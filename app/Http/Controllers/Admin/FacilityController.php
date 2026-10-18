<?php

namespace App\Http\Controllers\Admin;

use App\Models\Facility;
use Illuminate\Database\Eloquent\Model;

class FacilityController extends CrudController
{
    protected string $model = Facility::class;
    protected string $route = 'facilities';
    protected string $title = 'Fasilitas';
    protected string $singular = 'Fasilitas';
    protected array $searchable = ['name'];
    protected string $labelField = 'name';

    protected function fields(?Model $item = null): array
    {
        return [
            'name' => ['label' => 'Nama Fasilitas', 'type' => 'text', 'rules' => 'required|string|max:255'],
            'description' => ['label' => 'Deskripsi', 'type' => 'textarea', 'rules' => 'nullable|string'],
            'image' => ['label' => 'Foto', 'type' => 'image', 'rules' => 'nullable|image|max:2048'],
        ];
    }

    protected function columns(): array
    {
        return ['name' => 'Nama', 'description' => 'Deskripsi'];
    }
}
