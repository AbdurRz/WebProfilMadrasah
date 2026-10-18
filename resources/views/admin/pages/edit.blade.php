@extends('layouts.admin')
@section('title', 'Ubah: '.$page->title)

@section('content')
    <form method="post" action="{{ route('admin.pages.update', $page) }}" enctype="multipart/form-data" class="card max-w-4xl space-y-6 p-6 sm:p-8" data-testid="page-form">
        @csrf @method('PUT')
        <div>
            <label for="title" class="field-label">Judul</label>
            <input id="title" name="title" value="{{ old('title', $page->title) }}" class="field-input" data-testid="page-title-input">
        </div>
        <div>
            <label class="field-label">Isi</label>
            <input id="content" type="hidden" name="content" value="{{ old('content', $page->content) }}">
            <trix-editor input="content" class="trix-content" data-testid="page-content-editor"></trix-editor>
        </div>
        <div>
            <label for="image" class="field-label">Gambar (opsional)</label>
            <div class="flex items-center gap-4">
                @if ($page->image_url)<img src="{{ $page->image_url }}" alt="" class="h-16 w-24 rounded-lg object-cover">@endif
                <input id="image" type="file" name="image" accept="image/*" class="text-sm" data-testid="page-image-input">
            </div>
        </div>
        <div class="flex gap-2">
            <button class="btn-primary" data-testid="page-submit-button">Simpan</button>
            <a href="{{ route('admin.pages.index') }}" class="btn-ghost">Batal</a>
        </div>
    </form>
@endsection
