<?php

namespace App\Http\Controllers\Admin;

use App\Models\Event;
use Illuminate\Database\Eloquent\Model;

class EventController extends CrudController
{
    protected string $model = Event::class;
    protected string $route = 'events';
    protected string $title = 'Agenda Kegiatan';
    protected string $singular = 'Agenda';
    protected array $searchable = ['title', 'location'];

    protected function query()
    {
        return Event::orderByDesc('starts_at');
    }

    protected function fields(?Model $item = null): array
    {
        return [
            'title' => ['label' => 'Nama Kegiatan', 'type' => 'text', 'rules' => 'required|string|max:255'],
            'category' => ['label' => 'Kategori', 'type' => 'select', 'options' => ['akademik' => 'Akademik', 'keagamaan' => 'Keagamaan', 'kesiswaan' => 'Kesiswaan', 'umum' => 'Umum'], 'rules' => 'required|in:akademik,keagamaan,kesiswaan,umum'],
            'starts_at' => ['label' => 'Waktu Mulai', 'type' => 'datetime', 'rules' => 'required|date'],
            'ends_at' => ['label' => 'Waktu Selesai', 'type' => 'datetime', 'rules' => 'nullable|date|after_or_equal:starts_at'],
            'location' => ['label' => 'Lokasi', 'type' => 'text', 'rules' => 'nullable|string|max:255'],
            'description' => ['label' => 'Deskripsi', 'type' => 'textarea', 'rules' => 'nullable|string'],
        ];
    }

    protected function columns(): array
    {
        return ['title' => 'Kegiatan', 'category' => 'Kategori', 'starts_at' => 'Mulai', 'location' => 'Lokasi'];
    }
}
