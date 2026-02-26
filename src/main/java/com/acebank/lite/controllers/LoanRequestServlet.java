package com.acebank.lite.controllers;

import com.acebank.lite.service.BankService;
import com.acebank.lite.service.BankServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.java.Log;

import java.io.IOException;
import java.io.Serial;

@Log
@WebServlet("/LoanRequest")
public class LoanRequestServlet extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    private final BankService bankService = new BankServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("accountNumber") == null) {
            response.sendRedirect("login.jsp?error=unauthorized");
            return;
        }

        request.getRequestDispatcher("LoanRequest.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("accountNumber") == null) {
            response.sendRedirect("login.jsp?error=unauthorized");
            return;
        }

        String firstName = (String) session.getAttribute("firstName");
        String email = (String) session.getAttribute("email");
        String loanType = request.getParameter("loanType");
        String loanAmountStr = request.getParameter("loanAmount");

        if (loanType == null || loanType.trim().isEmpty()) {
            response.sendRedirect("LoanRequest?error=Please+select+a+loan+type");
            return;
        }

        double loanAmount = 0;
        try {
            loanAmount = Double.parseDouble(loanAmountStr);
            if (loanAmount <= 0) {
                response.sendRedirect("LoanRequest?error=Please+enter+a+valid+loan+amount");
                return;
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("LoanRequest?error=Please+enter+a+valid+loan+amount");
            return;
        }

        try {
            boolean success = bankService.applyForLoan(firstName, email, loanType, loanAmount);

            if (success) {
                log.info("Loan application submitted by " + email + " for " + loanType);
                response.sendRedirect("LoanRequest?success=Loan+application+submitted+successfully!+A+confirmation+email+has+been+sent.");
            } else {
                response.sendRedirect("LoanRequest?error=Failed+to+submit+loan+application.+Please+try+again.");
            }
        } catch (Exception e) {
            log.severe("Loan Request Error: " + e.getMessage());
            response.sendRedirect("LoanRequest?error=An+unexpected+error+occurred.");
        }
    }
}
