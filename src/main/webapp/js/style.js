// ============================
// CUSTOM CURSOR ANIMATION
// ============================
(function () {
    // Skip on touch devices
    if ('ontouchstart' in window || navigator.maxTouchPoints > 0) return;

    var dot = document.createElement('div');
    dot.className = 'cursor-dot';
    var ring = document.createElement('div');
    ring.className = 'cursor-ring';
    document.body.appendChild(dot);
    document.body.appendChild(ring);

    document.body.classList.add('custom-cursor-active');

    var mx = 0, my = 0;
    var rx = 0, ry = 0;

    document.addEventListener('mousemove', function (e) {
        mx = e.clientX;
        my = e.clientY;
        dot.style.left = mx + 'px';
        dot.style.top = my + 'px';
    });

    function animateRing() {
        rx += (mx - rx) * 0.15;
        ry += (my - ry) * 0.15;
        ring.style.left = rx + 'px';
        ring.style.top = ry + 'px';
        requestAnimationFrame(animateRing);
    }
    animateRing();

    document.addEventListener('mouseover', function (e) {
        if (e.target.closest('a, button, input, select, textarea, [onclick], label')) {
            document.body.classList.add('cursor-hover');
        }
    });
    document.addEventListener('mouseout', function (e) {
        if (e.target.closest('a, button, input, select, textarea, [onclick], label')) {
            document.body.classList.remove('cursor-hover');
        }
    });

    document.addEventListener('mousedown', function () {
        document.body.classList.add('cursor-click');
    });
    document.addEventListener('mouseup', function () {
        document.body.classList.remove('cursor-click');
    });

    document.addEventListener('mouseleave', function () {
        dot.style.opacity = '0';
        ring.style.opacity = '0';
    });
    document.addEventListener('mouseenter', function () {
        dot.style.opacity = '1';
        ring.style.opacity = '1';
    });
})();

// Smooth page load fade-in
document.addEventListener("DOMContentLoaded", function () {
    document.body.style.opacity = 0;
    document.body.style.transition = "opacity 0.8s ease";
    document.body.style.opacity = 1;
});

// Balance counter animation
document.addEventListener("DOMContentLoaded", function () {
    var counter = document.getElementById("balance-counter");
    if (!counter) return;
    var target = parseFloat(counter.innerText);
    if (isNaN(target)) return;
    var count = 0;
    var speed = target / 50;

    function updateCounter() {
        if (count < target) {
            count += speed;
            counter.innerText = count.toFixed(2);
            requestAnimationFrame(updateCounter);
        } else {
            counter.innerText = target.toFixed(2);
        }
    }

    updateCounter();
});