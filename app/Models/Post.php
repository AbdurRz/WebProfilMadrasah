<?php

namespace App\Models;

use App\Models\Concerns\HasSlug;
use App\Support\Media;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasSlug;

    protected $fillable = ['category_id', 'user_id', 'title', 'slug', 'excerpt', 'content', 'cover_image', 'status', 'is_featured', 'views', 'published_at'];

    protected $casts = ['published_at' => 'datetime', 'is_featured' => 'boolean'];

    protected static function booted(): void
    {
        static::saving(function (Post $post) {
            if ($post->status === 'published' && ! $post->published_at) {
                $post->published_at = now();
            }
        });
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function author()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function scopePublished($q)
    {
        return $q->where('status', 'published')->where('published_at', '<=', now());
    }

    public function getCoverUrlAttribute(): string
    {
        return Media::url($this->cover_image);
    }

    public function getSummaryAttribute(): string
    {
        return $this->excerpt ?: \Illuminate\Support\Str::limit(strip_tags($this->content), 160);
    }
}
