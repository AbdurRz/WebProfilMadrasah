<?php

namespace App\Models;

use App\Support\Media;
use Illuminate\Database\Eloquent\Model;

class Teacher extends Model
{
    protected $fillable = ['name', 'nip', 'position', 'subject', 'photo', 'sort'];

    public function getPhotoUrlAttribute(): ?string
    {
        return $this->photo ? Media::url($this->photo) : null;
    }
}
