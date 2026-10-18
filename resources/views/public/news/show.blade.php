@extends('layouts.public')
@section('title', $post->title)
@section('description', $post->summary)

@section('content')
    <article>
        <header class="container-x max-w-4xl pt-14 text-center">
            <nav class="mb-8 text-xs text-ink/50" data-testid="breadcrumb">
                <a href="{{ route('home') }}" class="hover:text-emerald-brand">Beranda</a> <span class="text-gold">/</span>
                <a href="{{ route('news.index') }}" class="hover:text-emerald-brand">Berita</a>
                @if ($post->category)<span class="text-gold">/</span> <a href="{{ route('news.index', ['kategori' => $post->category->slug]) }}" class="hover:text-emerald-brand">{{ $post->category->name }}</a>@endif
            </nav>
            <h1 class="rise text-3xl leading-tight text-forest sm:text-5xl" data-testid="news-title">{{ $post->title }}</h1>
            <p class="rise rise-1 mt-6 text-sm text-ink/55">
                <span class="font-mono">{{ $post->published_at?->translatedFormat('l, d F Y') }}</span> · {{ $post->author?->name ?? 'Humas' }} · <span data-testid="news-views">{{ number_format($post->views, 0, ',', '.') }}</span> kali dibaca
            </p>
        </header>
        <div class="container-x mt-10 max-w-5xl">
            <img src="{{ $post->cover_url }}" alt="{{ $post->title }}" class="rise rise-2 aspect-[16/8] w-full rounded-[1.75rem] object-cover">
        </div>
        <div class="container-x mt-12 max-w-3xl">
            @if ($post->excerpt)<p class="mb-8 font-serif text-xl leading-relaxed text-forest">{{ $post->excerpt }}</p>@endif
            <div class="prose-madrasah" data-testid="news-content">{!! $post->content !!}</div>
            <div class="mt-12 flex flex-wrap items-center gap-3 border-t border-stone-line pt-6 text-sm" x-data="{ copied: false }">
                <span class="text-ink/55">Bagikan:</span>
                <a href="https://wa.me/?text={{ urlencode($post->title.' '.url()->current()) }}" target="_blank" rel="noopener" class="btn-ghost px-4 py-1.5" data-testid="share-whatsapp">WhatsApp</a>
                <a href="https://www.facebook.com/sharer/sharer.php?u={{ urlencode(url()->current()) }}" target="_blank" rel="noopener" class="btn-ghost px-4 py-1.5" data-testid="share-facebook">Facebook</a>
                <button @click="navigator.clipboard.writeText(location.href); copied = true; setTimeout(() => copied = false, 2000)" class="btn-ghost px-4 py-1.5" data-testid="share-copy-link"><span x-text="copied ? 'Tersalin ✓' : 'Salin tautan'"></span></button>
            </div>
        </div>
    </article>

    @if ($related->isNotEmpty())
        <section class="container-x mt-24">
            <p class="eyebrow">Berita terkait</p>
            <div class="mt-8 grid gap-8 md:grid-cols-3">
                @foreach ($related as $r)<x-news-card :post="$r" />@endforeach
            </div>
        </section>
    @endif
@endsection
