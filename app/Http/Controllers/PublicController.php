<?php

namespace App\Http\Controllers;

use App\Models\Achievement;
use App\Models\Announcement;
use App\Models\Category;
use App\Models\Event;
use App\Models\Facility;
use App\Models\Gallery;
use App\Models\Page;
use App\Models\Post;
use App\Models\Statistic;
use App\Models\Teacher;
use Illuminate\Http\Request;

class PublicController extends Controller
{
    public function profile()
    {
        return view('public.profile', [
            'pages' => Page::whereIn('key', ['sejarah', 'visi', 'misi', 'sambutan', 'struktur'])->get()->keyBy('key'),
            'headmaster' => Teacher::orderBy('sort')->first(),
        ]);
    }

    public function teachers()
    {
        return view('public.teachers', ['teachers' => Teacher::orderBy('sort')->orderBy('name')->get()]);
    }

    public function facilities()
    {
        return view('public.facilities', ['facilities' => Facility::all()]);
    }

    public function news(Request $request)
    {
        $term = is_string($request->query('q')) ? trim($request->query('q')) : '';
        $slug = $request->query('kategori');
        $category = is_string($slug) && $slug !== '' ? Category::where('slug', $slug)->first() : null;
        $posts = Post::published()->with('category')
            ->when($category, fn ($q) => $q->where('category_id', $category->id))
            ->when($term !== '', fn ($q) => $q->where(fn ($w) => $w->where('title', 'like', "%{$term}%")->orWhere('content', 'like', "%{$term}%")))
            ->latest('published_at')->paginate(9)->withQueryString();

        return view('public.news.index', [
            'posts' => $posts,
            'categories' => Category::withCount(['posts' => fn ($q) => $q->published()])->orderBy('name')->get(),
            'activeCategory' => $category,
            'term' => $term,
            'popular' => Post::published()->orderByDesc('views')->take(4)->get(),
        ]);
    }

    public function newsShow(Post $post)
    {
        abort_unless($post->status === 'published' && $post->published_at <= now(), 404);
        $post->increment('views');

        return view('public.news.show', [
            'post' => $post->load('category', 'author'),
            'related' => Post::published()->where('id', '!=', $post->id)->where('category_id', $post->category_id)->latest('published_at')->take(3)->get(),
        ]);
    }

    public function announcements()
    {
        return view('public.announcements.index', [
            'announcements' => Announcement::where('is_published', true)->latest()->paginate(10),
        ]);
    }

    public function announcementShow(Announcement $announcement)
    {
        abort_unless($announcement->is_published, 404);

        return view('public.announcements.show', compact('announcement'));
    }

    public function agenda(Request $request)
    {
        $bulan = $request->query('bulan');
        $month = is_string($bulan) && preg_match('/^\d{4}-(0[1-9]|1[0-2])$/', $bulan)
            ? now()->createFromFormat('!Y-m', $bulan)->startOfMonth()
            : now()->startOfMonth();

        return view('public.agenda', [
            'month' => $month,
            'events' => Event::whereBetween('starts_at', [$month, $month->copy()->endOfMonth()])->orderBy('starts_at')->get(),
            'upcoming' => Event::upcoming()->take(6)->get(),
        ]);
    }

    public function statistics(Request $request)
    {
        $years = Statistic::distinct()->orderByDesc('academic_year')->pluck('academic_year');
        $year = is_string($request->query('tahun')) && $years->contains($request->query('tahun')) ? $request->query('tahun') : $years->first();
        $data = Statistic::where('academic_year', $year)->orderBy('sort')->get()->groupBy('group');
        $trend = Statistic::where('group', 'siswa')->get()->groupBy('academic_year')->map->sum('value')->sortKeys();

        return view('public.statistics', compact('years', 'year', 'data', 'trend') + [
            'achievementLevels' => Achievement::selectRaw('level, count(*) as total')->groupBy('level')->pluck('total', 'level'),
        ]);
    }

    public function achievements(Request $request)
    {
        return view('public.achievements', [
            'achievements' => Achievement::when(is_string($request->query('tingkat')) && $request->query('tingkat') !== '', fn ($q) => $q->where('level', $request->query('tingkat')))
                ->orderByDesc('year')->latest('id')->paginate(12)->withQueryString(),
        ]);
    }

    public function galleries()
    {
        return view('public.galleries.index', ['galleries' => Gallery::withCount('items')->latest('event_date')->paginate(12)]);
    }

    public function galleryShow(Gallery $gallery)
    {
        return view('public.galleries.show', ['gallery' => $gallery->load('items')]);
    }

    public function contact()
    {
        return view('public.contact');
    }
}
