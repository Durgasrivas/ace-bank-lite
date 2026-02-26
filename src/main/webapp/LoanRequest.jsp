<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Apply for Loan | AceBank</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/favicon.svg">
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@4.6.0/fonts/remixicon.css">
        <style>
            /* ---- Animated BG for Loan Page ---- */
            .loan-page {
                background: linear-gradient(135deg, #060d16, #0a1628, #0f2027) !important;
                background-size: 400% 400% !important;
                animation: lnGradientShift 12s ease infinite !important;
                overflow: hidden;
            }

            @keyframes lnGradientShift {
                0% {
                    background-position: 0% 50%;
                }

                50% {
                    background-position: 100% 50%;
                }

                100% {
                    background-position: 0% 50%;
                }
            }

            #ln-particles {
                position: fixed;
                inset: 0;
                z-index: 0;
                pointer-events: none;
            }

            .ln-orb {
                position: fixed;
                border-radius: 50%;
                filter: blur(90px);
                opacity: 0.3;
                z-index: 0;
                pointer-events: none;
            }

            .ln-orb-1 {
                width: 420px;
                height: 420px;
                background: radial-gradient(circle, #00ffa3, transparent 70%);
                top: -100px;
                left: -60px;
                animation: lnOrb1 14s ease-in-out infinite;
            }

            .ln-orb-2 {
                width: 350px;
                height: 350px;
                background: radial-gradient(circle, #00c6ff, transparent 70%);
                bottom: 5%;
                right: -80px;
                animation: lnOrb2 18s ease-in-out infinite;
            }

            .ln-orb-3 {
                width: 260px;
                height: 260px;
                background: radial-gradient(circle, #7b2ff7, transparent 70%);
                top: 55%;
                left: 12%;
                animation: lnOrb3 20s ease-in-out infinite;
            }

            @keyframes lnOrb1 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(50px, 70px) scale(1.08);
                }
            }

            @keyframes lnOrb2 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(-60px, -50px) scale(1.1);
                }
            }

            @keyframes lnOrb3 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(40px, 60px) scale(1.05);
                }
            }

            .loan-page .auth-wrapper {
                position: relative;
                z-index: 2;
            }

            .loan-page::before {
                background: rgba(6, 13, 22, 0.45) !important;
            }

            .loan-page .auth-card {
                animation: lnCardGlow 4s ease-in-out infinite alternate;
                width: 440px;
            }

            @keyframes lnCardGlow {
                0% {
                    box-shadow: 0 25px 60px rgba(0, 0, 0, 0.6);
                }

                100% {
                    box-shadow: 0 25px 80px rgba(0, 255, 163, 0.15), 0 0 60px rgba(0, 198, 255, 0.08);
                }
            }

            /* Loan type select */
            .loan-type-select {
                width: 100%;
                padding: 12px;
                border: none;
                border-radius: 10px;
                outline: none;
                margin: 8px 0;
                font-family: 'Poppins', sans-serif;
                font-size: 14px;
                background: white;
                color: #333;
                cursor: pointer;
                appearance: none;
                -webkit-appearance: none;
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%23666' d='M6 8L1 3h10z'/%3E%3C/svg%3E");
                background-repeat: no-repeat;
                background-position: right 12px center;
            }

            .loan-type-select:focus {
                box-shadow: 0 0 0 2px rgba(0, 198, 255, 0.4);
            }

            /* Alert messages */
            .ln-alert {
                padding: 12px 16px;
                border-radius: 10px;
                font-size: 13px;
                font-weight: 500;
                margin-bottom: 20px;
                text-align: center;
            }

            .ln-alert-success {
                background: rgba(0, 255, 153, 0.12);
                border: 1px solid rgba(0, 255, 153, 0.3);
                color: #00ff99;
            }

            .ln-alert-error {
                background: rgba(255, 77, 77, 0.12);
                border: 1px solid rgba(255, 77, 77, 0.3);
                color: #ff6b6b;
            }

            /* Loan type cards */
            .loan-info-row {
                display: flex;
                gap: 8px;
                margin-bottom: 20px;
            }

            .loan-info-chip {
                flex: 1;
                text-align: center;
                padding: 10px 6px;
                border-radius: 10px;
                background: rgba(0, 198, 255, 0.08);
                border: 1px solid rgba(0, 198, 255, 0.15);
                font-size: 11px;
                color: rgba(255, 255, 255, 0.7);
                line-height: 1.4;
            }

            .loan-info-chip i {
                display: block;
                font-size: 22px;
                color: #00c6ff;
                margin-bottom: 4px;
            }

            /* Pre-filled field styling */
            .prefilled-input {
                background: rgba(255, 255, 255, 0.85) !important;
                color: #444 !important;
            }

            /* Bank icon */
            .ln-bank-icon {
                text-align: center;
                font-size: 44px;
                margin-bottom: 8px;
            }

            /* ===== THREE COLUMN LAYOUT ===== */
            .loan-page .auth-wrapper {
                display: flex;
                gap: 50px;
                align-items: center;
                justify-content: center;
                z-index: 2;
                position: relative;
            }

            .loan-side-visual {
                width: 240px;
                flex-shrink: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 16px;
            }

            .loan-side-left {
                animation: lnSlideLeft 1s 0.2s ease both;
            }

            .loan-side-right {
                animation: lnSlideRight 1s 0.4s ease both;
            }

            @keyframes lnSlideLeft {
                from {
                    opacity: 0;
                    transform: translateX(-40px);
                }

                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }

            @keyframes lnSlideRight {
                from {
                    opacity: 0;
                    transform: translateX(40px);
                }

                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }

            /* LEFT: Loan Calculator Animation */
            .loan-calc {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                background: linear-gradient(135deg, #0a1628, #162a3a);
                border: 3px solid rgba(0, 255, 163, 0.25);
                display: flex;
                align-items: center;
                justify-content: center;
                position: relative;
                animation: calcFloat 5s ease-in-out infinite;
                box-shadow: 0 20px 50px rgba(0, 0, 0, 0.4), 0 0 30px rgba(0, 255, 163, 0.1);
            }

            .loan-calc::before {
                content: '';
                position: absolute;
                inset: 8px;
                border-radius: 50%;
                border: 2px dashed rgba(0, 255, 163, 0.15);
                animation: calcSpin 20s linear infinite;
            }

            .loan-calc i {
                font-size: 48px;
                color: #00ffa3;
                filter: drop-shadow(0 0 15px rgba(0, 255, 163, 0.4));
            }

            @keyframes calcSpin {
                to {
                    transform: rotate(360deg);
                }
            }

            @keyframes calcFloat {

                0%,
                100% {
                    transform: translateY(0);
                }

                50% {
                    transform: translateY(-15px);
                }
            }

            .loan-chip-row {
                display: flex;
                gap: 8px;
                flex-wrap: wrap;
                justify-content: center;
            }

            .loan-chip {
                background: rgba(0, 255, 163, 0.06);
                border: 1px solid rgba(0, 255, 163, 0.15);
                padding: 6px 12px;
                border-radius: 8px;
                font-size: 11px;
                font-weight: 600;
                color: rgba(255, 255, 255, 0.7);
                display: flex;
                align-items: center;
                gap: 5px;
                animation: lnChipIn 0.5s ease both;
            }

            .loan-chip:nth-child(1) {
                animation-delay: 0.5s;
            }

            .loan-chip:nth-child(2) {
                animation-delay: 0.7s;
            }

            .loan-chip:nth-child(3) {
                animation-delay: 0.9s;
            }

            .loan-chip i {
                color: #00ffa3;
                font-size: 14px;
            }

            @keyframes lnChipIn {
                from {
                    opacity: 0;
                    transform: translateY(8px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* RIGHT: Money Stack Animation */
            .ln-money-stack {
                position: relative;
                width: 200px;
                height: 200px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .ln-note {
                position: absolute;
                width: 160px;
                height: 70px;
                border-radius: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: 800;
                font-size: 24px;
                color: white;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            }

            .ln-note-1 {
                background: linear-gradient(135deg, #00ffa3, #00c853);
                transform: rotate(-8deg) translateY(-20px);
                animation: lnNote1 4s ease-in-out infinite;
                z-index: 3;
            }

            .ln-note-2 {
                background: linear-gradient(135deg, #00c6ff, #0072ff);
                transform: rotate(4deg) translateY(0px);
                animation: lnNote2 4.5s 0.5s ease-in-out infinite;
                z-index: 2;
            }

            .ln-note-3 {
                background: linear-gradient(135deg, #7b2ff7, #b57aff);
                transform: rotate(-3deg) translateY(20px);
                animation: lnNote3 5s 1s ease-in-out infinite;
                z-index: 1;
            }

            .ln-note-label {
                font-size: 9px;
                opacity: 0.5;
                position: absolute;
                left: 14px;
                bottom: 8px;
                letter-spacing: 1px;
                text-transform: uppercase;
                font-weight: 600;
            }

            @keyframes lnNote1 {

                0%,
                100% {
                    transform: rotate(-8deg) translateY(-20px);
                }

                50% {
                    transform: rotate(-5deg) translateY(-30px);
                }
            }

            @keyframes lnNote2 {

                0%,
                100% {
                    transform: rotate(4deg) translateY(0px);
                }

                50% {
                    transform: rotate(6deg) translateY(-12px);
                }
            }

            @keyframes lnNote3 {

                0%,
                100% {
                    transform: rotate(-3deg) translateY(20px);
                }

                50% {
                    transform: rotate(-1deg) translateY(10px);
                }
            }

            /* Floating coins */
            .ln-coin {
                position: absolute;
                width: 34px;
                height: 34px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 16px;
                font-weight: 800;
                color: white;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
                z-index: 4;
            }

            .lnc-1 {
                background: linear-gradient(135deg, #ffb347, #ff8c00);
                top: 5%;
                left: 0;
                animation: lnCBounce 3s ease-in-out infinite;
            }

            .lnc-2 {
                background: linear-gradient(135deg, #ff4d6a, #ff6b6b);
                bottom: 10%;
                right: 5%;
                animation: lnCBounce 3.5s 0.5s ease-in-out infinite;
            }

            .lnc-3 {
                background: linear-gradient(135deg, #00c6ff, #0072ff);
                top: 15%;
                right: 0;
                animation: lnCBounce 4s 1s ease-in-out infinite;
            }

            @keyframes lnCBounce {

                0%,
                100% {
                    transform: translateY(0) rotate(0);
                }

                50% {
                    transform: translateY(-10px) rotate(10deg);
                }
            }

            @media (max-width: 1400px) {
                .loan-page .auth-wrapper {
                    gap: 20px;
                }
            }

            @media (max-width: 1100px) {
                .loan-side-visual {
                    transform: scale(0.8);
                    /* Scale down for tablet screens */
                    opacity: 0.7;
                    /* Make it slightly transparent */
                }
            }

            @media (max-width: 900px) {

                /* Further hide for smaller screens if needed */
                .loan-side-visual {
                    display: none;
                }
            }
        </style>
    </head>

    <body class="loan-page">

        <!-- Animated background layers -->
        <canvas id="ln-particles"></canvas>
        <div class="ln-orb ln-orb-1"></div>
        <div class="ln-orb ln-orb-2"></div>
        <div class="ln-orb ln-orb-3"></div>

        <div class="auth-wrapper">

            <!-- LEFT: Loan Calculator Animation -->
            <div class="loan-side-visual loan-side-left">
                <div class="loan-calc">
                    <i class="ri-calculator-line"></i>
                </div>
                <h3 style="color:white; font-size:18px; font-weight:700; text-align:center;">
                    Easy <span style="color:#00ffa3;">EMI</span>
                </h3>
                <p style="color:rgba(255,255,255,0.45); font-size:12px; text-align:center; line-height:1.6;">
                    Flexible repayment plans tailored to your needs.
                </p>
                <div class="loan-chip-row">
                    <div class="loan-chip"><i class="ri-timer-flash-line"></i> Fast</div>
                    <div class="loan-chip"><i class="ri-percent-line"></i> Low EMI</div>
                    <div class="loan-chip"><i class="ri-shield-check-line"></i> Secure</div>
                </div>
            </div>

            <!-- CENTER: Loan Form -->
            <div class="auth-card">

                <!-- Logo -->
                <div style="text-align:center; margin-bottom:10px;">
                    <h1 style="font-weight:700; font-size:28px;">
                        Ace<span style="color:#00c6ff;">Bank</span>
                    </h1>
                </div>

                <!-- Bank Icon -->
                <div class="ln-bank-icon">🏦</div>

                <!-- Title -->
                <h2 style="text-align:center; margin-bottom:8px;">Apply for Loan</h2>
                <p style="text-align:center; color:rgba(255,255,255,0.6); font-size:14px; margin-bottom:20px;">
                    Select a loan type and we'll process your request.
                </p>

                <!-- Quick Info Chips -->
                <div class="loan-info-row">
                    <div class="loan-info-chip">
                        <i class="ri-timer-flash-line"></i>
                        Quick Approval
                    </div>
                    <div class="loan-info-chip">
                        <i class="ri-percent-line"></i>
                        Low Interest
                    </div>
                    <div class="loan-info-chip">
                        <i class="ri-shield-check-line"></i>
                        100% Secure
                    </div>
                </div>

                <!-- Alert Messages -->
                <% if (request.getParameter("error") !=null) { %>
                    <div class="ln-alert ln-alert-error">
                        <i class="ri-error-warning-line"></i>
                        <%= request.getParameter("error") %>
                    </div>
                    <% } %>

                        <% if (request.getParameter("success") !=null) { %>
                            <div class="ln-alert ln-alert-success">
                                <i class="ri-checkbox-circle-line"></i>
                                <%= request.getParameter("success") %>
                            </div>
                            <% } %>

                                <!-- Loan Application Form -->
                                <form action="LoanRequest" method="POST">

                                    <div class="form-control">
                                        <label>Applicant Name</label>
                                        <input type="text" value="${sessionScope.firstName} ${sessionScope.lastName}"
                                            class="prefilled-input" readonly>
                                    </div>

                                    <div class="form-control">
                                        <label>Email Address</label>
                                        <input type="email" value="${sessionScope.email}" class="prefilled-input"
                                            readonly>
                                    </div>

                                    <div class="form-control">
                                        <label>Loan Type</label>
                                        <select name="loanType" class="loan-type-select" required>
                                            <option value="" disabled selected>— Select Loan Type —</option>
                                            <option value="Home Loan">🏠 Home Loan</option>
                                            <option value="Personal Loan">💳 Personal Loan</option>
                                            <option value="Education Loan">🎓 Education Loan</option>
                                            <option value="Business Loan">💼 Business Loan</option>
                                            <option value="Vehicle Loan">🚗 Vehicle Loan</option>
                                        </select>
                                    </div>

                                    <div class="form-control">
                                        <label><i class="ri-money-dollar-circle-line" style="margin-right:4px;"></i>
                                            Loan Amount (₹)</label>
                                        <input type="number" name="loanAmount" placeholder="Enter loan amount"
                                            min="1000" step="1000" required>
                                    </div>

                                    <button type="submit">
                                        <i class="ri-send-plane-fill"></i> SUBMIT APPLICATION
                                    </button>

                                </form>

                                <!-- Links -->
                                <p style="text-align:center; margin-top:22px;">
                                    <a href="${pageContext.request.contextPath}/home">← Back to Dashboard</a>
                                </p>

            </div>
        </div>

        <script src="${pageContext.request.contextPath}/js/style.js"></script>

        <!-- Particle Network Animation -->
        <script>
            (function () {
                const canvas = document.getElementById('ln-particles');
                const ctx = canvas.getContext('2d');
                let w, h, particles;
                const PARTICLE_COUNT = 70;
                const MAX_DIST = 130;

                function resize() {
                    w = canvas.width = window.innerWidth;
                    h = canvas.height = window.innerHeight;
                }

                function createParticles() {
                    particles = [];
                    for (let i = 0; i < PARTICLE_COUNT; i++) {
                        particles.push({
                            x: Math.random() * w,
                            y: Math.random() * h,
                            vx: (Math.random() - 0.5) * 0.6,
                            vy: (Math.random() - 0.5) * 0.6,
                            r: Math.random() * 2 + 1
                        });
                    }
                }

                function draw() {
                    ctx.clearRect(0, 0, w, h);

                    for (let i = 0; i < particles.length; i++) {
                        for (let j = i + 1; j < particles.length; j++) {
                            const dx = particles[i].x - particles[j].x;
                            const dy = particles[i].y - particles[j].y;
                            const dist = Math.sqrt(dx * dx + dy * dy);
                            if (dist < MAX_DIST) {
                                const alpha = (1 - dist / MAX_DIST) * 0.25;
                                ctx.strokeStyle = 'rgba(0,255,163,' + alpha + ')';
                                ctx.lineWidth = 0.8;
                                ctx.beginPath();
                                ctx.moveTo(particles[i].x, particles[i].y);
                                ctx.lineTo(particles[j].x, particles[j].y);
                                ctx.stroke();
                            }
                        }
                    }

                    for (const p of particles) {
                        ctx.beginPath();
                        ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2);
                        ctx.fillStyle = 'rgba(0,255,163,0.55)';
                        ctx.fill();

                        p.x += p.vx;
                        p.y += p.vy;

                        if (p.x < 0 || p.x > w) p.vx *= -1;
                        if (p.y < 0 || p.y > h) p.vy *= -1;
                    }

                    requestAnimationFrame(draw);
                }

                window.addEventListener('resize', function () {
                    resize();
                    createParticles();
                });

                resize();
                createParticles();
                draw();
            })();
        </script>

    </body>

    </html>