<?php

namespace App\Models\Concerns;

use Illuminate\Support\Str;

trait HasSlug
{
    protected static function bootHasSlug(): void
    {
        static::saving(function ($model) {
            $source = method_exists($model, 'slugSource') ? $model->slugSource() : 'title';
            if (empty($model->slug) || $model->isDirty($source)) {
                $base = Str::slug($model->{$source}) ?: Str::random(8);
                $slug = $base;
                $i = 2;
                while (static::where('slug', $slug)->where('id', '!=', $model->id ?? 0)->exists()) {
                    $slug = $base.'-'.$i++;
                }
                $model->slug = $slug;
            }
        });
    }

    public function getRouteKeyName(): string
    {
        return 'slug';
    }
}
