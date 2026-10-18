@extends('layouts.public')
@section('title', 'Fasilitas')

@section('content')
    <x-page-hero title="Sarana & Prasarana" eyebrow="Profil" subtitle="Lingkungan belajar yang mendukung pembelajaran, ibadah, dan pengembangan diri." :crumbs="['Profil' => route('profile'), 'Fasilitas' => null]" />

    <div class="container-x grid gap-8 py-20 md:grid-cols-2 lg:grid-cols-3">
        @foreach ($facilities as $i => $f)
            <div class="group" data-testid="facility-card-{{ $f->id }}">
                <div class="img-zoom aspect-[4/3] overflow-hidden rounded-2xl {{ $i % 3 === 1 ? 'rounded-tr-[4rem]' : '' }}">
                    <img src="{{ $f->image_url }}" alt="{{ $f->name }}" loading="lazy" class="h-full w-full object-cover">
                </div>
                <p class="mt-5 font-mono text-xs text-gold">{{ str_pad($i + 1, 2, '0', STR_PAD_LEFT) }}</p>
                <h2 class="mt-1 text-2xl text-forest">{{ $f->name }}</h2>
                <p class="mt-2 text-sm leading-7 text-ink/65">{{ $f->description }}</p>
            </div>
        @endforeach
    </div>
@endsection
