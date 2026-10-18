@extends('layouts.public')
@section('title', 'Berita')

@section('content')
    <x-page-hero :title="$activeCategory ? 'Kategori: '.$activeCategory->name : 'Berita & Artikel'" eyebrow="Kabar Madrasah" subtitle="Liputan kegiatan, prestasi, dan informasi terkini dari MTsN 1 Bukittinggi." :crumbs="['Berita' => null]" />

    <div class="container-x grid gap-12 py-16 lg:grid-cols-12">
        <div class="lg:col-span-8">
            @if ($term)
                <p class="mb-8 text-sm text-ink/60" data-testid="news-search-summary">Hasil pencarian “<strong class="text-forest">{{ $term }}</strong>”: {{ $posts->total() }} berita</p>
            @endif
            <div class="grid gap-x-8 gap-y-12 sm:grid-cols-2" data-testid="news-list">
                @forelse ($posts as $post)
                    <x-news-card :post="$post" />
                @empty
                    <p class="text-ink/60" data-testid="news-empty">Belum ada berita yang sesuai.</p>
                @endforelse
            </div>
            {{ $posts->links() }}
        </div>

        <aside class="space-y-10 lg:col-span-4">
            <form action="{{ route('news.index') }}" method="get" class="card p-5" data-testid="news-search-form">
                <label for="q" class="field-label">Cari berita</label>
                <div class="flex gap-2">
                    <input id="q" name="q" value="{{ $term }}" placeholder="Kata kunci…" class="field-input" data-testid="news-search-input">
                    @if ($activeCategory)<input type="hidden" name="kategori" value="{{ $activeCategory->slug }}">@endif
                    <button class="btn-primary px-4" data-testid="news-search-submit">Cari</button>
                </div>
            </form>

            <div>
                <p class="eyebrow mb-4">Kategori</p>
                <ul class="space-y-1">
                    <li><a href="{{ route('news.index') }}" class="flex justify-between rounded-lg px-3 py-2 text-sm {{ ! $activeCategory ? 'bg-forest text-white' : 'hover:bg-white' }}" data-testid="news-category-all">Semua</a></li>
                    @foreach ($categories as $c)
                        <li>
                            <a href="{{ route('news.index', ['kategori' => $c->slug]) }}" class="flex justify-between rounded-lg px-3 py-2 text-sm {{ $activeCategory?->id === $c->id ? 'bg-forest text-white' : 'hover:bg-white' }}" data-testid="news-category-{{ $c->slug }}">
                                {{ $c->name }} <span class="font-mono text-xs opacity-60">{{ $c->posts_count }}</span>
                            </a>
                        </li>
                    @endforeach
                </ul>
            </div>

            <div>
                <p class="eyebrow mb-4">Terpopuler</p>
                <ol class="space-y-5">
                    @foreach ($popular as $i => $p)
                        <li class="flex gap-4">
                            <span class="font-serif text-3xl text-gold">{{ $i + 1 }}</span>
                            <a href="{{ route('news.show', $p) }}" class="text-sm leading-6 text-forest hover:text-emerald-brand" data-testid="news-popular-{{ $p->id }}">{{ $p->title }}</a>
                        </li>
                    @endforeach
                </ol>
            </div>
        </aside>
    </div>
@endsection
