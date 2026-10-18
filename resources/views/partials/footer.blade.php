<footer class="relative mt-28 overflow-hidden bg-forest text-white/75 grain">
    <div class="songket absolute inset-0 opacity-60"></div>
    <div class="container-x relative grid gap-12 py-16 md:grid-cols-12">
        <div class="md:col-span-5">
            <p class="font-serif text-3xl leading-snug text-white">{{ $site['site_name'] ?? 'MTsN 1 Bukittinggi' }}</p>
            <p class="mt-4 max-w-md text-sm leading-7">{{ $site['tagline'] ?? '' }}</p>
            <p class="mt-6 font-serif text-lg italic text-gold">“Adat Basandi Syarak, Syarak Basandi Kitabullah”</p>
        </div>
        <div class="md:col-span-3">
            <p class="mb-4 text-xs font-semibold uppercase tracking-[0.2em] text-gold">Jelajahi</p>
            <ul class="space-y-2.5 text-sm">
                @foreach ([['Profil Madrasah', 'profile'], ['Berita', 'news.index'], ['Pengumuman', 'announcements.index'], ['Agenda', 'agenda'], ['Statistik', 'statistics'], ['Prestasi', 'achievements'], ['Galeri', 'galleries.index'], ['Ekstrakurikuler', 'extracurriculars.index'], ['Unduhan', 'downloads'], ['PPDB', 'ppdb.index']] as [$l, $r])
                    <li><a href="{{ route($r) }}" class="link-underline hover:text-white">{{ $l }}</a></li>
                @endforeach
            </ul>
        </div>
        <div class="md:col-span-4">
            <p class="mb-4 text-xs font-semibold uppercase tracking-[0.2em] text-gold">Kontak</p>
            <address class="space-y-3 text-sm not-italic leading-6">
                <p data-testid="footer-address">{{ $site['address'] ?? '' }}</p>
                <p>Telp. <span class="font-mono text-white">{{ $site['phone'] ?? '' }}</span></p>
                <p>{{ $site['email'] ?? '' }}</p>
                <p>{{ $site['office_hours'] ?? '' }}</p>
            </address>
            <div class="mt-5 flex gap-2">
                @foreach (['facebook' => 'Facebook', 'instagram' => 'Instagram', 'youtube' => 'YouTube'] as $k => $l)
                    @if (! empty($site[$k]))
                        <a href="{{ $site[$k] }}" target="_blank" rel="noopener" class="rounded-full border border-white/15 px-3.5 py-1.5 text-xs transition-colors hover:border-gold hover:text-gold" data-testid="footer-social-{{ $k }}">{{ $l }}</a>
                    @endif
                @endforeach
            </div>
        </div>
    </div>
    <div class="relative border-t border-white/10">
        <div class="container-x flex flex-col justify-between gap-2 py-5 text-xs text-white/50 sm:flex-row">
            <p>© {{ date('Y') }} {{ $site['site_name'] ?? 'MTsN 1 Bukittinggi' }}. Hak cipta dilindungi.</p>
            <a href="{{ route('admin.login') }}" class="hover:text-gold" data-testid="footer-admin-link">Masuk Admin</a>
        </div>
    </div>
</footer>
