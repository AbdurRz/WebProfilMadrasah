<?php

namespace App\Models;

use App\Models\Concerns\HasSlug;
use App\Support\Media;
use Illuminate\Database\Eloquent\Model;

class Gallery extends Model
{
    use HasSlug;

    protected $fillable = ['title', 'slug', 'description', 'cover_image', 'video_url', 'event_date'];

    protected $casts = ['event_date' => 'date'];

    public function items()
    {
        return $this->hasMany(GalleryItem::class);
    }

    public function getCoverUrlAttribute(): string
    {
        return Media::url($this->cover_image ?: $this->items()->value('image_path'));
    }

    public function getYoutubeIdAttribute(): ?string
    {
        if (! $this->video_url) {
            return null;
        }
        preg_match('~(?:youtu\.be/|v=|embed/)([\w-]{11})~', $this->video_url, $m);

        return $m[1] ?? null;
    }

    /**
     * URL video lokal (.mp4, .webm, .ogg). Isi video_url dengan path di folder public
     * (contoh: videos/profil_madrasah.mp4) atau URL lengkap ke file video.
     */
    public function getLocalVideoUrlAttribute(): ?string
    {
        $path = trim((string) $this->video_url);

        if ($path === '' || ! preg_match('~\.(mp4|webm|ogg)(\?.*)?$~i', $path)) {
            return null;
        }

        return str_starts_with($path, 'http') ? $path : asset(ltrim($path, '/'));
    }

    public function getHasVideoAttribute(): bool
    {
        return $this->youtube_id !== null || $this->local_video_url !== null;
    }
}
