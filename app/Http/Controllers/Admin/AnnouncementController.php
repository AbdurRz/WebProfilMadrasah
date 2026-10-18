<?php

namespace App\Http\Controllers\Admin;

use App\Models\Announcement;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class AnnouncementController extends CrudController
{
    protected string $model = Announcement::class;
    protected string $route = 'announcements';
    protected string $title = 'Pengumuman';
    protected string $singular = 'Pengumuman';

    protected function fields(?Model $item = null): array
    {
        return [
            'title' => ['label' => 'Judul', 'type' => 'text', 'rules' => 'required|string|max:255'],
            'content' => ['label' => 'Isi Pengumuman', 'type' => 'richtext', 'rules' => 'required|string'],
            'priority' => ['label' => 'Prioritas', 'type' => 'select', 'options' => ['normal' => 'Normal', 'penting' => 'Penting', 'mendesak' => 'Mendesak'], 'rules' => 'required|in:normal,penting,mendesak'],
            'starts_at' => ['label' => 'Berlaku Mulai', 'type' => 'date', 'rules' => 'nullable|date'],
            'ends_at' => ['label' => 'Berlaku Hingga', 'type' => 'date', 'rules' => 'nullable|date|after_or_equal:starts_at'],
            'attachment' => ['label' => 'Lampiran (PDF/DOC)', 'type' => 'file', 'rules' => 'nullable|file|mimes:pdf,doc,docx,xls,xlsx|max:5120'],
            'is_published' => ['label' => 'Tampilkan di website', 'type' => 'checkbox', 'default' => true],
        ];
    }

    protected function afterSave(Model $item, Request $request): void
    {
        if ($item->wasRecentlyCreated && $item->priority === 'mendesak' && $item->is_published) {
            session()->flash('whatsapp', ['title' => $item->title, 'url' => $item->whatsapp_url, 'text' => $item->whatsapp_text]);
        }
    }

    protected function columns(): array
    {
        return ['title' => 'Judul', 'priority' => 'Prioritas', 'starts_at' => 'Mulai', 'ends_at' => 'Hingga', 'is_published' => 'Tampil'];
    }
}
