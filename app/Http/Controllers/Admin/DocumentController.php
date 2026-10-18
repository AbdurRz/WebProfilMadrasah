<?php

namespace App\Http\Controllers\Admin;

use App\Models\Document;
use Illuminate\Database\Eloquent\Model;

class DocumentController extends CrudController
{
    protected string $model = Document::class;
    protected string $route = 'documents';
    protected string $title = 'Unduhan Dokumen';
    protected string $singular = 'Dokumen';
    protected array $searchable = ['title', 'description'];

    protected function fields(?Model $item = null): array
    {
        return [
            'title' => ['label' => 'Judul Dokumen', 'type' => 'text', 'rules' => 'required|string|max:255'],
            'category' => ['label' => 'Kategori', 'type' => 'select', 'options' => Document::CATEGORIES, 'rules' => 'required|in:'.implode(',', array_keys(Document::CATEGORIES))],
            'description' => ['label' => 'Keterangan', 'type' => 'textarea', 'rules' => 'nullable|string|max:500'],
            'file' => ['label' => 'Berkas (PDF, DOC, XLS, PPT, ZIP)', 'type' => 'file', 'rules' => ($item ? 'nullable' : 'required').'|file|mimes:pdf,doc,docx,xls,xlsx,ppt,pptx,zip|max:10240', 'help' => 'Maksimal 10 MB.'],
            'is_published' => ['label' => 'Tampilkan di website', 'type' => 'checkbox', 'default' => true],
        ];
    }

    protected function columns(): array
    {
        return ['title' => 'Judul', 'category' => 'Kategori', 'downloads' => 'Diunduh', 'is_published' => 'Tampil', 'updated_at' => 'Diperbarui'];
    }
}
