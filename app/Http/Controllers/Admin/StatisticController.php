<?php

namespace App\Http\Controllers\Admin;

use App\Models\Statistic;
use Illuminate\Database\Eloquent\Model;

class StatisticController extends CrudController
{
    protected string $model = Statistic::class;
    protected string $route = 'statistics';
    protected string $title = 'Data Statistik';
    protected string $singular = 'Data statistik';
    protected array $searchable = ['label', 'academic_year', 'group'];
    protected string $labelField = 'label';

    protected function query()
    {
        return Statistic::orderByDesc('academic_year')->orderBy('group')->orderBy('sort');
    }

    protected function fields(?Model $item = null): array
    {
        return [
            'academic_year' => ['label' => 'Tahun Ajaran', 'type' => 'text', 'rules' => ['required', 'regex:/^\d{4}\/\d{4}$/'], 'help' => 'Format: 2025/2026'],
            'group' => ['label' => 'Kelompok Data', 'type' => 'select', 'options' => ['siswa' => 'Siswa', 'guru' => 'Guru & Tendik', 'rombel' => 'Rombongan Belajar', 'prestasi' => 'Prestasi', 'lulusan' => 'Lulusan'], 'rules' => 'required|in:siswa,guru,rombel,prestasi,lulusan'],
            'label' => ['label' => 'Indikator', 'type' => 'text', 'rules' => 'required|string|max:100', 'help' => 'Contoh: Kelas VII, Laki-laki, Guru PNS'],
            'value' => ['label' => 'Nilai', 'type' => 'number', 'rules' => 'required|integer|min:0'],
            'sort' => ['label' => 'Urutan', 'type' => 'number', 'rules' => 'nullable|integer|min:0'],
        ];
    }

    protected function columns(): array
    {
        return ['academic_year' => 'Tahun Ajaran', 'group' => 'Kelompok', 'label' => 'Indikator', 'value' => 'Nilai'];
    }
}
