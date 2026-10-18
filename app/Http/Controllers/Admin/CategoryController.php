<?php

namespace App\Http\Controllers\Admin;

use App\Models\Category;
use Illuminate\Database\Eloquent\Model;

class CategoryController extends CrudController
{
    protected string $model = Category::class;
    protected string $route = 'categories';
    protected string $title = 'Kategori Berita';
    protected string $singular = 'Kategori';
    protected array $searchable = ['name'];
    protected string $labelField = 'name';

    protected function query()
    {
        return Category::withCount('posts')->orderBy('name');
    }

    protected function fields(?Model $item = null): array
    {
        $unique = 'unique:categories,name'.($item ? ','.$item->id : '');

        return [
            'name' => ['label' => 'Nama Kategori', 'type' => 'text', 'rules' => "required|string|max:100|{$unique}"],
            'description' => ['label' => 'Deskripsi', 'type' => 'textarea', 'rules' => 'nullable|string|max:255'],
        ];
    }

    protected function columns(): array
    {
        return ['name' => 'Nama', 'slug' => 'Slug', 'posts_count' => 'Jumlah Berita'];
    }
}
