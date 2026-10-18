@extends('layouts.admin')
@section('title', ($item->exists ? 'Ubah ' : 'Tambah ').$singular)

@section('content')
    <form method="post" enctype="multipart/form-data" action="{{ $item->exists ? route("admin.$route.update", $item->id) : route("admin.$route.store") }}" class="grid gap-6 xl:grid-cols-3" data-testid="crud-form">
        @csrf
        @if ($item->exists) @method('PUT') @endif

        <div class="card space-y-6 p-6 sm:p-8 xl:col-span-2">
            @foreach ($fields as $name => $f)
                @continue($f['type'] === 'hidden')
                @php
                    $raw = old($name, $item->{$name} ?? null);
                    $value = match ($f['type']) {
                        'date' => $raw instanceof \Carbon\CarbonInterface ? $raw->format('Y-m-d') : $raw,
                        'datetime' => $raw instanceof \Carbon\CarbonInterface ? $raw->format('Y-m-d\TH:i') : $raw,
                        'password' => '',
                        default => $raw,
                    };
                    $id = 'field-'.$name;
                    $tid = 'input-'.Str::slug($name);
                @endphp
                <div>
                    @if ($f['type'] === 'checkbox')
                        <label class="flex items-center gap-3 text-sm font-medium">
                            <input type="hidden" name="{{ $name }}" value="0">
                            <input type="checkbox" name="{{ $name }}" value="1" @checked($item->exists ? $raw : old($name, $f['default'] ?? false)) class="h-4 w-4 accent-emerald-brand" data-testid="{{ $tid }}">
                            {{ $f['label'] }}
                        </label>
                    @else
                        <label for="{{ $id }}" class="field-label">{{ $f['label'] }} @if (Str::contains(is_array($f['rules'] ?? '') ? implode('|', $f['rules']) : ($f['rules'] ?? ''), 'required'))<span class="text-red-600">*</span>@endif</label>
                        @switch($f['type'])
                            @case('textarea')
                                <textarea id="{{ $id }}" name="{{ $name }}" rows="4" class="field-input" data-testid="{{ $tid }}">{{ $value }}</textarea>
                                @break
                            @case('richtext')
                                <input id="{{ $id }}" type="hidden" name="{{ $name }}" value="{{ $value }}">
                                <trix-editor input="{{ $id }}" class="trix-content" data-testid="{{ $tid }}"></trix-editor>
                                @break
                            @case('select')
                                <select id="{{ $id }}" name="{{ $name }}" class="field-input" data-testid="{{ $tid }}">
                                    <option value="">— Pilih —</option>
                                    @foreach ($f['options'] as $k => $l)<option value="{{ $k }}" @selected((string) $value === (string) $k)>{{ $l }}</option>@endforeach
                                </select>
                                @break
                            @case('image')
                            @case('file')
                                <div class="flex items-center gap-4">
                                    @if ($item->{$name})
                                        @if ($f['type'] === 'image')<img src="{{ \App\Support\Media::url($item->{$name}) }}" alt="" class="h-16 w-24 rounded-lg object-cover" data-testid="{{ $tid }}-preview">@else<a href="{{ \App\Support\Media::url($item->{$name}) }}" target="_blank" class="text-xs text-emerald-brand underline">Berkas saat ini</a>@endif
                                    @endif
                                    <input id="{{ $id }}" type="file" name="{{ $name }}" @if ($f['type'] === 'image') accept="image/*" @endif class="block w-full text-sm file:mr-4 file:rounded-full file:border-0 file:bg-sand-dark file:px-4 file:py-2 file:text-sm file:font-medium" data-testid="{{ $tid }}">
                                </div>
                                @break
                            @case('images')
                                <input id="{{ $id }}" type="file" name="{{ $name }}[]" multiple accept="image/*" class="block w-full text-sm file:mr-4 file:rounded-full file:border-0 file:bg-sand-dark file:px-4 file:py-2 file:text-sm file:font-medium" data-testid="{{ $tid }}">
                                @break
                            @default
                                <input id="{{ $id }}" type="{{ $f['type'] === 'datetime' ? 'datetime-local' : $f['type'] }}" name="{{ $name }}" value="{{ $value }}" class="field-input" data-testid="{{ $tid }}">
                        @endswitch
                    @endif
                    @if (! empty($f['help']))<p class="mt-1.5 text-xs text-ink/50">{{ $f['help'] }}</p>@endif
                    @error($name)<p class="mt-1.5 text-xs text-red-600" data-testid="{{ $tid }}-error">{{ $message }}</p>@enderror
                </div>
            @endforeach
        </div>

        <div class="space-y-6">
            <div class="card sticky top-24 p-6">
                <p class="font-medium text-forest">Simpan perubahan</p>
                <p class="mt-1 text-sm text-ink/55">Pastikan data sudah benar sebelum disimpan.</p>
                <div class="mt-5 flex gap-2">
                    <button class="btn-primary flex-1" data-testid="crud-submit-button">Simpan</button>
                    <a href="{{ route("admin.$route.index") }}" class="btn-ghost" data-testid="crud-cancel-button">Batal</a>
                </div>
                @php $publicRoute = ['posts' => 'news.show', 'announcements' => 'announcements.show', 'galleries' => 'galleries.show'][$route] ?? null; @endphp
                @if ($item->exists && $publicRoute)
                    <a href="{{ route($publicRoute, $item) }}" target="_blank" class="mt-4 block text-center text-xs text-emerald-brand" data-testid="crud-view-public-link">Lihat di website ↗</a>
                @endif
            </div>

            @if ($route === 'galleries' && $item->exists && $item->items->isNotEmpty())
                <div class="card p-6" data-testid="gallery-items-panel">
                    <p class="mb-4 font-medium text-forest">Foto dalam album ({{ $item->items->count() }})</p>
                    <div class="grid grid-cols-3 gap-2">
                        @foreach ($item->items as $photo)
                            <div class="group relative">
                                <img src="{{ $photo->url }}" alt="" class="aspect-square w-full rounded-lg object-cover">
                                <button form="del-photo-{{ $photo->id }}" class="absolute right-1 top-1 h-6 w-6 rounded-full bg-red-600 text-xs text-white lg:hidden lg:group-hover:block" data-testid="gallery-item-delete-{{ $photo->id }}">✕</button>
                            </div>
                        @endforeach
                    </div>
                </div>
            @endif
        </div>
    </form>

    @if ($route === 'galleries' && $item->exists)
        @foreach ($item->items as $photo)
            <form id="del-photo-{{ $photo->id }}" method="post" action="{{ route('admin.gallery-items.destroy', $photo) }}" onsubmit="return confirm('Hapus foto ini?')">@csrf @method('DELETE')</form>
        @endforeach
    @endif
@endsection
