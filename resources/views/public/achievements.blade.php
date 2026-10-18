@extends('layouts.public')
@section('title', 'Prestasi')

@section('content')
    <x-page-hero title="Prestasi Peserta Didik" eyebrow="Capaian" subtitle="Dokumentasi prestasi akademik, keagamaan, dan non-akademik warga madrasah." :crumbs="['Prestasi' => null]" />

    <div class="container-x py-16">
        <div class="mb-10 flex flex-wrap gap-2" data-testid="achievement-filters">
            @foreach (['' => 'Semua', 'kota' => 'Kota', 'provinsi' => 'Provinsi', 'nasional' => 'Nasional', 'internasional' => 'Internasional'] as $k => $l)
                <a href="{{ route('achievements', array_filter(['tingkat' => $k])) }}" class="rounded-full border px-4 py-2 text-sm transition-colors {{ (is_string(request('tingkat')) ? request('tingkat') : '') === $k ? 'border-forest bg-forest text-white' : 'border-stone-line bg-white hover:border-emerald-brand' }}" data-testid="achievement-filter-{{ $k ?: 'all' }}">{{ $l }}</a>
            @endforeach
        </div>
        <div class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
            @forelse ($achievements as $a)
                <div class="card group flex overflow-hidden" data-testid="achievement-card-{{ $a->id }}">
                    <div class="img-zoom w-32 shrink-0 overflow-hidden"><img src="{{ $a->image_url }}" alt="" loading="lazy" class="h-full w-full object-cover"></div>
                    <div class="p-5">
                        <p class="font-mono text-[11px] uppercase text-gold">{{ $a->year }} · {{ $a->level }}</p>
                        <p class="mt-1 font-serif text-lg leading-snug text-forest">{{ $a->rank }}</p>
                        <p class="text-sm font-medium">{{ $a->title }}</p>
                        <p class="mt-2 text-xs text-ink/55">{{ $a->student_name }}</p>
                    </div>
                </div>
            @empty
                <p class="text-ink/60" data-testid="achievement-empty">Belum ada data prestasi.</p>
            @endforelse
        </div>
        {{ $achievements->links() }}
    </div>
@endsection
