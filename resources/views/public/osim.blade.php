@extends('layouts.public')
@section('title', 'OSIM')

@section('content')
    <x-page-hero title="Organisasi Siswa Intra Madrasah" eyebrow="Kesiswaan" subtitle="OSIM menjadi wadah kepemimpinan, aspirasi, dan pengabdian peserta didik MTsN 1 Bukittinggi." :crumbs="['Kesiswaan' => null, 'OSIM' => null]">
        @if ($periods->count() > 1)
            <form method="get" class="rise rise-4 mt-8 flex items-center gap-3">
                <label for="periode" class="text-sm text-white/70">Periode</label>
                <select id="periode" name="periode" onchange="this.form.submit()" class="rounded-full border border-white/20 bg-white/10 px-4 py-2 text-sm text-white [&>option]:text-ink" data-testid="osim-period-select">
                    @foreach ($periods as $p)<option value="{{ $p }}" @selected($p === $period)>{{ $p }}</option>@endforeach
                </select>
            </form>
        @endif
    </x-page-hero>

    <div class="container-x py-16">
        @if ($page)
            <section class="grid gap-10 lg:grid-cols-12" data-testid="osim-about">
                <div class="lg:col-span-4"><p class="eyebrow">Tentang OSIM</p><h2 class="mt-3 text-3xl text-forest">{{ $page->title }}</h2></div>
                <div class="prose-madrasah lg:col-span-8">{!! $page->content !!}</div>
            </section>
        @endif

        <section class="mt-20" data-testid="osim-structure">
            <p class="eyebrow">Pengurus periode {{ $period }}</p>
            <div class="mt-8 flex flex-wrap justify-center gap-6">
                @foreach ($leaders as $m)
                    <div class="w-64 rounded-2xl bg-forest p-6 text-center text-white" data-testid="osim-leader-{{ $m->id }}">
                        @if ($m->photo_url)<img src="{{ $m->photo_url }}" alt="{{ $m->name }}" class="mx-auto h-24 w-24 rounded-full border-2 border-gold object-cover">@else<div class="mx-auto grid h-24 w-24 place-items-center rounded-full border-2 border-gold bg-emerald-brand font-serif text-3xl">{{ Str::substr($m->name, 0, 1) }}</div>@endif
                        <p class="mt-4 text-[11px] font-semibold uppercase tracking-[0.2em] text-gold">{{ $m->position }}</p>
                        <p class="mt-1 font-serif text-xl">{{ $m->name }}</p>
                        <p class="text-xs text-white/60">Kelas {{ $m->class_name }}</p>
                    </div>
                @endforeach
            </div>
            @if ($leaders->isNotEmpty() && $members->isNotEmpty())<div class="mx-auto my-6 h-10 w-px bg-gold"></div>@endif
            <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
                @foreach ($members as $m)
                    <div class="card flex items-center gap-4 p-4" data-testid="osim-member-{{ $m->id }}">
                        @if ($m->photo_url)<img src="{{ $m->photo_url }}" alt="" class="h-12 w-12 rounded-full object-cover">@else<div class="grid h-12 w-12 shrink-0 place-items-center rounded-full bg-sand-dark font-serif text-emerald-brand">{{ Str::substr($m->name, 0, 1) }}</div>@endif
                        <div class="min-w-0">
                            <p class="truncate font-medium text-forest">{{ $m->name }}</p>
                            <p class="text-xs text-emerald-brand">{{ $m->position }}</p>
                            <p class="text-[11px] text-ink/50">Kelas {{ $m->class_name }}</p>
                        </div>
                    </div>
                @endforeach
            </div>
            @if ($leaders->isEmpty() && $members->isEmpty())<p class="text-sm text-ink/60" data-testid="osim-empty">Data pengurus belum tersedia.</p>@endif
        </section>
    </div>
@endsection
