@props(['title', 'eyebrow' => null, 'subtitle' => null, 'crumbs' => []])
<section class="relative overflow-hidden bg-forest text-white grain">
    <div class="songket absolute inset-0"></div>
    <div class="absolute -right-24 -top-24 h-80 w-80 rounded-full bg-emerald-brand/60 blur-3xl"></div>
    <div class="container-x relative py-16 sm:py-20">
        <nav class="rise mb-6 flex flex-wrap items-center gap-2 text-xs text-white/60" aria-label="Breadcrumb" data-testid="breadcrumb">
            <a href="{{ route('home') }}" class="hover:text-gold">Beranda</a>
            @foreach ($crumbs as $label => $url)
                <span class="text-gold">/</span>
                @if ($url)<a href="{{ $url }}" class="hover:text-gold">{{ $label }}</a>@else<span class="text-white/85">{{ $label }}</span>@endif
            @endforeach
        </nav>
        @if ($eyebrow)<p class="rise rise-1 mb-3 text-[11px] font-semibold uppercase tracking-[0.25em] text-gold">{{ $eyebrow }}</p>@endif
        <h1 class="rise rise-2 max-w-4xl text-4xl leading-[1.1] sm:text-5xl lg:text-6xl" data-testid="page-title">{{ $title }}</h1>
        @if ($subtitle)<p class="rise rise-3 mt-5 max-w-2xl text-base leading-7 text-white/70 md:text-lg">{{ $subtitle }}</p>@endif
        {{ $slot }}
    </div>
</section>
