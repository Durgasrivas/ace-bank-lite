package com.acebank.lite.filters;

import com.acebank.lite.util.ConfigKeys;
import com.acebank.lite.util.ConfigLoader;
import com.acebank.lite.util.MailUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.java.Log;

import java.io.IOException;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Fires once per unique visitor session when someone lands on the website.
 * Sends an async email to the site owner with visitor details (IP, browser, time).
 *
 * <p>The session attribute {@code visitorNotified} is set after the first
 * notification so subsequent requests from the same browser session are ignored.</p>
 */
@Log
@WebFilter(urlPatterns = {"/index.jsp", "/"})
public class VisitorNotificationFilter implements Filter {

    /** Session flag — set after the first notification to prevent duplicates. */
    private static final String NOTIFIED_FLAG = "visitorNotified";

    /** Owner email — same address already used by the ContactUs servlet. */
    private static final String OWNER_EMAIL = "srivasnetha.35@gmail.com";

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;

        // Always let the request through first — notification is fire-and-forget
        chain.doFilter(request, response);

        try {
            // getSession(false) → don't create a session just for this check
            HttpSession session = httpRequest.getSession(false);

            // Create a session now if there wasn't one (new visitor)
            if (session == null) {
                session = httpRequest.getSession(true);
            }

            // Only notify once per session
            if (session.getAttribute(NOTIFIED_FLAG) != null) {
                return;
            }

            // Mark as notified immediately to prevent race conditions on fast reloads
            session.setAttribute(NOTIFIED_FLAG, Boolean.TRUE);

            // ── Collect visitor details ──────────────────────────────────────
            String ip          = resolveClientIp(httpRequest);
            String userAgent   = httpRequest.getHeader("User-Agent");
            String referer     = httpRequest.getHeader("Referer");
            String requestUrl  = httpRequest.getRequestURL().toString();
            String timestamp   = ZonedDateTime.now(ZoneId.of("Asia/Kolkata"))
                                              .format(DateTimeFormatter.ofPattern("dd MMM yyyy, hh:mm:ss a z"));

            // ── Build email ──────────────────────────────────────────────────
            String subject = "🏦 [AceBank] New Visitor on Your Website!";
            String body    = buildEmailBody(ip, userAgent, referer, requestUrl, timestamp);

            // Send asynchronously — never blocks the HTTP response
            log.info("New visitor detected from IP: " + ip + " — sending notification email.");
            MailUtil.sendMailAsync(OWNER_EMAIL, subject, body);

        } catch (Exception e) {
            // Never let a notification failure bubble up to the user
            log.warning("Visitor notification failed silently: " + e.getMessage());
        }
    }

    // ── Helpers ──────────────────────────────────────────────────────────────

    /**
     * Resolves the real client IP, accounting for common reverse-proxy headers.
     */
    private String resolveClientIp(HttpServletRequest request) {
        String[] headerCandidates = {
            "X-Forwarded-For",
            "Proxy-Client-IP",
            "WL-Proxy-Client-IP",
            "HTTP_X_FORWARDED_FOR",
            "HTTP_CLIENT_IP"
        };

        for (String header : headerCandidates) {
            String ip = request.getHeader(header);
            if (ip != null && !ip.isBlank() && !"unknown".equalsIgnoreCase(ip)) {
                // X-Forwarded-For can be a comma-separated list; take the first
                return ip.split(",")[0].trim();
            }
        }

        return request.getRemoteAddr();
    }

    private String buildEmailBody(String ip, String userAgent,
                                   String referer, String requestUrl,
                                   String timestamp) {
        return """
                ============================================================
                  👋  NEW VISITOR — AceBank Website
                ============================================================

                  🕐  Time       : %s
                  🌐  Page       : %s
                  📍  IP Address : %s
                  🔗  Referred by: %s
                  💻  Browser    : %s

                ============================================================
                  This is an automated visitor alert from AceBank.
                  No action is required.
                ============================================================
                """.formatted(
                    timestamp,
                    requestUrl,
                    ip,
                    referer != null ? referer : "Direct / No referrer",
                    userAgent != null ? userAgent : "Unknown"
        );
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        log.info("VisitorNotificationFilter initialized — owner alerts active.");
    }

    @Override
    public void destroy() {}
}
