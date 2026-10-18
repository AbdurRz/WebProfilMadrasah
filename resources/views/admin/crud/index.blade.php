@extends('layouts.admin')
@section('title', $title)

@php
    $fmt = function ($item, $key) {
        $v = data_get($item, $key);
        return match (true) {
            $v instanceof \Carbon\CarbonInterface => $v->translatedFormat('d M Y'),
            is_bool($v) => $v ? 'Ya' : 'Tidak',
            $key === 'status' => $v === 'published' ? 'Terbit' : 'Draf',
            in_array($key, ['priority', 'category', 'level', 'group', 'role']) => Str::headline((string) $v),
            default => Str::limit((string) $v, 60) ?: '—',
        };
    };
@endphp

@section('content')
    <div class="mb-6 flex flex-wrap items-center justify-between gap-4">
        <form method="get" class="flex gap-2" data-testid="crud-search-form">
            <input name="q" value="{{ request('q') }}" placeholder="Cari {{ Str::lower($singular) }}…" class="field-input w-64" data-testid="crud-search-input">
            <button class="btn-ghost" data-testid="crud-search-submit">Cari</button>
        </form>
        <a href="{{ route("admin.$route.create") }}" class="btn-primary" data-testid="crud-create-button">+ Tambah {{ $singular }}</a>
    </div>

    <div class="card overflow-x-auto">
        <table class="w-full text-left text-sm" data-testid="crud-table">
            <thead class="border-b border-stone-line bg-sand/70 text-[11px] uppercase tracking-wider text-ink/50">
                <tr>
                    @foreach ($columns as $label)<th class="px-5 py-3 font-semibold">{{ $label }}</th>@endforeach
                    <th class="px-5 py-3 text-right font-semibold">Aksi</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-stone-line">
                @forelse ($items as $item)
                    <tr class="transition-colors hover:bg-sand/50" data-testid="crud-row-{{ $item->id }}">
                        @foreach ($columns as $key => $label)
                            <td class="px-5 py-3 {{ $loop->first ? 'font-medium text-forest' : 'text-ink/70' }}">{{ $fmt($item, $key) }}</td>
                        @endforeach
                        <td class="whitespace-nowrap px-5 py-3 text-right">
                            @includeIf("admin.$route.row-actions", ['item' => $item])
                            <a href="{{ route("admin.$route.edit", $item->id) }}" class="rounded-lg px-3 py-1.5 text-xs font-medium text-emerald-brand hover:bg-emerald-50" data-testid="crud-edit-{{ $item->id }}">Ubah</a>
                            <form method="post" action="{{ route("admin.$route.destroy", $item->id) }}" class="inline" x-data @submit.prevent="if (confirm('Hapus data ini? Tindakan tidak dapat dibatalkan.')) $el.submit()">
                                @csrf @method('DELETE')
                                <button class="rounded-lg px-3 py-1.5 text-xs font-medium text-red-700 hover:bg-red-50" data-testid="crud-delete-{{ $item->id }}">Hapus</button>
                            </form>
                        </td>
                    </tr>
                @empty
                    <tr><td colspan="{{ count($columns) + 1 }}" class="px-5 py-12 text-center text-ink/50" data-testid="crud-empty">Belum ada data.</td></tr>
                @endforelse
            </tbody>
        </table>
    </div>
    {{ $items->links() }}
@endsection
