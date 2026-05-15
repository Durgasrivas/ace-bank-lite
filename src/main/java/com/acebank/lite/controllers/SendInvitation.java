package com.acebank.lite.controllers;

import com.acebank.lite.util.MailUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.java.Log;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;

/**
 * Receives a visitor's email from the homepage popup and sends them
 * a warm "Thank you for visiting" invitation email with the sign-up link.
 *
 * <p>Responds with JSON so the frontend can show a success/error toast
 * without a full page reload.</p>
 */
@Log
@WebServlet(name = "SendInvitation", urlPatterns = "/SendInvitation")
public class SendInvitation extends HttpServlet {

    @Serial
    private static final long serialVersionUID = 1L;

    /** The public sign-up URL on Render. */
    private static final String SIGNUP_URL = "https://ace-bank-lite-24.onrender.com/sign-up.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        // ── 1. Read & validate email ─────────────────────────────────────────
        String email = request.getParameter("email");
        if (email == null || email.isBlank()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print("{\"success\":false,\"message\":\"Please enter a valid email address.\"}");
            return;
        }

        email = email.trim();
        if (!email.matches("^[\\w.+\\-]+@[a-zA-Z0-9.\\-]+\\.[a-zA-Z]{2,}$")) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print("{\"success\":false,\"message\":\"That doesn't look like a valid email. Please try again.\"}");
            return;
        }

        // ── 3. Build the HTML invitation email ───────────────────────────────
        String subject = "🏦 You're Invited — Open Your AceBank Account Today!";
        String htmlBody = buildHtmlInvitationEmail();

        // ── 4. Send asynchronously — never block the response ────────────────
        log.info("Sending visitor invitation email to: " + email);
        MailUtil.sendHtmlMailAsync(email, subject, htmlBody);

        // ── 5. Respond with JSON success ─────────────────────────────────────
        out.print("{\"success\":true,\"message\":\"Invitation sent! Check your inbox.\"}");
    }

    // ── Helpers ──────────────────────────────────────────────────────────────

    private String buildHtmlInvitationEmail() {
        return """
        <!DOCTYPE html>
        <html lang="en">
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>You're Invited to AceBank</title>
        </head>
        <body style="margin:0;padding:0;background-color:#f0f4f8;font-family:'Segoe UI',Arial,sans-serif;">

          <!-- Outer wrapper -->
          <table width="100%%" cellpadding="0" cellspacing="0" border="0" style="background:#f0f4f8;padding:30px 0;">
            <tr><td align="center">

              <!-- Email card -->
              <table width="560" cellpadding="0" cellspacing="0" border="0"
                     style="max-width:560px;width:100%%;border-radius:18px;overflow:hidden;
                            box-shadow:0 8px 40px rgba(0,0,0,0.18);">

                <!-- ── TOP BANNER ── -->
                <tr>
                  <td style="background:linear-gradient(135deg,#0a0a1a 0%%,#0d2137 50%%,#0a1628 100%%);
                             padding:0;text-align:center;">

                    <!-- Alert pill -->
                    <div style="background:linear-gradient(90deg,#ff9500,#ff6b00);
                                display:inline-block;border-radius:50px;
                                padding:6px 20px;margin-top:22px;
                                font-size:11px;font-weight:700;color:#fff;
                                letter-spacing:1.5px;text-transform:uppercase;">
                      &#127881; EXCLUSIVE WELCOME OFFER ACTIVE
                    </div>

                    <!-- Headline -->
                    <h1 style="color:#fff;font-size:26px;font-weight:800;
                               margin:16px 24px 4px;line-height:1.25;">
                      Welcome to <span style="color:#00c6ff;">AceBank!</span>
                    </h1>
                    <p style="color:rgba(255,255,255,0.75);font-size:14px;
                              margin:0 24px 10px;">
                      Your invitation to smarter, faster banking is here.
                    </p>

                    <!-- Divider glow -->
                    <div style="height:2px;background:linear-gradient(90deg,transparent,#00c6ff,#7b2ff7,transparent);
                                margin:0 20px 0;"></div>

                  </td>
                </tr>

                <!-- ── WHITE BODY ── -->
                <tr>
                  <td style="background:#ffffff;padding:28px 32px 0;">

                    <p style="font-size:15px;color:#333;margin:0 0 6px;">
                      Hi there,
                    </p>
                    <p style="font-size:14px;color:#555;line-height:1.6;margin:0 0 24px;">
                      Thank you for visiting <strong>AceBank</strong>! We noticed your interest and
                      we&rsquo;d love to have you on board. We&rsquo;ve put together a
                      <strong>special welcome package</strong> just for you &mdash; open your
                      free account today and enjoy these exclusive perks.
                    </p>

                    <!-- ── DEAL CARD ── -->
                    <table width="100%%" cellpadding="0" cellspacing="0" border="0"
                           style="background:linear-gradient(135deg,#0d2137,#1a3a5c);
                                  border-radius:14px;overflow:hidden;margin-bottom:24px;">
                      <tr>
                        <td style="padding:24px;">

                          <!-- Badge -->
                          <div style="background:linear-gradient(90deg,#00ffa3,#00c6ff);
                                      display:inline-block;border-radius:50px;
                                      padding:5px 14px;margin-bottom:14px;
                                      font-size:11px;font-weight:700;color:#0a0a1a;
                                      letter-spacing:1px;text-transform:uppercase;">
                            &#9989; ZERO JOINING FEE &bull; INSTANT SETUP
                          </div>

                          <!-- Offer headline -->
                          <div style="color:#fff;font-size:38px;font-weight:900;
                                      line-height:1;margin-bottom:4px;">
                            <span style="color:#00c6ff;">FREE</span>
                          </div>
                          <div style="color:rgba(255,255,255,0.85);font-size:15px;
                                      font-weight:600;margin-bottom:16px;">
                            ACCOUNT OPENING &bull; NO PAPERWORK
                          </div>

                          <!-- Features grid -->
                          <table width="100%%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                              <td width="50%%" style="padding-bottom:10px;">
                                <span style="color:#00ffa3;font-size:16px;">&#9889;</span>
                                <span style="color:#fff;font-size:13px;margin-left:6px;">Instant Transfers</span>
                              </td>
                              <td width="50%%" style="padding-bottom:10px;">
                                <span style="color:#00ffa3;font-size:16px;">&#128274;</span>
                                <span style="color:#fff;font-size:13px;margin-left:6px;">Bank-Grade Security</span>
                              </td>
                            </tr>
                            <tr>
                              <td style="padding-bottom:6px;">
                                <span style="color:#00ffa3;font-size:16px;">&#128200;</span>
                                <span style="color:#fff;font-size:13px;margin-left:6px;">Real-Time History</span>
                              </td>
                              <td style="padding-bottom:6px;">
                                <span style="color:#00ffa3;font-size:16px;">&#127968;</span>
                                <span style="color:#fff;font-size:13px;margin-left:6px;">Loan Applications</span>
                              </td>
                            </tr>
                          </table>

                        </td>
                      </tr>
                    </table>

                    <!-- ── COUPON STYLE LINK BOX ── -->
                    <p style="font-size:12px;font-weight:700;color:#888;
                              letter-spacing:1.5px;text-transform:uppercase;
                              text-align:center;margin:0 0 8px;">
                      CLICK BELOW TO OPEN YOUR FREE ACCOUNT
                    </p>
                    <table width="100%%" cellpadding="0" cellspacing="0" border="0"
                           style="border:2px dashed #00c6ff;border-radius:10px;
                                  background:#f0faff;margin-bottom:24px;">
                      <tr>
                        <td style="padding:14px;text-align:center;">
                          <span style="font-size:13px;font-weight:700;color:#0070a8;
                                       letter-spacing:1px;word-break:break-all;">
                            https://ace-bank-lite-24.onrender.com/sign-up.jsp
                          </span>
                        </td>
                      </tr>
                    </table>

                    <!-- ── CTA BUTTON ── -->
                    <table width="100%%" cellpadding="0" cellspacing="0" border="0"
                           style="margin-bottom:28px;">
                      <tr>
                        <td align="center">
                          <a href="https://ace-bank-lite-24.onrender.com/sign-up.jsp"
                             target="_blank"
                             style="display:inline-block;
                                    background:linear-gradient(135deg,#ff8c00,#ff5500);
                                    color:#ffffff;font-size:16px;font-weight:700;
                                    text-decoration:none;padding:15px 40px;
                                    border-radius:50px;
                                    box-shadow:0 6px 20px rgba(255,100,0,0.4);
                                    letter-spacing:0.5px;">
                            CLAIM YOUR FREE ACCOUNT NOW &#128640;
                          </a>
                        </td>
                      </tr>
                    </table>

                  </td>
                </tr>

                <!-- ── FOOTER ── -->
                <tr>
                  <td style="background:#f7f7f7;padding:18px 32px;
                             border-top:1px solid #e8e8e8;">
                    <p style="font-size:11px;color:#aaa;text-align:center;
                              line-height:1.6;margin:0;">
                      <em>This exclusive offer is valid for a limited time only. Your account is free
                      to open with no hidden charges.</em><br><br>
                      &copy; 2026 AceBank &bull; Modern banking for the digital generation.<br>
                      <a href="https://ace-bank-lite-24.onrender.com"
                         style="color:#00c6ff;text-decoration:none;">ace-bank-lite-24.onrender.com</a><br><br>
                      You received this email because you visited our website.
                      If this was a mistake, please ignore it.
                    </p>
                  </td>
                </tr>

              </table>
              <!-- end card -->

            </td></tr>
          </table>

        </body>
        </html>
        """;
    }
