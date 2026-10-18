<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ActivityLog;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class SettingController extends Controller
{
    public const FIELDS = [
        'site_name' => ['Nama Madrasah', 'text'],
        'tagline' => ['Tagline', 'text'],
        'hero_title' => ['Judul Hero Beranda', 'text'],
        'hero_subtitle' => ['Subjudul Hero Beranda', 'textarea'],
        'npsn' => ['NPSN', 'text'],
        'accreditation' => ['Akreditasi', 'text'],
        'address' => ['Alamat', 'textarea'],
        'phone' => ['Telepon', 'text'],
        'email' => ['Email', 'email'],
        'whatsapp' => ['Nomor WhatsApp (format 62…)', 'text'],
        'office_hours' => ['Jam Layanan', 'text'],
        'facebook' => ['Facebook URL', 'url'],
        'instagram' => ['Instagram URL', 'url'],
        'youtube' => ['YouTube URL', 'url'],
        'maps_embed' => ['Google Maps Embed URL', 'url'],
        'ppdb_open' => ['Status Pendaftaran PPDB', 'select', ['1' => 'Dibuka', '0' => 'Ditutup']],
        'ppdb_year' => ['Tahun Ajaran PPDB', 'text'],
        'ppdb_quota' => ['Kuota PPDB (siswa)', 'text'],
    ];

    public function edit()
    {
        return view('admin.settings', ['fields' => self::FIELDS, 'values' => Setting::map()]);
    }

    public function update(Request $request)
    {
        $rules = collect(self::FIELDS)->map(fn ($f) => match ($f[1]) {
            'select' => 'nullable|in:'.implode(',', array_keys($f[2])),
            'email' => 'nullable|email|max:255',
            'url' => 'nullable|url|max:500',
            default => 'nullable|string|max:1000',
        })->all();
        foreach ($request->validate($rules) as $key => $value) {
            Setting::updateOrCreate(['key' => $key], ['value' => $value]);
        }
        Cache::forget('settings');
        ActivityLog::record('update', 'Memperbarui pengaturan situs');

        return back()->with('success', 'Pengaturan disimpan.');
    }
}
