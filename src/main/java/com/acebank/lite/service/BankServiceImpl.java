package com.acebank.lite.service;


import com.acebank.lite.dao.BankUserDao;
import com.acebank.lite.dao.BankUserDaoImpl;

import com.acebank.lite.models.*;
import com.acebank.lite.models.*;
import com.acebank.lite.util.MailUtil;
import com.acebank.lite.util.PasswordUtil;
import lombok.extern.java.Log;

import java.math.BigDecimal;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.ThreadLocalRandom;

@Log
public class BankServiceImpl implements BankService {

    private final BankUserDao userDao = new BankUserDaoImpl(); // Or get via Singleton
    private static final BigDecimal DAILY_LIMIT = new BigDecimal("50000.00");


    @Override
    public Optional<LoginResult> authenticate(int accountNo, String plainPassword) {
        try {
            // 1. Get the hash using the new DAO method
            String storedHash = userDao.getPasswordHash(accountNo);

            // 2. Compare using BCrypt
            if (PasswordUtil.checkPassword(plainPassword, storedHash)) {
                // 3. If matched, fetch full details for the session
                return Optional.of(userDao.getUserDetails(accountNo));
            }
        } catch (SQLException e) {
            log.severe("Database error during login: " + e.getMessage());
        }
        return Optional.empty();
    }


    @Override
    public boolean changePassword(int accountNo, String oldPlain, String newPlain) throws SQLException {
        String storedHash = userDao.getPasswordHash(accountNo);

        if (PasswordUtil.checkPassword(oldPlain, storedHash)) {
            String newSecureHash = PasswordUtil.hashPassword(newPlain);
            return userDao.changePassword(accountNo, storedHash, newSecureHash);
        }
        return false;
    }


    @Override
    public boolean processDeposit(int accountNo, BigDecimal amount) {
        // Business Rule: No zero or negative deposits
        if (amount.compareTo(BigDecimal.ZERO) <= 0) {
            return false;
        }

        try {
            // Orchestrate the DAO call
            return userDao.deposit(accountNo, amount);
        } catch (SQLException e) {
            log.severe("Deposit Error for " + accountNo + ": " + e.getMessage());
            return false;
        }
    }


    @Override
    public String withdraw(int accountNo, BigDecimal amount) {
        try {
            // Rule 1: No negative or zero amounts
            if (amount.compareTo(BigDecimal.ZERO) <= 0) {
                return "Invalid amount.";
            }

            // Rule 2: Daily Limit Check
            BigDecimal alreadyWithdrawn = userDao.getDailyWithdrawalTotal(accountNo);
            BigDecimal projectedTotal = alreadyWithdrawn.add(amount);

            if (projectedTotal.compareTo(DAILY_LIMIT) > 0) {
                BigDecimal remaining = DAILY_LIMIT.subtract(alreadyWithdrawn);
                return "Limit exceeded. You can only withdraw $" + remaining + " more today.";
            }

            // Rule 3: Process the actual DB update via DAO
            boolean success = userDao.withdraw(accountNo, amount); // Reuses logic similar to transfer
            return success ? "SUCCESS" : "Insufficient balance or account error.";

        } catch (SQLException e) {
            return "System error. Please try later.";
        }
    }


    @Override
    public Optional<LoginResult> registerUser(User user) {
        // 1. Generate a unique account number
        int accountNumber = ThreadLocalRandom.current().nextInt(10000000, 99999999);
        // Hash before saving to DB
        String secureHash = PasswordUtil.hashPassword(user.passwordHash());

        // Create a new version of the record with the hash
        User secureUser = new User(
                user.userId(), user.firstName(), user.lastName(),
                user.aadhaarNo(), user.email(), secureHash, user.createdAt()
        );
        try {
            // 2. Save to Database via DAO
            boolean isSaved = userDao.signUp(secureUser, accountNumber);

            if (isSaved) {
                // 3. Send Welcome Email (Asynchronous is better, but this works for now)
                sendWelcomeEmail(user, accountNumber);

                // 4. Return the details to be used for the session
                return Optional.of(new LoginResult(
                        user.firstName(),
                        user.lastName(),
                        user.email(),
                        BigDecimal.ZERO,
                        accountNumber
                ));
            }
        } catch (Exception e) {
            log.severe("Signup Error: " + e.getMessage());
        }
        return Optional.empty();
    }


    private void sendWelcomeEmail(User user, int accNo) {
        String subject = "Welcome to AceBank";
        String msg = String.format("Dear %s,\n\nWelcome! Your account number is: %d.\nKeep it safe!",
                user.firstName(), accNo);
        try {
            MailUtil.sendMail(user.email(), subject, msg);
        } catch (Exception e) {
            log.warning("Email failed to send, but account was created.");
        }
    }

    @Override
    public BigDecimal getBalance(int accountNo) {
        try {
            return userDao.getBalance(accountNo);
        } catch (SQLException e) {
            log.severe("Could not fetch balance for: " + accountNo);
            return BigDecimal.ZERO; // Default fallback
        }
    }

    @Override
    public List<Transaction> getTransactionHistory(int accountNo) {
        try {
            return userDao.getStatement(accountNo);
        } catch (SQLException e) {
            log.severe("Could not fetch transactions for: " + accountNo);
            return List.of(); // Return empty list to avoid NullPointer in JSP
        }
    }

    @Override
    public ServiceResponse processTransfer(int fromAcc, int toAcc, BigDecimal amount) {
        // 1. Validation: Self-transfer
        if (fromAcc == toAcc) {
            return new ServiceResponse(false, "You cannot transfer money to your own account.");
        }

        // 2. Validation: Positive amount
        if (amount == null || amount.compareTo(BigDecimal.ZERO) <= 0) {
            return new ServiceResponse(false, "Please enter a valid amount greater than zero.");
        }

        try {
            // 3. Check if Recipient exists
            // This avoids triggering foreign key constraint errors in the DB
            if (!userDao.accountExists(toAcc)) {
                return new ServiceResponse(false, "Recipient account number " + toAcc + " not found.");
            }

            // 4. Check Sender's Balance
            // We do this in the Service to provide a friendly message before hitting the DB
            BigDecimal currentBalance = userDao.getBalance(fromAcc);
            if (currentBalance.compareTo(amount) < 0) {
                return new ServiceResponse(false, "Insufficient balance. Your current balance is ₹" + currentBalance);
            }

            // 5. Atomic Transaction
            // We pass the amount to the DAO which handles Debit, Credit, and Logging
            boolean success = userDao.transfer(fromAcc, toAcc, amount);

            if (success) {
                log.info("Transfer Successful: ₹" + amount + " from " + fromAcc + " to " + toAcc);
                return new ServiceResponse(true, "Transfer Successful!");
            } else {
                return new ServiceResponse(false, "Transfer could not be processed. Please try again.");
            }

        } catch (SQLException e) {
            log.severe("SQL Error during transfer: " + e.getMessage());
            return new ServiceResponse(false, "Database connection error. Please contact support.");
        } catch (Exception e) {
            log.severe("General Error during transfer: " + e.getMessage());
            return new ServiceResponse(false, "An unexpected error occurred.");
        }
    }

    @Override
    public boolean recoverAccount(String email) {
        try {
            // 1. Get the joined details from DAO
            Optional<AccountRecoveryDTO> detailsOpt = userDao.getRecoveryDetails(email);

            if (detailsOpt.isPresent()) {
                AccountRecoveryDTO details = detailsOpt.get();

                // 2. Compose Email
                String subject = "AceBank - Account Recovery";
                String msg = "Hi " + details.firstName() + " " + details.lastName() + ",\n\n"
                        + "We found your account details associated with this email:\n"
                        + "- Account Number: " + details.accountNo() + "\n\n"
                        + "Note: For security reasons, we cannot email your password. "
                        + "Please use the 'Change Password' feature if you've forgotten it.\n\n"
                        + "Best regards,\nAceBank Team";

                MailUtil.sendMail(email, subject, msg);
                return true;
            }
        } catch (Exception e) {
            log.severe("Failed recovery for: " + email + " Error: " + e.getMessage());
        }
        return false;
    }


    @Override
    public boolean applyForLoan(String firstName, String email, String loanType, double loanAmount) {
        String subject = "Loan Application Received - AceBank";
        String body = String.format(
                """
                        Dear %s,
                        
                        Thank you for applying for a %s loan with AceBank.
                        Requested Amount: ₹%.2f
                        We have received your request and our team will review it shortly.
                        
                        We will be in touch with you as soon as a decision is made.
                        
                        Sincerely,
                        The AceBank Team""",
                firstName, loanType, loanAmount
        );

        try {
            // Save loan request to database
            userDao.saveLoanRequest(firstName, email, loanType, loanAmount);
            log.info("Loan request saved to DB for " + email + " - Type: " + loanType + " - Amount: " + loanAmount);

            // Send confirmation email
            MailUtil.sendMail(email, subject, body);
            return true;
        } catch (Exception e) {
            log.severe("Failed to process loan application: " + e.getMessage());
            return false;
        }
    }


    @Override
    public boolean sendForgotPasswordOtp(String email) {
        try {
            // 1. Check if user exists
            var userIdOpt = userDao.getUserIdByEmail(email);
            if (userIdOpt.isEmpty()) {
                log.warning("Forgot password request for non-existent email: " + email);
                return false;
            }

            // 2. Generate 6-digit OTP
            String otp = String.valueOf(ThreadLocalRandom.current().nextInt(100000, 999999));

            // 3. Clean old OTPs and save new one
            userDao.deleteOtp(email);
            userDao.saveOtp(email, otp);

            // 4. Send OTP via email
            String subject = "AceBank - Password Reset OTP";
            String body = String.format(
                    """
                            Dear User,
                            
                            Your One-Time Password (OTP) for password reset is:
                            
                                %s
                            
                            This OTP is valid for 15 minutes. Do not share it with anyone.
                            
                            If you did not request this, please ignore this email.
                            
                            Best regards,
                            AceBank Security Team""",
                    otp
            );

            MailUtil.sendMail(email, subject, body);
            log.info("OTP sent successfully to " + email);
            return true;

        } catch (Exception e) {
            log.severe("Failed to send OTP: " + e.getMessage());
            return false;
        }
    }

    @Override
    public boolean verifyOtpAndResetPassword(String email, String otp, String newPassword) {
        try {
            // 1. Verify OTP
            boolean isValid = userDao.verifyOtp(email, otp);
            if (!isValid) {
                log.warning("Invalid or expired OTP for email: " + email);
                return false;
            }

            // 2. Get user ID
            var userIdOpt = userDao.getUserIdByEmail(email);
            if (userIdOpt.isEmpty()) {
                return false;
            }

            // 3. Hash new password and update
            String hashedPassword = PasswordUtil.hashPassword(newPassword);
            boolean updated = userDao.resetPasswordByUserId(userIdOpt.get(), hashedPassword);

            // 4. Clean up OTPs
            if (updated) {
                userDao.deleteOtp(email);
                log.info("Password reset successfully for " + email);
            }

            return updated;

        } catch (Exception e) {
            log.severe("Failed to reset password: " + e.getMessage());
            return false;
        }
    }


}