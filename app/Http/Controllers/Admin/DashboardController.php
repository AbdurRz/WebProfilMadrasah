<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Achievement;
use App\Models\ActivityLog;
use App\Models\Announcement;
use App\Models\Document;
use App\Models\Event;
use App\Models\Gallery;
use App\Models\Post;
use App\Models\PpdbRegistration;

class DashboardController extends Controller
{
    public function __invoke()
    {
        $months = collect(range(5, 0))->map(fn ($i) => now()->startOfMonth()->subMonths($i));
        $postsPerMonth = $months->map(fn ($m) => [
            'label' => $m->translatedFormat('M Y'),
            'value' => Post::published()->whereBetween('published_at', [$m, $m->copy()->endOfMonth()])->count(),
        ]);

        return view('admin.dashboard', [
            'counts' => [
                'Berita terbit' => Post::published()->count(),
                'Draf berita' => Post::where('status', 'draft')->count(),
                'Pengumuman aktif' => Announcement::active()->count(),
                'Agenda mendatang' => Event::upcoming()->count(),
                'Album galeri' => Gallery::count(),
                'Prestasi' => Achievement::count(),
                'Pendaftar PPDB baru' => PpdbRegistration::where('status', 'baru')->count(),
                'Dokumen diunduh' => Document::sum('downloads'),
            ],
            'latestPosts' => Post::with('category')->latest('id')->take(5)->get(),
            'upcoming' => Event::upcoming()->take(5)->get(),
            'logs' => ActivityLog::with('user')->latest('created_at')->take(8)->get(),
            'postsPerMonth' => $postsPerMonth,
            'totalViews' => Post::sum('views'),
        ]);
    }
}
