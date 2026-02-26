<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Password | AceBank</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/favicon.svg">
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
        <style>
            /* ---- Animated BG overrides for this page ---- */
            .reset-page {
                background: linear-gradient(135deg, #060d16, #0a1628, #0f2027) !important;
                background-size: 400% 400% !important;
                animation: cpGradientShift 12s ease infinite !important;
                overflow: hidden;
            }

            @keyframes cpGradientShift {
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

            /* Particle canvas behind everything */
            #cp-particles {
                position: fixed;
                inset: 0;
                z-index: 0;
                pointer-events: none;
            }

            /* Floating gradient orbs */
            .cp-orb {
                position: fixed;
                border-radius: 50%;
                filter: blur(90px);
                opacity: 0.3;
                z-index: 0;
                pointer-events: none;
            }

            .cp-orb-1 {
                width: 420px;
                height: 420px;
                background: radial-gradient(circle, #00c6ff, transparent 70%);
                top: -100px;
                right: -60px;
                animation: cpOrb1 14s ease-in-out infinite;
            }

            .cp-orb-2 {
                width: 350px;
                height: 350px;
                background: radial-gradient(circle, #7b2ff7, transparent 70%);
                bottom: 5%;
                left: -80px;
                animation: cpOrb2 18s ease-in-out infinite;
            }

            .cp-orb-3 {
                width: 260px;
                height: 260px;
                background: radial-gradient(circle, #00ffa3, transparent 70%);
                top: 55%;
                right: 12%;
                animation: cpOrb3 20s ease-in-out infinite;
            }

            @keyframes cpOrb1 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(-50px, 70px) scale(1.08);
                }
            }

            @keyframes cpOrb2 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(60px, -50px) scale(1.1);
                }
            }

            @keyframes cpOrb3 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(-40px, 60px) scale(1.05);
                }
            }

            /* Ensure card sits above the animated bg */
            .reset-page .auth-wrapper {
                position: relative;
                z-index: 2;
            }

            /* Remove the static dark overlay for this page */
            .reset-page::before {
                background: rgba(6, 13, 22, 0.45) !important;
            }

            /* Subtle card glow pulse */
            .reset-page .auth-card {
                animation: cpCardGlow 4s ease-in-out infinite alternate;
            }

            @keyframes cpCardGlow {
                0% {
                    box-shadow: 0 25px 60px rgba(0, 0, 0, 0.6);
                }

                100% {
                    box-shadow: 0 25px 80px rgba(0, 198, 255, 0.18), 0 0 60px rgba(123, 47, 247, 0.08);
                }
            }

            /* ===== 2-COLUMN LAYOUT ===== */
            .reset-page .auth-wrapper {
                display: flex;
                gap: 50px;
                align-items: center;
                justify-content: center;
                max-width: 900px;
                margin: 0 auto;
                width: 100%;
            }

            /* LEFT ANIMATION (Padlock) */
            .reset-side-visual {
                width: 250px;
                flex-shrink: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 20px;
                animation: rsSlideLeft 1s 0.2s ease both;
            }

            @keyframes rsSlideLeft {
                from {
                    opacity: 0;
                    transform: translateX(-40px);
                }

                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }

            .reset-padlock {
                width: 140px;
                height: 140px;
                border-radius: 20px;
                background: linear-gradient(135deg, rgba(123, 47, 247, 0.15), rgba(0, 198, 255, 0.15));
                border: 2px solid rgba(123, 47, 247, 0.3);
                display: flex;
                align-items: center;
                justify-content: center;
                position: relative;
                animation: lockFloat 4s ease-in-out infinite;
                box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3), inset 0 0 20px rgba(123, 47, 247, 0.2);
            }

            .reset-padlock::after {
                content: '';
                position: absolute;
                inset: -6px;
                border: 1px dashed rgba(0, 198, 255, 0.4);
                border-radius: 25px;
                animation: lockSpin 15s linear infinite;
            }

            .reset-padlock i {
                font-size: 60px;
                background: linear-gradient(135deg, #00c6ff, #7b2ff7);
                -webkit-background-clip: text;
                background-clip: text;
                -webkit-text-fill-color: transparent;
                filter: drop-shadow(0 0 10px rgba(123, 47, 247, 0.5));
            }

            @keyframes lockFloat {

                0%,
                100% {
                    transform: translateY(0);
                }

                50% {
                    transform: translateY(-15px);
                }
            }

            @keyframes lockSpin {
                to {
                    transform: rotate(360deg);
                }
            }

            .reset-chip-row {
                display: flex;
                gap: 10px;
                flex-wrap: wrap;
                justify-content: center;
            }

            .reset-chip {
                background: rgba(123, 47, 247, 0.1);
                border: 1px solid rgba(123, 47, 247, 0.2);
                padding: 6px 14px;
                border-radius: 8px;
                font-size: 11px;
                font-weight: 600;
                color: rgba(255, 255, 255, 0.8);
                display: flex;
                align-items: center;
                gap: 6px;
                animation: rsChipIn 0.5s ease both;
            }

            .reset-chip:nth-child(1) {
                animation-delay: 0.5s;
            }

            .reset-chip:nth-child(2) {
                animation-delay: 0.7s;
            }

            .reset-chip i {
                color: #00c6ff;
            }

            @keyframes rsChipIn {
                from {
                    opacity: 0;
                    transform: translateY(8px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @media (max-width: 900px) {
                .reset-page .auth-wrapper {
                    flex-direction: column;
                    gap: 30px;
                }
            }
        </style>
    </head>

    <body class="reset-page">

        <!-- Animated background layers -->
        <canvas id="cp-particles"></canvas>
        <div class="cp-orb cp-orb-1"></div>
        <div class="cp-orb cp-orb-2"></div>
        <div class="cp-orb cp-orb-3"></div>

        <div class="auth-wrapper">

            <!-- LEFT: Lock Animation Visual -->
            <div class="reset-side-visual">
                <div class="reset-padlock">
                    <i class="ri-lock-password-fill"></i>
                </div>
                <h3 style="color:white; font-size:20px; font-weight:700; text-align:center; margin:0;">
                    Secure <span style="color:#00c6ff;">Update</span>
                </h3>
                <p style="color:rgba(255,255,255,0.5); font-size:13px; text-align:center; line-height:1.5; margin:0;">
                    Your new password is encrypted with bank-grade BCrypt technology.
                </p>
                <div class="reset-chip-row">
                    <div class="reset-chip"><i class="ri-shield-check-line"></i> Encrypted</div>
                    <div class="reset-chip"><i class="ri-refresh-line"></i> Instant</div>
                </div>
            </div>

            <!-- RIGHT: Form Card -->
            <div class="auth-card">

                <!-- Logo -->
                <div style="text-align:center; margin-bottom:10px;">
                    <h1 style="font-weight:700; font-size:28px;">
                        Ace<span style="color:#00c6ff;">Bank</span>
                    </h1>
                </div>

                <!-- Title -->
                <h2 style="text-align:center; margin-bottom:8px;">Change Password</h2>
                <p style="text-align:center; color:rgba(255,255,255,0.6); font-size:14px; margin-bottom:28px;">
                    Enter your current password and choose a new one.
                </p>

                <!-- Change Password Form -->
                <form action="ChangePassword" method="POST">

                    <div class="form-control">
                        <label>Account Number</label>
                        <input type="text" name="accountNumber" value="${sessionScope.accountNumber}"
                            placeholder="Enter Account Number" required>
                    </div>

                    <div class="form-control">
                        <label>Current Password</label>
                        <input type="password" name="currentPassword" placeholder="Enter Current Password" required>
                    </div>

                    <div class="form-control">
                        <label>New Password</label>
                        <input type="password" name="newPassword" placeholder="Min. 10 characters" required>
                    </div>

                    <div class="form-control">
                        <label>Confirm New Password</label>
                        <input type="password" name="confirmPassword" placeholder="Confirm New Password" required>
                    </div>

                    <button type="submit">UPDATE PASSWORD</button>

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
                const canvas = document.getElementById('cp-particles');
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

                    // Draw connections
                    for (let i = 0; i < particles.length; i++) {
                        for (let j = i + 1; j < particles.length; j++) {
                            const dx = particles[i].x - particles[j].x;
                            const dy = particles[i].y - particles[j].y;
                            const dist = Math.sqrt(dx * dx + dy * dy);
                            if (dist < MAX_DIST) {
                                const alpha = (1 - dist / MAX_DIST) * 0.25;
                                ctx.strokeStyle = 'rgba(0,198,255,' + alpha + ')';
                                ctx.lineWidth = 0.8;
                                ctx.beginPath();
                                ctx.moveTo(particles[i].x, particles[i].y);
                                ctx.lineTo(particles[j].x, particles[j].y);
                                ctx.stroke();
                            }
                        }
                    }

                    // Draw & update particles
                    for (const p of particles) {
                        ctx.beginPath();
                        ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2);
                        ctx.fillStyle = 'rgba(0,198,255,0.55)';
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