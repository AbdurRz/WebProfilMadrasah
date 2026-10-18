@extends('layouts.public')
@section('title', 'Ekstrakurikuler')

@section('content')
    <x-page-hero title="Ekstrakurikuler" eyebrow="Kesiswaan" subtitle="Wadah pengembangan bakat, minat, dan karakter peserta didik di luar jam pelajaran." :crumbs="['Kesiswaan' => null, 'Ekstrakurikuler' => null]" />

    <div class="container-x py-16" x-data="{ cat: '' }">
        <div class="mb-10 flex flex-wrap gap-2" data-testid="ekskul-filters">
            <button @click="cat = ''" :class="cat === '' ? 'border-forest bg-forest text-white' : 'border-stone-line bg-white hover:border-emerald-brand'" class="rounded-full border px-4 py-2 text-sm transition-colors" data-testid="ekskul-filter-all">Semua</button>
            @foreach (\App\Models\Extracurricular::CATEGORIES as $k => $l)
                <button @click="cat = '{{ $k }}'" :class="cat === '{{ $k }}' ? 'border-forest bg-forest text-white' : 'border-stone-line bg-white hover:border-emerald-brand'" class="rounded-full border px-4 py-2 text-sm transition-colors" data-testid="ekskul-filter-{{ $k }}">{{ $l }}</button>
            @endforeach
        </div>
        <div class="grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
            @foreach ($items as $e)
                <a href="{{ route('extracurriculars.show', $e) }}" x-show="!cat || cat === '{{ $e->category }}'" x-transition.opacity class="group card overflow-hidden" data-testid="ekskul-card-{{ $e->id }}">
                    <div class="img-zoom relative aspect-[16/10] overflow-hidden">
                        <img src="{{ $e->cover_url }}" alt="{{ $e->name }}" loading="lazy" class="h-full w-full object-cover">
                        <span class="absolute left-3 top-3 rounded-full bg-white/90 px-3 py-1 text-[11px] font-semibold text-emerald-brand backdrop-blur">{{ \App\Models\Extracurricular::CATEGORIES[$e->category] }}</span>
                    </div>
                    <div class="p-6">
                        <h2 class="text-2xl text-forest transition-colors group-hover:text-emerald-brand">{{ $e->name }}</h2>
                        <dl class="mt-4 space-y-1.5 text-sm">
                            <div class="flex gap-2"><dt class="w-20 shrink-0 text-ink/50">Pembina</dt><dd>{{ $e->coach_name ?: '—' }}</dd></div>
                            <div class="flex gap-2"><dt class="w-20 shrink-0 text-ink/50">Jadwal</dt><dd class="font-medium text-emerald-brand">{{ $e->schedule ?: '—' }}</dd></div>
                        </dl>
                    </div>
                </a>
            @endforeach
        </div>
    </div>
@endsection
