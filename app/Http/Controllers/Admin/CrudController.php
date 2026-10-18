<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ActivityLog;
use App\Support\Media;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

/**
 * Generic CRUD: subclasses declare model, fields and table columns.
 */
abstract class CrudController extends Controller
{
    protected string $model;
    protected string $route;
    protected string $title;
    protected string $singular;
    protected array $searchable = ['title'];
    protected string $labelField = 'title';

    abstract protected function fields(?Model $item = null): array;

    abstract protected function columns(): array;

    protected function query()
    {
        return $this->model::query()->latest('id');
    }

    protected function afterSave(Model $item, Request $request): void {}

    public function index(Request $request)
    {
        $q = $this->query();
        if ($term = $request->string('q')->trim()->value()) {
            $q->where(function ($w) use ($term) {
                foreach ($this->searchable as $col) {
                    $w->orWhere($col, 'like', "%{$term}%");
                }
            });
        }

        return view('admin.crud.index', $this->viewData() + [
            'items' => $q->paginate(15)->withQueryString(),
            'columns' => $this->columns(),
        ]);
    }

    public function create()
    {
        return view('admin.crud.form', $this->viewData() + ['item' => new $this->model, 'fields' => $this->fields()]);
    }

    public function store(Request $request)
    {
        $item = $this->model::create($this->validated($request));
        $this->afterSave($item, $request);
        ActivityLog::record('create', "Menambah {$this->singular}: {$item->{$this->labelField}}", $item);

        return redirect()->route("admin.{$this->route}.index")->with('success', "{$this->singular} berhasil ditambahkan.");
    }

    public function edit(string $id)
    {
        $item = $this->model::findOrFail($id);

        return view('admin.crud.form', $this->viewData() + ['item' => $item, 'fields' => $this->fields($item)]);
    }

    public function update(Request $request, string $id)
    {
        $item = $this->model::findOrFail($id);
        $item->update($this->validated($request, $item));
        $this->afterSave($item, $request);
        ActivityLog::record('update', "Memperbarui {$this->singular}: {$item->{$this->labelField}}", $item);

        return redirect()->route("admin.{$this->route}.index")->with('success', "{$this->singular} berhasil diperbarui.");
    }

    public function destroy(string $id)
    {
        $item = $this->model::findOrFail($id);
        foreach ($this->fields($item) as $name => $f) {
            if (in_array($f['type'], ['image', 'file'])) {
                Media::delete($item->{$name});
            }
        }
        ActivityLog::record('delete', "Menghapus {$this->singular}: {$item->{$this->labelField}}", $item);
        $item->delete();

        return back()->with('success', "{$this->singular} berhasil dihapus.");
    }

    protected function validated(Request $request, ?Model $item = null): array
    {
        $fields = $this->fields($item);
        $rules = [];
        foreach ($fields as $name => $f) {
            $rules[$name] = $f['rules'] ?? 'nullable';
        }
        $data = $request->validate($rules);

        foreach ($fields as $name => $f) {
            $type = $f['type'];
            if ($type === 'checkbox') {
                $data[$name] = $request->boolean($name);
            } elseif ($type === 'richtext' && isset($data[$name])) {
                $data[$name] = Media::sanitizeHtml($data[$name]);
            } elseif (in_array($type, ['image', 'file'])) {
                if ($request->hasFile($name)) {
                    Media::delete($item?->{$name});
                    $data[$name] = $request->file($name)->store("uploads/{$this->route}", 'public');
                } else {
                    unset($data[$name]);
                }
            } elseif (($f['virtual'] ?? false)) {
                unset($data[$name]);
            }
        }

        return $data;
    }

    protected function viewData(): array
    {
        return ['route' => $this->route, 'title' => $this->title, 'singular' => $this->singular];
    }
}
