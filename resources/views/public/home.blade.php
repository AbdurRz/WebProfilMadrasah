@extends('layouts.public')

@section('content')
    {{-- Hero --}}
    <section class="relative overflow-hidden bg-forest text-white grain" data-testid="home-hero">
        <div class="songket absolute inset-0 opacity-70"></div>
        <div class="container-x relative grid items-center gap-12 py-16 lg:grid-cols-12 lg:py-24">
            <div class="lg:col-span-6">
                <p class="rise mb-6 inline-flex items-center gap-3 rounded-full border border-gold/30 bg-white/5 px-4 py-1.5 text-xs text-gold-soft backdrop-blur">
                    <span class="h-1.5 w-1.5 rounded-full bg-gold"></span> Terakreditasi {{ $site['accreditation'] ?? 'A' }} · Kementerian Agama RI
                </p>
                <h1 class="rise rise-1 text-4xl leading-[1.08] sm:text-5xl lg:text-6xl" data-testid="hero-title">{{ $site['hero_title'] ?? '' }}</h1>
                <p class="rise rise-2 mt-6 max-w-xl text-base leading-8 text-white/70 md:text-lg">{{ $site['hero_subtitle'] ?? '' }}</p>
                <div class="rise rise-3 mt-9 flex flex-wrap gap-3">
                    <a href="{{ route('profile') }}" class="btn-gold" data-testid="hero-profile-button">Kenali Madrasah</a>
                    <a href="{{ route('news.index') }}" class="btn border border-white/25 text-white hover:bg-white hover:text-forest" data-testid="hero-news-button">Berita Terbaru</a>
                </div>
            </div>
            <div class="relative lg:col-span-6">
                <div class="rise rise-2 relative ml-auto aspect-[4/5] w-full max-w-md overflow-hidden rounded-[2rem] rounded-tr-[7rem] border border-white/10 sm:aspect-[5/5]">
                    <img src="https://images.unsplash.com/photo-1689669060288-400996a38dcd?w=1200&q=75" alt="Jam Gadang Bukittinggi" class="h-full w-full object-cover">
                    <div class="absolute inset-0 bg-gradient-to-t from-forest/70 via-transparent"></div>
                    <p class="absolute bottom-5 right-5 text-right text-xs uppercase tracking-[0.2em] text-white/80">Kota Bukittinggi · Sumatera Barat</p>
                </div>
                <div class="rise rise-4 absolute -bottom-6 left-0 hidden w-60 rounded-2xl border border-white/10 bg-white p-5 text-ink shadow-2xl sm:block lg:-left-4">
                    <p class="text-[11px] uppercase tracking-[0.2em] text-ink/50">Peserta didik {{ $year }}</p>
                    <p class="mt-1 font-mono text-4xl font-bold text-emerald-brand">{{ number_format($quick['Peserta Didik'], 0, ',', '.') }}</p>
                    <p class="mt-1 text-xs text-ink/60">dalam {{ $quick['Rombongan Belajar'] }} rombongan belajar</p>
                </div>
            </div>
        </div>
    </section>

    {{-- Announcement ticker --}}
    @if ($announcements->isNotEmpty())
        <section class="border-b border-stone-line bg-white" data-testid="announcement-ticker">
            <div class="container-x flex items-center gap-4 py-3">
                <a href="{{ route('announcements.index') }}" class="shrink-0 rounded-full bg-gold px-3 py-1 text-[11px] font-bold uppercase tracking-wider text-forest">Pengumuman</a>
                <div class="relative flex-1 overflow-hidden [mask-image:linear-gradient(90deg,transparent,#000_6%,#000_94%,transparent)]">
                    <div class="marquee flex w-max gap-12 whitespace-nowrap text-sm">
                        @foreach ([1, 2] as $_)
                            @foreach ($announcements as $a)
                                <a href="{{ route('announcements.show', $a) }}" class="text-ink/75 hover:text-emerald-brand">◆ {{ $a->title }}</a>
                            @endforeach
                        @endforeach
                    </div>
                </div>
            </div>
        </section>
    @endif

    {{-- Quick stats --}}
    <section class="container-x py-20" data-testid="quick-stats">
        <div class="grid gap-px overflow-hidden rounded-2xl border border-stone-line bg-stone-line sm:grid-cols-2 lg:grid-cols-4">
            @foreach ($quick as $label => $value)
                <div class="bg-white p-8" x-data="counter({{ (int) $value }})">
                    <p class="font-mono text-5xl font-bold text-forest" x-text="value.toLocaleString('id-ID')" data-testid="quick-stat-{{ Str::slug($label) }}">{{ $value }}</p>
                    <p class="mt-3 text-sm text-ink/60">{{ $label }}</p>
                </div>
            @endforeach
        </div>
        <a href="{{ route('statistics') }}" class="mt-4 inline-flex items-center gap-2 text-sm font-medium text-emerald-brand link-underline" data-testid="quick-stats-more-link">Lihat statistik lengkap →</a>
    </section>

    {{-- Welcome --}}
    @if ($welcome)
        <section class="container-x grid items-center gap-12 pb-24 lg:grid-cols-12">
            <div class="relative lg:col-span-5">
                <div class="aspect-[4/5] overflow-hidden rounded-[2rem] rounded-bl-[6rem]">
                    <img src="{{ $welcome->image_url }}" alt="{{ $headmaster?->name }}" loading="lazy" class="h-full w-full object-cover">
                </div>
                <div class="absolute -right-4 -top-4 -z-10 h-full w-full rounded-[2rem] border-2 border-gold/40"></div>
            </div>
            <div class="lg:col-span-7 lg:pl-8">
                <p class="eyebrow">Sambutan</p>
                <h2 class="mt-4 text-3xl leading-tight text-forest sm:text-4xl">{{ $welcome->title }}</h2>
                <div class="prose-madrasah mt-6 line-clamp-[8]">{!! $welcome->content !!}</div>
                @if ($headmaster)
                    <div class="mt-6 border-l-2 border-gold pl-4">
                        <p class="font-serif text-lg text-forest">{{ $headmaster->name }}</p>
                        <p class="text-sm text-ink/55">{{ $headmaster->position }}</p>
                    </div>
                @endif
                <a href="{{ route('profile') }}" class="btn-ghost mt-8" data-testid="welcome-readmore-button">Profil lengkap</a>
            </div>
        </section>
    @endif

    {{-- News --}}
    <section class="bg-white py-24">
        <div class="container-x">
            <div class="mb-12 flex flex-wrap items-end justify-between gap-4">
                <div>
                    <p class="eyebrow">Kabar Madrasah</p>
                    <h2 class="mt-3 text-3xl text-forest sm:text-4xl">Berita terbaru</h2>
                </div>
                <a href="{{ route('news.index') }}" class="btn-ghost" data-testid="home-all-news-button">Semua berita</a>
            </div>
            <div class="grid gap-10 lg:grid-cols-12">
                @if ($featured)
                    <div class="lg:col-span-7"><x-news-card :post="$featured" size="lg" /></div>
                @endif
                <div class="divide-y divide-stone-line lg:col-span-5">
                    @foreach ($posts->where('id', '!=', $featured?->id)->take(4) as $post)
                        <a href="{{ route('news.show', $post) }}" class="group flex gap-5 py-5 first:pt-0" data-testid="home-news-item-{{ $post->id }}">
                            <img src="{{ $post->cover_url }}" alt="" loading="lazy" class="h-20 w-28 shrink-0 rounded-lg object-cover">
                            <div>
                                <p class="font-mono text-[11px] uppercase text-ink/50">{{ $post->published_at?->translatedFormat('d M Y') }} · {{ $post->category?->name }}</p>
                                <h3 class="mt-1.5 text-base leading-snug text-forest group-hover:text-emerald-brand">{{ $post->title }}</h3>
                            </div>
                        </a>
                    @endforeach
                </div>
            </div>
        </div>
    </section>

    {{-- Agenda + Announcements --}}
    <section class="container-x grid gap-12 py-24 lg:grid-cols-12">
        <div class="min-w-0 lg:col-span-7">
            <div class="mb-8 flex items-end justify-between gap-4">
                <div><p class="eyebrow">Kalender</p><h2 class="mt-3 text-3xl text-forest">Agenda mendatang</h2></div>
                <a href="{{ route('agenda') }}" class="text-sm font-medium text-emerald-brand link-underline" data-testid="home-agenda-link">Kalender lengkap →</a>
            </div>
            <div class="space-y-3">
                @forelse ($events as $event)
                    <div class="card flex items-center gap-6 p-5 transition-[border-color,transform] hover:-translate-y-0.5 hover:border-emerald-brand/40" data-testid="home-event-{{ $event->id }}">
                        <div class="w-16 shrink-0 text-center">
                            <p class="font-mono text-3xl font-bold text-emerald-brand">{{ $event->starts_at->format('d') }}</p>
                            <p class="text-[11px] uppercase tracking-wider text-ink/50">{{ $event->starts_at->translatedFormat('M Y') }}</p>
                        </div>
                        <div class="h-12 w-px bg-stone-line"></div>
                        <div class="min-w-0">
                            <p class="text-[11px] font-semibold uppercase tracking-wider text-gold">{{ $event->category }}</p>
                            <p class="truncate font-medium text-forest">{{ $event->title }}</p>
                            <p class="text-sm text-ink/55">{{ $event->starts_at->format('H.i') }} WIB · {{ $event->location }}</p>
                        </div>
                    </div>
                @empty
                    <p class="text-sm text-ink/60">Belum ada agenda mendatang.</p>
                @endforelse
            </div>
        </div>
        <div class="min-w-0 lg:col-span-5">
            <div class="relative h-full overflow-hidden rounded-2xl bg-emerald-brand p-8 text-white grain">
                <div class="songket absolute inset-0 opacity-50"></div>
                <div class="relative">
                    <p class="text-[11px] font-semibold uppercase tracking-[0.25em] text-gold">Papan Informasi</p>
                    <h2 class="mt-3 text-3xl">Pengumuman resmi</h2>
                    <ul class="mt-8 space-y-5">
                        @foreach ($announcements as $a)
                            <li class="border-b border-white/15 pb-5 last:border-0">
                                <a href="{{ route('announcements.show', $a) }}" class="group block" data-testid="home-announcement-{{ $a->id }}">
                                    <x-priority-badge :priority="$a->priority" />
                                    <p class="mt-2 font-medium leading-snug group-hover:text-gold">{{ $a->title }}</p>
                                    <p class="mt-1 text-xs text-white/55">Berlaku s.d. {{ $a->ends_at?->translatedFormat('d F Y') ?? '—' }}</p>
                                </a>
                            </li>
                        @endforeach
                    </ul>
                    <a href="{{ route('announcements.index') }}" class="btn-gold mt-4" data-testid="home-all-announcements-button">Semua pengumuman</a>
                </div>
            </div>
        </div>
    </section>

    {{-- Achievements --}}
    <section class="bg-sand-dark/60 py-24">
        <div class="container-x">
            <div class="mb-12 grid gap-6 lg:grid-cols-2 lg:items-end">
                <div><p class="eyebrow">Prestasi</p><h2 class="mt-3 text-3xl text-forest sm:text-4xl">Mengharumkan nama madrasah</h2></div>
                <p class="text-sm leading-7 text-ink/65 lg:text-right">Capaian peserta didik di bidang akademik, keagamaan, seni, dan olahraga — dari tingkat kota hingga nasional.</p>
            </div>
            <div class="grid gap-6 sm:grid-cols-2 lg:grid-cols-4">
                @foreach ($achievements as $i => $ach)
                    <div class="group card overflow-hidden {{ $i % 2 ? 'lg:translate-y-8' : '' }}" data-testid="home-achievement-{{ $ach->id }}">
                        <div class="img-zoom aspect-[4/3] overflow-hidden"><img src="{{ $ach->image_url }}" alt="{{ $ach->title }}" loading="lazy" class="h-full w-full object-cover"></div>
                        <div class="p-5">
                            <p class="font-mono text-xs text-gold">{{ $ach->rank }} · {{ ucfirst($ach->level) }} · {{ $ach->year }}</p>
                            <p class="mt-2 font-serif text-lg leading-snug text-forest">{{ $ach->title }}</p>
                            <p class="mt-1 text-sm text-ink/55">{{ $ach->student_name }}</p>
                        </div>
                    </div>
                @endforeach
            </div>
            <a href="{{ route('achievements') }}" class="btn-ghost mt-16" data-testid="home-all-achievements-button">Lihat semua prestasi</a>
        </div>
    </section>

    {{-- Gallery --}}
    <section class="container-x py-24">
        <div class="mb-10 flex items-end justify-between">
            <div><p class="eyebrow">Galeri</p><h2 class="mt-3 text-3xl text-forest sm:text-4xl">Lensa kegiatan</h2></div>
            <a href="{{ route('galleries.index') }}" class="text-sm font-medium text-emerald-brand link-underline" data-testid="home-gallery-link">Buka galeri →</a>
        </div>
        <div class="grid auto-rows-[180px] grid-cols-2 gap-4 md:grid-cols-4">
            @foreach ($galleries as $i => $g)
                <a href="{{ route('galleries.show', $g) }}" class="img-zoom group relative overflow-hidden rounded-2xl {{ $i === 0 ? 'col-span-2 row-span-2' : '' }}" data-testid="home-gallery-{{ $g->id }}">
                    <img src="{{ $g->cover_url }}" alt="{{ $g->title }}" loading="lazy" class="h-full w-full object-cover">
                    <div class="absolute inset-0 bg-gradient-to-t from-forest/80 via-forest/0 opacity-80 transition-opacity group-hover:opacity-100"></div>
                    <p class="absolute bottom-4 left-4 right-4 text-sm font-medium text-white">{{ $g->title }}</p>
                </a>
            @endforeach
        </div>
    </section>

    {{-- CTA --}}
    <section class="container-x">
        <div class="relative overflow-hidden rounded-[2rem] bg-forest px-8 py-14 text-white grain sm:px-14">
            <div class="songket absolute inset-0"></div>
            <div class="relative grid items-center gap-8 lg:grid-cols-3">
                <div class="lg:col-span-2">
                    <h2 class="text-3xl sm:text-4xl">Bergabung bersama keluarga besar MTsN 1 Bukittinggi.</h2>
                    <p class="mt-3 text-white/70">Informasi Penerimaan Peserta Didik Baru, persyaratan, dan jadwal seleksi.</p>
                </div>
                <div class="flex flex-wrap gap-3 lg:justify-end">
                    <a href="{{ route('ppdb.index') }}" class="btn-gold" data-testid="cta-ppdb-button">Daftar PPDB</a>
                    <a href="{{ route('contact') }}" class="btn border border-white/25 text-white hover:bg-white hover:text-forest" data-testid="cta-contact-button">Hubungi kami</a>
                </div>
            </div>
        </div>
    </section>
@endsection
