@extends('layouts.admin')
@section('title', 'Pendaftar PPDB')

@php
    $badge = ['baru' => 'bg-sky-50 text-sky-700', 'diverifikasi' => 'bg-amber-50 text-amber-800', 'diterima' => 'bg-emerald-50 text-emerald-700', 'ditolak' => 'bg-red-50 text-red-700'];
@endphp

@section('content')
    <div class="mb-6 grid gap-3 sm:grid-cols-2 xl:grid-cols-5">
        <a href="{{ route('admin.ppdb.index') }}" class="card p-4 {{ ! $status ? 'border-forest bg-forest text-white' : '' }}" data-testid="ppdb-filter-all">
            <p class="text-xs {{ ! $status ? 'text-white/60' : 'text-ink/55' }}">Semua pendaftar</p>
            <p class="mt-1 font-mono text-2xl font-bold {{ ! $status ? 'text-gold' : 'text-forest' }}">{{ $counts->sum() }}</p>
        </a>
        @foreach (\App\Models\PpdbRegistration::STATUSES as $k => $l)
            <a href="{{ route('admin.ppdb.index', ['status' => $k]) }}" class="card p-4 {{ $status === $k ? 'border-forest bg-forest text-white' : '' }}" data-testid="ppdb-filter-{{ $k }}">
                <p class="text-xs {{ $status === $k ? 'text-white/60' : 'text-ink/55' }}">{{ $l }}</p>
                <p class="mt-1 font-mono text-2xl font-bold {{ $status === $k ? 'text-gold' : 'text-forest' }}" data-testid="ppdb-count-{{ $k }}">{{ $counts[$k] ?? 0 }}</p>
            </a>
        @endforeach
    </div>

    <div class="mb-6 flex flex-wrap items-center justify-between gap-4">
        <form method="get" class="flex gap-2">
            @if ($status)<input type="hidden" name="status" value="{{ $status }}">@endif
            <input name="q" value="{{ $term }}" placeholder="Cari nama, NISN, no. pendaftaran…" class="field-input w-72" data-testid="ppdb-search-input">
            <button class="btn-ghost" data-testid="ppdb-search-submit">Cari</button>
        </form>
        <a href="{{ route('admin.ppdb.export') }}" class="btn-primary" data-testid="ppdb-export-button">Ekspor CSV / Excel</a>
    </div>

    <div class="card overflow-x-auto">
        <table class="w-full text-left text-sm" data-testid="ppdb-table">
            <thead class="border-b border-stone-line bg-sand/70 text-[11px] uppercase tracking-wider text-ink/50">
                <tr><th class="px-5 py-3">No. Pendaftaran</th><th class="px-5 py-3">Nama</th><th class="px-5 py-3">NISN</th><th class="px-5 py-3">Asal Sekolah</th><th class="px-5 py-3">Tanggal</th><th class="px-5 py-3">Status</th><th class="px-5 py-3 text-right">Aksi</th></tr>
            </thead>
            <tbody class="divide-y divide-stone-line">
                @forelse ($items as $r)
                    <tr class="hover:bg-sand/50" data-testid="ppdb-row-{{ $r->id }}">
                        <td class="px-5 py-3 font-mono text-xs">{{ $r->registration_number }}</td>
                        <td class="px-5 py-3 font-medium text-forest">{{ $r->full_name }} <span class="text-xs text-ink/45">({{ $r->gender }})</span></td>
                        <td class="px-5 py-3 font-mono text-xs">{{ $r->nisn }}</td>
                        <td class="px-5 py-3 text-ink/70">{{ $r->previous_school }}</td>
                        <td class="px-5 py-3 text-ink/70">{{ $r->created_at->translatedFormat('d M Y') }}</td>
                        <td class="px-5 py-3"><span class="rounded-full px-2.5 py-0.5 text-[11px] font-semibold {{ $badge[$r->status] }}">{{ $r->status_label }}</span></td>
                        <td class="px-5 py-3 text-right"><a href="{{ route('admin.ppdb.show', $r) }}" class="rounded-lg px-3 py-1.5 text-xs font-medium text-emerald-brand hover:bg-emerald-50" data-testid="ppdb-review-{{ $r->id }}">Tinjau</a></td>
                    </tr>
                @empty
                    <tr><td colspan="7" class="px-5 py-12 text-center text-ink/50" data-testid="ppdb-empty">Belum ada pendaftar.</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
    {{ $items->links() }}
@endsection
