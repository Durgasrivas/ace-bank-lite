package com.acebank.lite.controllers;

import com.acebank.lite.service.BankService;
import com.acebank.lite.service.BankServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.java.Log;

import java.io.IOException;
import java.io.Serial;

@Log
@WebServlet("/ForgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    private final BankService bankService = new BankServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Simply show the forgot password page
        request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("sendOtp".equals(action)) {
            handleSendOtp(request, response);
        } else if ("resetPassword".equals(action)) {
            handleResetPassword(request, response);
        } else {
            response.sendRedirect("ForgotPassword.jsp");
        }
    }

    private void handleSendOtp(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String email = request.getParameter("email");

        if (email == null || email.trim().isEmpty()) {
            response.sendRedirect("ForgotPassword?error=Please+enter+your+email+address");
            return;
        }

        try {
            boolean sent = bankService.sendForgotPasswordOtp(email.trim());

            if (sent) {
                log.info("OTP sent for password reset to: " + email);
                response.sendRedirect("ForgotPassword?otpSent=true&email=" + java.net.URLEncoder.encode(email.trim(), "UTF-8"));
            } else {
                response.sendRedirect("ForgotPassword?error=No+account+found+with+this+email+address");
            }
        } catch (Exception e) {
            log.severe("Send OTP Error: " + e.getMessage());
            response.sendRedirect("ForgotPassword?error=Failed+to+send+OTP.+Please+try+again.");
        }
    }

    private void handleResetPassword(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String email = request.getParameter("email");
        String otp = request.getParameter("otp");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validation
        if (email == null || otp == null || newPassword == null || confirmPassword == null) {
            response.sendRedirect("ForgotPassword?error=All+fields+are+required&otpSent=true&email=" +
                    java.net.URLEncoder.encode(email != null ? email : "", "UTF-8"));
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("ForgotPassword?error=Passwords+do+not+match&otpSent=true&email=" +
                    java.net.URLEncoder.encode(email, "UTF-8"));
            return;
        }

        if (newPassword.length() < 10) {
            response.sendRedirect("ForgotPassword?error=Password+must+be+at+least+10+characters&otpSent=true&email=" +
                    java.net.URLEncoder.encode(email, "UTF-8"));
            return;
        }

        try {
            boolean reset = bankService.verifyOtpAndResetPassword(email.trim(), otp.trim(), newPassword);

            if (reset) {
                log.info("Password reset successful for: " + email);
                response.sendRedirect("login.jsp?success=Password+reset+successful!+Please+login+with+your+new+password.");
            } else {
                response.sendRedirect("ForgotPassword?error=Invalid+or+expired+OTP.+Please+try+again.&otpSent=true&email=" +
                        java.net.URLEncoder.encode(email, "UTF-8"));
            }
        } catch (Exception e) {
            log.severe("Reset Password Error: " + e.getMessage());
            response.sendRedirect("ForgotPassword?error=An+error+occurred.+Please+try+again.");
        }
    }
}
