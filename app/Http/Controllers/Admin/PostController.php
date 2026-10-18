<?php

namespace App\Http\Controllers\Admin;

use App\Models\Category;
use App\Models\Post;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class PostController extends CrudController
{
    protected string $model = Post::class;
    protected string $route = 'posts';
    protected string $title = 'Berita & Artikel';
    protected string $singular = 'Berita';
    protected array $searchable = ['title', 'excerpt'];

    protected function query()
    {
        return Post::with('category', 'author')->latest('id');
    }

    protected function fields(?Model $item = null): array
    {
        return [
            'title' => ['label' => 'Judul', 'type' => 'text', 'rules' => 'required|string|max:255'],
            'category_id' => ['label' => 'Kategori', 'type' => 'select', 'options' => Category::orderBy('name')->pluck('name', 'id')->all(), 'rules' => 'nullable|exists:categories,id'],
            'excerpt' => ['label' => 'Ringkasan', 'type' => 'textarea', 'rules' => 'nullable|string|max:500', 'help' => 'Maks. 500 karakter, tampil di daftar berita.'],
            'content' => ['label' => 'Isi Berita', 'type' => 'richtext', 'rules' => 'required|string'],
            'cover_image' => ['label' => 'Gambar Sampul', 'type' => 'image', 'rules' => 'nullable|image|max:2048'],
            'status' => ['label' => 'Status', 'type' => 'select', 'options' => ['draft' => 'Draf', 'published' => 'Terbit'], 'rules' => 'required|in:draft,published'],
            'published_at' => ['label' => 'Tanggal Terbit', 'type' => 'datetime', 'rules' => 'nullable|date', 'help' => 'Kosongkan untuk terbit sekarang.'],
            'is_featured' => ['label' => 'Jadikan berita utama', 'type' => 'checkbox'],
        ];
    }

    protected function columns(): array
    {
        return [
            'title' => 'Judul',
            'category.name' => 'Kategori',
            'status' => 'Status',
            'published_at' => 'Terbit',
            'views' => 'Dilihat',
        ];
    }

    protected function validated(Request $request, ?Model $item = null): array
    {
        $data = parent::validated($request, $item);
        if (! $item) {
            $data['user_id'] = auth()->id();
        }

        return $data;
    }
}
