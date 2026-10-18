<?php

namespace App\Models;

use App\Support\Media;
use Illuminate\Database\Eloquent\Model;

class Page extends Model
{
    protected $fillable = ['key', 'title', 'content', 'image'];

    public static function byKey(string $key): ?self
    {
        return static::where('key', $key)->first();
    }

    public function getImageUrlAttribute(): ?string
    {
        return $this->image ? Media::url($this->image) : null;
    }
}
