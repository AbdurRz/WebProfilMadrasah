<?php

namespace Database\Seeders;

use App\Models\Document;
use App\Models\Extracurricular;
use App\Models\Gallery;
use App\Models\OsimMember;
use App\Models\Page;
use App\Models\PpdbRegistration;
use App\Models\Setting;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ModuleSeeder extends Seeder
{
    public function run(): void
    {
        if (Extracurricular::exists()) {
            return;
        }
        $img = DatabaseSeeder::IMG;

        foreach (['ppdb_open' => '1', 'ppdb_year' => '2026/2027', 'ppdb_quota' => '320', 'whatsapp' => Setting::get('whatsapp', '6281234567890')] as $key => $value) {
            Setting::updateOrCreate(['key' => $key], ['value' => $value]);
        }
        Cache::forget('settings');

        $pages = [
            ['ppdb_alur', 'Alur Pendaftaran', '<ol><li>Isi formulir pendaftaran online dan unggah berkas.</li><li>Simpan nomor pendaftaran yang muncul setelah formulir terkirim.</li><li>Panitia memverifikasi berkas (1–3 hari kerja).</li><li>Ikuti tes seleksi: baca tulis Al-Qur\'an, akademik dasar, dan wawancara.</li><li>Cek pengumuman hasil seleksi melalui menu Cek Status.</li><li>Lakukan daftar ulang bagi calon peserta didik yang diterima.</li></ol>'],
            ['ppdb_persyaratan', 'Persyaratan Pendaftaran', '<ul><li>Lulusan SD/MI atau sederajat tahun 2026 / kelas 6 yang akan lulus.</li><li>Usia maksimal 15 tahun pada 1 Juli 2026.</li><li>Fotokopi Kartu Keluarga dan akta kelahiran.</li><li>Fotokopi rapor kelas 4 dan 5 yang dilegalisir.</li><li>Pas foto berwarna 3×4 sebanyak 2 lembar.</li><li>Sertifikat prestasi (jika ada) untuk jalur prestasi.</li></ul>'],
            ['ppdb_jadwal', 'Jadwal PPDB 2026/2027', '<ul><li><strong>2 Feb – 28 Mar 2026</strong> · Pendaftaran online</li><li><strong>30 Mar – 3 Apr 2026</strong> · Verifikasi berkas</li><li><strong>11 Apr 2026</strong> · Tes seleksi &amp; wawancara</li><li><strong>20 Apr 2026</strong> · Pengumuman hasil</li><li><strong>27 – 30 Apr 2026</strong> · Daftar ulang</li><li><strong>13 Jul 2026</strong> · MATSAMA (Masa Ta\'aruf Siswa Madrasah)</li></ul>'],
            ['osim', 'Wadah kepemimpinan siswa', '<p>OSIM MTsN 1 Bukittinggi merupakan satu-satunya organisasi resmi peserta didik di lingkungan madrasah. Pengurus dipilih secara demokratis melalui pemilihan ketua OSIM setiap tahun ajaran.</p><h3>Program kerja unggulan</h3><ul><li>Gerakan Salat Duha dan Tadarus Pagi berjamaah.</li><li>Pekan Seni dan Olahraga (PORSENI) antarkelas.</li><li>Bakti sosial dan santunan anak yatim setiap Ramadan.</li><li>Madrasah Bersih dan Hijau (Adiwiyata).</li><li>Peringatan Hari Besar Islam dan Hari Besar Nasional.</li></ul>'],
        ];
        foreach ($pages as [$key, $title, $content]) {
            Page::firstOrCreate(['key' => $key], compact('title', 'content'));
        }

        $galleries = Gallery::pluck('id', 'title');
        $ekskul = [
            ['Tahfiz Al-Qur\'an', 'keagamaan', 'Ust. Hafizul Ikhwan, Lc', 'Senin & Kamis, 14.00–15.30 WIB', 'Musala Al-Ikhlas', 'quran2', 'Wisuda Tahfiz Angkatan VII', 'Program pembinaan hafalan Al-Qur\'an dengan target minimal 3 juz selama tiga tahun. Peserta dibimbing dengan metode talaqqi dan murajaah berkala.'],
            ['Pramuka', 'kepanduan', 'Rahmat Hidayat, S.Pd', 'Jumat, 14.00–16.00 WIB', 'Lapangan madrasah', 'scout', 'Kemah Bakti Pramuka', 'Ekstrakurikuler wajib bagi kelas VII yang menanamkan kedisiplinan, kemandirian, dan cinta tanah air melalui kegiatan kepanduan.'],
            ['Kelompok Ilmiah Remaja (KIR)', 'akademik', 'Yusnimar, S.Pd', 'Rabu, 14.00–15.30 WIB', 'Laboratorium IPA', 'lab', 'Projek P5 Kearifan Lokal', 'Wadah bagi siswa yang gemar meneliti. Anggota KIR rutin mengikuti lomba karya tulis ilmiah dan KSM.'],
            ['Silek Tradisi Minangkabau', 'seni', 'Zulkifli, S.Sn', 'Sabtu, 08.00–10.00 WIB', 'Aula madrasah', 'kids', null, 'Pelestarian seni bela diri tradisional Minangkabau yang memadukan keterampilan fisik dan nilai-nilai adat.'],
            ['Drumband', 'seni', 'Tim Pelatih Drumband', 'Selasa & Sabtu, 15.00–17.00 WIB', 'Lapangan madrasah', 'parade', null, 'Tim drumband madrasah tampil dalam upacara, pawai budaya, dan berbagai perlombaan tingkat kota.'],
            ['Futsal', 'olahraga', 'Dedi Kurniawan, S.Pd', 'Kamis, 15.30–17.00 WIB', 'Lapangan serbaguna', 'futsal', null, 'Pembinaan olahraga futsal putra dan putri untuk kompetisi antarsekolah.'],
            ['Muhadharah & Pidato 3 Bahasa', 'keagamaan', 'Fitri Handayani, S.Pd.I', 'Sabtu, 10.00–11.30 WIB', 'Ruang kelas IX-A', 'girls', null, 'Latihan berpidato dalam Bahasa Indonesia, Arab, dan Inggris untuk membangun kepercayaan diri dan kemampuan dakwah.'],
            ['Literasi & Jurnalistik', 'akademik', 'Silvia Marni, S.Pd', 'Rabu, 14.00–15.00 WIB', 'Perpustakaan', 'library', 'Kunjungan Perpustakaan Daerah', 'Mengelola majalah dinding dan berita sekolah, serta melatih kemampuan menulis kreatif.'],
        ];
        foreach ($ekskul as [$name, $cat, $coach, $schedule, $loc, $cover, $album, $desc]) {
            Extracurricular::create(['name' => $name, 'category' => $cat, 'coach_name' => $coach, 'schedule' => $schedule, 'location' => $loc, 'cover_image' => $img[$cover], 'gallery_id' => $album ? $galleries[$album] ?? null : null, 'description' => $desc]);
        }

        $osim = [
            ['Muhammad Fadhil Ramadhan', 'Ketua OSIM', 'IX-B'], ['Aisyah Rahmadani', 'Wakil Ketua OSIM', 'VIII-A'],
            ['Nabila Putri Azzahra', 'Sekretaris', 'VIII-C'], ['Rafi Alhaq', 'Bendahara', 'VIII-B'],
            ['Zahra Khairunnisa', 'Sekbid Keimanan & Ketakwaan', 'VIII-D'], ['Fikri Maulana', 'Sekbid Kepemimpinan', 'VIII-E'],
            ['Salsabila Putri', 'Sekbid Seni & Budaya', 'VIII-F'], ['Arkan Hafiz', 'Sekbid Olahraga', 'VIII-A'],
            ['Keisya Amanda', 'Sekbid Lingkungan Hidup', 'VII-C'], ['Dzaky Al-Fatih', 'Sekbid Teknologi Informasi', 'VII-B'],
        ];
        foreach ($osim as $i => [$name, $position, $class]) {
            OsimMember::create(['name' => $name, 'position' => $position, 'class_name' => $class, 'period' => '2025/2026', 'sort' => $i]);
        }

        $docs = [
            ['Kalender Pendidikan 2025/2026', 'regulasi', 'Kalender akademik resmi madrasah tahun pelajaran 2025/2026.'],
            ['Tata Tertib Peserta Didik', 'regulasi', 'Ketentuan disiplin, seragam, dan sanksi bagi peserta didik.'],
            ['Surat Edaran Libur Iduladha 1447 H', 'regulasi', null],
            ['Formulir Izin Tidak Masuk Sekolah', 'formulir', 'Diisi orang tua/wali dan diserahkan ke wali kelas.'],
            ['Formulir Permohonan Mutasi Siswa', 'formulir', null],
            ['Formulir Pendaftaran Ekstrakurikuler', 'formulir', null],
            ['Silabus Fikih Kelas VII', 'silabus', 'Kurikulum Merdeka — Fase D.'],
            ['Modul Ajar Matematika Kelas VIII', 'silabus', 'Kurikulum Merdeka — Fase D.'],
            ['Silabus Bahasa Arab Kelas IX', 'silabus', null],
        ];
        foreach ($docs as [$title, $cat, $desc]) {
            $path = 'uploads/documents/'.Str::slug($title).'.pdf';
            Storage::disk('public')->put($path, $this->pdf($title));
            Document::create(['title' => $title, 'category' => $cat, 'description' => $desc, 'file' => $path, 'downloads' => random_int(5, 240)]);
        }

        $applicants = [
            ['Ahmad Zaki Mubarak', 'L', 'Bukittinggi', '2014-03-12', 'SDN 01 Kubu Gulai Bancah', 'baru'],
            ['Siti Aulia Rahma', 'P', 'Agam', '2014-07-25', 'MIN 1 Bukittinggi', 'diverifikasi'],
            ['Rizky Pratama', 'L', 'Padang Panjang', '2013-11-02', 'SDIT Al-Hikmah', 'diterima'],
            ['Nadia Syafitri', 'P', 'Bukittinggi', '2014-01-18', 'SDN 05 Aur Kuning', 'baru'],
            ['Habib Alfarizi', 'L', 'Payakumbuh', '2014-05-30', 'MIS Tarbiyah', 'ditolak'],
        ];
        foreach ($applicants as $i => [$name, $g, $place, $dob, $school, $status]) {
            PpdbRegistration::create([
                'academic_year' => '2026/2027', 'full_name' => $name, 'nisn' => '01'.str_pad((string) (41230000 + $i * 1371), 8, '0', STR_PAD_LEFT),
                'gender' => $g, 'birth_place' => $place, 'birth_date' => $dob, 'previous_school' => $school,
                'address' => 'Jl. Contoh No. '.($i + 3).', Kota Bukittinggi', 'parent_name' => 'Orang Tua '.Str::before($name, ' '),
                'parent_phone' => '08126'.str_pad((string) (100000 + $i * 777), 6, '0'), 'status' => $status,
                'admin_note' => $status === 'ditolak' ? 'Kuota jalur reguler sudah terpenuhi.' : null,
            ]);
        }
    }

    private function pdf(string $title): string
    {
        $text = str_replace(['\\', '(', ')'], ['\\\\', '\\(', '\\)'], $title);
        $stream = "BT /F1 18 Tf 72 760 Td (MTsN 1 Bukittinggi) Tj 0 -32 Td /F1 14 Tf ({$text}) Tj 0 -24 Td /F1 10 Tf (Dokumen contoh - ganti melalui dashboard admin.) Tj ET";
        $objs = [
            '<< /Type /Catalog /Pages 2 0 R >>',
            '<< /Type /Pages /Kids [3 0 R] /Count 1 >>',
            '<< /Type /Page /Parent 2 0 R /MediaBox [0 0 595 842] /Contents 4 0 R /Resources << /Font << /F1 5 0 R >> >> >>',
            '<< /Length '.strlen($stream)." >>\nstream\n{$stream}\nendstream",
            '<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>',
        ];
        $out = "%PDF-1.4\n";
        $offsets = [];
        foreach ($objs as $i => $o) {
            $offsets[] = strlen($out);
            $out .= ($i + 1)." 0 obj\n{$o}\nendobj\n";
        }
        $xref = strlen($out);
        $out .= 'xref'."\n0 ".(count($objs) + 1)."\n0000000000 65535 f \n";
        foreach ($offsets as $off) {
            $out .= sprintf("%010d 00000 n \n", $off);
        }

        return $out.'trailer << /Size '.(count($objs) + 1)." /Root 1 0 R >>\nstartxref\n{$xref}\n%%EOF";
    }
}
