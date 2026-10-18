@extends('layouts.public')
@section('title', 'Statistik Madrasah')

@php
    $sum = fn ($g) => $data->get($g, collect())->sum('value');
    $chart = fn ($g) => ['labels' => $data->get($g, collect())->pluck('label'), 'values' => $data->get($g, collect())->pluck('value')];
    $levelLabels = $achievementLevels->keys()->map(fn ($k) => ucfirst($k));
    [$siswaChart, $guruChart, $lulusanChart] = [$chart('siswa'), $chart('guru'), $chart('lulusan')];
@endphp

@section('content')
    <x-page-hero title="Statistik Madrasah" eyebrow="Data Terbuka" subtitle="Data peserta didik, pendidik, rombongan belajar, dan lulusan sebagai wujud keterbukaan informasi publik." :crumbs="['Statistik' => null]">
        <form class="rise rise-4 mt-8 flex items-center gap-3" method="get">
            <label for="tahun" class="text-sm text-white/70">Tahun ajaran</label>
            <select id="tahun" name="tahun" onchange="this.form.submit()" class="rounded-full border border-white/20 bg-white/10 px-4 py-2 text-sm text-white backdrop-blur [&>option]:text-ink" data-testid="statistics-year-select">
                @foreach ($years as $y)<option value="{{ $y }}" @selected($y === $year)>{{ $y }}</option>@endforeach
            </select>
        </form>
    </x-page-hero>

    <div class="container-x py-16">
        <div class="grid gap-px overflow-hidden rounded-2xl border border-stone-line bg-stone-line sm:grid-cols-2 lg:grid-cols-4">
            @foreach (['siswa' => 'Peserta Didik', 'guru' => 'Guru & Tendik', 'rombel' => 'Rombongan Belajar', 'lulusan' => 'Lulusan'] as $g => $l)
                <div class="bg-white p-7">
                    <p class="text-sm text-ink/55">{{ $l }}</p>
                    <p class="mt-2 font-mono text-4xl font-bold text-forest" data-testid="statistics-total-{{ $g }}">{{ number_format($sum($g), 0, ',', '.') }}</p>
                </div>
            @endforeach
        </div>

        <div class="mt-10 grid gap-6 lg:grid-cols-2">
            <div class="card p-7"><p class="eyebrow">Peserta didik per jenjang</p><div class="mt-6 h-72"><canvas id="chartSiswa" data-testid="chart-siswa"></canvas></div></div>
            <div class="card p-7"><p class="eyebrow">Komposisi pendidik</p><div class="mt-6 h-72"><canvas id="chartGuru" data-testid="chart-guru"></canvas></div></div>
            <div class="card p-7"><p class="eyebrow">Tren jumlah peserta didik</p><div class="mt-6 h-72"><canvas id="chartTrend" data-testid="chart-trend"></canvas></div></div>
            <div class="card p-7"><p class="eyebrow">Sebaran lulusan</p><div class="mt-6 h-72"><canvas id="chartLulusan" data-testid="chart-lulusan"></canvas></div></div>
            <div class="card p-7 lg:col-span-2"><p class="eyebrow">Prestasi berdasarkan tingkat</p><div class="mt-6 h-64"><canvas id="chartPrestasi" data-testid="chart-prestasi"></canvas></div></div>
        </div>

        <div class="mt-10 overflow-x-auto rounded-2xl border border-stone-line bg-white">
            <table class="w-full text-left text-sm" data-testid="statistics-table">
                <thead class="bg-sand text-[11px] uppercase tracking-wider text-ink/50"><tr><th class="px-6 py-3">Kelompok</th><th class="px-6 py-3">Indikator</th><th class="px-6 py-3 text-right">Jumlah</th></tr></thead>
                <tbody class="divide-y divide-stone-line">
                    @foreach ($data as $group => $rows)
                        @foreach ($rows as $row)
                            <tr><td class="px-6 py-3 capitalize text-ink/60">{{ $group }}</td><td class="px-6 py-3">{{ $row->label }}</td><td class="px-6 py-3 text-right font-mono">{{ number_format($row->value, 0, ',', '.') }}</td></tr>
                        @endforeach
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection

@push('scripts')
<script type="module">
    const palette = ['#046A38', '#D4AF37', '#0B3C24', '#8FBF9F', '#B8962E'];
    const grid = { color: '#EFECE6' };
    const make = (id, type, labels, data, opts = {}) => new Chart(document.getElementById(id), {
        type, data: { labels, datasets: [{ data, backgroundColor: type === 'line' ? 'rgba(4,106,56,.12)' : palette, borderColor: type === 'line' ? '#046A38' : '#fff', borderWidth: type === 'line' ? 2.5 : 2, borderRadius: type === 'bar' ? 8 : 0, fill: true, tension: .35, pointBackgroundColor: '#D4AF37', pointRadius: 5 }] },
        options: Object.assign({ maintainAspectRatio: false, plugins: { legend: { display: ['doughnut', 'pie'].includes(type), position: 'bottom' } }, scales: ['doughnut', 'pie'].includes(type) ? {} : { x: { grid: { display: false } }, y: { grid, beginAtZero: true } } }, opts),
    });
    const siswa = @json($siswaChart), guru = @json($guruChart), lulusan = @json($lulusanChart);
    make('chartSiswa', 'bar', siswa.labels, siswa.values);
    make('chartGuru', 'doughnut', guru.labels, guru.values, { cutout: '62%' });
    make('chartTrend', 'line', @json($trend->keys()), @json($trend->values()));
    make('chartLulusan', 'pie', lulusan.labels, lulusan.values);
    make('chartPrestasi', 'bar', @json($levelLabels), @json($achievementLevels->values()), { indexAxis: 'y' });
</script>
@endpush
