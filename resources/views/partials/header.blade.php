@php
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

    <div :class="scrolled ? 'shadow-[0_8px_30px_-12px_rgba(11,60,36,.25)] bg-white/90' : 'bg-white/80'" class="border-b border-stone-line/70 backdrop-blur-xl transition-[background-color,box-shadow] duration-300">
        <div class="container-x flex h-[76px] items-center justify-between gap-4">
            <a href="{{ route('home') }}" class="group flex items-center gap-3" data-testid="site-logo-link">
                <span class="relative grid h-11 w-11 place-items-center rounded-xl bg-emerald-brand text-gold transition-transform duration-300 group-hover:rotate-[8deg]">
                    <svg viewBox="0 0 40 40" class="h-7 w-7" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 4 36 20 20 36 4 20Z"/><path d="M20 12 28 20 20 28 12 20Z"/><path d="M12 9c0 4 3.5 6 8 6s8-2 8-6" stroke-linecap="round"/></svg>
                </span>
                <span class="leading-tight">
                    <span class="block whitespace-nowrap font-serif text-lg font-semibold text-forest">{{ $site['site_name'] ?? 'MTsN 1 Bukittinggi' }}</span>
                    <span class="block whitespace-nowrap text-[11px] tracking-wide text-ink/55 xl:hidden 2xl:block">Kementerian Agama Kota Bukittinggi</span>
                </span>
            </a>

            <nav class="hidden items-center gap-0.5 xl:flex" aria-label="Navigasi utama">
                @foreach ($nav as [$label, $routeName, $children])
                    @if ($children)
                        <div x-data="{ dd: false }" @mouseenter="dd = true" @mouseleave="dd = false" class="relative">
                            <button @click="dd = !dd" class="flex items-center gap-1 rounded-full px-2 py-2 text-[13.5px] 2xl:px-3.5 2xl:text-sm font-medium transition-colors {{ $isActive($routeName, $children) ? 'text-emerald-brand' : 'text-ink/75 hover:text-forest' }}" data-testid="nav-{{ Str::slug($label) }}-dropdown">
                                {{ $label }}
                                <svg class="h-3.5 w-3.5 transition-transform" :class="dd && 'rotate-180'" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="m6 9 6 6 6-6"/></svg>
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
                        <a href="{{ route($routeName) }}" class="relative whitespace-nowrap rounded-full px-2 py-2 text-[13.5px] 2xl:px-3.5 2xl:text-sm font-medium transition-colors {{ $isActive($routeName, []) ? 'text-emerald-brand' : 'text-ink/75 hover:text-forest' }}" data-testid="nav-{{ Str::slug($label) }}-link">
                            {{ $label }}
                            @if ($isActive($routeName, []))<span class="absolute inset-x-3.5 -bottom-0.5 h-0.5 rounded bg-gold"></span>@endif
                        </a>
                    @endif
                @endforeach
            </nav>

            <div class="flex items-center gap-2">
                <a href="{{ route('ppdb.index') }}" class="btn-gold hidden whitespace-nowrap sm:inline-flex" data-testid="header-ppdb-button">PPDB {{ $site['ppdb_year'] ?? '' }}</a>
                <button @click="open = !open" class="grid h-10 w-10 place-items-center rounded-full border border-stone-line xl:hidden" aria-label="Menu" data-testid="mobile-menu-toggle">
                    <svg x-show="!open" class="h-5 w-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M4 7h16M4 12h16M4 17h10"/></svg>
                    <svg x-cloak x-show="open" class="h-5 w-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M6 6l12 12M18 6 6 18"/></svg>
                </button>
            </div>
        </div>

        <div x-cloak x-show="open" x-collapse class="border-t border-stone-line xl:hidden" data-testid="mobile-menu">
            <nav class="container-x grid gap-1 py-4">
                @foreach (array_merge($nav, [['PPDB', 'ppdb.index', []]]) as [$label, $routeName, $children])
                    @foreach ($children ?: [[$label, $routeName]] as [$cl, $cr])
                        <a href="{{ route($cr) }}" class="rounded-lg px-3 py-2.5 text-sm font-medium {{ request()->routeIs($cr) ? 'bg-sand text-emerald-brand' : 'text-ink/80' }}">{{ $cl }}</a>
                    @endforeach
                @endforeach
            </nav>
        </div>
    </div>
</header>
