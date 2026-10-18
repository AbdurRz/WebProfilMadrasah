<?php

namespace App\Http\Controllers\Admin;

use App\Models\Extracurricular;
use App\Models\Gallery;
use Illuminate\Database\Eloquent\Model;

class ExtracurricularController extends CrudController
{
    protected string $model = Extracurricular::class;
    protected string $route = 'extracurriculars';
    protected string $title = 'Ekstrakurikuler';
    protected string $singular = 'Ekstrakurikuler';
    protected array $searchable = ['name', 'coach_name'];
    protected string $labelField = 'name';

    protected function query()
    {
        return Extracurricular::orderBy('name');
    }

    protected function fields(?Model $item = null): array
    {
        return [
            'name' => ['label' => 'Nama Ekstrakurikuler', 'type' => 'text', 'rules' => 'required|string|max:255'],
            'category' => ['label' => 'Bidang', 'type' => 'select', 'options' => Extracurricular::CATEGORIES, 'rules' => 'required|in:'.implode(',', array_keys(Extracurricular::CATEGORIES))],
            'coach_name' => ['label' => 'Pembina / Pelatih', 'type' => 'text', 'rules' => 'nullable|string|max:255'],
            'schedule' => ['label' => 'Jadwal Latihan', 'type' => 'text', 'rules' => 'nullable|string|max:255', 'help' => 'Contoh: Sabtu, 08.00–10.00 WIB'],
            'location' => ['label' => 'Tempat', 'type' => 'text', 'rules' => 'nullable|string|max:255'],
            'description' => ['label' => 'Deskripsi', 'type' => 'textarea', 'rules' => 'nullable|string'],
            'cover_image' => ['label' => 'Foto Sampul', 'type' => 'image', 'rules' => 'nullable|image|max:2048'],
            'gallery_id' => ['label' => 'Album Foto Kegiatan', 'type' => 'select', 'options' => Gallery::latest('event_date')->pluck('title', 'id')->all(), 'rules' => 'nullable|exists:galleries,id', 'help' => 'Pilih album dari menu Galeri untuk ditampilkan sebagai foto kegiatan.'],
        ];
    }

    protected function columns(): array
    {
        return ['name' => 'Nama', 'category' => 'Bidang', 'coach_name' => 'Pembina', 'schedule' => 'Jadwal'];
    }
}
