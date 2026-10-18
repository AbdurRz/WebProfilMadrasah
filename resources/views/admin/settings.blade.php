@extends('layouts.admin')
@section('title', 'Pengaturan Situs')

@section('content')
    <form method="post" action="{{ route('admin.settings.update') }}" class="card max-w-4xl p-6 sm:p-8" data-testid="settings-form">
        @csrf @method('PUT')
        <div class="grid gap-6 md:grid-cols-2">
            @foreach ($fields as $key => $f)
                @php [$label, $type] = $f; @endphp
                <div class="{{ $type === 'textarea' || $type === 'url' ? 'md:col-span-2' : '' }}">
                    <label for="{{ $key }}" class="field-label">{{ $label }}</label>
                    @if ($type === 'select')
                        <select id="{{ $key }}" name="{{ $key }}" class="field-input" data-testid="setting-{{ $key }}">
                            @foreach ($f[2] as $ov => $ol)<option value="{{ $ov }}" @selected(old($key, $values[$key] ?? '') == $ov)>{{ $ol }}</option>@endforeach
                        </select>
                    @elseif ($type === 'textarea')
                        <textarea id="{{ $key }}" name="{{ $key }}" rows="3" class="field-input" data-testid="setting-{{ $key }}">{{ old($key, $values[$key] ?? '') }}</textarea>
                    @else
                        <input id="{{ $key }}" type="{{ $type }}" name="{{ $key }}" value="{{ old($key, $values[$key] ?? '') }}" class="field-input" data-testid="setting-{{ $key }}">
                    @endif
                    @error($key)<p class="mt-1 text-xs text-red-600">{{ $message }}</p>@enderror
                </div>
            @endforeach
        </div>
        <button class="btn-primary mt-8" data-testid="settings-submit-button">Simpan pengaturan</button>
    </form>
@endsection
