@extends('layouts.public')
@section('title', 'Cek Status PPDB')

@php
    $tone = ['baru' => 'bg-sky-50 text-sky-800 ring-sky-200', 'diverifikasi' => 'bg-amber-50 text-amber-800 ring-amber-200', 'diterima' => 'bg-emerald-50 text-emerald-800 ring-emerald-200', 'ditolak' => 'bg-red-50 text-red-700 ring-red-200'];
@endphp

@section('content')
    <x-page-hero title="Cek Status Pendaftaran" eyebrow="PPDB" subtitle="Masukkan nomor pendaftaran dan tanggal lahir calon peserta didik." :crumbs="['PPDB' => route('ppdb.index'), 'Cek Status' => null]" />

    <div class="container-x max-w-2xl py-16">
        <form method="get" class="card grid gap-5 p-6 sm:grid-cols-[1fr_1fr_auto] sm:items-end sm:p-8" data-testid="ppdb-check-form">
            <div>
                <label for="nomor" class="field-label">Nomor pendaftaran</label>
                <input id="nomor" name="nomor" value="{{ is_string(request('nomor')) ? request('nomor') : '' }}" placeholder="PPDB-2026-0001" required class="field-input font-mono uppercase" data-testid="ppdb-check-number">
            </div>
            <div>
                <label for="tanggal_lahir" class="field-label">Tanggal lahir</label>
                <input id="tanggal_lahir" type="date" name="tanggal_lahir" value="{{ is_string(request('tanggal_lahir')) ? request('tanggal_lahir') : '' }}" required class="field-input" data-testid="ppdb-check-birthdate">
            </div>
            <button class="btn-primary" data-testid="ppdb-check-submit">Cek</button>
        </form>
        @error('nomor')<p class="mt-3 text-sm text-red-600">{{ $message }}</p>@enderror

        @if ($result)
            <div class="card mt-8 p-8" data-testid="ppdb-check-result">
                <p class="font-mono text-xs text-gold">{{ $result->registration_number }}</p>
                <p class="mt-1 font-serif text-2xl text-forest">{{ $result->full_name }}</p>
                <span class="mt-4 inline-flex rounded-full px-4 py-1.5 text-sm font-semibold ring-1 {{ $tone[$result->status] }}" data-testid="ppdb-check-status">{{ $result->status_label }}</span>
                @if ($result->admin_note)<p class="mt-5 rounded-xl bg-sand p-4 text-sm leading-6 text-ink/75" data-testid="ppdb-check-note"><strong class="text-forest">Catatan panitia:</strong> {{ $result->admin_note }}</p>@endif
                <p class="mt-4 text-xs text-ink/50">Terakhir diperbarui {{ $result->updated_at->translatedFormat('d F Y, H.i') }} WIB</p>
            </div>
        @elseif ($result === false)
            <div class="mt-8 rounded-xl border border-red-200 bg-red-50 p-5 text-sm text-red-700" data-testid="ppdb-check-notfound">Data tidak ditemukan. Pastikan nomor pendaftaran dan tanggal lahir sesuai.</div>
        @endif
    </div>
@endsection
