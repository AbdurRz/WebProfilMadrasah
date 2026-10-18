@extends('layouts.public')
@section('title', $item->name)

@section('content')
    <x-page-hero :title="$item->name" :eyebrow="\App\Models\Extracurricular::CATEGORIES[$item->category]" :crumbs="['Ekstrakurikuler' => route('extracurriculars.index'), $item->name => null]" />

    <div class="container-x grid gap-12 py-16 lg:grid-cols-12" x-data="{ open: false, src: '' }" @keydown.escape.window="open = false">
        <div class="lg:col-span-8">
            <img src="{{ $item->cover_url }}" alt="{{ $item->name }}" class="aspect-[16/9] w-full rounded-2xl object-cover" data-testid="ekskul-cover">
            <div class="prose-madrasah mt-10" data-testid="ekskul-description">{!! nl2br(e($item->description)) !!}</div>

            @if ($item->gallery && $item->gallery->items->isNotEmpty())
                <section class="mt-12" data-testid="ekskul-photos">
                    <div class="mb-6 flex items-end justify-between">
                        <p class="eyebrow">Foto kegiatan</p>
                        <a href="{{ route('galleries.show', $item->gallery) }}" class="text-sm text-emerald-brand link-underline">Album lengkap →</a>
                    </div>
                    <div class="grid grid-cols-2 gap-3 md:grid-cols-3">
                        @foreach ($item->gallery->items as $photo)
                            <button @click="open = true; src = @js($photo->url)" class="img-zoom aspect-square overflow-hidden rounded-xl" data-testid="ekskul-photo-{{ $photo->id }}"><img src="{{ $photo->url }}" alt="" loading="lazy" class="h-full w-full object-cover"></button>
                        @endforeach
                    </div>
                </section>
            @endif
        </div>

        <aside class="lg:col-span-4">
            <div class="sticky top-28 space-y-4">
                <div class="card divide-y divide-stone-line" data-testid="ekskul-info">
                    @foreach (['Pembina / pelatih' => $item->coach_name, 'Jadwal latihan' => $item->schedule, 'Tempat' => $item->location] as $l => $v)
                        <div class="p-5"><p class="text-[11px] font-semibold uppercase tracking-[0.2em] text-gold">{{ $l }}</p><p class="mt-1 text-forest">{{ $v ?: '—' }}</p></div>
                    @endforeach
                </div>
                @if ($others->isNotEmpty())
                    <div class="rounded-2xl bg-forest p-6 text-white">
                        <p class="text-[11px] font-semibold uppercase tracking-[0.2em] text-gold">Ekstrakurikuler lain</p>
                        <ul class="mt-4 space-y-3">
                            @foreach ($others as $o)<li><a href="{{ route('extracurriculars.show', $o) }}" class="text-sm hover:text-gold">{{ $o->name }} →</a></li>@endforeach
                        </ul>
                    </div>
                @endif
            </div>
        </aside>

        <div x-cloak x-show="open" x-transition.opacity @click="open = false" class="fixed inset-0 z-[70] grid place-items-center bg-forest-deep/90 p-6 backdrop-blur" data-testid="ekskul-lightbox">
            <img :src="src" alt="" class="max-h-[85vh] rounded-xl" @click.stop>
            <button @click="open = false" class="absolute right-6 top-6 grid h-11 w-11 place-items-center rounded-full bg-white/10 text-white" data-testid="ekskul-lightbox-close">✕</button>
        </div>
    </div>
@endsection
