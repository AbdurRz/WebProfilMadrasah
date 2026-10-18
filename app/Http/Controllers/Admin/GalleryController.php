<?php

namespace App\Http\Controllers\Admin;

use App\Models\ActivityLog;
use App\Models\Gallery;
use App\Models\GalleryItem;
use App\Support\Media;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class GalleryController extends CrudController
{
    protected string $model = Gallery::class;
    protected string $route = 'galleries';
    protected string $title = 'Galeri';
    protected string $singular = 'Album';

    protected function query()
    {
        return Gallery::withCount('items')->latest('event_date');
    }

    protected function fields(?Model $item = null): array
    {
        return [
            'title' => ['label' => 'Judul Album', 'type' => 'text', 'rules' => 'required|string|max:255'],
            'event_date' => ['label' => 'Tanggal Kegiatan', 'type' => 'date', 'rules' => 'nullable|date'],
            'description' => ['label' => 'Deskripsi', 'type' => 'textarea', 'rules' => 'nullable|string'],
            'cover_image' => ['label' => 'Gambar Sampul', 'type' => 'image', 'rules' => 'nullable|image|max:2048'],
            'video_url' => ['label' => 'Tautan Video YouTube', 'type' => 'url', 'rules' => 'nullable|url|max:255'],
            'photos' => ['label' => 'Tambah Foto (bisa banyak)', 'type' => 'images', 'virtual' => true, 'rules' => 'nullable|array|max:20'],
            'photos.*' => ['type' => 'hidden', 'virtual' => true, 'rules' => 'image|max:2048'],
        ];
    }

    protected function columns(): array
    {
        return ['title' => 'Album', 'event_date' => 'Tanggal', 'items_count' => 'Jumlah Foto'];
    }

    protected function afterSave(Model $item, Request $request): void
    {
        foreach ($request->file('photos', []) as $photo) {
            $item->items()->create(['image_path' => $photo->store('uploads/galleries', 'public')]);
        }
    }

    public function destroy(string $id)
    {
        Gallery::findOrFail($id)->items->each(fn ($i) => Media::delete($i->image_path));

        return parent::destroy($id);
    }

    public function destroyItem(GalleryItem $item)
    {
        Media::delete($item->image_path);
        ActivityLog::record('delete', "Menghapus foto dari album: {$item->gallery->title}", $item);
        $item->delete();

        return back()->with('success', 'Foto dihapus dari album.');
    }
}
