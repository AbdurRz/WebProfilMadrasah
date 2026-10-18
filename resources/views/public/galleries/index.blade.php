@extends('layouts.public')
@section('title', 'Galeri')

@section('content')
    <x-page-hero title="Galeri Kegiatan" eyebrow="Dokumentasi" subtitle="Rekam jejak kegiatan madrasah dalam foto dan video." :crumbs="['Galeri' => null]" />

    <div class="container-x grid gap-8 py-16 sm:grid-cols-2 lg:grid-cols-3">
        @foreach ($galleries as $g)
            <a href="{{ route('galleries.show', $g) }}" class="group" data-testid="gallery-card-{{ $g->id }}">
                <div class="img-zoom relative aspect-[4/3] overflow-hidden rounded-2xl">
                    <img src="{{ $g->cover_url }}" alt="{{ $g->title }}" loading="lazy" class="h-full w-full object-cover">
                    <span class="absolute right-3 top-3 rounded-full bg-forest/80 px-3 py-1 font-mono text-[11px] text-white backdrop-blur">{{ $g->items_count }} foto{{ $g->youtube_id ? ' · video' : '' }}</span>
                </div>
                <p class="mt-4 font-mono text-[11px] uppercase text-ink/50">{{ $g->event_date?->translatedFormat('d F Y') }}</p>
                <h2 class="mt-1 text-xl text-forest group-hover:text-emerald-brand">{{ $g->title }}</h2>
            </a>
        @endforeach
    </div>
    <div class="container-x">{{ $galleries->links() }}</div>
@endsection
