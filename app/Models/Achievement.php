<?php

namespace App\Models;

use App\Support\Media;
use Illuminate\Database\Eloquent\Model;

class Achievement extends Model
{
    protected $fillable = ['title', 'student_name', 'level', 'category', 'rank', 'year', 'description', 'image'];

    public function getImageUrlAttribute(): string
    {
        return Media::url($this->image);
    }
}
