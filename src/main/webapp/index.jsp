<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>AceBank — Banking Made Easy</title>
        <meta name="description"
            content="Join over 2 million users managing money smarter with AceBank. Instant transfers, smart security, and 24/7 access.">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/favicon.svg">
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@4.6.0/fonts/remixicon.css">
    </head>

    <body class="index-page">

        <!-- Particle Canvas -->
        <canvas id="idx-particles"></canvas>

        <!-- Floating Orbs -->
        <div class="orb orb-1"></div>
        <div class="orb orb-2"></div>
        <div class="orb orb-3"></div>

        <!-- Floating Currency Symbols -->
        <div
            style="position:fixed;font-size:18px;font-weight:800;opacity:0.15;z-index:0;top:10%;left:8%;color:#00c6ff;animation:fc 6s ease-in-out infinite;">
            ₹</div>
        <div
            style="position:fixed;font-size:18px;font-weight:800;opacity:0.15;z-index:0;top:20%;right:12%;color:#00ffa3;animation:fc 7s 1s ease-in-out infinite;">
            $</div>
        <div
            style="position:fixed;font-size:18px;font-weight:800;opacity:0.15;z-index:0;bottom:25%;left:15%;color:#7b2ff7;animation:fc 8s 2s ease-in-out infinite;">
            €</div>
        <div
            style="position:fixed;font-size:18px;font-weight:800;opacity:0.15;z-index:0;bottom:15%;right:8%;color:#ffb347;animation:fc 5s 0.5s ease-in-out infinite;">
            £</div>

        <!-- ====== HEADER / NAVBAR ====== -->
        <header class="idx-header">
            <div class="idx-header-inner">
                <a href="${pageContext.request.contextPath}/" class="idx-logo">
                    Ace<span>Bank</span>
                </a>
                <nav class="idx-nav">
                    <a href="${pageContext.request.contextPath}/about.jsp"><i class="ri-information-line"></i> About</a>
                    <a href="${pageContext.request.contextPath}/contact.jsp" class="idx-nav-link"><i class="ri-customer-service-2-line"></i> Contact</a>
                    <a href="${pageContext.request.contextPath}/login.jsp" class="idx-nav-link"><i
                            class="ri-login-box-line"></i> Login</a>
                    <a href="${pageContext.request.contextPath}/sign-up.jsp" class="idx-btn-signup"><i
                            class="ri-user-add-line"></i> Open Account</a>
                </nav>
            </div>
        </header>

        <!-- ====== HERO SECTION ====== -->
        <section class="idx-hero">
            <div class="idx-hero-content">
                <span class="idx-badge"><i class="ri-shield-check-line"></i> Trusted by 2M+ Users</span>
                <h1>
                    Banking Made<br>
                    <span class="idx-gradient-text">Effortless.</span>
                </h1>
                <p class="idx-hero-sub">
                    Join over 40,000 people who open an AceBank account every week.
                    Manage, spend, and save your money — all in one place.
                </p>
                <div class="idx-hero-actions">
                    <a href="${pageContext.request.contextPath}/sign-up.jsp" class="idx-btn-primary">
                        <i class="ri-rocket-2-line"></i> Get Started Free
                    </a>
                </div>
            </div>

            <!-- Money Animation Visual -->
            <div class="idx-money-visual">
                <!-- Floating Credit Card -->
                <div class="money-card">
                    <div class="money-card-inner">
                        <div class="money-card-chip"></div>
                        <div class="money-card-number">•••• •••• •••• 4289</div>
                        <div class="money-card-bottom">
                            <span>ACEBANK USER</span>
                            <span>12/28</span>
                        </div>
                    </div>
                </div>

                <!-- Floating Coins -->
                <div class="money-coin coin-1">₹</div>
                <div class="money-coin coin-2">$</div>
                <div class="money-coin coin-3">€</div>
                <div class="money-coin coin-4">£</div>
                <div class="money-coin coin-5">¥</div>

                <!-- Sparkle particles -->
                <div class="money-sparkle s1"></div>
                <div class="money-sparkle s2"></div>
                <div class="money-sparkle s3"></div>
                <div class="money-sparkle s4"></div>
                <div class="money-sparkle s5"></div>
                <div class="money-sparkle s6"></div>
            </div>

        </section>



        <!-- ====== STATS SECTION ====== -->
        <section class="idx-stats" id="stats">
            <div class="idx-stats-grid">
                <div class="idx-stat-item">
                    <span class="idx-stat-number">2M+</span>
                    <span class="idx-stat-desc">Active Users</span>
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

        <!-- ====== CTA SECTION ====== -->
        <section class="idx-cta">
            <div class="idx-cta-inner">
                <h2>Ready to take control of your <span class="idx-gradient-text">finances?</span></h2>
                <p>Open a free account in under 2 minutes. No paperwork, no hassle.</p>
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

        <!-- ====== VISITOR INVITATION POPUP ====== -->
        <div id="invite-overlay" class="invite-overlay" aria-hidden="true"></div>
        <div id="invite-popup" class="invite-popup" role="dialog" aria-labelledby="invite-title" aria-modal="true">
            <button id="invite-close" class="invite-close" aria-label="Close">&times;</button>
            <div class="invite-icon">🎉</div>
            <h2 id="invite-title" class="invite-title">Thanks for Visiting AceBank!</h2>
            <p class="invite-desc">
                Enter your email and we'll send you a personal invitation to open your free account — no paperwork, no hassle.
            </p>
            <form id="invite-form" class="invite-form" novalidate>
                <div class="invite-input-wrap">
                    <input
                        type="email"
                        id="invite-email"
                        name="email"
                        class="invite-input"
                        placeholder="you@example.com"
                        autocomplete="email"
                        required
                    />
                    <button type="submit" id="invite-submit" class="invite-submit-btn">
                        <span id="invite-btn-text">Send My Invite</span>
                        <span id="invite-spinner" class="invite-spinner" hidden>⏳</span>
                    </button>
                </div>
                <p id="invite-feedback" class="invite-feedback" aria-live="polite"></p>
            </form>
            <button id="invite-skip" class="invite-skip">No thanks, I'll look around first</button>
        </div>

        <style>
            /* ── Invitation Popup Styles ──────────────────────────────── */
            .invite-overlay {
                display: none;
                position: fixed;
                inset: 0;
                background: rgba(0,0,0,0.55);
                backdrop-filter: blur(4px);
                z-index: 9998;
                opacity: 0;
                transition: opacity 0.4s ease;
            }
            .invite-overlay.visible { display: block; opacity: 1; }

            .invite-popup {
                display: none;
                position: fixed;
                bottom: 32px;
                right: 32px;
                width: 380px;
                max-width: calc(100vw - 40px);
                background: linear-gradient(135deg, #0f0f1a 0%, #1a1a2e 50%, #16213e 100%);
                border: 1px solid rgba(0, 198, 255, 0.25);
                border-radius: 20px;
                padding: 32px 28px 24px;
                box-shadow:
                    0 0 0 1px rgba(0,198,255,0.1),
                    0 24px 80px rgba(0,0,0,0.6),
                    0 0 40px rgba(0,198,255,0.08);
                z-index: 9999;
                transform: translateY(40px);
                opacity: 0;
                transition: transform 0.45s cubic-bezier(0.34,1.56,0.64,1), opacity 0.4s ease;
            }
            .invite-popup.visible {
                display: block;
                transform: translateY(0);
                opacity: 1;
            }
            .invite-popup.slide-in {
                transform: translateY(0);
                opacity: 1;
            }

            .invite-close {
                position: absolute;
                top: 12px;
                right: 16px;
                background: none;
                border: none;
                color: rgba(255,255,255,0.4);
                font-size: 22px;
                cursor: pointer;
                line-height: 1;
                transition: color 0.2s;
                padding: 4px 8px;
                border-radius: 6px;
            }
            .invite-close:hover { color: #fff; background: rgba(255,255,255,0.08); }

            .invite-icon {
                font-size: 36px;
                text-align: center;
                margin-bottom: 12px;
                animation: bounceIn 0.6s ease 0.5s both;
            }
            @keyframes bounceIn {
                0%   { transform: scale(0.3); opacity: 0; }
                60%  { transform: scale(1.15); opacity: 1; }
                100% { transform: scale(1); }
            }

            .invite-title {
                font-size: 1.25rem;
                font-weight: 700;
                color: #fff;
                text-align: center;
                margin: 0 0 10px;
                background: linear-gradient(90deg, #00c6ff, #7b2ff7);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
            }

            .invite-desc {
                font-size: 0.875rem;
                color: rgba(255,255,255,0.65);
                text-align: center;
                line-height: 1.55;
                margin-bottom: 20px;
            }

            .invite-form { width: 100%; }

            .invite-input-wrap {
                display: flex;
                gap: 8px;
                flex-wrap: wrap;
            }

            .invite-input {
                flex: 1;
                min-width: 0;
                padding: 11px 14px;
                border-radius: 10px;
                border: 1px solid rgba(0,198,255,0.3);
                background: rgba(255,255,255,0.05);
                color: #fff;
                font-size: 0.875rem;
                outline: none;
                transition: border-color 0.25s, box-shadow 0.25s;
            }
            .invite-input::placeholder { color: rgba(255,255,255,0.3); }
            .invite-input:focus {
                border-color: #00c6ff;
                box-shadow: 0 0 0 3px rgba(0,198,255,0.15);
            }

            .invite-submit-btn {
                padding: 11px 18px;
                border-radius: 10px;
                border: none;
                background: linear-gradient(135deg, #00c6ff, #7b2ff7);
                color: #fff;
                font-weight: 600;
                font-size: 0.875rem;
                cursor: pointer;
                white-space: nowrap;
                transition: opacity 0.2s, transform 0.2s;
            }
            .invite-submit-btn:hover:not(:disabled) {
                opacity: 0.88;
                transform: translateY(-1px);
            }
            .invite-submit-btn:disabled { opacity: 0.55; cursor: not-allowed; }

            .invite-feedback {
                font-size: 0.8rem;
                margin-top: 10px;
                text-align: center;
                min-height: 18px;
                transition: color 0.2s;
            }
            .invite-feedback.success { color: #00ffa3; }
            .invite-feedback.error   { color: #ff6b6b; }

            .invite-skip {
                display: block;
                margin: 14px auto 0;
                background: none;
                border: none;
                color: rgba(255,255,255,0.35);
                font-size: 0.78rem;
                cursor: pointer;
                text-decoration: underline;
                transition: color 0.2s;
            }
            .invite-skip:hover { color: rgba(255,255,255,0.6); }

            .invite-spinner { font-size: 0.9rem; }
        </style>

        <script src="${pageContext.request.contextPath}/js/style.js"></script>
        <script>
            (function () {
                var c = document.getElementById('idx-particles'); if (!c) return;
                var ctx = c.getContext('2d'), w, h, pts = [], N = 60, D = 120;
                function resize() { w = c.width = innerWidth; h = c.height = innerHeight; }
                function init() { pts = []; for (var i = 0; i < N; i++) pts.push({ x: Math.random() * w, y: Math.random() * h, vx: (Math.random() - 0.5) * 0.5, vy: (Math.random() - 0.5) * 0.5, r: Math.random() * 2 + 1 }); }
                function draw() { ctx.clearRect(0, 0, w, h); for (var i = 0; i < pts.length; i++) for (var j = i + 1; j < pts.length; j++) { var dx = pts[i].x - pts[j].x, dy = pts[i].y - pts[j].y, d = Math.sqrt(dx * dx + dy * dy); if (d < D) { ctx.strokeStyle = 'rgba(0,198,255,' + (1 - d / D) * 0.2 + ')'; ctx.lineWidth = 0.7; ctx.beginPath(); ctx.moveTo(pts[i].x, pts[i].y); ctx.lineTo(pts[j].x, pts[j].y); ctx.stroke(); } } for (var p of pts) { ctx.beginPath(); ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2); ctx.fillStyle = 'rgba(0,198,255,0.45)'; ctx.fill(); p.x += p.vx; p.y += p.vy; if (p.x < 0 || p.x > w) p.vx *= -1; if (p.y < 0 || p.y > h) p.vy *= -1; } requestAnimationFrame(draw); }
                addEventListener('resize', function () { resize(); init(); }); resize(); init(); draw();
            })();

            // ── Visitor Invitation Popup Logic ────────────────────────────────
            (function () {
                var STORAGE_KEY = 'acebank_invite_dismissed';

                // Don't show again if already dismissed or sent this session
                if (sessionStorage.getItem(STORAGE_KEY)) return;

                var popup   = document.getElementById('invite-popup');
                var overlay = document.getElementById('invite-overlay');
                var form    = document.getElementById('invite-form');
                var input   = document.getElementById('invite-email');
                var feedback= document.getElementById('invite-feedback');
                var btnText = document.getElementById('invite-btn-text');
                var spinner = document.getElementById('invite-spinner');
                var submitBtn = document.getElementById('invite-submit');

                function showPopup() {
                    popup.style.display = 'block';
                    overlay.style.display = 'block';
                    // Trigger transition on next frame
                    requestAnimationFrame(function () {
                        requestAnimationFrame(function () {
                            popup.classList.add('visible', 'slide-in');
                            overlay.classList.add('visible');
                        });
                    });
                }

                function closePopup() {
                    popup.classList.remove('visible', 'slide-in');
                    overlay.classList.remove('visible');
                    sessionStorage.setItem(STORAGE_KEY, '1');
                    setTimeout(function () {
                        popup.style.display = 'none';
                        overlay.style.display = 'none';
                    }, 400);
                }

                // Show after 3 seconds
                setTimeout(showPopup, 3000);

                document.getElementById('invite-close').addEventListener('click', closePopup);
                document.getElementById('invite-skip').addEventListener('click', closePopup);
                overlay.addEventListener('click', closePopup);

                form.addEventListener('submit', function (e) {
                    e.preventDefault();
                    var email = input.value.trim();
                    if (!email) {
                        showFeedback('Please enter your email address.', false);
                        return;
                    }

                    // Loading state
                    submitBtn.disabled = true;
                    btnText.hidden = true;
                    spinner.hidden = false;
                    feedback.textContent = '';
                    feedback.className = 'invite-feedback';

                    fetch('${pageContext.request.contextPath}/SendInvitation', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                        body: 'email=' + encodeURIComponent(email)
                    })
                    .then(function (res) { return res.json(); })
                    .then(function (data) {
                        if (data.success) {
                            showFeedback('✅ ' + data.message, true);
                            sessionStorage.setItem(STORAGE_KEY, '1');
                            setTimeout(closePopup, 2500);
                        } else {
                            showFeedback('❌ ' + data.message, false);
                            submitBtn.disabled = false;
                        }
                    })
                    .catch(function () {
                        showFeedback('❌ Something went wrong. Please try again.', false);
                        submitBtn.disabled = false;
                    })
                    .finally(function () {
                        btnText.hidden = false;
                        spinner.hidden = true;
                    });
                });

                function showFeedback(msg, isSuccess) {
                    feedback.textContent = msg;
                    feedback.className = 'invite-feedback ' + (isSuccess ? 'success' : 'error');
                }
            })();
        </script>

    </body>

    </html>