<?php

namespace App\Models;

use App\Support\Media;
use Illuminate\Database\Eloquent\Model;

class Facility extends Model
{
    protected $fillable = ['name', 'description', 'image'];

    public function getImageUrlAttribute(): string
    {
        return Media::url($this->image);
    }
}
