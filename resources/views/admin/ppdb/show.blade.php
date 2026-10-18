@extends('layouts.admin')
@section('title', 'Tinjau Pendaftar')

@php
    $rows = [
        'Nama lengkap' => $r->full_name, 'NISN' => $r->nisn, 'Jenis kelamin' => $r->gender === 'L' ? 'Laki-laki' : 'Perempuan',
        'Tempat, tanggal lahir' => $r->birth_place.', '.$r->birth_date->translatedFormat('d F Y'), 'Asal sekolah' => $r->previous_school,
        'Alamat' => $r->address, 'Nama orang tua/wali' => $r->parent_name, 'No. HP orang tua' => $r->parent_phone,
        'Email' => $r->email ?: '—', 'Prestasi' => $r->achievement_note ?: '—',
    ];
    $waText = "Assalamu'alaikum Bapak/Ibu {$r->parent_name}.\n\nKami dari panitia PPDB MTsN 1 Bukittinggi menginformasikan status pendaftaran ananda *{$r->full_name}* (No. {$r->registration_number}): *{$r->status_label}*."
        .($r->admin_note ? "\n\nCatatan: {$r->admin_note}" : '')."\n\nCek status: ".route('ppdb.check');
@endphp

@section('content')
    <a href="{{ route('admin.ppdb.index') }}" class="mb-6 inline-block text-sm text-emerald-brand" data-testid="ppdb-back-link">← Kembali ke daftar</a>
    <div class="grid gap-6 xl:grid-cols-3">
        <div class="card overflow-hidden xl:col-span-2">
            <div class="flex flex-wrap items-center justify-between gap-3 border-b border-stone-line px-6 py-5">
                <div>
                    <p class="font-mono text-xs text-gold" data-testid="ppdb-detail-number">{{ $r->registration_number }}</p>
                    <p class="mt-1 font-serif text-2xl text-forest">{{ $r->full_name }}</p>
                </div>
                <p class="text-sm text-ink/55">Mendaftar {{ $r->created_at->translatedFormat('d F Y, H.i') }} · TA {{ $r->academic_year }}</p>
            </div>
            <dl class="divide-y divide-stone-line" data-testid="ppdb-detail-list">
                @foreach ($rows as $label => $value)
                    <div class="grid gap-1 px-6 py-3 sm:grid-cols-3"><dt class="text-sm text-ink/55">{{ $label }}</dt><dd class="text-sm sm:col-span-2">{{ $value }}</dd></div>
                @endforeach
                <div class="grid gap-1 px-6 py-3 sm:grid-cols-3">
                    <dt class="text-sm text-ink/55">Berkas</dt>
                    <dd class="flex flex-wrap gap-2 sm:col-span-2">
                        @foreach (['kk' => 'Kartu Keluarga', 'rapor' => 'Rapor SD/MI'] as $t => $l)
                            @if ($r->{'doc_'.$t})<a href="{{ route('admin.ppdb.document', [$r, $t]) }}" target="_blank" class="btn-ghost px-4 py-1.5 text-xs" data-testid="ppdb-doc-{{ $t }}">{{ $l }} ↗</a>@endif
                        @endforeach
                    </dd>
                </div>
            </dl>
        </div>

        <div class="space-y-6">
            <form method="post" action="{{ route('admin.ppdb.update', $r) }}" class="card space-y-4 p-6" data-testid="ppdb-status-form">
                @csrf @method('PUT')
                <p class="font-medium text-forest">Keputusan panitia</p>
                <div class="grid grid-cols-2 gap-2">
                    @foreach (\App\Models\PpdbRegistration::STATUSES as $k => $l)
                        <label class="cursor-pointer">
                            <input type="radio" name="status" value="{{ $k }}" class="peer sr-only" @checked($r->status === $k) data-testid="ppdb-status-{{ $k }}">
                            <span class="block rounded-lg border border-stone-line px-3 py-2 text-center text-sm transition-colors peer-checked:border-forest peer-checked:bg-forest peer-checked:text-white">{{ $l }}</span>
                        </label>
                    @endforeach
                </div>
                <div>
                    <label for="admin_note" class="field-label">Catatan untuk pendaftar</label>
                    <textarea id="admin_note" name="admin_note" rows="3" class="field-input" placeholder="Mis. silakan lengkapi pas foto saat daftar ulang." data-testid="ppdb-admin-note">{{ old('admin_note', $r->admin_note) }}</textarea>
                </div>
                <button class="btn-primary w-full" data-testid="ppdb-status-submit">Simpan keputusan</button>
            </form>

            <div class="card p-6">
                <p class="font-medium text-forest">Hubungi orang tua</p>
                <p class="mt-1 text-sm text-ink/55">Kirim status terbaru melalui WhatsApp ke {{ $r->parent_phone }}.</p>
                <a href="https://wa.me/{{ $r->whatsapp_number }}?text={{ rawurlencode($waText) }}" target="_blank" rel="noopener" class="btn-gold mt-4 w-full" data-testid="ppdb-whatsapp-parent">Kirim WhatsApp</a>
            </div>

            <form method="post" action="{{ route('admin.ppdb.destroy', $r) }}" x-data @submit.prevent="if (confirm('Hapus data pendaftar ini beserta berkasnya?')) $el.submit()">
                @csrf @method('DELETE')
                <button class="w-full rounded-lg px-3 py-2 text-sm text-red-700 hover:bg-red-50" data-testid="ppdb-delete-button">Hapus pendaftar</button>
            </form>
        </div>
    </div>
@endsection
