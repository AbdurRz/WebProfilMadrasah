<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ActivityLog;
use App\Models\PpdbRegistration;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class PpdbController extends Controller
{
    public function index(Request $request)
    {
        $status = is_string($request->query('status')) && array_key_exists($request->query('status'), PpdbRegistration::STATUSES) ? $request->query('status') : null;
        $term = is_string($request->query('q')) ? trim($request->query('q')) : '';

        $items = PpdbRegistration::query()
            ->when($status, fn ($q) => $q->where('status', $status))
            ->when($term !== '', fn ($q) => $q->where(fn ($w) => $w->where('full_name', 'like', "%{$term}%")->orWhere('registration_number', 'like', "%{$term}%")->orWhere('nisn', 'like', "%{$term}%")))
            ->latest('id')->paginate(20)->withQueryString();

        return view('admin.ppdb.index', [
            'items' => $items,
            'status' => $status,
            'term' => $term,
            'counts' => PpdbRegistration::selectRaw('status, count(*) as total')->groupBy('status')->pluck('total', 'status'),
        ]);
    }

    public function show(PpdbRegistration $registration)
    {
        return view('admin.ppdb.show', ['r' => $registration]);
    }

    public function update(Request $request, PpdbRegistration $registration)
    {
        $data = $request->validate([
            'status' => 'required|in:'.implode(',', array_keys(PpdbRegistration::STATUSES)),
            'admin_note' => 'nullable|string|max:1000',
        ]);
        $registration->update($data);
        ActivityLog::record('update', "Mengubah status PPDB {$registration->registration_number} menjadi {$registration->status_label}", $registration);

        return back()->with('success', 'Status pendaftar diperbarui.');
    }

    public function destroy(PpdbRegistration $registration)
    {
        Storage::disk('local')->delete(array_filter([$registration->doc_kk, $registration->doc_rapor]));
        ActivityLog::record('delete', "Menghapus pendaftar PPDB {$registration->registration_number}", $registration);
        $registration->delete();

        return redirect()->route('admin.ppdb.index')->with('success', 'Data pendaftar dihapus.');
    }

    public function document(PpdbRegistration $registration, string $type)
    {
        $path = match ($type) {
            'kk' => $registration->doc_kk,
            'rapor' => $registration->doc_rapor,
            default => null,
        };
        abort_unless($path && Storage::disk('local')->exists($path), 404);

        return Storage::disk('local')->response($path);
    }

    public function export(Request $request)
    {
        $filename = 'ppdb-'.now()->format('Ymd-His').'.csv';

        return response()->streamDownload(function () {
            $out = fopen('php://output', 'w');
            fwrite($out, "\xEF\xBB\xBF");
            fputcsv($out, ['No. Pendaftaran', 'Tahun', 'Nama', 'NISN', 'L/P', 'Tempat Lahir', 'Tanggal Lahir', 'Asal Sekolah', 'Alamat', 'Orang Tua', 'No. HP', 'Email', 'Prestasi', 'Status', 'Catatan', 'Tanggal Daftar']);
            PpdbRegistration::orderBy('id')->chunk(200, function ($rows) use ($out) {
                foreach ($rows as $r) {
                    fputcsv($out, [$r->registration_number, $r->academic_year, $r->full_name, "'".$r->nisn, $r->gender, $r->birth_place, $r->birth_date->format('Y-m-d'), $r->previous_school, $r->address, $r->parent_name, "'".$r->parent_phone, $r->email, $r->achievement_note, $r->status_label, $r->admin_note, $r->created_at->format('Y-m-d H:i')]);
                }
            });
            fclose($out);
        }, $filename, ['Content-Type' => 'text/csv; charset=UTF-8']);
    }
}
