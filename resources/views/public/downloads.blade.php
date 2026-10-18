@extends('layouts.public')
@section('title', 'Unduhan Dokumen')

@section('content')
    <x-page-hero title="Unduhan Dokumen" eyebrow="Informasi Publik" subtitle="Silabus, formulir layanan, dan regulasi madrasah yang dapat diunduh oleh peserta didik dan orang tua." :crumbs="['Unduhan' => null]" />

    <div class="container-x grid gap-10 py-16 lg:grid-cols-12">
        <aside class="lg:col-span-3">
            <div class="sticky top-28 space-y-6">
                <form method="get" data-testid="downloads-search-form">
                    @if ($category)<input type="hidden" name="kategori" value="{{ $category }}">@endif
                    <input name="q" value="{{ $term }}" placeholder="Cari dokumen…" class="field-input" data-testid="downloads-search-input">
                </form>
                <ul class="space-y-1">
                    <li><a href="{{ route('downloads') }}" class="flex justify-between rounded-lg px-3 py-2 text-sm {{ ! $category ? 'bg-forest text-white' : 'hover:bg-white' }}" data-testid="downloads-category-all">Semua <span class="font-mono text-xs opacity-60">{{ $counts->sum() }}</span></a></li>
                    @foreach (\App\Models\Document::CATEGORIES as $k => $l)
                        <li><a href="{{ route('downloads', ['kategori' => $k]) }}" class="flex justify-between rounded-lg px-3 py-2 text-sm {{ $category === $k ? 'bg-forest text-white' : 'hover:bg-white' }}" data-testid="downloads-category-{{ $k }}">{{ $l }} <span class="font-mono text-xs opacity-60">{{ $counts[$k] ?? 0 }}</span></a></li>
                    @endforeach
                </ul>
            </div>
        </aside>

        <div class="lg:col-span-9">
            <div class="divide-y divide-stone-line rounded-2xl border border-stone-line bg-white" data-testid="downloads-list">
                @forelse ($documents as $d)
                    <div class="grid gap-4 p-5 sm:grid-cols-[56px_1fr_auto] sm:items-center" data-testid="document-item-{{ $d->id }}">
                        <div class="grid h-14 w-14 place-items-center rounded-xl bg-sand-dark font-mono text-[11px] font-bold text-emerald-brand">{{ $d->extension }}</div>
                        <div class="min-w-0">
                            <p class="text-[11px] font-semibold uppercase tracking-wider text-gold">{{ \App\Models\Document::CATEGORIES[$d->category] }}</p>
                            <p class="mt-0.5 font-medium text-forest">{{ $d->title }}</p>
                            @if ($d->description)<p class="mt-1 text-sm text-ink/60">{{ $d->description }}</p>@endif
                            <p class="mt-1 text-xs text-ink/45">{{ $d->updated_at->translatedFormat('d M Y') }}@if ($d->size_label) · {{ $d->size_label }}@endif · <span data-testid="document-downloads-{{ $d->id }}">{{ $d->downloads }}</span> kali diunduh</p>
                        </div>
                        <a href="{{ route('downloads.file', $d) }}" class="btn-primary" data-testid="document-download-{{ $d->id }}">Unduh</a>
                    </div>
                @empty
                    <p class="p-8 text-sm text-ink/60" data-testid="downloads-empty">Belum ada dokumen.</p>
                @endforelse
            </div>
            {{ $documents->links() }}
        </div>
    </div>
@endsection
