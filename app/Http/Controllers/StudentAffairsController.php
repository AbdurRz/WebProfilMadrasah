<?php

namespace App\Http\Controllers;

use App\Models\Document;
use App\Models\Extracurricular;
use App\Models\OsimMember;
use App\Models\Page;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class StudentAffairsController extends Controller
{
    public function extracurriculars()
    {
        return view('public.extracurriculars.index', ['items' => Extracurricular::orderBy('name')->get()]);
    }

    public function extracurricularShow(Extracurricular $extracurricular)
    {
        return view('public.extracurriculars.show', [
            'item' => $extracurricular->load('gallery.items'),
            'others' => Extracurricular::where('id', '!=', $extracurricular->id)->inRandomOrder()->take(3)->get(),
        ]);
    }

    public function osim(Request $request)
    {
        $periods = OsimMember::distinct()->orderByDesc('period')->pluck('period');
        $period = is_string($request->query('periode')) && $periods->contains($request->query('periode')) ? $request->query('periode') : $periods->first();
        $members = OsimMember::where('period', $period)->orderBy('sort')->get();

        return view('public.osim', [
            'page' => Page::byKey('osim'),
            'periods' => $periods,
            'period' => $period,
            'leaders' => $members->where('sort', '<', 2),
            'members' => $members->where('sort', '>=', 2),
        ]);
    }

    public function downloads(Request $request)
    {
        $category = is_string($request->query('kategori')) && array_key_exists($request->query('kategori'), Document::CATEGORIES) ? $request->query('kategori') : null;
        $term = is_string($request->query('q')) ? trim($request->query('q')) : '';

        return view('public.downloads', [
            'documents' => Document::where('is_published', true)
                ->when($category, fn ($q) => $q->where('category', $category))
                ->when($term !== '', fn ($q) => $q->where('title', 'like', "%{$term}%"))
                ->latest()->paginate(15)->withQueryString(),
            'category' => $category,
            'term' => $term,
            'counts' => Document::where('is_published', true)->selectRaw('category, count(*) as total')->groupBy('category')->pluck('total', 'category'),
        ]);
    }

    public function download(Document $document)
    {
        abort_unless($document->is_published, 404);
        $document->increment('downloads');

        if (str_starts_with($document->file, 'http')) {
            return redirect()->away($document->file);
        }
        abort_unless(Storage::disk('public')->exists($document->file), 404);

        return Storage::disk('public')->download($document->file, \Illuminate\Support\Str::slug($document->title).'.'.strtolower($document->extension));
    }
}
