<?php

namespace App\Models;

use App\Support\Media;
use Illuminate\Database\Eloquent\Model;

class OsimMember extends Model
{
    protected $fillable = ['name', 'position', 'class_name', 'period', 'photo', 'sort'];

    public function getPhotoUrlAttribute(): ?string
    {
        return $this->photo ? Media::url($this->photo) : null;
    }
}
