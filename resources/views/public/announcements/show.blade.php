@extends('layouts.public')
@section('title', $announcement->title)

@section('content')
    <x-page-hero :title="$announcement->title" eyebrow="Pengumuman" :crumbs="['Pengumuman' => route('announcements.index'), Str::limit($announcement->title, 40) => null]">
        <div class="rise rise-3 mt-6 flex flex-wrap items-center gap-3 text-sm text-white/70">
            <x-priority-badge :priority="$announcement->priority" />
            <span>Diterbitkan {{ $announcement->created_at->translatedFormat('d F Y') }}</span>
            <span class="text-gold">·</span>
            <span>Berlaku s.d. {{ $announcement->ends_at?->translatedFormat('d F Y') ?? '—' }}</span>
        </div>
    </x-page-hero>

    <div class="container-x max-w-3xl py-16">
        <div class="card p-8 sm:p-12">
            <div class="prose-madrasah" data-testid="announcement-content">{!! $announcement->content !!}</div>
            @if ($announcement->attachment_url)
                <a href="{{ $announcement->attachment_url }}" target="_blank" class="btn-primary mt-6" data-testid="announcement-attachment-link">Unduh lampiran</a>
            @endif
            <div class="mt-8 flex flex-wrap items-center gap-3 border-t border-stone-line pt-6">
                <span class="text-sm text-ink/55">Teruskan ke orang tua lain:</span>
                <a href="{{ $announcement->whatsapp_url }}" target="_blank" rel="noopener" class="btn bg-[#128C7E] px-4 py-2 text-white hover:bg-[#075E54]" data-testid="announcement-share-whatsapp">Bagikan via WhatsApp</a>
            </div>
        </div>
        <a href="{{ route('announcements.index') }}" class="mt-8 inline-block text-sm text-emerald-brand link-underline" data-testid="announcement-back-link">← Kembali ke daftar pengumuman</a>
    </div>
@endsection
