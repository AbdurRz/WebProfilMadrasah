<?php

namespace App\Http\Controllers\Admin;

use App\Models\Achievement;
use Illuminate\Database\Eloquent\Model;

class AchievementController extends CrudController
{
    protected string $model = Achievement::class;
    protected string $route = 'achievements';
    protected string $title = 'Prestasi';
    protected string $singular = 'Prestasi';
    protected array $searchable = ['title', 'student_name'];

    protected function query()
    {
        return Achievement::orderByDesc('year')->latest('id');
    }

    protected function fields(?Model $item = null): array
    {
        return [
            'title' => ['label' => 'Nama Lomba / Prestasi', 'type' => 'text', 'rules' => 'required|string|max:255'],
            'student_name' => ['label' => 'Nama Siswa / Tim', 'type' => 'text', 'rules' => 'nullable|string|max:255'],
            'rank' => ['label' => 'Peringkat', 'type' => 'text', 'rules' => 'nullable|string|max:50', 'help' => 'Contoh: Juara 1, Medali Emas'],
            'level' => ['label' => 'Tingkat', 'type' => 'select', 'options' => ['kota' => 'Kota', 'provinsi' => 'Provinsi', 'nasional' => 'Nasional', 'internasional' => 'Internasional'], 'rules' => 'required|in:kota,provinsi,nasional,internasional'],
            'category' => ['label' => 'Bidang', 'type' => 'select', 'options' => ['akademik' => 'Akademik', 'non-akademik' => 'Non-Akademik', 'keagamaan' => 'Keagamaan'], 'rules' => 'required|in:akademik,non-akademik,keagamaan'],
            'year' => ['label' => 'Tahun', 'type' => 'number', 'rules' => 'required|integer|min:2000|max:2100'],
            'description' => ['label' => 'Keterangan', 'type' => 'textarea', 'rules' => 'nullable|string'],
            'image' => ['label' => 'Foto', 'type' => 'image', 'rules' => 'nullable|image|max:2048'],
        ];
    }

    protected function columns(): array
    {
        return ['title' => 'Prestasi', 'student_name' => 'Siswa', 'rank' => 'Peringkat', 'level' => 'Tingkat', 'year' => 'Tahun'];
    }
}
