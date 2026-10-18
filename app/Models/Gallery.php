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
}
