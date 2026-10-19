@php
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
    $navIcons = [
        'Beranda' => '<path d="M3 10.5 12 3l9 7.5V20a1 1 0 0 1-1 1h-5v-6H9v6H4a1 1 0 0 1-1-1z"/>',
        'Profil' => '<circle cx="12" cy="8" r="4"/><path d="M4 21v-1a6 6 0 0 1 6-6h4a6 6 0 0 1 6 6v1"/>',
        'Berita' => '<path d="M7 3h8l4 4v13a1 1 0 0 1-1 1H7a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1z"/><path d="M9 11h6M9 15h6"/>',
        'Pengumuman' => '<path d="M2 9l10-5 10 5-10 5z"/><path d="M6 11.5V16c0 1.5 3 3 6 3s6-1.5 6-3v-4.5"/><path d="M22 9v6"/>',
        'Agenda' => '<rect x="3" y="5" width="18" height="16" rx="2"/><path d="M3 10h18M8 3v4M16 3v4"/><path d="M8 14h.01M12 14h.01M16 14h.01M8 18h.01M12 18h.01"/>',
        'Kesiswaan' => '<path d="M12 6.5C10 5 7 4.5 3 5v13c4-.5 7 0 9 1.5 2-1.5 5-2 9-1.5V5c-4-.5-7 0-9 1.5z"/><path d="M12 6.5v13"/>',
        'Informasi' => '<circle cx="12" cy="12" r="9"/><path d="M12 11v5M12 8h.01"/>',
        'Galeri' => '<rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="9" cy="9" r="1.6"/><path d="m21 15-5-5L5 21"/>',
        'Kontak' => '<rect x="3" y="5" width="18" height="14" rx="2"/><path d="m3 7 9 6 9-6"/>',
    ];
    $isActive = fn ($r, $children) => request()->routeIs($r, $r.'.*') || collect($children)->contains(fn ($c) => request()->routeIs($c[1]));
@endphp
<header x-data="{ open: false, scrolled: false }" @scroll.window="scrolled = window.scrollY > 24" class="sticky top-0 z-50">
    <div class="hidden bg-forest text-[12px] text-white/75 md:block">
        <div class="container-x flex h-9 items-center justify-between">
            <div class="flex items-center gap-6">
                <span class="flex items-center gap-2"><svg class="h-3.5 w-3.5 text-gold" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M22 16.9v3a2 2 0 0 1-2.2 2 19.8 19.8 0 0 1-8.6-3.1 19.5 19.5 0 0 1-6-6A19.8 19.8 0 0 1 2.1 4.2 2 2 0 0 1 4.1 2h3a2 2 0 0 1 2 1.7c.1.9.4 1.8.7 2.7a2 2 0 0 1-.5 2.1L8 9.8a16 16 0 0 0 6 6l1.3-1.3a2 2 0 0 1 2.1-.4c.9.3 1.8.6 2.7.7a2 2 0 0 1 1.7 2Z"/></svg>{{ $site['phone'] ?? '' }}</span>
                <span>{{ $site['email'] ?? '' }}</span>
            </div>
            <div class="flex items-center gap-5">
                <span>Akreditasi <strong class="text-gold">{{ $site['accreditation'] ?? 'A' }}</strong></span>
                <span class="text-white/30">|</span>
                <span>NPSN {{ $site['npsn'] ?? '-' }}</span>
            </div>
        </div>
    </div>

    <div class="nb-wrap">
        <div class="nb-pill" :class="scrolled && 'is-scrolled'">
            <div class="nb-deco" aria-hidden="true">
                <svg viewBox="0 0 64 80" preserveAspectRatio="none"><polygon points="0,0 46,0 0,80" fill="#0B6B3A"/><polygon points="0,0 34,0 0,60" fill="#064d29"/><line x1="54" y1="0" x2="0" y2="92" stroke="#D4AF37" stroke-width="1.6"/><line x1="62" y1="0" x2="0" y2="108" stroke="#D4AF37" stroke-opacity=".45" stroke-width="1"/></svg>
                <svg viewBox="0 0 64 80" preserveAspectRatio="none"><polygon points="0,0 46,0 0,80" fill="#0B6B3A"/><polygon points="0,0 34,0 0,60" fill="#064d29"/><line x1="54" y1="0" x2="0" y2="92" stroke="#D4AF37" stroke-width="1.6"/><line x1="62" y1="0" x2="0" y2="108" stroke="#D4AF37" stroke-opacity=".45" stroke-width="1"/></svg>
            </div>

            <div class="nb-inner">
                <a href="{{ route('home') }}" class="group flex items-center gap-3" data-testid="site-logo-link" aria-label="{{ $site['site_name'] ?? 'MTsN 1 Bukittinggi' }}, Kementerian Agama Kota Bukittinggi">
                    <span class="brand-logo">
                        <img src="{{ asset($brandLogo) }}" alt="" width="44" height="44" class="brand-logo__img">
                    </span>
                    <span class="leading-tight" aria-hidden="true">
                        <span class="brand-line block whitespace-nowrap font-serif text-lg font-semibold text-forest" data-type="{{ $site['site_name'] ?? 'MTsN 1 Bukittinggi' }}">
                            <span class="brand-line__ghost">{{ $site['site_name'] ?? 'MTsN 1 Bukittinggi' }}</span>
                            <span class="brand-line__live"></span>
                        </span>
                        <span class="brand-line block whitespace-nowrap text-[11px] tracking-wide text-ink/55 xl:hidden 2xl:block" data-type="Madrasah Hebat Bermartabat">
                            <span class="brand-line__ghost">Madrasah Hebat Bermartabat</span>
                            <span class="brand-line__live"></span>
                        </span>
                    </span>
                </a>

                <span class="nb-div" aria-hidden="true"></span>

                <nav class="nb-nav" aria-label="Navigasi utama">
                    @foreach ($nav as [$label, $routeName, $children])
                        @php $active = $isActive($routeName, $children); @endphp
                        <div class="nb-cell">
                            @if ($children)
                                <div x-data="{ dd: false }" @mouseenter="dd = true" @mouseleave="dd = false" class="relative">
                                    <button type="button" @click="dd = !dd" class="nb-item {{ $active ? 'is-active' : '' }}" data-testid="nav-{{ Str::slug($label) }}-dropdown" :aria-expanded="dd">
                                        <svg class="nb-ico" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">{!! $navIcons[$label] ?? '' !!}</svg>
                                        <span class="nb-label">{{ $label }}<svg class="nb-chev" :class="dd && 'is-open'" fill="none" stroke="currentColor" stroke-width="2.4" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24" aria-hidden="true"><path d="m6 9 6 6 6-6"/></svg></span>
                                    </button>
                                    <div x-cloak x-show="dd" x-transition.origin.top class="absolute left-0 top-full w-56 pt-2">
                                        <div class="card overflow-hidden p-1.5 shadow-xl shadow-forest/10">
                                            @foreach ($children as [$cl, $cr])
                                                <a href="{{ route($cr) }}" class="block rounded-lg px-3.5 py-2.5 text-sm text-ink/80 transition-colors hover:bg-sand hover:text-emerald-brand" data-testid="nav-{{ Str::slug($cl) }}-link">{{ $cl }}</a>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            @else
                                <a href="{{ route($routeName) }}" class="nb-item {{ $active ? 'is-active' : '' }}" @if ($active) aria-current="page" @endif data-testid="nav-{{ Str::slug($label) }}-link">
                                    <svg class="nb-ico {{ $label === 'Beranda' ? 'nb-ico--solid' : '' }}" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">{!! $navIcons[$label] ?? '' !!}</svg>
                                    <span class="nb-label">{{ $label }}</span>
                                </a>
                            @endif
                        </div>
                    @endforeach
                </nav>

                <span class="nb-div" aria-hidden="true"></span>

                <div class="nb-right">
                    <a href="{{ route('ppdb.index') }}" class="nb-cta" data-testid="header-ppdb-button">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">{!! $navIcons['Pengumuman'] !!}</svg>
                        <span>PPDB {{ $site['ppdb_year'] ?? '' }}</span>
                        <svg class="nb-cta__arrow" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 12h14M13 6l6 6-6 6"/></svg>
                    </a>
                    <button type="button" @click="open = !open" class="nb-toggle" aria-label="Menu" data-testid="mobile-menu-toggle">
                        <svg x-show="!open" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M4 7h16M4 12h16M4 17h10"/></svg>
                        <svg x-cloak x-show="open" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M6 6l12 12M18 6 6 18"/></svg>
                    </button>
                </div>
            </div>
        </div>

        <div x-cloak x-show="open" x-collapse class="nb-mobile" data-testid="mobile-menu">
            <nav class="nb-mobile__nav">
                @foreach (array_merge($nav, [['PPDB', 'ppdb.index', []]]) as [$label, $routeName, $children])
                    @foreach ($children ?: [[$label, $routeName]] as [$cl, $cr])
                        <a href="{{ route($cr) }}" class="rounded-lg px-3 py-2.5 text-sm font-medium {{ request()->routeIs($cr) ? 'bg-sand text-emerald-brand' : 'text-ink/80' }}">{{ $cl }}</a>
                    @endforeach
                @endforeach
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

    /* Menu bar melayang */
    .nb-wrap { padding: .6rem 1rem .35rem; }
    .nb-pill { position: relative; max-width: 1640px; margin: 0 auto; border-radius: 999px; background: rgba(255,255,255,.93); -webkit-backdrop-filter: blur(18px) saturate(1.2); backdrop-filter: blur(18px) saturate(1.2); border: 1px solid rgba(255,255,255,.95); box-shadow: 0 22px 40px -22px rgba(11,60,36,.45), 0 2px 6px rgba(11,60,36,.06); transition: box-shadow .3s ease, background-color .3s ease; }
    .nb-pill.is-scrolled { background: rgba(255,255,255,.97); box-shadow: 0 26px 46px -20px rgba(11,60,36,.5), 0 2px 8px rgba(11,60,36,.08); }
    .nb-deco { position: absolute; inset: 0; border-radius: inherit; overflow: hidden; pointer-events: none; }
    .nb-deco svg { position: absolute; top: 0; height: 100%; width: 44px; }
    .nb-deco svg:first-child { left: 0; }
    .nb-deco svg:last-child { right: 0; transform: scaleX(-1); }
    .nb-inner { position: relative; display: flex; align-items: center; justify-content: space-between; gap: 1rem; min-height: 68px; padding: .5rem 1.5rem .5rem 2.2rem; }
    .nb-nav, .nb-div { display: none; }
    .nb-div { width: 1px; height: 42px; background: linear-gradient(transparent, rgba(11,60,36,.2), transparent); flex: none; }
    .nb-nav { align-items: center; gap: .15rem; }
    .nb-cell { position: relative; display: flex; align-items: center; }
    .nb-cell + .nb-cell::before { content: ""; position: absolute; left: -1px; top: 50%; width: 1px; height: 34px; transform: translateY(-50%); background: rgba(11,60,36,.14); transition: opacity .2s; }
    .nb-cell:has(.is-active)::before, .nb-cell:has(.is-active) + .nb-cell::before { opacity: 0; }
    .nb-item { position: relative; display: flex; flex-direction: column; align-items: center; justify-content: center; gap: .3rem; min-width: 3.4rem; padding: .6rem .65rem .5rem; border: 0; border-radius: 1rem; background: transparent; color: #0a5a32; font-family: inherit; font-size: .78rem; font-weight: 600; line-height: 1; white-space: nowrap; text-decoration: none; cursor: pointer; transition: background-color .2s ease, color .2s ease, transform .2s ease; }
    .nb-item:hover { background: rgba(4,106,56,.07); color: #0B3C24; transform: translateY(-1px); }
    .nb-item:focus-visible { outline: 2px solid #D4AF37; outline-offset: 2px; }
    .nb-item.is-active { color: #046A38; background: linear-gradient(180deg, #fff, #e4f6ea); box-shadow: 0 10px 18px -10px rgba(4,106,56,.55), inset 0 0 0 1px rgba(4,106,56,.07); }
    .nb-item.is-active::after { content: ""; position: absolute; left: 16%; right: 16%; bottom: -4px; height: 4px; border-radius: 0 0 6px 6px; background: linear-gradient(90deg, #e2bb3f, #b88a12); }
    .nb-ico { width: 1.4rem; height: 1.4rem; }
    .nb-item.is-active .nb-ico--solid { fill: currentColor; }
    .nb-label { display: inline-flex; align-items: center; }
    .nb-chev { width: .7rem; height: .7rem; margin-left: .2rem; transition: transform .2s ease; }
    .nb-chev.is-open { transform: rotate(180deg); }
    .nb-right { display: flex; align-items: center; gap: .6rem; flex: none; }
    .nb-cta { display: none; align-items: center; gap: .6rem; padding: .8rem 1.25rem; border-radius: 999px; background: linear-gradient(180deg, #e2bb3f, #b88a12); color: #fff; font-size: .82rem; font-weight: 700; white-space: nowrap; text-decoration: none; box-shadow: 0 12px 20px -10px rgba(184,138,18,.8), inset 0 1px 0 rgba(255,255,255,.35); transition: transform .2s ease, box-shadow .2s ease; }
    .nb-cta:hover { transform: translateY(-1px); box-shadow: 0 16px 24px -10px rgba(184,138,18,.9), inset 0 1px 0 rgba(255,255,255,.35); }
    .nb-cta svg { width: 1.2rem; height: 1.2rem; }
    .nb-cta__arrow { transition: transform .2s ease; }
    .nb-cta:hover .nb-cta__arrow { transform: translateX(3px); }
    .nb-toggle { display: grid; place-items: center; width: 2.6rem; height: 2.6rem; border-radius: 999px; border: 1px solid rgba(11,60,36,.15); background: #fff; color: #0a5a32; cursor: pointer; }
    .nb-toggle svg { width: 1.25rem; height: 1.25rem; }
    .nb-mobile { max-width: 1640px; margin: .5rem auto 0; border-radius: 1.5rem; background: rgba(255,255,255,.97); border: 1px solid rgba(255,255,255,.95); box-shadow: 0 22px 40px -22px rgba(11,60,36,.45); }
    .nb-mobile__nav { display: grid; gap: .25rem; padding: .75rem; }
    @media (min-width: 640px) {
        .nb-cta { display: inline-flex; }
        .nb-inner { padding-left: 2.8rem; padding-right: 1.9rem; }
        .nb-deco svg { width: 54px; }
    }
    @media (min-width: 1360px) {
        .nb-nav, .nb-div { display: flex; }
        .nb-toggle, .nb-mobile { display: none; }
        .nb-inner { padding-left: 3.4rem; padding-right: 2.4rem; min-height: 78px; }
        .nb-deco svg { width: 64px; }
    }
    @media (min-width: 1600px) {
        .nb-item { padding: .6rem 1rem .5rem; font-size: .82rem; }
    }
    @media (prefers-reduced-motion: reduce) {
        .nb-item, .nb-cta, .nb-cta__arrow { transition: none; }
        .nb-item:hover, .nb-cta:hover { transform: none; }
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
