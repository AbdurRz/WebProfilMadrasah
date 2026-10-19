<?php
    // Lokasi logo di folder public. Ubah jika file Anda ada di folder lain.
    $brandLogo = 'images/logo-mtsn1.png';
    $nav = [
        ['Beranda', 'home', []],
        ['Profil', 'profile', [['Profil Madrasah', 'profile'], ['Guru & Tendik', 'teachers'], ['Fasilitas', 'facilities']]],
        ['Berita', 'news.index', []],
        ['Pengumuman', 'announcements.index', []],
        ['Agenda', 'agenda', []],
        ['Kesiswaan', 'extracurriculars.index', [['Ekstrakurikuler', 'extracurriculars.index'], ['OSIM', 'osim'], ['Prestasi', 'achievements']]],
        ['Informasi', 'statistics', [['Statistik Madrasah', 'statistics'], ['Unduhan Dokumen', 'downloads'], ['Cek Status PPDB', 'ppdb.check']]],
        ['Galeri', 'galleries.index', []],
        ['Kontak', 'contact', []],
    ];
    $isActive = fn ($r, $children) => request()->routeIs($r, $r.'.*') || collect($children)->contains(fn ($c) => request()->routeIs($c[1]));
?>
<header x-data="{ open: false, scrolled: false }" @scroll.window="scrolled = window.scrollY > 24" class="sticky top-0 z-50">
    <div class="hidden bg-forest text-[12px] text-white/75 md:block">
        <div class="container-x flex h-9 items-center justify-between">
            <div class="flex items-center gap-6">
                <span class="flex items-center gap-2"><svg class="h-3.5 w-3.5 text-gold" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M22 16.9v3a2 2 0 0 1-2.2 2 19.8 19.8 0 0 1-8.6-3.1 19.5 19.5 0 0 1-6-6A19.8 19.8 0 0 1 2.1 4.2 2 2 0 0 1 4.1 2h3a2 2 0 0 1 2 1.7c.1.9.4 1.8.7 2.7a2 2 0 0 1-.5 2.1L8 9.8a16 16 0 0 0 6 6l1.3-1.3a2 2 0 0 1 2.1-.4c.9.3 1.8.6 2.7.7a2 2 0 0 1 1.7 2Z"/></svg><?php echo e($site['phone'] ?? ''); ?></span>
                <span><?php echo e($site['email'] ?? ''); ?></span>
            </div>
            <div class="flex items-center gap-5">
                <span>Akreditasi <strong class="text-gold"><?php echo e($site['accreditation'] ?? 'A'); ?></strong></span>
                <span class="text-white/30">|</span>
                <span>NPSN <?php echo e($site['npsn'] ?? '-'); ?></span>
            </div>
        </div>
    </div>

    <div :class="scrolled ? 'shadow-[0_8px_30px_-12px_rgba(11,60,36,.25)] bg-white/90' : 'bg-white/80'" class="border-b border-stone-line/70 backdrop-blur-xl transition-[background-color,box-shadow] duration-300">
        <div class="container-x flex h-[76px] items-center justify-between gap-4">
            <a href="<?php echo e(route('home')); ?>" class="group flex items-center gap-3" data-testid="site-logo-link" aria-label="<?php echo e($site['site_name'] ?? 'MTsN 1 Bukittinggi'); ?>, Kementerian Agama Kota Bukittinggi">
                <span class="brand-logo">
                    <img src="<?php echo e(asset($brandLogo)); ?>" alt="" width="44" height="44" class="brand-logo__img">
                </span>
                <span class="leading-tight" aria-hidden="true">
                    <span class="brand-line block whitespace-nowrap font-serif text-lg font-semibold text-forest" data-type="<?php echo e($site['site_name'] ?? 'MTsN 1 Bukittinggi'); ?>">
                        <span class="brand-line__ghost"><?php echo e($site['site_name'] ?? 'MTsN 1 Bukittinggi'); ?></span>
                        <span class="brand-line__live"></span>
                    </span>
                    <span class="brand-line block whitespace-nowrap text-[11px] tracking-wide text-ink/55 xl:hidden 2xl:block" data-type="Kementerian Agama Kota Bukittinggi">
                        <span class="brand-line__ghost">Kementerian Agama Kota Bukittinggi</span>
                        <span class="brand-line__live"></span>
                    </span>
                </span>
            </a>

            <nav class="hidden items-center gap-0.5 xl:flex" aria-label="Navigasi utama">
                <?php $__currentLoopData = $nav; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as [$label, $routeName, $children]): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php if($children): ?>
                        <div x-data="{ dd: false }" @mouseenter="dd = true" @mouseleave="dd = false" class="relative">
                            <button @click="dd = !dd" class="flex items-center gap-1 rounded-full px-2 py-2 text-[13.5px] 2xl:px-3.5 2xl:text-sm font-medium transition-colors <?php echo e($isActive($routeName, $children) ? 'text-emerald-brand' : 'text-ink/75 hover:text-forest'); ?>" data-testid="nav-<?php echo e(Str::slug($label)); ?>-dropdown">
                                <?php echo e($label); ?>

                                <svg class="h-3.5 w-3.5 transition-transform" :class="dd && 'rotate-180'" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="m6 9 6 6 6-6"/></svg>
                            </button>
                            <div x-cloak x-show="dd" x-transition.origin.top class="absolute left-0 top-full w-56 pt-2">
                                <div class="card overflow-hidden p-1.5 shadow-xl shadow-forest/10">
                                    <?php $__currentLoopData = $children; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as [$cl, $cr]): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <a href="<?php echo e(route($cr)); ?>" class="block rounded-lg px-3.5 py-2.5 text-sm text-ink/80 transition-colors hover:bg-sand hover:text-emerald-brand" data-testid="nav-<?php echo e(Str::slug($cl)); ?>-link"><?php echo e($cl); ?></a>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </div>
                            </div>
                        </div>
                    <?php else: ?>
                        <a href="<?php echo e(route($routeName)); ?>" class="relative whitespace-nowrap rounded-full px-2 py-2 text-[13.5px] 2xl:px-3.5 2xl:text-sm font-medium transition-colors <?php echo e($isActive($routeName, []) ? 'text-emerald-brand' : 'text-ink/75 hover:text-forest'); ?>" data-testid="nav-<?php echo e(Str::slug($label)); ?>-link">
                            <?php echo e($label); ?>

                            <?php if($isActive($routeName, [])): ?><span class="absolute inset-x-3.5 -bottom-0.5 h-0.5 rounded bg-gold"></span><?php endif; ?>
                        </a>
                    <?php endif; ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </nav>

            <div class="flex items-center gap-2">
                <a href="<?php echo e(route('ppdb.index')); ?>" class="btn-gold hidden whitespace-nowrap sm:inline-flex" data-testid="header-ppdb-button">PPDB <?php echo e($site['ppdb_year'] ?? ''); ?></a>
                <button @click="open = !open" class="grid h-10 w-10 place-items-center rounded-full border border-stone-line xl:hidden" aria-label="Menu" data-testid="mobile-menu-toggle">
                    <svg x-show="!open" class="h-5 w-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M4 7h16M4 12h16M4 17h10"/></svg>
                    <svg x-cloak x-show="open" class="h-5 w-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M6 6l12 12M18 6 6 18"/></svg>
                </button>
            </div>
        </div>

        <div x-cloak x-show="open" x-collapse class="border-t border-stone-line xl:hidden" data-testid="mobile-menu">
            <nav class="container-x grid gap-1 py-4">
                <?php $__currentLoopData = array_merge($nav, [['PPDB', 'ppdb.index', []]]); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as [$label, $routeName, $children]): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <?php $__currentLoopData = $children ?: [[$label, $routeName]]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as [$cl, $cr]): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <a href="<?php echo e(route($cr)); ?>" class="rounded-lg px-3 py-2.5 text-sm font-medium <?php echo e(request()->routeIs($cr) ? 'bg-sand text-emerald-brand' : 'text-ink/80'); ?>"><?php echo e($cl); ?></a>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </nav>
        </div>
    </div>
</header>

<style>
    .brand-logo { display: block; width: 2.75rem; height: 2.75rem; perspective: 700px; flex: none; }
    .brand-logo__img { width: 100%; height: 100%; object-fit: contain; animation: brand-spin 6s ease-in-out infinite; transform-style: preserve-3d; will-change: transform; }
    @keyframes brand-spin {
        0%, 25% { transform: rotateY(0deg); }
        65%, 100% { transform: rotateY(360deg); }
    }
    .brand-line { position: relative; }
    .brand-line__ghost { visibility: hidden; }
    .brand-line__live { position: absolute; left: 0; top: 0; white-space: nowrap; }
    .brand-line.is-typing .brand-line__live::after { content: ""; display: inline-block; width: 2px; height: 1em; margin-left: 2px; vertical-align: -0.12em; background: #D4AF37; animation: brand-caret .7s steps(1) infinite; }
    @keyframes brand-caret { 50% { opacity: 0; } }
    @media (prefers-reduced-motion: reduce) {
        .brand-logo__img { animation: none; }
        .brand-line__ghost { visibility: visible; }
        .brand-line__live { display: none; }
    }
</style>

<script>
    (function () {
        if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;
        var lines = Array.prototype.slice.call(document.querySelectorAll('.brand-line[data-type]'));
        if (!lines.length) return;
        var sleep = function (ms) { return new Promise(function (r) { setTimeout(r, ms); }); };

        async function type(line, text) {
            var live = line.querySelector('.brand-line__live');
            line.classList.add('is-typing');
            for (var i = 1; i <= text.length; i++) { live.textContent = text.slice(0, i); await sleep(70); }
            line.classList.remove('is-typing');
        }
        async function erase(line, text) {
            var live = line.querySelector('.brand-line__live');
            line.classList.add('is-typing');
            for (var i = text.length - 1; i >= 0; i--) { live.textContent = text.slice(0, i); await sleep(30); }
            line.classList.remove('is-typing');
        }

        (async function loop() {
            while (true) {
                for (var i = 0; i < lines.length; i++) await type(lines[i], lines[i].dataset.type);
                await sleep(2800);
                for (var j = lines.length - 1; j >= 0; j--) await erase(lines[j], lines[j].dataset.type);
                await sleep(600);
            }
        })();
    })();
</script>
<?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/partials/header.blade.php ENDPATH**/ ?>