<?php

namespace App\Http\Controllers;

use App\Models\Achievement;
use App\Models\Announcement;
use App\Models\Event;
use App\Models\Facility;
use App\Models\Gallery;
use App\Models\Page;
use App\Models\Post;
use App\Models\Statistic;
use App\Models\Teacher;

class HomeController extends Controller
{
    public function __invoke()
    {
        $year = Statistic::max('academic_year');
        $stats = Statistic::where('academic_year', $year)->get()->groupBy('group');

        return view('public.home', [
            'featured' => Post::published()->with('category')->where('is_featured', true)->latest('published_at')->first()
                ?? Post::published()->with('category')->latest('published_at')->first(),
            'posts' => Post::published()->with('category')->latest('published_at')->take(5)->get(),
            'announcements' => Announcement::active()->latest()->take(4)->get(),
            'events' => Event::upcoming()->take(4)->get(),
            'achievements' => Achievement::orderByDesc('year')->latest('id')->take(4)->get(),
            'galleries' => Gallery::latest('event_date')->take(5)->get(),
            'facilities' => Facility::take(4)->get(),
            'welcome' => Page::byKey('sambutan'),
            'headmaster' => Teacher::orderBy('sort')->first(),
            'year' => $year,
            'quick' => [
                'Peserta Didik' => $stats->get('siswa')?->sum('value') ?? 0,
                'Guru & Tendik' => $stats->get('guru')?->sum('value') ?? 0,
                'Rombongan Belajar' => $stats->get('rombel')?->sum('value') ?? 0,
                'Prestasi' => Achievement::count(),
            ],
        ]);
    }
}
