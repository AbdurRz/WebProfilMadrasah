<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ActivityLog;
use App\Models\Page;
use App\Support\Media;
use Illuminate\Http\Request;

class PageController extends Controller
{
    public function index()
    {
        return view('admin.pages.index', ['pages' => Page::orderBy('id')->get()]);
    }

    public function edit(Page $page)
    {
        return view('admin.pages.edit', compact('page'));
    }

    public function update(Request $request, Page $page)
    {
        $data = $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'nullable|string',
            'image' => 'nullable|image|max:2048',
        ]);
        $data['content'] = Media::sanitizeHtml($data['content'] ?? '');
        if ($request->hasFile('image')) {
            Media::delete($page->image);
            $data['image'] = $request->file('image')->store('uploads/pages', 'public');
        }
        $page->update($data);
        ActivityLog::record('update', "Memperbarui halaman profil: {$page->title}", $page);

        return redirect()->route('admin.pages.index')->with('success', 'Halaman berhasil diperbarui.');
    }
}
