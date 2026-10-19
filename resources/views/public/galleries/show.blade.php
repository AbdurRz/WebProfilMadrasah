@extends('layouts.public')
@section('title', $gallery->title)

@section('content')
    <x-page-hero :title="$gallery->title" eyebrow="Galeri" :subtitle="$gallery->description" :crumbs="['Galeri' => route('galleries.index'), $gallery->title => null]" />

    <div class="container-x py-16" x-data="{ open: false, src: '', caption: '' }" @keydown.escape.window="open = false">
        @if ($gallery->local_video_url)
            <div class="mb-12 aspect-video overflow-hidden rounded-2xl bg-forest" data-testid="gallery-video">
                <video class="h-full w-full" controls playsinline preload="metadata" poster="{{ $gallery->cover_url }}" title="{{ $gallery->title }}">
                    <source src="{{ $gallery->local_video_url }}" type="video/mp4">
                    Browser Anda tidak mendukung pemutar video.
                </video>
            </div>
        @elseif ($gallery->youtube_id)
            <div class="mb-12 aspect-video overflow-hidden rounded-2xl bg-forest" data-testid="gallery-video">
                <iframe class="h-full w-full" src="https://www.youtube.com/embed/{{ $gallery->youtube_id }}" title="{{ $gallery->title }}" allowfullscreen loading="lazy"></iframe>
            </div>
        @endif
        <div class="columns-1 gap-4 sm:columns-2 lg:columns-3 [&>*]:mb-4">
            @foreach ($gallery->items as $item)
                <button @click="open = true; src = @js($item->url); caption = @js($item->caption)" class="img-zoom block w-full overflow-hidden rounded-xl" data-testid="gallery-photo-{{ $item->id }}">
                    <img src="{{ $item->url }}" alt="{{ $item->caption }}" loading="lazy" class="w-full">
                </button>
            @endforeach
        </div>

        <div x-cloak x-show="open" x-transition.opacity @click="open = false" class="fixed inset-0 z-[70] grid place-items-center bg-forest-deep/90 p-6 backdrop-blur" data-testid="gallery-lightbox">
            <figure @click.stop class="max-w-5xl">
                <img :src="src" alt="" class="max-h-[80vh] rounded-xl">
                <figcaption class="mt-3 text-center text-sm text-white/70" x-text="caption"></figcaption>
            </figure>
            <button @click="open = false" class="absolute right-6 top-6 grid h-11 w-11 place-items-center rounded-full bg-white/10 text-white" data-testid="gallery-lightbox-close">✕</button>
        </div>
    </div>
@endsection
