<?php

namespace App\Http\Controllers\Admin;

use App\Models\Teacher;
use Illuminate\Database\Eloquent\Model;

class TeacherController extends CrudController
{
    protected string $model = Teacher::class;
    protected string $route = 'teachers';
    protected string $title = 'Guru & Tendik';
    protected string $singular = 'Data guru';
    protected array $searchable = ['name', 'subject', 'position'];
    protected string $labelField = 'name';

    protected function query()
    {
        return Teacher::orderBy('sort')->orderBy('name');
    }

    protected function fields(?Model $item = null): array
    {
        return [
            'name' => ['label' => 'Nama Lengkap', 'type' => 'text', 'rules' => 'required|string|max:255'],
            'nip' => ['label' => 'NIP', 'type' => 'text', 'rules' => 'nullable|string|max:30'],
            'position' => ['label' => 'Jabatan', 'type' => 'text', 'rules' => 'required|string|max:100'],
            'subject' => ['label' => 'Mata Pelajaran', 'type' => 'text', 'rules' => 'nullable|string|max:100'],
            'sort' => ['label' => 'Urutan Tampil', 'type' => 'number', 'rules' => 'nullable|integer|min:0'],
            'photo' => ['label' => 'Foto', 'type' => 'image', 'rules' => 'nullable|image|max:1024'],
        ];
    }

    protected function columns(): array
    {
        return ['name' => 'Nama', 'position' => 'Jabatan', 'subject' => 'Mapel', 'nip' => 'NIP'];
    }
}
