<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About | AceBank</title>
        <meta name="description"
            content="Learn about AceBank — our mission, vision, and the team building the future of digital banking.">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/favicon.svg">
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@4.6.0/fonts/remixicon.css">
        <style>
            /* ---- About Page Animated BG ---- */
            .about-page {
                background: linear-gradient(135deg, #0f2027, #203a43, #2c5364) !important;
                min-height: 100vh;
                position: relative;
                overflow-x: hidden;
            }

            /* ---- Floating Orbs ---- */
            .abt-orb {
                position: fixed;
                border-radius: 50%;
                filter: blur(100px);
                opacity: 0.3;
                z-index: 0;
                pointer-events: none;
            }

            .abt-orb-1 {
                width: 500px;
                height: 500px;
                background: radial-gradient(circle, #7b2ff7, transparent 70%);
                top: -120px;
                left: -80px;
                animation: abtOrb1 14s ease-in-out infinite;
            }

            .abt-orb-2 {
                width: 400px;
                height: 400px;
                background: radial-gradient(circle, #00c6ff, transparent 70%);
                bottom: 10%;
                right: -100px;
                animation: abtOrb2 18s ease-in-out infinite;
            }

            .abt-orb-3 {
                width: 300px;
                height: 300px;
                background: radial-gradient(circle, #00ffa3, transparent 70%);
                top: 50%;
                left: 15%;
                animation: abtOrb3 20s ease-in-out infinite;
            }

            @keyframes abtOrb1 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(50px, 70px) scale(1.08);
                }
            }

            @keyframes abtOrb2 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(-60px, -50px) scale(1.1);
                }
            }

            @keyframes abtOrb3 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(40px, 60px) scale(1.05);
                }
            }

            /* ---- Particle Canvas ---- */
            #abt-particles {
                position: fixed;
                inset: 0;
                z-index: 0;
                pointer-events: none;
            }

            /* ---- About Hero ---- */
            .abt-hero {
                position: relative;
                z-index: 1;
                max-width: 1280px;
                margin: 0 auto;
                padding: 160px 60px 80px;
                text-align: center;
                animation: abtFadeUp 1s ease both;
            }

            @keyframes abtFadeUp {
                from {
                    opacity: 0;
                    transform: translateY(40px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .abt-hero h1 {
                font-size: 52px;
                font-weight: 800;
                letter-spacing: -1px;
                margin-bottom: 20px;
                line-height: 1.15;
            }

            .abt-hero-sub {
                font-size: 18px;
                line-height: 1.7;
                color: rgba(255, 255, 255, 0.65);
                max-width: 640px;
                margin: 0 auto 40px;
            }

            /* ---- Story Section ---- */
            .abt-story {
                position: relative;
                z-index: 1;
                max-width: 1280px;
                margin: 0 auto;
                padding: 40px 60px 80px;
            }

            .abt-story-grid {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 50px;
                align-items: center;
            }

            .abt-story-text h2 {
                font-size: 36px;
                font-weight: 800;
                margin-bottom: 20px;
                line-height: 1.2;
            }

            .abt-story-text p {
                font-size: 15px;
                line-height: 1.8;
                color: rgba(255, 255, 255, 0.6);
                margin-bottom: 16px;
            }

            .abt-story-visual {
                display: flex;
                flex-direction: column;
                gap: 20px;
                animation: abtFadeUp 1s 0.3s ease both;
            }

            .abt-milestone {
                background: rgba(255, 255, 255, 0.04);
                border: 1px solid rgba(255, 255, 255, 0.07);
                backdrop-filter: blur(12px);
                border-radius: 18px;
                padding: 24px 28px;
                display: flex;
                align-items: center;
                gap: 18px;
                transition: transform 0.3s, border-color 0.3s;
            }

            .abt-milestone:hover {
                transform: translateX(8px);
                border-color: rgba(0, 198, 255, 0.2);
            }

            .abt-milestone-icon {
                width: 50px;
                height: 50px;
                border-radius: 14px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 24px;
                flex-shrink: 0;
            }

            .abt-milestone-icon.blue {
                background: rgba(0, 198, 255, 0.12);
                color: #00c6ff;
            }

            .abt-milestone-icon.green {
                background: rgba(0, 255, 163, 0.12);
                color: #00ffa3;
            }

            .abt-milestone-icon.purple {
                background: rgba(123, 47, 247, 0.12);
                color: #b57aff;
            }

            .abt-milestone-icon.gold {
                background: rgba(255, 179, 71, 0.12);
                color: #ffb347;
            }

            .abt-milestone-info h4 {
                font-size: 16px;
                font-weight: 700;
                margin-bottom: 4px;
            }

            .abt-milestone-info p {
                font-size: 13px;
                color: rgba(255, 255, 255, 0.5);
                margin: 0;
            }

            /* ---- Values Section ---- */
            .abt-values {
                position: relative;
                z-index: 1;
                max-width: 1280px;
                margin: 0 auto;
                padding: 60px 60px 100px;
            }

            .abt-values-grid {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 30px;
            }

            .abt-value-card {
                background: rgba(255, 255, 255, 0.04);
                border: 1px solid rgba(255, 255, 255, 0.07);
                backdrop-filter: blur(12px);
                border-radius: 22px;
                padding: 40px 32px;
                text-align: center;
                transition: transform 0.35s, box-shadow 0.35s, border-color 0.35s;
            }

            .abt-value-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 20px 50px rgba(0, 0, 0, 0.35);
                border-color: rgba(0, 198, 255, 0.2);
            }

            .abt-value-icon {
                width: 64px;
                height: 64px;
                border-radius: 18px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 30px;
                margin: 0 auto 22px;
            }

            .abt-value-card h3 {
                font-size: 20px;
                font-weight: 700;
                margin-bottom: 12px;
            }

            .abt-value-card p {
                font-size: 14.5px;
                line-height: 1.7;
                color: rgba(255, 255, 255, 0.6);
            }

            /* ---- Team Section ---- */
            .abt-team {
                position: relative;
                z-index: 1;
                max-width: 1280px;
                margin: 0 auto;
                padding: 0 60px 80px;
            }

            .abt-team-grid {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 24px;
            }

            .abt-team-card {
                text-align: center;
                background: rgba(255, 255, 255, 0.04);
                border: 1px solid rgba(255, 255, 255, 0.07);
                border-radius: 20px;
                padding: 36px 20px;
                transition: transform 0.3s, border-color 0.3s;
            }

            .abt-team-card:hover {
                transform: translateY(-4px);
                border-color: rgba(0, 198, 255, 0.2);
            }

            .abt-team-avatar {
                width: 72px;
                height: 72px;
                border-radius: 50%;
                margin: 0 auto 16px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 32px;
            }

            .abt-team-card h4 {
                font-size: 16px;
                font-weight: 700;
                margin-bottom: 4px;
            }

            .abt-team-card p {
                font-size: 13px;
                color: rgba(255, 255, 255, 0.5);
            }

            /* ---- Responsive ---- */
            @media(max-width: 960px) {
                .abt-hero {
                    padding: 140px 24px 60px;
                }

                .abt-hero h1 {
                    font-size: 34px;
                }

                .abt-story-grid {
                    grid-template-columns: 1fr;
                }

                .abt-values-grid {
                    grid-template-columns: 1fr;
                }

                .abt-team-grid {
                    grid-template-columns: repeat(2, 1fr);
                }

                .abt-story,
                .abt-values,
                .abt-team {
                    padding-left: 24px;
                    padding-right: 24px;
                }
            }
        </style>
    </head>

    <body class="about-page">

        <!-- Animated Background Layers -->
        <canvas id="abt-particles"></canvas>
        <div class="abt-orb abt-orb-1"></div>
        <div class="abt-orb abt-orb-2"></div>
        <div class="abt-orb abt-orb-3"></div>

        <!-- ====== HEADER / NAVBAR ====== -->
        <header class="idx-header">
            <div class="idx-header-inner">
                <a href="${pageContext.request.contextPath}/" class="idx-logo">
                    Ace<span>Bank</span>
                </a>
                <nav class="idx-nav">
                    <a href="${pageContext.request.contextPath}/index.jsp#features"><i class="ri-apps-line"></i>
                        Features</a>
                    <a href="${pageContext.request.contextPath}/about.jsp"
                        style="color:#00c6ff; border-color: rgba(0,198,255,0.3); background: rgba(0,198,255,0.1);"><i
                            class="ri-information-line"></i> About</a>
                    <a href="${pageContext.request.contextPath}/login.jsp" class="idx-nav-link"><i
                            class="ri-login-box-line"></i> Login</a>
                    <a href="${pageContext.request.contextPath}/sign-up.jsp" class="idx-btn-signup"><i
                            class="ri-user-add-line"></i> Open Account</a>
                </nav>
            </div>
        </header>

        <!-- ====== HERO SECTION ====== -->
        <section class="abt-hero">
            <span class="idx-badge"><i class="ri-team-line"></i> Our Story</span>
            <h1>
                Building the Future of<br>
                <span class="idx-gradient-text">Digital Banking.</span>
            </h1>
            <p class="abt-hero-sub">
                AceBank was founded with a simple idea: banking should be effortless, accessible,
                and built for the way people live today. We're on a mission to empower millions
                with smarter financial tools.
            </p>
        </section>

        <!-- ====== OUR STORY SECTION ====== -->
        <section class="abt-story">
            <div class="abt-story-grid">
                <div class="abt-story-text">
                    <span class="idx-section-tag">Our Journey</span>
                    <h2>From Idea to <span class="idx-gradient-text">Impact</span></h2>
                    <p>
                        What started as a college project in 2024 has grown into a platform trusted
                        by over 2 million users worldwide. We saw the gap between traditional banking
                        and modern life — and we decided to bridge it.
                    </p>
                    <p>
                        Today, AceBank processes billions in transactions, serves users across 150+
                        countries, and maintains 99.9% uptime. But we're just getting started.
                    </p>
                </div>
                <div class="abt-story-visual">
                    <div class="abt-milestone">
                        <div class="abt-milestone-icon blue"><i class="ri-lightbulb-flash-line"></i></div>
                        <div class="abt-milestone-info">
                            <h4>2024 — The Spark</h4>
                            <p>AceBank idea born as a college fintech project</p>
                        </div>
                    </div>
                    <div class="abt-milestone">
                        <div class="abt-milestone-icon green"><i class="ri-rocket-2-line"></i></div>
                        <div class="abt-milestone-info">
                            <h4>2025 — Launch</h4>
                            <p>Public beta launched with 10,000 early users</p>
                        </div>
                    </div>
                    <div class="abt-milestone">
                        <div class="abt-milestone-icon purple"><i class="ri-global-line"></i></div>
                        <div class="abt-milestone-info">
                            <h4>2025 — Going Global</h4>
                            <p>Expanded to 150+ countries with multi-currency support</p>
                        </div>
                    </div>
                    <div class="abt-milestone">
                        <div class="abt-milestone-icon gold"><i class="ri-trophy-line"></i></div>
                        <div class="abt-milestone-info">
                            <h4>2026 — 2M Users</h4>
                            <p>Crossed 2 million active users milestone</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ====== VALUES SECTION ====== -->
        <section class="abt-values">
            <div class="idx-section-head">
                <span class="idx-section-tag">What Drives Us</span>
                <h2>Our Core <span class="idx-gradient-text">Values</span></h2>
            </div>

            <div class="abt-values-grid">
                <div class="abt-value-card">
                    <div class="abt-value-icon" style="background: rgba(0, 198, 255, 0.12); color: #00c6ff;">
                        <i class="ri-shield-check-line"></i>
                    </div>
                    <h3>Security First</h3>
                    <p>Every line of code, every transaction — built with industry-grade BCrypt encryption,
                        session-based authentication, and real-time fraud detection.</p>
                </div>

                <div class="abt-value-card">
                    <div class="abt-value-icon" style="background: rgba(0, 255, 163, 0.12); color: #00ffa3;">
                        <i class="ri-user-heart-line"></i>
                    </div>
                    <h3>People Centered</h3>
                    <p>We design for real humans. Every feature goes through extensive user testing
                        to ensure it's intuitive, accessible, and genuinely helpful.</p>
                </div>

                <div class="abt-value-card">
                    <div class="abt-value-icon" style="background: rgba(123, 47, 247, 0.12); color: #b57aff;">
                        <i class="ri-flashlight-line"></i>
                    </div>
                    <h3>Innovation</h3>
                    <p>From instant transfers to smart insights — we push boundaries to build the
                        banking experience of tomorrow, today.</p>
                </div>
            </div>
        </section>

        <!-- ====== TEAM STATS ====== -->
        <section class="idx-stats" style="position:relative; z-index:1;">
            <div class="idx-section-head">
                <span class="idx-section-tag">By The Numbers</span>
                <h2>Growing <span class="idx-gradient-text">Together</span></h2>
            </div>
            <div class="idx-stats-grid">
                <div class="idx-stat-item">
                    <span class="idx-stat-number">2M+</span>
                    <span class="idx-stat-desc">Happy Users</span>
                </div>
                <div class="idx-stat-item">
                    <span class="idx-stat-number">₹5B+</span>
                    <span class="idx-stat-desc">Transactions</span>
                </div>
                <div class="idx-stat-item">
                    <span class="idx-stat-number">99.9%</span>
                    <span class="idx-stat-desc">Uptime</span>
                </div>
                <div class="idx-stat-item">
                    <span class="idx-stat-number">150+</span>
                    <span class="idx-stat-desc">Countries</span>
                </div>
            </div>
        </section>

        <!-- ====== MEET THE TEAM ====== -->
        <section class="abt-team">
            <div class="idx-section-head">
                <span class="idx-section-tag">The People</span>
                <h2>Meet Our <span class="idx-gradient-text">Team</span></h2>
            </div>
            <div class="abt-team-grid">
                <div class="abt-team-card">
                    <div class="abt-team-avatar" style="background: linear-gradient(135deg, #00c6ff, #0072ff);">
                        <i class="ri-user-line" style="color:white;"></i>
                    </div>
                    <h4>Namani Srivas</h4>
                    <p>Founder & CEO</p>
                </div>
                <div class="abt-team-card">
                    <div class="abt-team-avatar" style="background: linear-gradient(135deg, #7b2ff7, #b57aff);">
                        <i class="ri-code-s-slash-line" style="color:white;"></i>
                    </div>
                    <h4>Engineering Team</h4>
                    <p>Backend & Frontend</p>
                </div>
                <div class="abt-team-card">
                    <div class="abt-team-avatar" style="background: linear-gradient(135deg, #00ffa3, #00c853);">
                        <i class="ri-shield-keyhole-line" style="color:white;"></i>
                    </div>
                    <h4>Security Team</h4>
                    <p>Cyber & Compliance</p>
                </div>
                <div class="abt-team-card">
                    <div class="abt-team-avatar" style="background: linear-gradient(135deg, #ffb347, #ff8c00);">
                        <i class="ri-customer-service-2-line" style="color:white;"></i>
                    </div>
                    <h4>Support Team</h4>
                    <p>24/7 Customer Care</p>
                </div>
            </div>
        </section>

        <!-- ====== CTA SECTION ====== -->
        <section class="idx-cta" style="position:relative; z-index:1;">
            <div class="idx-cta-inner">
                <h2>Ready to experience <span class="idx-gradient-text">better banking?</span></h2>
                <p>Join millions of happy users. Open a free account in under 2 minutes.</p>
                <a href="${pageContext.request.contextPath}/sign-up.jsp" class="idx-btn-primary idx-btn-lg">
                    <i class="ri-user-add-line"></i> Create Free Account
                </a>
            </div>
        </section>

        <!-- ====== FOOTER ====== -->
        <footer class="idx-footer">
            <div class="idx-footer-inner">
                <div class="idx-footer-brand">
                    <h2>Ace<span>Bank</span></h2>
                    <p>Modern banking for the digital generation.</p>
                </div>
                <div class="idx-footer-links">
                    <div>
                        <h4>Product</h4>
                        <a href="${pageContext.request.contextPath}/index.jsp#features">Features</a>
                        <a href="#">Pricing</a>
                        <a href="#">Security</a>
                    </div>
                    <div>
                        <h4>Company</h4>
                        <a href="${pageContext.request.contextPath}/about.jsp">About</a>
                        <a href="#">Careers</a>
                        <a href="#">Blog</a>
                    </div>
                    <div>
                        <h4>Account</h4>
                        <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
                        <a href="${pageContext.request.contextPath}/sign-up.jsp">Sign Up</a>
                    </div>
                </div>
            </div>
            <div class="idx-footer-bottom">
                <p>&copy; 2026 AceBank. All rights reserved.</p>
            </div>
        </footer>

        <script src="${pageContext.request.contextPath}/js/style.js"></script>

        <!-- Particle Network Animation -->
        <script>
            (function () {
                const canvas = document.getElementById('abt-particles');
                if (!canvas) return;
                const ctx = canvas.getContext('2d');
                let w, h, particles;
                const PARTICLE_COUNT = 60;
                const MAX_DIST = 120;

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
                            vx: (Math.random() - 0.5) * 0.5,
                            vy: (Math.random() - 0.5) * 0.5,
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
                                const alpha = (1 - dist / MAX_DIST) * 0.2;
                                ctx.strokeStyle = 'rgba(123,47,247,' + alpha + ')';
                                ctx.lineWidth = 0.7;
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
                        ctx.fillStyle = 'rgba(123,47,247,0.4)';
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