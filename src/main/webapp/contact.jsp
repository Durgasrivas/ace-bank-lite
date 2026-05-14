<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | AceBank</title>
    <meta name="description" content="Get in touch with AceBank support. We're here to help you 24/7.">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --primary:       #4f46e5;
            --primary-light: #6366f1;
            --primary-dark:  #3730a3;
            --accent:        #06b6d4;
            --success:       #10b981;
            --danger:        #ef4444;
            --bg:            #0f0f1a;
            --bg2:           #13131f;
            --card:          rgba(255,255,255,0.04);
            --border:        rgba(255,255,255,0.08);
            --text:          #f1f5f9;
            --muted:         #94a3b8;
            --radius:        14px;
        }

        html { scroll-behavior: smooth; }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--bg);
            color: var(--text);
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* ── Animated background ── */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background:
                radial-gradient(ellipse 80% 60% at 20% 10%, rgba(79,70,229,.25) 0%, transparent 55%),
                radial-gradient(ellipse 60% 50% at 80% 80%, rgba(6,182,212,.18) 0%, transparent 55%);
            pointer-events: none;
            z-index: 0;
        }

        /* ── Header ── */
        header {
            position: sticky;
            top: 0;
            z-index: 100;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 1rem 2.5rem;
            background: rgba(15,15,26,.85);
            backdrop-filter: blur(16px);
            border-bottom: 1px solid var(--border);
        }

        .logo h1 {
            font-size: 1.6rem;
            font-weight: 700;
            letter-spacing: -0.5px;
            color: var(--text);
        }
        .logo h1 span { color: var(--primary-light); }

        nav ul {
            list-style: none;
            display: flex;
            gap: 1.5rem;
            align-items: center;
        }
        nav ul li a {
            text-decoration: none;
            color: var(--muted);
            font-size: .9rem;
            font-weight: 500;
            transition: color .2s;
        }
        nav ul li a:hover { color: var(--text); }
        nav ul li a.active { color: var(--primary-light); }

        .btn-nav {
            background: var(--primary);
            color: #fff !important;
            padding: .45rem 1.1rem;
            border-radius: 8px;
            transition: background .2s, transform .15s !important;
        }
        .btn-nav:hover { background: var(--primary-light) !important; transform: translateY(-1px); }

        /* ── Page wrapper ── */
        .page-wrapper {
            position: relative;
            z-index: 1;
            max-width: 960px;
            margin: 0 auto;
            padding: 4rem 1.5rem 6rem;
        }

        /* ── Hero heading ── */
        .contact-hero {
            text-align: center;
            margin-bottom: 3rem;
        }
        .contact-hero .badge {
            display: inline-block;
            background: rgba(79,70,229,.2);
            border: 1px solid rgba(79,70,229,.4);
            color: var(--primary-light);
            font-size: .75rem;
            font-weight: 600;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            padding: .35rem .9rem;
            border-radius: 50px;
            margin-bottom: 1.2rem;
        }
        .contact-hero h1 {
            font-size: clamp(2rem, 5vw, 3rem);
            font-weight: 700;
            line-height: 1.15;
            background: linear-gradient(135deg, #fff 30%, var(--accent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: .75rem;
        }
        .contact-hero p {
            color: var(--muted);
            font-size: 1.05rem;
            max-width: 520px;
            margin: 0 auto;
        }

        /* ── Grid ── */
        .contact-grid {
            display: grid;
            grid-template-columns: 1fr 1.6fr;
            gap: 2rem;
            align-items: start;
        }
        @media (max-width: 700px) {
            .contact-grid { grid-template-columns: 1fr; }
        }

        /* ── Info card ── */
        .info-card {
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            padding: 2rem 1.6rem;
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }
        .info-item {
            display: flex;
            align-items: flex-start;
            gap: 1rem;
        }
        .info-icon {
            width: 42px;
            height: 42px;
            border-radius: 10px;
            background: rgba(79,70,229,.18);
            display: grid;
            place-items: center;
            flex-shrink: 0;
            font-size: 1.1rem;
        }
        .info-item h3 {
            font-size: .85rem;
            font-weight: 600;
            color: var(--muted);
            text-transform: uppercase;
            letter-spacing: .8px;
            margin-bottom: .25rem;
        }
        .info-item p, .info-item a {
            font-size: .95rem;
            color: var(--text);
            text-decoration: none;
            word-break: break-all;
            transition: color .2s;
        }
        .info-item a:hover { color: var(--primary-light); }

        .divider {
            height: 1px;
            background: var(--border);
        }

        /* ── Form card ── */
        .form-card {
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            padding: 2.5rem 2rem;
            backdrop-filter: blur(8px);
        }
        .form-card h2 {
            font-size: 1.3rem;
            font-weight: 700;
            margin-bottom: .4rem;
        }
        .form-card .sub {
            color: var(--muted);
            font-size: .875rem;
            margin-bottom: 2rem;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }
        @media (max-width: 500px) { .form-row { grid-template-columns: 1fr; } }

        .field {
            display: flex;
            flex-direction: column;
            gap: .45rem;
            margin-bottom: 1.2rem;
        }
        .field label {
            font-size: .82rem;
            font-weight: 600;
            color: var(--muted);
            letter-spacing: .4px;
        }
        .field input,
        .field select,
        .field textarea {
            background: rgba(255,255,255,.05);
            border: 1px solid var(--border);
            border-radius: 8px;
            color: var(--text);
            font-family: inherit;
            font-size: .9rem;
            padding: .7rem 1rem;
            outline: none;
            transition: border-color .2s, box-shadow .2s;
            width: 100%;
        }
        .field input::placeholder,
        .field textarea::placeholder { color: #4b5563; }
        .field input:focus,
        .field select:focus,
        .field textarea:focus {
            border-color: var(--primary-light);
            box-shadow: 0 0 0 3px rgba(99,102,241,.2);
        }
        .field select { cursor: pointer; }
        .field select option { background: #1e1e30; }
        .field textarea { resize: vertical; min-height: 130px; }

        /* ── Alert messages ── */
        .alert {
            display: flex;
            align-items: center;
            gap: .75rem;
            padding: .9rem 1.1rem;
            border-radius: 8px;
            font-size: .875rem;
            font-weight: 500;
            margin-bottom: 1.5rem;
            animation: slideDown .3s ease;
        }
        .alert-success { background: rgba(16,185,129,.12); border: 1px solid rgba(16,185,129,.3); color: #34d399; }
        .alert-error   { background: rgba(239,68,68,.12);  border: 1px solid rgba(239,68,68,.3);  color: #f87171; }
        @keyframes slideDown { from { opacity:0; transform: translateY(-8px); } to { opacity:1; transform: translateY(0); } }

        /* ── Submit button ── */
        .btn-submit {
            width: 100%;
            padding: .85rem 1.5rem;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            color: #fff;
            font-family: inherit;
            font-size: .95rem;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: transform .2s, box-shadow .2s, opacity .2s;
            letter-spacing: .3px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: .6rem;
            margin-top: .5rem;
        }
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(79,70,229,.45);
        }
        .btn-submit:active { transform: translateY(0); }
        .btn-submit:disabled { opacity: .6; cursor: not-allowed; transform: none; box-shadow: none; }

        /* spinner */
        .spinner {
            width: 16px; height: 16px;
            border: 2px solid rgba(255,255,255,.3);
            border-top-color: #fff;
            border-radius: 50%;
            animation: spin .6s linear infinite;
            display: none;
        }
        @keyframes spin { to { transform: rotate(360deg); } }
    </style>
</head>
<body>

<!-- ── Header ── -->
<header>
    <div class="logo">
        <h1>Ace<span>Bank</span></h1>
    </div>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/login.jsp">Login</a></li>
            <li><a href="${pageContext.request.contextPath}/contact.jsp" class="active">Contact Us</a></li>
            <li><a href="${pageContext.request.contextPath}/sign-up.jsp" class="btn-nav">Sign Up</a></li>
        </ul>
    </nav>
</header>

<!-- ── Main content ── -->
<div class="page-wrapper">

    <!-- Hero -->
    <div class="contact-hero">
        <span class="badge">📬 Support</span>
        <h1>We're Here to Help</h1>
        <p>Have a question, issue, or feedback? Drop us a message and our team will get back to you shortly.</p>
    </div>

    <!-- Grid -->
    <div class="contact-grid">

        <!-- Info card -->
        <div class="info-card">
            <div class="info-item">
                <div class="info-icon">📧</div>
                <div>
                    <h3>Email Us</h3>
                    <a href="mailto:srivasnetha.35@gmail.com">srivasnetha.35@gmail.com</a>
                </div>
            </div>
            <div class="divider"></div>
            <div class="info-item">
                <div class="info-icon">🕐</div>
                <div>
                    <h3>Response Time</h3>
                    <p>Within 24 hours on business days</p>
                </div>
            </div>
            <div class="divider"></div>
            <div class="info-item">
                <div class="info-icon">🔒</div>
                <div>
                    <h3>Secure & Private</h3>
                    <p>Your information is kept safe and never shared.</p>
                </div>
            </div>
            <div class="divider"></div>
            <div class="info-item">
                <div class="info-icon">🏦</div>
                <div>
                    <h3>AceBank Support</h3>
                    <p>Trusted by 2M+ customers worldwide.</p>
                </div>
            </div>
        </div>

        <!-- Form card -->
        <div class="form-card">
            <h2>Send Us a Message</h2>
            <p class="sub">Fill in the details below and we'll respond as soon as possible.</p>

            <!-- Success / Error alert -->
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success" role="alert">
                    ✅ &nbsp;${successMessage}
                </div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-error" role="alert">
                    ⚠️ &nbsp;${errorMessage}
                </div>
            </c:if>

            <form id="contact-form" action="${pageContext.request.contextPath}/ContactUs" method="POST" novalidate>

                <div class="form-row">
                    <div class="field">
                        <label for="firstName">First Name *</label>
                        <input type="text" id="firstName" name="firstName"
                               placeholder="Jane" required
                               value="${not empty firstName ? firstName : ''}">
                    </div>
                    <div class="field">
                        <label for="lastName">Last Name *</label>
                        <input type="text" id="lastName" name="lastName"
                               placeholder="Doe" required
                               value="${not empty lastName ? lastName : ''}">
                    </div>
                </div>

                <div class="field">
                    <label for="email">Your Email Address *</label>
                    <input type="email" id="email" name="email"
                           placeholder="you@example.com" required
                           value="${not empty email ? email : ''}">
                </div>

                <div class="field">
                    <label for="subject">Subject *</label>
                    <select id="subject" name="subject" required>
                        <option value="" disabled ${empty subject ? 'selected' : ''}>— Select a topic —</option>
                        <option value="Account Inquiry"      ${subject == 'Account Inquiry' ? 'selected' : ''}>Account Inquiry</option>
                        <option value="Transaction Issue"    ${subject == 'Transaction Issue' ? 'selected' : ''}>Transaction Issue</option>
                        <option value="Password / Login Help"${subject == 'Password / Login Help' ? 'selected' : ''}>Password / Login Help</option>
                        <option value="Loan & Services"      ${subject == 'Loan & Services' ? 'selected' : ''}>Loan &amp; Services</option>
                        <option value="Feedback"             ${subject == 'Feedback' ? 'selected' : ''}>Feedback</option>
                        <option value="Other"                ${subject == 'Other' ? 'selected' : ''}>Other</option>
                    </select>
                </div>

                <div class="field">
                    <label for="message">Message *</label>
                    <textarea id="message" name="message"
                              placeholder="Describe your issue or question in detail…"
                              required minlength="20">${not empty message ? message : ''}</textarea>
                </div>

                <button type="submit" class="btn-submit" id="submit-btn">
                    <span class="spinner" id="spinner"></span>
                    <span id="btn-text">✉️ &nbsp;Send Message</span>
                </button>
            </form>
        </div>
    </div>
</div>

<script>
    const form = document.getElementById('contact-form');
    const btn  = document.getElementById('submit-btn');
    const spinner = document.getElementById('spinner');
    const btnText = document.getElementById('btn-text');

    form.addEventListener('submit', function(e) {
        // Basic client-side validation
        const firstName = document.getElementById('firstName').value.trim();
        const lastName  = document.getElementById('lastName').value.trim();
        const email     = document.getElementById('email').value.trim();
        const subject   = document.getElementById('subject').value;
        const message   = document.getElementById('message').value.trim();

        if (!firstName || !lastName || !email || !subject || !message) {
            e.preventDefault();
            alert('Please fill in all required fields.');
            return;
        }
        if (message.length < 20) {
            e.preventDefault();
            alert('Please enter a more detailed message (at least 20 characters).');
            return;
        }

        // Show loading state
        btn.disabled = true;
        spinner.style.display = 'block';
        btnText.textContent = 'Sending…';
    });
</script>

</body>
</html>
