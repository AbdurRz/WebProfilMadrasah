<?php

namespace App\Http\Controllers;

use App\Models\Page;
use App\Models\PpdbRegistration;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class PpdbController extends Controller
{
    private function year(): string
    {
        return Setting::get('ppdb_year', now()->year.'/'.(now()->year + 1));
    }

    private function isOpen(): bool
    {
        return Setting::get('ppdb_open') === '1';
    }

    public function index()
    {
        return view('public.ppdb.index', [
            'pages' => Page::whereIn('key', ['ppdb_persyaratan', 'ppdb_jadwal', 'ppdb_alur'])->get()->keyBy('key'),
            'open' => $this->isOpen(),
            'year' => $this->year(),
            'quota' => Setting::get('ppdb_quota'),
            'registered' => PpdbRegistration::where('academic_year', $this->year())->count(),
        ]);
    }

    public function store(Request $request)
    {
        abort_unless($this->isOpen(), 403, 'Pendaftaran PPDB sedang ditutup.');
        if ($request->filled('website')) {
            return redirect()->route('ppdb.index');
        }

        $year = $this->year();
        $data = $request->validate([
            'full_name' => 'required|string|max:255',
            'nisn' => ['required', 'digits:10', Rule::unique('ppdb_registrations')->where('academic_year', $year)],
            'gender' => 'required|in:L,P',
            'birth_place' => 'required|string|max:100',
            'birth_date' => 'required|date|before:-10 years|after:-18 years',
            'previous_school' => 'required|string|max:255',
            'address' => 'required|string|max:1000',
            'parent_name' => 'required|string|max:255',
            'parent_phone' => ['required', 'regex:/^(\+62|62|0)8[0-9]{7,12}$/'],
            'email' => 'nullable|email|max:255',
            'achievement_note' => 'nullable|string|max:1000',
            'doc_kk' => 'required|file|mimes:pdf,jpg,jpeg,png|max:2048',
            'doc_rapor' => 'required|file|mimes:pdf,jpg,jpeg,png|max:2048',
            'agree' => 'accepted',
        ], [
            'nisn.unique' => 'NISN ini sudah terdaftar pada PPDB tahun ini. Gunakan menu Cek Status.',
            'birth_date.before' => 'Usia calon peserta didik minimal 10 tahun.',
            'birth_date.after' => 'Usia calon peserta didik maksimal 18 tahun.',
            'parent_phone.regex' => 'Nomor HP tidak valid. Contoh: 081234567890.',
            'agree.accepted' => 'Anda harus menyetujui pernyataan kebenaran data.',
        ]);

        $data['doc_kk'] = $request->file('doc_kk')->store('ppdb', 'local');
        $data['doc_rapor'] = $request->file('doc_rapor')->store('ppdb', 'local');
        unset($data['agree']);

        $registration = PpdbRegistration::create($data + ['academic_year' => $year]);

        session(['ppdb_last' => $registration->registration_number]);

        return redirect()->route('ppdb.success');
    }

    public function success()
    {
        $number = session('ppdb_last');
        abort_unless($number, 404);

        return view('public.ppdb.success', ['r' => PpdbRegistration::where('registration_number', $number)->firstOrFail()]);
    }

    public function check(Request $request)
    {
        $result = null;
        if ($request->filled('nomor')) {
            $request->validate(['nomor' => 'required|string|max:20', 'tanggal_lahir' => 'required|date']);
            $result = PpdbRegistration::where('registration_number', strtoupper(trim($request->nomor)))
                ->whereDate('birth_date', $request->tanggal_lahir)->first() ?? false;
        }

        return view('public.ppdb.check', compact('result'));
    }
}
