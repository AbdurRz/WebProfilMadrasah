<?php

namespace Database\Seeders;

use App\Models\Achievement;
use App\Models\Announcement;
use App\Models\Category;
use App\Models\Event;
use App\Models\Facility;
use App\Models\Gallery;
use App\Models\Page;
use App\Models\Post;
use App\Models\Setting;
use App\Models\Statistic;
use App\Models\Teacher;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public const IMG = [
        'jamgadang' => 'https://images.unsplash.com/photo-1689669060288-400996a38dcd?w=1600&q=75',
        'jamgadang2' => 'https://images.pexels.com/photos/16584280/pexels-photo-16584280.jpeg?auto=compress&cs=tinysrgb&w=1400',
        'students' => 'https://images.unsplash.com/photo-1625111380820-9a371d413cc4?w=1400&q=75',
        'teacher' => 'https://images.unsplash.com/photo-1625111381887-458fce74a923?w=1400&q=75',
        'kids' => 'https://images.unsplash.com/photo-1599717460927-8101594d1418?w=1400&q=75',
        'classroom' => 'https://images.pexels.com/photos/35548842/pexels-photo-35548842.jpeg?auto=compress&cs=tinysrgb&w=1400',
        'classroom2' => 'https://images.pexels.com/photos/35548841/pexels-photo-35548841.jpeg?auto=compress&cs=tinysrgb&w=1400',
        'girls' => 'https://images.pexels.com/photos/29599422/pexels-photo-29599422.jpeg?auto=compress&cs=tinysrgb&w=1400',
        'quran' => 'https://images.unsplash.com/photo-1629273229664-11fabc0becc0?w=1400&q=75',
        'quran2' => 'https://images.pexels.com/photos/33451744/pexels-photo-33451744.jpeg?auto=compress&cs=tinysrgb&w=1400',
        'quran3' => 'https://images.unsplash.com/photo-1629273229214-d96be4552b9a?w=1400&q=75',
        'library' => 'https://images.pexels.com/photos/10638225/pexels-photo-10638225.jpeg?auto=compress&cs=tinysrgb&w=1400',
        'library2' => 'https://images.unsplash.com/photo-1595315342809-fa10945ed07c?w=1400&q=75',
        'lab' => 'https://images.pexels.com/photos/40117754/pexels-photo-40117754.jpeg?auto=compress&cs=tinysrgb&w=1400',
        'lab2' => 'https://images.unsplash.com/photo-1518152006812-edab29b069ac?w=1400&q=75',
        'ceremony' => 'https://images.pexels.com/photos/6638645/pexels-photo-6638645.jpeg?auto=compress&cs=tinysrgb&w=1400',
        'scout' => 'https://images.pexels.com/photos/16842098/pexels-photo-16842098.jpeg?auto=compress&cs=tinysrgb&w=1400',
        'futsal' => 'https://images.pexels.com/photos/37097046/pexels-photo-37097046.jpeg?auto=compress&cs=tinysrgb&w=1400',
        'parade' => 'https://images.unsplash.com/photo-1665664660924-255a6167f498?w=1400&q=75',
    ];

    public function run(): void
    {
        $admin = User::updateOrCreate(['email' => env('ADMIN_EMAIL')], [
            'name' => 'Administrator Madrasah',
            'password' => env('ADMIN_PASSWORD'),
            'role' => 'admin',
            'is_active' => true,
        ]);
        User::updateOrCreate(['email' => env('EDITOR_EMAIL')], [
            'name' => 'Tim Humas MTsN 1',
            'password' => env('EDITOR_PASSWORD'),
            'role' => 'editor',
            'is_active' => true,
        ]);

        if (Post::exists()) {
            $this->call(ModuleSeeder::class);

            return;
        }

        $this->settings();
        $this->pages();
        $this->posts($admin);
        $this->announcements();
        $this->events();
        $this->statistics();
        $this->achievements();
        $this->galleries();
        $this->teachers();
        $this->facilities();
        $this->call(ModuleSeeder::class);
    }

    private function settings(): void
    {
        $data = [
            'site_name' => 'MTsN 1 Bukittinggi',
            'tagline' => 'Madrasah Hebat, Bermartabat — Islami, Berprestasi, Berbudaya',
            'hero_title' => 'Mendidik generasi berakhlak karimah di kaki Gunung Marapi.',
            'hero_subtitle' => 'Madrasah Tsanawiyah Negeri 1 Bukittinggi memadukan keunggulan akademik, tradisi keilmuan Islam, dan nilai adat Minangkabau "Adat Basandi Syarak, Syarak Basandi Kitabullah".',
            'npsn' => '10310836',
            'accreditation' => 'A (Unggul)',
            'address' => 'Jl. Raya Kusuma Bhakti KM 1, Kubu Gulai Bancah, Kec. Mandiangin Koto Selayan, Kota Bukittinggi, Sumatera Barat 26122',
            'phone' => '(0752) 22939',
            'email' => 'info@mtsn1bukittinggi.sch.id',
            'whatsapp' => '6281234567890',
            'office_hours' => 'Senin–Jumat, 07.15–16.00 WIB',
            'facebook' => 'https://facebook.com/',
            'instagram' => 'https://instagram.com/',
            'youtube' => 'https://youtube.com/',
            'maps_embed' => 'https://maps.google.com/maps?q=MTsN%201%20Bukittinggi&t=&z=16&ie=UTF8&iwloc=&output=embed',
            'ppdb_url' => 'https://ppdb.kemenag.go.id/',
        ];
        foreach ($data as $key => $value) {
            Setting::create(compact('key', 'value'));
        }
    }

    private function pages(): void
    {
        $pages = [
            ['sambutan', 'Sambutan Kepala Madrasah', '<p>Assalamu\'alaikum warahmatullahi wabarakatuh.</p><p>Puji syukur kita panjatkan ke hadirat Allah SWT. Website resmi ini kami hadirkan sebagai jendela informasi bagi orang tua, peserta didik, alumni, dan masyarakat untuk mengenal lebih dekat MTsN 1 Bukittinggi.</p><p>Kami berkomitmen menyelenggarakan pendidikan yang menyeimbangkan kecerdasan intelektual, kedalaman spiritual, dan kepedulian sosial. Dengan dukungan seluruh warga madrasah, kami terus berbenah agar setiap anak tumbuh menjadi pribadi yang berilmu, beramal, dan berakhlak mulia.</p><p>Wassalamu\'alaikum warahmatullahi wabarakatuh.</p>', self::IMG['teacher']],
            ['sejarah', 'Sejarah Singkat', '<p>MTsN 1 Bukittinggi berawal dari Pendidikan Guru Agama (PGA) yang kemudian dialihfungsikan menjadi Madrasah Tsanawiyah Negeri pada akhir dekade 1970-an melalui kebijakan penegerian madrasah oleh Kementerian Agama.</p><p>Sejak itu madrasah terus berkembang, baik dari sisi jumlah peserta didik, kualitas tenaga pendidik, maupun sarana prasarana. Berlokasi di Kubu Gulai Bancah, madrasah ini menjadi salah satu rujukan pendidikan menengah pertama berbasis keislaman di Kota Bukittinggi dan sekitarnya.</p><p>Kini MTsN 1 Bukittinggi terakreditasi A dan aktif mengembangkan program unggulan tahfiz, sains, literasi, serta pembinaan karakter berbasis budaya Minangkabau.</p>', self::IMG['jamgadang2']],
            ['visi', 'Visi', '<p>Terwujudnya madrasah yang Islami, unggul dalam prestasi, berwawasan lingkungan, dan berbudaya Minangkabau.</p>', null],
            ['misi', 'Misi', '<ul><li>Menanamkan akidah dan membiasakan ibadah serta akhlak karimah dalam kehidupan sehari-hari.</li><li>Menyelenggarakan pembelajaran aktif, kreatif, dan bermakna sesuai Kurikulum Merdeka.</li><li>Mengembangkan program tahfiz Al-Qur\'an dan literasi keagamaan.</li><li>Membina potensi akademik dan non-akademik peserta didik hingga tingkat nasional.</li><li>Mewujudkan lingkungan madrasah yang bersih, hijau, dan ramah anak.</li><li>Melestarikan nilai adat Basandi Syarak, Syarak Basandi Kitabullah.</li></ul>', null],
            ['struktur', 'Struktur Organisasi', '<p>Kepala Madrasah dibantu oleh Kepala Tata Usaha serta Wakil Kepala Madrasah bidang Kurikulum, Kesiswaan, Sarana Prasarana, dan Humas. Setiap wakil membawahi koordinator program, wali kelas, dan guru mata pelajaran.</p>', null],
        ];
        foreach ($pages as [$key, $title, $content, $image]) {
            Page::create(compact('key', 'title', 'content', 'image'));
        }
    }

    private function posts(User $admin): void
    {
        $cats = collect(['Kegiatan Madrasah', 'Prestasi', 'Keagamaan', 'Akademik', 'Informasi'])
            ->mapWithKeys(fn ($n) => [$n => Category::create(['name' => $n])->id]);

        $posts = [
            ['Siswa MTsN 1 Bukittinggi Raih Medali Emas KSM Tingkat Provinsi Sumatera Barat', 'Prestasi', 'lab', true, 2, 'Tiga siswa MTsN 1 Bukittinggi berhasil meraih medali pada Kompetisi Sains Madrasah tingkat provinsi, satu di antaranya medali emas bidang Matematika Terintegrasi.'],
            ['Wisuda Tahfiz Angkatan VII: 48 Siswa Tuntaskan Hafalan 3 Juz', 'Keagamaan', 'quran2', false, 5, 'Sebanyak 48 peserta didik mengikuti wisuda tahfiz yang disaksikan orang tua dan tokoh masyarakat Bukittinggi.'],
            ['Pelaksanaan Asesmen Madrasah Kelas IX Berjalan Lancar dan Tertib', 'Akademik', 'classroom', false, 9, 'Asesmen Madrasah berbasis komputer diikuti seluruh siswa kelas IX dengan tingkat kehadiran 100 persen.'],
            ['Gerakan Literasi Pagi: Lima Belas Menit Membaca Sebelum Belajar', 'Kegiatan Madrasah', 'library', false, 13, 'Program literasi pagi kembali digalakkan untuk menumbuhkan kebiasaan membaca seluruh warga madrasah.'],
            ['Kemah Bakti Pramuka Gugus Depan MTsN 1 Bukittinggi di Bumi Perkemahan Panorama', 'Kegiatan Madrasah', 'scout', false, 18, 'Ratusan anggota pramuka penggalang mengikuti kemah bakti selama tiga hari dengan berbagai lomba ketangkasan.'],
            ['Peringatan Maulid Nabi Muhammad SAW Bersama Wali Murid', 'Keagamaan', 'quran', false, 24, 'Peringatan maulid diisi tausiyah, penampilan seni islami, dan santunan bagi siswa yatim.'],
            ['Implementasi Kurikulum Merdeka: Projek Penguatan Profil Pelajar Pancasila dan Rahmatan lil Alamin', 'Akademik', 'classroom2', false, 30, 'Siswa kelas VII dan VIII menampilkan hasil projek bertema kearifan lokal Minangkabau dan gaya hidup berkelanjutan.'],
            ['Upacara Peringatan Hari Amal Bakti Kementerian Agama', 'Informasi', 'ceremony', false, 38, 'Seluruh guru, tenaga kependidikan, dan siswa mengikuti upacara HAB Kemenag dengan khidmat.'],
            ['Tim Drumband MTsN 1 Bukittinggi Tampil Memukau di Pawai Budaya Kota', 'Prestasi', 'parade', false, 45, 'Penampilan tim drumband madrasah mendapat apresiasi dari pemerintah kota dan masyarakat.'],
        ];

        foreach ($posts as [$title, $cat, $img, $featured, $daysAgo, $excerpt]) {
            Post::create([
                'category_id' => $cats[$cat],
                'user_id' => $admin->id,
                'title' => $title,
                'excerpt' => $excerpt,
                'content' => "<p>{$excerpt}</p><p>Kepala MTsN 1 Bukittinggi menyampaikan apresiasi kepada seluruh pihak yang terlibat. Menurutnya, kegiatan ini merupakan wujud komitmen madrasah dalam membentuk peserta didik yang unggul secara akademik sekaligus kuat dalam karakter keislaman.</p><h3>Dukungan orang tua dan masyarakat</h3><p>Keberhasilan kegiatan tidak lepas dari kolaborasi antara guru, komite madrasah, dan orang tua. Madrasah berharap sinergi ini terus terjaga sehingga program-program pembinaan dapat berjalan berkelanjutan.</p><blockquote>\"Kami ingin setiap anak merasakan bahwa madrasah adalah rumah kedua tempat mereka tumbuh, belajar, dan berkarya.\"</blockquote><p>Ke depan, madrasah akan terus mengembangkan program serupa dengan melibatkan lebih banyak peserta didik dari seluruh jenjang kelas.</p>",
                'cover_image' => self::IMG[$img],
                'status' => 'published',
                'is_featured' => $featured,
                'views' => random_int(80, 1400),
                'published_at' => now()->subDays($daysAgo)->setTime(9, 0),
            ]);
        }

        Post::create([
            'category_id' => $cats['Informasi'], 'user_id' => $admin->id, 'status' => 'draft',
            'title' => 'Draf: Rencana Studi Tiru ke Madrasah Unggulan', 'content' => '<p>Draf berita internal.</p>',
        ]);
    }

    private function announcements(): void
    {
        $items = [
            ['Pendaftaran Peserta Didik Baru (PPDB) Tahun Pelajaran 2026/2027', 'mendesak', -5, 30],
            ['Jadwal Penilaian Akhir Semester Genap', 'penting', -2, 20],
            ['Libur Hari Raya Iduladha 1447 H', 'normal', -1, 14],
            ['Pengambilan Rapor dan Pertemuan Wali Murid', 'penting', 0, 25],
            ['Seleksi Tim Olimpiade Sains Madrasah', 'normal', -10, 10],
        ];
        foreach ($items as [$title, $priority, $start, $end]) {
            Announcement::create([
                'title' => $title,
                'priority' => $priority,
                'content' => "<p>Diberitahukan kepada seluruh peserta didik dan orang tua/wali bahwa <strong>{$title}</strong> akan dilaksanakan sesuai jadwal yang telah ditetapkan madrasah.</p><p>Informasi lebih lanjut dapat ditanyakan kepada wali kelas masing-masing atau melalui bagian Tata Usaha pada jam layanan.</p>",
                'starts_at' => today()->addDays($start),
                'ends_at' => today()->addDays($end),
                'is_published' => true,
            ]);
        }
    }

    private function events(): void
    {
        $items = [
            ['Penilaian Akhir Semester Genap', 'akademik', 6, 9, 'Ruang kelas'],
            ['Manasik Haji Siswa Kelas VII', 'keagamaan', 9, 9, 'Lapangan madrasah'],
            ['Rapat Pleno Kenaikan Kelas', 'akademik', 14, 14, 'Aula madrasah'],
            ['Pembagian Rapor Semester Genap', 'akademik', 18, 18, 'Ruang kelas'],
            ['Masa Ta\'aruf Siswa Madrasah (MATSAMA)', 'kesiswaan', 30, 32, 'Aula & lapangan'],
            ['Lomba Pidato Tiga Bahasa', 'kesiswaan', 3, 3, 'Aula madrasah'],
            ['Kajian Jumat Guru dan Tendik', 'keagamaan', 2, 2, 'Musala Al-Ikhlas'],
            ['Rapat Komite Madrasah', 'umum', -4, -4, 'Ruang rapat'],
        ];
        foreach ($items as [$title, $cat, $start, $end, $loc]) {
            Event::create([
                'title' => $title, 'category' => $cat, 'location' => $loc,
                'description' => "Kegiatan {$title} diikuti oleh warga madrasah sesuai ketentuan panitia.",
                'starts_at' => today()->addDays($start)->setTime(7, 30),
                'ends_at' => today()->addDays($end)->setTime(12, 0),
            ]);
        }
    }

    private function statistics(): void
    {
        $years = ['2022/2023' => 0.91, '2023/2024' => 0.95, '2024/2025' => 0.98, '2025/2026' => 1.0];
        foreach ($years as $year => $f) {
            $rows = [
                ['siswa', 'Kelas VII', 312], ['siswa', 'Kelas VIII', 305], ['siswa', 'Kelas IX', 298],
                ['guru', 'Guru PNS/PPPK', 52], ['guru', 'Guru Honorer', 9], ['guru', 'Tenaga Kependidikan', 14],
                ['rombel', 'Kelas VII', 10], ['rombel', 'Kelas VIII', 10], ['rombel', 'Kelas IX', 10],
                ['lulusan', 'Melanjutkan ke MAN/SMA', 268], ['lulusan', 'Pondok Pesantren', 22], ['lulusan', 'SMK/Lainnya', 8],
            ];
            foreach ($rows as $i => [$group, $label, $value]) {
                $v = in_array($group, ['siswa', 'lulusan']) ? (int) round($value * $f) : $value;
                Statistic::create(['academic_year' => $year, 'group' => $group, 'label' => $label, 'value' => $v, 'sort' => $i]);
            }
        }
    }

    private function achievements(): void
    {
        $items = [
            ['KSM Matematika Terintegrasi', 'Aisyah Rahmadani', 'provinsi', 'akademik', 'Medali Emas', 2026, 'lab'],
            ['MTQ Pelajar Cabang Tilawah', 'Muhammad Fadhil', 'kota', 'keagamaan', 'Juara 1', 2026, 'quran'],
            ['Olimpiade IPA Madrasah', 'Nabila Putri Azzahra', 'nasional', 'akademik', 'Medali Perak', 2025, 'lab2'],
            ['Lomba Pidato Bahasa Arab', 'Zahra Khairunnisa', 'provinsi', 'keagamaan', 'Juara 2', 2025, 'girls'],
            ['Festival Silek Tradisi Minangkabau', 'Tim Silek MTsN 1', 'kota', 'non-akademik', 'Juara Umum', 2025, 'kids'],
            ['Musabaqah Hifzhil Qur\'an 5 Juz', 'Rafi Alhaq', 'provinsi', 'keagamaan', 'Juara 3', 2025, 'quran3'],
            ['Lomba Karya Tulis Ilmiah Remaja', 'Tim KIR', 'nasional', 'akademik', 'Finalis', 2024, 'library'],
            ['Jambore Pramuka Penggalang', 'Gudep MTsN 1', 'provinsi', 'non-akademik', 'Tergiat', 2024, 'scout'],
        ];
        foreach ($items as [$title, $student, $level, $cat, $rank, $year, $img]) {
            Achievement::create(['title' => $title, 'student_name' => $student, 'level' => $level, 'category' => $cat, 'rank' => $rank, 'year' => $year, 'image' => self::IMG[$img], 'description' => "{$rank} {$title} tingkat ".ucfirst($level).'.']);
        }
    }

    private function galleries(): void
    {
        $albums = [
            ['Wisuda Tahfiz Angkatan VII', 5, ['quran2', 'quran', 'quran3'], null],
            ['Kemah Bakti Pramuka', 18, ['scout', 'ceremony', 'parade'], null],
            ['Projek P5 Kearifan Lokal', 30, ['classroom2', 'classroom', 'students'], null],
            ['Profil Video MTsN 1 Bukittinggi', 60, ['jamgadang', 'kids'], 'https://www.youtube.com/watch?v=ysz5S6PUM-U'],
            ['Kunjungan Perpustakaan Daerah', 75, ['library', 'library2'], null],
        ];
        foreach ($albums as [$title, $days, $imgs, $video]) {
            $g = Gallery::create(['title' => $title, 'event_date' => today()->subDays($days), 'cover_image' => self::IMG[$imgs[0]], 'video_url' => $video, 'description' => "Dokumentasi kegiatan {$title}."]);
            foreach ($imgs as $k) {
                $g->items()->create(['image_path' => self::IMG[$k], 'caption' => $title]);
            }
        }
    }

    private function teachers(): void
    {
        $items = [
            ['Drs. H. Syafrizal, M.Pd', 'Kepala Madrasah', null],
            ['Hj. Elfi Yanti, S.Ag', 'Wakil Kepala Bidang Kurikulum', 'Fikih'],
            ['Rahmat Hidayat, S.Pd', 'Wakil Kepala Bidang Kesiswaan', 'Penjasorkes'],
            ['Yusnimar, S.Pd', 'Wakil Kepala Bidang Sarpras', 'IPA'],
            ['Fitri Handayani, S.Pd.I', 'Wakil Kepala Bidang Humas', 'Bahasa Arab'],
            ['Afrizal, S.E', 'Kepala Tata Usaha', null],
            ['Nurhasanah, S.Pd', 'Guru', 'Matematika'],
            ['Dedi Kurniawan, S.Pd', 'Guru', 'Bahasa Inggris'],
            ['Silvia Marni, S.Pd', 'Guru', 'Bahasa Indonesia'],
            ['Ust. Hafizul Ikhwan, Lc', 'Koordinator Tahfiz', 'Al-Qur\'an Hadis'],
            ['Rini Oktavia, S.Kom', 'Guru', 'Informatika'],
            ['Zulkifli, S.Sn', 'Guru', 'Seni Budaya & BAM'],
        ];
        foreach ($items as $i => [$name, $position, $subject]) {
            Teacher::create(['name' => $name, 'position' => $position, 'subject' => $subject, 'sort' => $i, 'nip' => '19'.random_int(70, 89).str_pad((string) random_int(1, 1231), 4, '0', STR_PAD_LEFT).' '.random_int(199500, 202099).' '.random_int(1, 2).' '.str_pad((string) random_int(1, 999), 3, '0', STR_PAD_LEFT)]);
        }
    }

    private function facilities(): void
    {
        $items = [
            ['Laboratorium IPA', 'Dilengkapi mikroskop, alat praktikum fisika dan biologi untuk pembelajaran berbasis eksperimen.', 'lab'],
            ['Perpustakaan Madrasah', 'Koleksi lebih dari 8.000 judul buku, ruang baca nyaman, dan pojok literasi digital.', 'library2'],
            ['Musala Al-Ikhlas', 'Pusat kegiatan ibadah, tahfiz, dan kajian keislaman warga madrasah.', 'quran3'],
            ['Ruang Kelas Representatif', '30 ruang kelas dengan proyektor dan sirkulasi udara yang baik.', 'classroom2'],
            ['Laboratorium Komputer', '40 unit komputer untuk pembelajaran informatika dan asesmen berbasis komputer.', 'classroom'],
            ['Lapangan Olahraga', 'Lapangan serbaguna untuk upacara, futsal, voli, dan kegiatan pramuka.', 'ceremony'],
        ];
        foreach ($items as [$name, $desc, $img]) {
            Facility::create(['name' => $name, 'description' => $desc, 'image' => self::IMG[$img]]);
        }
    }
}
