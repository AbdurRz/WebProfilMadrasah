<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;

class Setting extends Model
{
    protected $fillable = ['key', 'value'];

    public static function map(): array
    {
        return Cache::rememberForever('settings', fn () => static::pluck('value', 'key')->all());
    }

    public static function get(string $key, $default = null)
    {
        return static::map()[$key] ?? $default;
    }

    protected static function booted(): void
    {
        static::saved(fn () => Cache::forget('settings'));
    }
}
