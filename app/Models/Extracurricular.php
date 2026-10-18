<?php

namespace App\Models;

use App\Models\Concerns\HasSlug;
use App\Support\Media;
use Illuminate\Database\Eloquent\Model;

class Extracurricular extends Model
{
    use HasSlug;

    public const CATEGORIES = ['keagamaan' => 'Keagamaan', 'olahraga' => 'Olahraga', 'seni' => 'Seni & Budaya', 'akademik' => 'Akademik', 'kepanduan' => 'Kepanduan'];

    protected $fillable = ['name', 'slug', 'category', 'coach_name', 'schedule', 'location', 'description', 'cover_image', 'gallery_id'];

    public function slugSource(): string
    {
        return 'name';
    }

    public function gallery()
    {
        return $this->belongsTo(Gallery::class);
    }

    public function getCoverUrlAttribute(): string
    {
        return Media::url($this->cover_image);
    }
}
