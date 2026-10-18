<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PpdbRegistration extends Model
{
    public const STATUSES = ['baru' => 'Baru', 'diverifikasi' => 'Diverifikasi', 'diterima' => 'Diterima', 'ditolak' => 'Tidak Diterima'];

    protected $fillable = [
        'registration_number', 'academic_year', 'full_name', 'nisn', 'gender', 'birth_place', 'birth_date',
        'previous_school', 'address', 'parent_name', 'parent_phone', 'email', 'achievement_note',
        'doc_kk', 'doc_rapor', 'status', 'admin_note',
    ];

    protected $casts = ['birth_date' => 'date'];

    protected static function booted(): void
    {
        static::creating(function (PpdbRegistration $r) {
            $year = substr($r->academic_year, 0, 4);
            $last = static::where('registration_number', 'like', "PPDB-{$year}-%")->max('registration_number');
            $next = $last ? (int) substr($last, -4) + 1 : 1;
            do {
                $r->registration_number = sprintf('PPDB-%s-%04d', $year, $next++);
            } while (static::where('registration_number', $r->registration_number)->exists());
        });
    }

    public function getStatusLabelAttribute(): string
    {
        return self::STATUSES[$this->status] ?? $this->status;
    }

    public function getWhatsappNumberAttribute(): string
    {
        $digits = preg_replace('/\D/', '', $this->parent_phone);

        return str_starts_with($digits, '0') ? '62'.substr($digits, 1) : $digits;
    }
}
