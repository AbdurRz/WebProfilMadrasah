<?php

namespace App\Models;

use App\Models\Concerns\HasSlug;
use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    use HasSlug;

    protected $fillable = ['title', 'slug', 'description', 'location', 'category', 'starts_at', 'ends_at'];

    protected $casts = ['starts_at' => 'datetime', 'ends_at' => 'datetime'];

    public function scopeUpcoming($q)
    {
        return $q->where('starts_at', '>=', today())->orderBy('starts_at');
    }
}
