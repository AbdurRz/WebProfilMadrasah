<?php

namespace App\Support;

use Illuminate\Support\Facades\Storage;

class Media
{
    public const PLACEHOLDER = 'https://images.unsplash.com/photo-1638199406429-f0c6cf5de006?w=1200&q=70';

    public static function url(?string $path): string
    {
        if (! $path) {
            return self::PLACEHOLDER;
        }

        return str_starts_with($path, 'http') ? $path : Storage::disk('public')->url($path);
    }

    public static function delete(?string $path): void
    {
        if ($path && ! str_starts_with($path, 'http')) {
            Storage::disk('public')->delete($path);
        }
    }

    public static function sanitizeHtml(?string $html): string
    {
        $clean = strip_tags((string) $html, '<p><br><strong><b><em><i><u><ul><ol><li><a><h1><h2><h3><h4><blockquote><div><span><pre>');
        $clean = preg_replace('/\s+on\w+\s*=\s*("[^"]*"|\'[^\']*\'|[^\s>]+)/i', '', $clean);
        $clean = preg_replace('/\s+style\s*=\s*("[^"]*"|\'[^\']*\')/i', '', $clean);

        return preg_replace('/href\s*=\s*(["\']?)\s*javascript:[^"\'>\s]*/i', 'href=$1#', $clean);
    }
}
