<?php

namespace App\Models;

use App\Models\Concerns\HasSlug;
use App\Support\Media;
use Illuminate\Database\Eloquent\Model;

class Announcement extends Model
{
    use HasSlug;

    protected $fillable = ['title', 'slug', 'content', 'priority', 'attachment', 'starts_at', 'ends_at', 'is_published'];

    protected $casts = ['starts_at' => 'date', 'ends_at' => 'date', 'is_published' => 'boolean'];

    public function scopeActive($q)
    {
        return $q->where('is_published', true)
            ->where(fn ($w) => $w->whereNull('starts_at')->orWhereDate('starts_at', '<=', today()))
            ->where(fn ($w) => $w->whereNull('ends_at')->orWhereDate('ends_at', '>=', today()));
    }

    public function getWhatsappTextAttribute(): string
    {
        $label = ['mendesak' => '🔴 *PENGUMUMAN MENDESAK*', 'penting' => '🟡 *PENGUMUMAN PENTING*'][$this->priority] ?? '*PENGUMUMAN*';
        $body = \Illuminate\Support\Str::limit(trim(preg_replace('/\s+/', ' ', html_entity_decode(strip_tags(str_replace(['</p>', '<br>', '</div>', '</li>'], ' ', $this->content))))), 400);
        $lines = [
            $label,
            Setting::get('site_name', 'MTsN 1 Bukittinggi'),
            '',
            '*'.$this->title.'*',
            '',
            $body,
        ];
        if ($this->ends_at) {
            $lines[] = '';
            $lines[] = '🗓 Berlaku s.d. '.$this->ends_at->translatedFormat('d F Y');
        }
        $lines[] = '';
        $lines[] = 'Selengkapnya: '.route('announcements.show', $this);

        return implode("\n", $lines);
    }

    public function getWhatsappUrlAttribute(): string
    {
        return 'https://wa.me/?text='.rawurlencode($this->whatsapp_text);
    }

    public function getAttachmentUrlAttribute(): ?string
    {
        return $this->attachment ? Media::url($this->attachment) : null;
    }
}
