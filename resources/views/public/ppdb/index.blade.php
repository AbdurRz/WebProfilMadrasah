@extends('layouts.public')
@section('title', 'PPDB '.$year)

@php
    $input = fn ($name, $label, $type = 'text', $attrs = '') => compact('name', 'label', 'type', 'attrs');
@endphp

@section('content')
    <x-page-hero :title="'Penerimaan Peserta Didik Baru '.$year" eyebrow="PPDB" subtitle="Informasi persyaratan, jadwal, dan pendaftaran online calon peserta didik MTsN 1 Bukittinggi." :crumbs="['PPDB' => null]">
        <div class="rise rise-4 mt-8 flex flex-wrap items-center gap-3">
            <span class="inline-flex items-center gap-2 rounded-full px-4 py-1.5 text-sm font-semibold {{ $open ? 'bg-gold text-forest' : 'bg-white/10 text-white/80' }}" data-testid="ppdb-status-badge">
                <span class="h-2 w-2 rounded-full {{ $open ? 'bg-forest animate-pulse' : 'bg-white/50' }}"></span>
                Pendaftaran {{ $open ? 'dibuka' : 'ditutup' }}
            </span>
            @if ($quota)<span class="rounded-full border border-white/20 px-4 py-1.5 text-sm text-white/80">Kuota <span class="font-mono text-white">{{ $quota }}</span> siswa · <span class="font-mono text-white" data-testid="ppdb-registered-count">{{ $registered }}</span> pendaftar</span>@endif
            <a href="{{ route('ppdb.check') }}" class="rounded-full border border-white/20 px-4 py-1.5 text-sm text-white hover:border-gold hover:text-gold" data-testid="ppdb-check-link">Cek status pendaftaran →</a>
        </div>
    </x-page-hero>

    <div class="container-x grid gap-10 py-16 lg:grid-cols-12">
        <div class="space-y-10 lg:col-span-5">
            @if ($p = $pages->get('ppdb_alur'))
                <section data-testid="ppdb-flow">
                    <p class="eyebrow">{{ $p->title }}</p>
                    <div class="prose-madrasah mt-5">{!! $p->content !!}</div>
                </section>
            @endif
            @if ($p = $pages->get('ppdb_persyaratan'))
                <section class="card p-7" data-testid="ppdb-requirements">
                    <h2 class="text-2xl text-forest">{{ $p->title }}</h2>
                    <div class="prose-madrasah mt-4">{!! $p->content !!}</div>
                </section>
            @endif
            @if ($p = $pages->get('ppdb_jadwal'))
                <section class="relative overflow-hidden rounded-2xl bg-forest p-7 text-white grain" data-testid="ppdb-schedule">
                    <div class="songket absolute inset-0 opacity-50"></div>
                    <h2 class="relative text-2xl">{{ $p->title }}</h2>
                    <div class="relative mt-5 text-sm leading-7 text-white/80 [&_li]:border-b [&_li]:border-white/10 [&_li]:py-2.5 [&_strong]:text-gold [&_ul]:space-y-0">{!! $p->content !!}</div>
                </section>
            @endif
        </div>

        <div class="scroll-mt-28 lg:col-span-7" id="formulir" @if ($errors->any()) x-data x-init="$el.scrollIntoView({ behavior: 'smooth' })" @endif>
            @if ($open)
                <form method="post" action="{{ route('ppdb.store') }}" enctype="multipart/form-data" class="card p-6 sm:p-10" data-testid="ppdb-form" x-data="{ sending: false }" @submit="sending = true">
                    @csrf
                    <input type="text" name="website" tabindex="-1" autocomplete="off" class="hidden" aria-hidden="true">
                    <h2 class="text-3xl text-forest">Formulir pendaftaran online</h2>
                    <p class="mt-2 text-sm text-ink/60">Isi data sesuai dokumen resmi. Kolom bertanda <span class="text-red-600">*</span> wajib diisi.</p>

                    @if ($errors->any())
                        <div class="mt-6 rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-700" data-testid="ppdb-form-errors">
                            <p class="font-medium">Periksa kembali isian berikut:</p>
                            <ul class="mt-1 list-inside list-disc">@foreach ($errors->all() as $e)<li>{{ $e }}</li>@endforeach</ul>
                        </div>
                    @endif

                    @foreach ([
                        'Data calon peserta didik' => [
                            $input('full_name', 'Nama lengkap'), $input('nisn', 'NISN (10 digit)', 'text', 'inputmode=numeric maxlength=10'),
                            $input('gender', 'Jenis kelamin', 'gender'), $input('birth_place', 'Tempat lahir'),
                            $input('birth_date', 'Tanggal lahir', 'date'), $input('previous_school', 'Asal sekolah (SD/MI)'),
                            $input('address', 'Alamat lengkap', 'textarea'),
                        ],
                        'Data orang tua / wali' => [
                            $input('parent_name', 'Nama orang tua/wali'), $input('parent_phone', 'No. HP / WhatsApp', 'tel', 'placeholder=081234567890'),
                            $input('email', 'Email (opsional)', 'email'), $input('achievement_note', 'Prestasi yang pernah diraih (opsional)', 'textarea'),
                        ],
                        'Unggah berkas' => [
                            $input('doc_kk', 'Kartu Keluarga (PDF/JPG, maks. 2 MB)', 'file'), $input('doc_rapor', 'Rapor kelas 4–5 SD/MI (PDF/JPG, maks. 2 MB)', 'file'),
                        ],
                    ] as $section => $fields)
                        <fieldset class="mt-10">
                            <legend class="mb-5 flex items-center gap-3 text-[11px] font-semibold uppercase tracking-[0.2em] text-emerald-brand"><span class="grid h-6 w-6 place-items-center rounded-full bg-gold font-mono text-[11px] text-forest">{{ $loop->iteration }}</span>{{ $section }}</legend>
                            <div class="grid gap-5 sm:grid-cols-2">
                                @foreach ($fields as $f)
                                    @php $optional = str_contains($f['label'], 'opsional'); $tid = 'ppdb-input-'.Str::slug($f['name']); @endphp
                                    <div class="{{ in_array($f['type'], ['textarea', 'file']) ? 'sm:col-span-2' : '' }}">
                                        <label for="{{ $f['name'] }}" class="field-label">{{ $f['label'] }} @unless ($optional)<span class="text-red-600">*</span>@endunless</label>
                                        @switch($f['type'])
                                            @case('textarea')
                                                <textarea id="{{ $f['name'] }}" name="{{ $f['name'] }}" rows="3" class="field-input" data-testid="{{ $tid }}">{{ old($f['name']) }}</textarea>
                                                @break
                                            @case('gender')
                                                <div class="grid grid-cols-2 gap-2">
                                                    @foreach (['L' => 'Laki-laki', 'P' => 'Perempuan'] as $gv => $gl)
                                                        <label class="cursor-pointer"><input type="radio" name="gender" value="{{ $gv }}" class="peer sr-only" @checked(old('gender') === $gv) data-testid="ppdb-gender-{{ $gv }}"><span class="block rounded-lg border border-stone-line px-3 py-2.5 text-center text-sm transition-colors peer-checked:border-emerald-brand peer-checked:bg-emerald-brand peer-checked:text-white">{{ $gl }}</span></label>
                                                    @endforeach
                                                </div>
                                                @break
                                            @case('file')
                                                <input id="{{ $f['name'] }}" type="file" name="{{ $f['name'] }}" accept=".pdf,.jpg,.jpeg,.png" class="block w-full rounded-lg border border-dashed border-stone-line bg-sand/50 p-3 text-sm file:mr-4 file:rounded-full file:border-0 file:bg-forest file:px-4 file:py-2 file:text-sm file:font-medium file:text-white" data-testid="{{ $tid }}">
                                                @break
                                            @default
                                                <input id="{{ $f['name'] }}" type="{{ $f['type'] }}" name="{{ $f['name'] }}" value="{{ old($f['name']) }}" {!! $f['attrs'] !!} class="field-input" data-testid="{{ $tid }}">
                                        @endswitch
                                        @error($f['name'])<p class="mt-1.5 text-xs text-red-600" data-testid="{{ $tid }}-error">{{ $message }}</p>@enderror
                                    </div>
                                @endforeach
                            </div>
                        </fieldset>
                    @endforeach

                    <label class="mt-10 flex items-start gap-3 rounded-xl bg-sand p-4 text-sm text-ink/75">
                        <input type="checkbox" name="agree" value="1" class="mt-0.5 h-4 w-4 accent-emerald-brand" @checked(old('agree')) data-testid="ppdb-agree-checkbox">
                        Saya menyatakan bahwa data yang saya isi adalah benar dan dapat dipertanggungjawabkan.
                    </label>
                    <button class="btn-primary mt-6 w-full py-3.5 text-base disabled:opacity-60" :disabled="sending" data-testid="ppdb-submit-button"><span x-text="sending ? 'Mengirim…' : 'Kirim pendaftaran'">Kirim pendaftaran</span></button>
                </form>
            @else
                <div class="card p-10 text-center" data-testid="ppdb-closed-notice">
                    <p class="font-serif text-3xl text-forest">Pendaftaran online sedang ditutup</p>
                    <p class="mx-auto mt-3 max-w-md text-sm text-ink/60">Pantau halaman pengumuman untuk jadwal pembukaan berikutnya, atau hubungi panitia PPDB di {{ $site['phone'] ?? '' }}.</p>
                    <a href="{{ route('announcements.index') }}" class="btn-ghost mt-6">Lihat pengumuman</a>
                </div>
            @endif
        </div>
    </div>
@endsection
