<?php

namespace App\Models;

use App\Support\Media;
use Illuminate\Database\Eloquent\Model;

class GalleryItem extends Model
{
    protected $fillable = ['gallery_id', 'image_path', 'caption'];

    public function gallery()
    {
        return $this->belongsTo(Gallery::class);
    }

    public function getUrlAttribute(): string
    {
        return Media::url($this->image_path);
    }
}
