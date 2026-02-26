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

        <!-- ====== Floating Decorative Orbs ====== -->
        <div class="orb orb-1"></div>
        <div class="orb orb-2"></div>
        <div class="orb orb-3"></div>

        <!-- ====== HEADER / NAVBAR ====== -->
        <header class="idx-header">
            <div class="idx-header-inner">
                <a href="${pageContext.request.contextPath}/" class="idx-logo">
                    Ace<span>Bank</span>
                </a>
                <nav class="idx-nav">
                    <a href="#features"><i class="ri-apps-line"></i> Features</a>
                    <a href="${pageContext.request.contextPath}/about.jsp"><i class="ri-information-line"></i> About</a>
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

        <script src="${pageContext.request.contextPath}/js/style.js"></script>

    </body>

    </html>