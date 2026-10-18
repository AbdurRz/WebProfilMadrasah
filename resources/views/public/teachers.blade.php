@extends('layouts.public')
@section('title', 'Guru & Tenaga Kependidikan')

@section('content')
    <x-page-hero title="Guru & Tenaga Kependidikan" eyebrow="Profil" subtitle="Pendidik dan tenaga kependidikan yang membersamai tumbuh kembang peserta didik." :crumbs="['Profil' => route('profile'), 'Guru & Tendik' => null]" />

    <div class="container-x py-20" x-data="{ q: '' }">
        <div class="mb-10 flex flex-wrap items-center justify-between gap-4">
            <p class="text-sm text-ink/60"><span class="font-mono text-ink">{{ $teachers->count() }}</span> orang terdaftar</p>
            <input x-model="q" type="search" placeholder="Cari nama atau mapel…" class="field-input max-w-xs" data-testid="teacher-search-input">
        </div>
        <div class="grid gap-5 sm:grid-cols-2 lg:grid-cols-4">
            @foreach ($teachers as $t)
                <div x-show="!q || @js(Str::lower($t->name.' '.$t->subject.' '.$t->position)).includes(q.toLowerCase())" class="card group p-6 transition-[border-color,transform] hover:-translate-y-1 hover:border-emerald-brand/40" data-testid="teacher-card-{{ $t->id }}">
                    @if ($t->photo_url)
                        <img src="{{ $t->photo_url }}" alt="{{ $t->name }}" class="mb-5 h-16 w-16 rounded-full object-cover">
                    @else
                        <div class="mb-5 grid h-16 w-16 place-items-center rounded-full bg-sand-dark font-serif text-xl text-emerald-brand">{{ Str::of($t->name)->replaceMatches('/^(Drs?\.|Hj?\.|Ust\.)\s*/', '')->substr(0, 1) }}</div>
                    @endif
                    <p class="font-serif text-lg leading-snug text-forest">{{ $t->name }}</p>
                    <p class="mt-1 text-sm text-emerald-brand">{{ $t->position }}</p>
                    @if ($t->subject)<p class="mt-3 text-xs text-ink/55">Mapel: {{ $t->subject }}</p>@endif
                    @if ($t->nip)<p class="mt-1 font-mono text-[11px] text-ink/40">NIP {{ $t->nip }}</p>@endif
                </div>
            @endforeach
        </div>
    </div>
@endsection
