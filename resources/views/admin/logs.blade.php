@extends('layouts.admin')
@section('title', 'Log Aktivitas')

@section('content')
    <div class="card overflow-x-auto">
        <table class="w-full text-left text-sm" data-testid="logs-table">
            <thead class="border-b border-stone-line bg-sand/70 text-[11px] uppercase tracking-wider text-ink/50">
                <tr><th class="px-5 py-3">Waktu</th><th class="px-5 py-3">Pengguna</th><th class="px-5 py-3">Aksi</th><th class="px-5 py-3">Keterangan</th><th class="px-5 py-3">IP</th></tr>
            </thead>
            <tbody class="divide-y divide-stone-line">
                @forelse ($logs as $log)
                    <tr>
                        <td class="whitespace-nowrap px-5 py-3 font-mono text-xs">{{ $log->created_at->format('d/m/Y H:i') }}</td>
                        <td class="px-5 py-3">{{ $log->user?->name ?? '—' }}</td>
                        <td class="px-5 py-3"><span class="rounded-full bg-sand-dark px-2 py-0.5 text-[11px] uppercase">{{ $log->action }}</span></td>
                        <td class="px-5 py-3 text-ink/70">{{ $log->description }}</td>
                        <td class="px-5 py-3 font-mono text-xs text-ink/50">{{ $log->ip_address }}</td>
                    </tr>
                @empty
                    <tr><td colspan="5" class="px-5 py-12 text-center text-ink/50">Belum ada aktivitas.</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
    {{ $logs->links() }}
@endsection
