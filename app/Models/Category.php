<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Category extends Model
{
    protected $fillable = ['name', 'slug', 'description'];

    protected static function booted(): void
    {
        static::saving(fn ($c) => $c->slug = Str::slug($c->name));
    }

    public function posts()
    {
        return $this->hasMany(Post::class);
    }
}
