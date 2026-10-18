@extends('layouts.public')
@section('title', 'Pengumuman')

@section('content')
    <x-page-hero title="Pengumuman Resmi" eyebrow="Papan Informasi" subtitle="Surat edaran, jadwal, dan informasi penting bagi peserta didik dan orang tua/wali." :crumbs="['Pengumuman' => null]" />

    <div class="container-x max-w-4xl py-16">
        <div class="divide-y divide-stone-line rounded-2xl border border-stone-line bg-white" data-testid="announcement-list">
            @forelse ($announcements as $a)
                <a href="{{ route('announcements.show', $a) }}" class="group grid gap-4 p-6 transition-colors hover:bg-sand sm:grid-cols-[110px_1fr_auto] sm:items-center" data-testid="announcement-item-{{ $a->id }}">
                    <div class="font-mono text-xs uppercase text-ink/50">{{ $a->created_at->translatedFormat('d M Y') }}</div>
                    <div>
                        <x-priority-badge :priority="$a->priority" />
                        <p class="mt-2 font-serif text-xl leading-snug text-forest group-hover:text-emerald-brand">{{ $a->title }}</p>
                        <p class="mt-1 text-xs text-ink/50">Berlaku {{ $a->starts_at?->translatedFormat('d M') ?? '—' }} – {{ $a->ends_at?->translatedFormat('d M Y') ?? '—' }}</p>
                    </div>
                    <span class="text-gold transition-transform group-hover:translate-x-1">→</span>
                </a>
            @empty
                <p class="p-8 text-ink/60">Belum ada pengumuman.</p>
            @endforelse
        </div>
        {{ $announcements->links() }}
    </div>
@endsection
