@extends('layouts.public')
@section('title', 'Pendaftaran Berhasil')

@section('content')
    <div class="container-x max-w-2xl py-20">
        <div class="card overflow-hidden text-center print:border-0" data-testid="ppdb-success-card">
            <div class="relative bg-forest px-8 py-12 text-white grain">
                <div class="songket absolute inset-0"></div>
                <div class="relative mx-auto grid h-16 w-16 place-items-center rounded-full bg-gold text-3xl text-forest">✓</div>
                <h1 class="relative mt-6 text-3xl sm:text-4xl">Pendaftaran berhasil dikirim</h1>
                <p class="relative mt-2 text-white/70">Simpan nomor pendaftaran di bawah ini.</p>
            </div>
            <div class="p-8 sm:p-10">
                <p class="text-xs uppercase tracking-[0.2em] text-ink/50">Nomor pendaftaran</p>
                <p class="mt-2 font-mono text-4xl font-bold tracking-wider text-emerald-brand" data-testid="ppdb-registration-number">{{ $r->registration_number }}</p>
                <dl class="mx-auto mt-8 max-w-sm space-y-2 text-left text-sm">
                    <div class="flex justify-between gap-4"><dt class="text-ink/55">Nama</dt><dd class="font-medium">{{ $r->full_name }}</dd></div>
                    <div class="flex justify-between gap-4"><dt class="text-ink/55">NISN</dt><dd class="font-mono">{{ $r->nisn }}</dd></div>
                    <div class="flex justify-between gap-4"><dt class="text-ink/55">Tahun ajaran</dt><dd>{{ $r->academic_year }}</dd></div>
                    <div class="flex justify-between gap-4"><dt class="text-ink/55">Status</dt><dd>{{ $r->status_label }}</dd></div>
                </dl>
                <p class="mt-8 text-sm leading-6 text-ink/60">Panitia akan memverifikasi berkas Anda. Cek status secara berkala menggunakan nomor pendaftaran dan tanggal lahir calon peserta didik.</p>
                <div class="mt-8 flex flex-wrap justify-center gap-3 print:hidden">
                    <button onclick="window.print()" class="btn-ghost" data-testid="ppdb-print-button">Cetak bukti</button>
                    <a href="{{ route('ppdb.check') }}" class="btn-primary" data-testid="ppdb-success-check-link">Cek status</a>
                </div>
            </div>
        </div>
    </div>
@endsection
