import './bootstrap';
import Alpine from 'alpinejs';
import collapse from '@alpinejs/collapse';
import Chart from 'chart.js/auto';

Chart.defaults.font.family = "'Plus Jakarta Sans', sans-serif";
Chart.defaults.color = '#4b5563';
window.Chart = Chart;

Alpine.plugin(collapse);

Alpine.data('reveal', () => ({
    shown: false,
    init() {
        const io = new IntersectionObserver(([e]) => {
            if (e.isIntersecting) { this.shown = true; io.disconnect(); }
        }, { threshold: 0.15 });
        io.observe(this.$el);
    },
}));

Alpine.data('counter', (target) => ({
    value: 0,
    init() {
        const io = new IntersectionObserver(([e]) => {
            if (!e.isIntersecting) return;
            io.disconnect();
            const start = performance.now();
            const tick = (t) => {
                const p = Math.min((t - start) / 1400, 1);
                this.value = Math.round(target * (1 - Math.pow(1 - p, 3)));
                if (p < 1) requestAnimationFrame(tick);
            };
            requestAnimationFrame(tick);
        });
        io.observe(this.$el);
    },
}));

window.Alpine = Alpine;
Alpine.start();

document.addEventListener('trix-file-accept', (e) => e.preventDefault());
