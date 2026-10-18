<?php

namespace App\Http\Controllers\Admin;

use App\Models\OsimMember;
use Illuminate\Database\Eloquent\Model;

class OsimMemberController extends CrudController
{
    protected string $model = OsimMember::class;
    protected string $route = 'osim';
    protected string $title = 'Pengurus OSIM';
    protected string $singular = 'Pengurus OSIM';
    protected array $searchable = ['name', 'position', 'period'];
    protected string $labelField = 'name';

    protected function query()
    {
        return OsimMember::orderByDesc('period')->orderBy('sort');
    }

    protected function fields(?Model $item = null): array
    {
        return [
            'name' => ['label' => 'Nama Siswa', 'type' => 'text', 'rules' => 'required|string|max:255'],
            'position' => ['label' => 'Jabatan', 'type' => 'text', 'rules' => 'required|string|max:100', 'help' => 'Contoh: Ketua, Sekretaris, Koordinator Sekbid Keagamaan'],
            'class_name' => ['label' => 'Kelas', 'type' => 'text', 'rules' => 'nullable|string|max:20'],
            'period' => ['label' => 'Periode', 'type' => 'text', 'rules' => ['required', 'regex:/^\d{4}\/\d{4}$/'], 'help' => 'Format: 2025/2026'],
            'sort' => ['label' => 'Urutan', 'type' => 'number', 'rules' => 'nullable|integer|min:0', 'help' => 'Urutan 0–1 tampil sebagai pimpinan inti.'],
            'photo' => ['label' => 'Foto', 'type' => 'image', 'rules' => 'nullable|image|max:1024'],
        ];
    }

    protected function columns(): array
    {
        return ['name' => 'Nama', 'position' => 'Jabatan', 'class_name' => 'Kelas', 'period' => 'Periode'];
    }
}
