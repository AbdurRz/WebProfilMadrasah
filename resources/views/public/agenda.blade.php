@extends('layouts.public')
@section('title', 'Agenda')

@php
    $byDay = $events->groupBy(fn ($e) => $e->starts_at->day);
    $offset = ($month->dayOfWeekIso - 1);
    $colors = ['akademik' => 'bg-emerald-brand', 'keagamaan' => 'bg-gold', 'kesiswaan' => 'bg-sky-600', 'umum' => 'bg-stone-500'];
@endphp

@section('content')
    <x-page-hero title="Agenda & Kalender Akademik" eyebrow="Kalender" subtitle="Jadwal kegiatan akademik, keagamaan, dan kesiswaan madrasah." :crumbs="['Agenda' => null]" />

    <div class="container-x grid gap-12 py-16 lg:grid-cols-12">
        <div class="lg:col-span-8">
            <div class="mb-6 flex items-center justify-between">
                <a href="{{ route('agenda', ['bulan' => $month->copy()->subMonth()->format('Y-m')]) }}" class="btn-ghost px-4 py-2" data-testid="agenda-prev-month">←</a>
                <h2 class="text-2xl text-forest sm:text-3xl" data-testid="agenda-month-title">{{ $month->translatedFormat('F Y') }}</h2>
                <a href="{{ route('agenda', ['bulan' => $month->copy()->addMonth()->format('Y-m')]) }}" class="btn-ghost px-4 py-2" data-testid="agenda-next-month">→</a>
            </div>
            <div class="overflow-hidden rounded-2xl border border-stone-line bg-white" data-testid="agenda-calendar">
                <div class="grid grid-cols-7 border-b border-stone-line bg-sand text-center text-[11px] font-semibold uppercase tracking-wider text-ink/50">
                    @foreach (['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'] as $d)<div class="py-3">{{ $d }}</div>@endforeach
                </div>
                <div class="grid grid-cols-7">
                    @for ($i = 0; $i < $offset; $i++)<div class="min-h-24 border-b border-r border-stone-line bg-sand/50"></div>@endfor
                    @for ($d = 1; $d <= $month->daysInMonth; $d++)
                        @php $isToday = $month->copy()->day($d)->isToday(); @endphp
                        <div class="min-h-24 border-b border-r border-stone-line p-1.5 sm:p-2">
                            <p class="mb-1 font-mono text-xs {{ $isToday ? 'inline-grid h-6 w-6 place-items-center rounded-full bg-forest text-white' : 'text-ink/50' }}">{{ $d }}</p>
                            @foreach ($byDay->get($d, []) as $e)
                                <p class="mb-1 truncate rounded px-1.5 py-0.5 text-[10px] font-medium text-white sm:text-[11px] {{ $colors[$e->category] }}" title="{{ $e->title }}">{{ $e->title }}</p>
                            @endforeach
                        </div>
                    @endfor
                </div>
            </div>
            <div class="mt-4 flex flex-wrap gap-4 text-xs text-ink/60">
                @foreach ($colors as $k => $c)<span class="flex items-center gap-2"><span class="h-2.5 w-2.5 rounded-sm {{ $c }}"></span>{{ ucfirst($k) }}</span>@endforeach
            </div>

            <div class="mt-12 space-y-3">
                <p class="eyebrow mb-4">Kegiatan bulan ini</p>
                @forelse ($events as $e)
                    <div class="card flex gap-5 p-5" data-testid="agenda-event-{{ $e->id }}">
                        <div class="w-14 text-center"><p class="font-mono text-2xl font-bold text-emerald-brand">{{ $e->starts_at->format('d') }}</p><p class="text-[10px] uppercase text-ink/50">{{ $e->starts_at->translatedFormat('D') }}</p></div>
                        <div>
                            <p class="font-medium text-forest">{{ $e->title }}</p>
                            <p class="text-sm text-ink/55">{{ $e->starts_at->format('H.i') }}{{ $e->ends_at ? ' – '.$e->ends_at->translatedFormat($e->ends_at->isSameDay($e->starts_at) ? 'H.i' : 'd M, H.i') : '' }} WIB · {{ $e->location }}</p>
                            @if ($e->description)<p class="mt-2 text-sm text-ink/65">{{ $e->description }}</p>@endif
                        </div>
                    </div>
                @empty
                    <p class="text-sm text-ink/60" data-testid="agenda-empty">Tidak ada kegiatan pada bulan ini.</p>
                @endforelse
            </div>
        </div>

        <aside class="lg:col-span-4">
            <div class="sticky top-28 rounded-2xl bg-forest p-7 text-white">
                <p class="text-[11px] font-semibold uppercase tracking-[0.25em] text-gold">Segera</p>
                <h3 class="mt-2 text-2xl">Agenda terdekat</h3>
                <ul class="mt-6 space-y-5">
                    @foreach ($upcoming as $e)
                        <li class="flex gap-4 border-b border-white/10 pb-5 last:border-0">
                            <span class="font-mono text-sm text-gold">{{ $e->starts_at->translatedFormat('d M') }}</span>
                            <span class="text-sm leading-6">{{ $e->title }}</span>
                        </li>
                    @endforeach
                </ul>
            </div>
        </aside>
    </div>
@endsection
