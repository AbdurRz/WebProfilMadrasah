<?php

namespace App\Models;

use App\Support\Media;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Document extends Model
{
    public const CATEGORIES = ['silabus' => 'Silabus & Modul Ajar', 'formulir' => 'Formulir', 'regulasi' => 'Regulasi & Surat Edaran', 'lainnya' => 'Lainnya'];

    protected $fillable = ['title', 'category', 'description', 'file', 'downloads', 'is_published'];

    protected $casts = ['is_published' => 'boolean'];

    public function getExtensionAttribute(): string
    {
        return strtoupper(pathinfo(parse_url($this->file, PHP_URL_PATH), PATHINFO_EXTENSION) ?: 'FILE');
    }

    public function getSizeLabelAttribute(): ?string
    {
        if (str_starts_with($this->file, 'http') || ! Storage::disk('public')->exists($this->file)) {
            return null;
        }
        $kb = Storage::disk('public')->size($this->file) / 1024;

        return $kb > 1024 ? number_format($kb / 1024, 1, ',', '.').' MB' : number_format($kb, 0, ',', '.').' KB';
    }

    public function getFileUrlAttribute(): string
    {
        return Media::url($this->file);
    }
}
