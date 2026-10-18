@extends('layouts.admin')
@section('title', 'Halaman Profil')

@section('content')
    <p class="mb-6 max-w-2xl text-sm text-ink/60">Konten statis yang tampil di halaman Profil dan Beranda (sambutan, sejarah, visi, misi, struktur organisasi).</p>
    <div class="grid gap-4 md:grid-cols-2 xl:grid-cols-3">
        @foreach ($pages as $page)
            <a href="{{ route('admin.pages.edit', $page) }}" class="card group p-6 transition-[border-color,transform] hover:-translate-y-0.5 hover:border-emerald-brand/40" data-testid="page-card-{{ $page->key }}">
                <p class="font-mono text-[11px] uppercase text-gold">{{ $page->key }}</p>
                <p class="mt-1 font-serif text-xl text-forest">{{ $page->title }}</p>
                <p class="mt-2 line-clamp-2 text-sm text-ink/55">{{ strip_tags($page->content) }}</p>
                <p class="mt-4 text-xs text-ink/45">Diperbarui {{ $page->updated_at->diffForHumans() }}</p>
            </a>
        @endforeach
    </div>
@endsection
