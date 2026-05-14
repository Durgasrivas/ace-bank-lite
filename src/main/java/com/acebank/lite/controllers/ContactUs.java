package com.acebank.lite.controllers;

import com.acebank.lite.util.MailUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.java.Log;

import java.io.IOException;
import java.io.Serial;

/**
 * Handles the "Contact Us" form submission.
 * Forwards the customer's message to the bank owner's email address.
 */
@Log
@WebServlet(name = "ContactUs", urlPatterns = "/ContactUs")
public class ContactUs extends HttpServlet {

    @Serial
    private static final long serialVersionUID = 1L;

    /** The bank owner's email where all customer messages are delivered. */
    private static final String OWNER_EMAIL = "srivasnetha.35@gmail.com";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ── 1. Read form fields ──────────────────────────────────────────────
        String firstName = sanitize(request.getParameter("firstName"));
        String lastName  = sanitize(request.getParameter("lastName"));
        String email     = sanitize(request.getParameter("email"));
        String subject   = sanitize(request.getParameter("subject"));
        String message   = sanitize(request.getParameter("message"));

        // ── 2. Server-side validation ────────────────────────────────────────
        if (firstName.isEmpty() || lastName.isEmpty() || email.isEmpty()
                || subject.isEmpty() || message.isEmpty()) {
            forwardWithError(request, response,
                    "All fields are required. Please go back and fill in the form.",
                    firstName, lastName, email, subject, message);
            return;
        }

        if (!email.matches("^[\\w.+\\-]+@[a-zA-Z0-9.\\-]+\\.[a-zA-Z]{2,}$")) {
            forwardWithError(request, response,
                    "Please enter a valid email address.",
                    firstName, lastName, email, subject, message);
            return;
        }

        if (message.length() < 20) {
            forwardWithError(request, response,
                    "Message is too short. Please provide more details (at least 20 characters).",
                    firstName, lastName, email, subject, message);
            return;
        }

        // ── 3. Build email body ──────────────────────────────────────────────
        String fullName   = firstName + " " + lastName;
        String emailSubject = "[AceBank Contact] " + subject + " — from " + fullName;
        String emailBody  = buildEmailBody(fullName, email, subject, message);

        // ── 4. Send asynchronously so the servlet doesn't block ──────────────
        log.info("Sending contact-us email from: " + email + " | Subject: " + subject);
        boolean sent = MailUtil.sendMail(OWNER_EMAIL, emailSubject, emailBody);

        // ── 5. Redirect or show error ────────────────────────────────────────
        if (sent) {
            request.setAttribute("successMessage",
                    "Thank you, " + firstName + "! Your message has been sent. We'll get back to you within 24 hours.");
            request.getRequestDispatcher("/contact.jsp").forward(request, response);
        } else {
            forwardWithError(request, response,
                    "We couldn't send your message right now. Please try again later or email us directly at " + OWNER_EMAIL,
                    firstName, lastName, email, subject, message);
        }
    }

    /** Redirect GET requests to the contact page. */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/contact.jsp");
    }

    // ── Helpers ──────────────────────────────────────────────────────────────

    private String buildEmailBody(String name, String senderEmail,
                                   String subject, String message) {
        return """
                ============================================================
                  NEW CUSTOMER MESSAGE — AceBank Contact Form
                ============================================================

                From    : %s
                Email   : %s
                Subject : %s

                Message :
                %s

                ============================================================
                This message was submitted via the AceBank "Contact Us" page.
                Reply directly to: %s
                ============================================================
                """.formatted(name, senderEmail, subject, message, senderEmail);
    }

    private void forwardWithError(HttpServletRequest request, HttpServletResponse response,
                                   String errorMsg,
                                   String firstName, String lastName,
                                   String email, String subject, String message)
            throws ServletException, IOException {

        // Re-populate form fields so the user doesn't have to retype everything
        request.setAttribute("errorMessage", errorMsg);
        request.setAttribute("firstName", firstName);
        request.setAttribute("lastName", lastName);
        request.setAttribute("email", email);
        request.setAttribute("subject", subject);
        request.setAttribute("message", message);
        request.getRequestDispatcher("/contact.jsp").forward(request, response);
    }

    /** Basic sanitisation — trims whitespace and strips leading/trailing HTML tags. */
    private String sanitize(String value) {
        if (value == null) return "";
        return value.trim();
    }
}
