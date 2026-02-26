<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Forgot Password | AceBank</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/favicon.svg">
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
        <style>
            /* ---- Animated BG for Forgot Password ---- */
            .forgot-page {
                background: linear-gradient(135deg, #060d16, #0a1628, #0f2027) !important;
                background-size: 400% 400% !important;
                animation: fpGradientShift 12s ease infinite !important;
                overflow: hidden;
            }

            @keyframes fpGradientShift {
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

            #fp-particles {
                position: fixed;
                inset: 0;
                z-index: 0;
                pointer-events: none;
            }

            .fp-orb {
                position: fixed;
                border-radius: 50%;
                filter: blur(90px);
                opacity: 0.3;
                z-index: 0;
                pointer-events: none;
            }

            .fp-orb-1 {
                width: 420px;
                height: 420px;
                background: radial-gradient(circle, #00c6ff, transparent 70%);
                top: -100px;
                right: -60px;
                animation: fpOrb1 14s ease-in-out infinite;
            }

            .fp-orb-2 {
                width: 350px;
                height: 350px;
                background: radial-gradient(circle, #7b2ff7, transparent 70%);
                bottom: 5%;
                left: -80px;
                animation: fpOrb2 18s ease-in-out infinite;
            }

            .fp-orb-3 {
                width: 260px;
                height: 260px;
                background: radial-gradient(circle, #ff6b6b, transparent 70%);
                top: 55%;
                right: 12%;
                animation: fpOrb3 20s ease-in-out infinite;
            }

            @keyframes fpOrb1 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(-50px, 70px) scale(1.08);
                }
            }

            @keyframes fpOrb2 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(60px, -50px) scale(1.1);
                }
            }

            @keyframes fpOrb3 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(-40px, 60px) scale(1.05);
                }
            }

            .forgot-page .auth-wrapper {
                position: relative;
                z-index: 2;
            }

            .forgot-page::before {
                background: rgba(6, 13, 22, 0.45) !important;
            }

            .forgot-page .auth-card {
                animation: fpCardGlow 4s ease-in-out infinite alternate;
            }

            @keyframes fpCardGlow {
                0% {
                    box-shadow: 0 25px 60px rgba(0, 0, 0, 0.6);
                }

                100% {
                    box-shadow: 0 25px 80px rgba(0, 198, 255, 0.18), 0 0 60px rgba(123, 47, 247, 0.08);
                }
            }

            /* Step indicator */
            .fp-steps {
                display: flex;
                justify-content: center;
                gap: 12px;
                margin-bottom: 28px;
            }

            .fp-step {
                display: flex;
                align-items: center;
                gap: 8px;
                font-size: 13px;
                font-weight: 500;
                opacity: 0.4;
                transition: opacity 0.3s;
            }

            .fp-step.active {
                opacity: 1;
            }

            .fp-step-num {
                width: 28px;
                height: 28px;
                border-radius: 50%;
                background: rgba(0, 198, 255, 0.15);
                border: 1.5px solid rgba(0, 198, 255, 0.3);
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: 700;
                font-size: 13px;
                color: #00c6ff;
            }

            .fp-step.active .fp-step-num {
                background: linear-gradient(135deg, #00c6ff, #0072ff);
                border-color: transparent;
                color: white;
            }

            .fp-step-divider {
                width: 30px;
                height: 2px;
                background: rgba(255, 255, 255, 0.15);
                border-radius: 1px;
            }

            /* Alert messages */
            .fp-alert {
                padding: 12px 16px;
                border-radius: 10px;
                font-size: 13px;
                font-weight: 500;
                margin-bottom: 20px;
                text-align: center;
            }

            .fp-alert-success {
                background: rgba(0, 255, 153, 0.12);
                border: 1px solid rgba(0, 255, 153, 0.3);
                color: #00ff99;
            }

            .fp-alert-error {
                background: rgba(255, 77, 77, 0.12);
                border: 1px solid rgba(255, 77, 77, 0.3);
                color: #ff6b6b;
            }

            /* OTP input styling */
            .otp-input {
                text-align: center;
                font-size: 24px !important;
                font-weight: 700 !important;
                letter-spacing: 8px;
            }

            /* Hidden step */
            .fp-hidden {
                display: none;
            }

            /* Lock icon animation */
            .fp-lock-icon {
                text-align: center;
                font-size: 48px;
                margin-bottom: 8px;
                animation: fpLockPulse 2s ease-in-out infinite;
            }

            @keyframes fpLockPulse {

                0%,
                100% {
                    transform: scale(1);
                }

                50% {
                    transform: scale(1.08);
                }
            }
        </style>
    </head>

    <body class="forgot-page">

        <!-- Animated background layers -->
        <canvas id="fp-particles"></canvas>
        <div class="fp-orb fp-orb-1"></div>
        <div class="fp-orb fp-orb-2"></div>
        <div class="fp-orb fp-orb-3"></div>

        <div class="auth-wrapper">
            <div class="auth-card">

                <!-- Logo -->
                <div style="text-align:center; margin-bottom:10px;">
                    <h1 style="font-weight:700; font-size:28px;">
                        Ace<span style="color:#00c6ff;">Bank</span>
                    </h1>
                </div>

                <!-- Lock Icon -->
                <div class="fp-lock-icon">🔐</div>

                <!-- Title -->
                <h2 style="text-align:center; margin-bottom:8px;">Forgot Password</h2>

                <!-- Step Indicators -->
                <div class="fp-steps">
                    <div class="fp-step active" id="step1-indicator">
                        <span class="fp-step-num">1</span>
                        <span>Email</span>
                    </div>
                    <div class="fp-step-divider"></div>
                    <div class="fp-step" id="step2-indicator">
                        <span class="fp-step-num">2</span>
                        <span>Reset</span>
                    </div>
                </div>

                <!-- Alert Messages -->
                <% if (request.getParameter("error") !=null) { %>
                    <div class="fp-alert fp-alert-error">
                        <%= request.getParameter("error") %>
                    </div>
                    <% } %>

                        <% if (request.getParameter("success") !=null) { %>
                            <div class="fp-alert fp-alert-success">
                                <%= request.getParameter("success") %>
                            </div>
                            <% } %>

                                <!-- STEP 1: Enter Email -->
                                <div id="step1-form" class="${param.otpSent == 'true' ? 'fp-hidden' : ''}">
                                    <p
                                        style="text-align:center; color:rgba(255,255,255,0.6); font-size:14px; margin-bottom:24px;">
                                        Enter your registered email address to receive an OTP.
                                    </p>

                                    <form action="ForgotPassword" method="POST">
                                        <input type="hidden" name="action" value="sendOtp">

                                        <div class="form-control">
                                            <label>Email Address</label>
                                            <input type="email" name="email" placeholder="Enter your registered email"
                                                required>
                                        </div>

                                        <button type="submit">SEND OTP</button>
                                    </form>
                                </div>

                                <!-- STEP 2: Enter OTP + New Password -->
                                <div id="step2-form" class="${param.otpSent == 'true' ? '' : 'fp-hidden'}">
                                    <p
                                        style="text-align:center; color:rgba(255,255,255,0.6); font-size:14px; margin-bottom:24px;">
                                        Enter the OTP sent to your email and choose a new password.
                                    </p>

                                    <form action="ForgotPassword" method="POST">
                                        <input type="hidden" name="action" value="resetPassword">
                                        <input type="hidden" name="email" value="${param.email}">

                                        <div class="form-control">
                                            <label>OTP Code</label>
                                            <input type="text" name="otp" class="otp-input" maxlength="6"
                                                placeholder="------" required pattern="[0-9]{6}"
                                                title="Enter the 6-digit OTP">
                                        </div>

                                        <div class="form-control">
                                            <label>New Password</label>
                                            <input type="password" name="newPassword" id="newPassword"
                                                placeholder="Min. 10 characters" required minlength="10">
                                        </div>

                                        <div class="form-control">
                                            <label>Confirm Password</label>
                                            <input type="password" name="confirmPassword" id="confirmPassword"
                                                placeholder="Re-enter new password" required minlength="10">
                                        </div>

                                        <button type="submit">RESET PASSWORD</button>
                                    </form>

                                    <p style="text-align:center; margin-top:15px;">
                                        <a href="ForgotPassword" style="font-size:13px;">← Send a new OTP</a>
                                    </p>
                                </div>

                                <!-- Links -->
                                <p style="text-align:center; margin-top:22px;">
                                    <a href="login.jsp">← Back to Login</a>
                                </p>

            </div>
        </div>

        <script src="${pageContext.request.contextPath}/js/style.js"></script>

        <!-- Step indicator toggle -->
        <script>
            (function () {
                var otpSent = '${param.otpSent}' === 'true';
                if (otpSent) {
                    document.getElementById('step1-indicator').classList.remove('active');
                    document.getElementById('step2-indicator').classList.add('active');
                }
            })();
        </script>

        <!-- Particle Network Animation -->
        <script>
            (function () {
                const canvas = document.getElementById('fp-particles');
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
                                ctx.strokeStyle = 'rgba(255,107,107,' + alpha + ')';
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
                        ctx.fillStyle = 'rgba(255,107,107,0.55)';
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