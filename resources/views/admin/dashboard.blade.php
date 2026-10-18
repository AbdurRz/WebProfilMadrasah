@extends('layouts.admin')
@section('title', 'Dashboard')

@section('content')
    <div class="mb-8 flex flex-wrap items-end justify-between gap-4">
        <div>
            <p class="text-sm text-ink/55">{{ now()->translatedFormat('l, d F Y') }}</p>
            <h1 class="mt-1 text-3xl text-forest" data-testid="dashboard-greeting">Assalamu'alaikum, {{ Str::before(auth()->user()->name, ' ') }}.</h1>
        </div>
        <div class="flex flex-wrap gap-2">
            <a href="{{ route('admin.posts.create') }}" class="btn-primary" data-testid="quick-add-post">+ Berita</a>
            <a href="{{ route('admin.announcements.create') }}" class="btn-ghost" data-testid="quick-add-announcement">+ Pengumuman</a>
            <a href="{{ route('admin.events.create') }}" class="btn-ghost" data-testid="quick-add-event">+ Agenda</a>
        </div>
    </div>

    <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        @foreach ($counts as $label => $value)
            <div class="card p-5 {{ $loop->first ? 'bg-forest text-white border-forest' : '' }}">
                <p class="text-xs {{ $loop->first ? 'text-white/60' : 'text-ink/55' }}">{{ $label }}</p>
                <p class="mt-2 font-mono text-3xl font-bold {{ $loop->first ? 'text-gold' : 'text-forest' }}" data-testid="dashboard-count-{{ Str::slug($label) }}">{{ $value }}</p>
            </div>
        @endforeach
    </div>

    <div class="mt-6 grid gap-6 xl:grid-cols-3">
        <div class="card p-6 xl:col-span-2">
            <div class="flex items-center justify-between">
                <p class="font-medium text-forest">Berita terbit per bulan</p>
                <p class="text-xs text-ink/50">Total dibaca: <span class="font-mono text-ink">{{ number_format($totalViews, 0, ',', '.') }}</span></p>
            </div>
            <div class="mt-4 h-64"><canvas id="postsChart" data-testid="dashboard-posts-chart"></canvas></div>
        </div>
        <div class="card p-6">
            <p class="font-medium text-forest">Agenda mendatang</p>
            <ul class="mt-4 space-y-4">
                @forelse ($upcoming as $e)
                    <li class="flex gap-3"><span class="w-14 shrink-0 font-mono text-xs text-emerald-brand">{{ $e->starts_at->translatedFormat('d M') }}</span><span class="text-sm">{{ $e->title }}</span></li>
                @empty
                    <li class="text-sm text-ink/50">Tidak ada agenda.</li>
                @endforelse
            </ul>
        </div>
    </div>

    <div class="mt-6 grid gap-6 xl:grid-cols-2">
        <div class="card overflow-hidden">
            <div class="flex items-center justify-between border-b border-stone-line px-6 py-4"><p class="font-medium text-forest">Berita terakhir</p><a href="{{ route('admin.posts.index') }}" class="text-xs text-emerald-brand">Kelola →</a></div>
            <ul class="divide-y divide-stone-line">
                @foreach ($latestPosts as $p)
                    <li class="flex items-center justify-between gap-4 px-6 py-3">
                        <a href="{{ route('admin.posts.edit', $p) }}" class="truncate text-sm hover:text-emerald-brand">{{ $p->title }}</a>
                        <span class="shrink-0 rounded-full px-2 py-0.5 text-[11px] {{ $p->status === 'published' ? 'bg-emerald-50 text-emerald-700' : 'bg-stone-100 text-stone-600' }}">{{ $p->status === 'published' ? 'Terbit' : 'Draf' }}</span>
                    </li>
                @endforeach
            </ul>
        </div>
        <div class="card overflow-hidden">
            <div class="border-b border-stone-line px-6 py-4"><p class="font-medium text-forest">Aktivitas terbaru</p></div>
            <ul class="divide-y divide-stone-line" data-testid="dashboard-activity-list">
                @forelse ($logs as $log)
                    <li class="px-6 py-3 text-sm"><span class="font-medium">{{ $log->user?->name ?? 'Sistem' }}</span> <span class="text-ink/65">{{ Str::lcfirst($log->description) }}</span><span class="block text-xs text-ink/45">{{ $log->created_at->diffForHumans() }}</span></li>
                @empty
                    <li class="px-6 py-3 text-sm text-ink/50">Belum ada aktivitas.</li>
                @endforelse
            </ul>
        </div>
    </div>
@endsection

@push('scripts')
<script type="module">
    const d = @json($postsPerMonth);
    new Chart(document.getElementById('postsChart'), {
        type: 'bar',
        data: { labels: d.map(x => x.label), datasets: [{ data: d.map(x => x.value), backgroundColor: '#046A38', borderRadius: 8, maxBarThickness: 42 }] },
        options: { maintainAspectRatio: false, plugins: { legend: { display: false } }, scales: { x: { grid: { display: false } }, y: { beginAtZero: true, ticks: { precision: 0 }, grid: { color: '#EFECE6' } } } },
    });
</script>
@endpush
