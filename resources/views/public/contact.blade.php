@extends('layouts.public')
@section('title', 'Kontak')

@section('content')
    <x-page-hero title="Hubungi Kami" eyebrow="Layanan" subtitle="Kami siap melayani informasi akademik, administrasi, dan kerja sama." :crumbs="['Kontak' => null]" />

    <div class="container-x grid gap-10 py-16 lg:grid-cols-12">
        <div class="space-y-4 lg:col-span-5">
            @foreach ([['Alamat', $site['address'] ?? '', 'contact-address'], ['Telepon', $site['phone'] ?? '', 'contact-phone'], ['Email', $site['email'] ?? '', 'contact-email'], ['Jam Layanan', $site['office_hours'] ?? '', 'contact-hours']] as [$l, $v, $id])
                <div class="card p-6">
                    <p class="text-[11px] font-semibold uppercase tracking-[0.2em] text-gold">{{ $l }}</p>
                    <p class="mt-2 leading-7 text-forest" data-testid="{{ $id }}">{{ $v }}</p>
                </div>
            @endforeach
            <a href="https://wa.me/{{ preg_replace('/\D/', '', $site['whatsapp'] ?? '') }}?text={{ urlencode('Assalamualaikum, saya ingin bertanya tentang MTsN 1 Bukittinggi') }}" target="_blank" rel="noopener" class="btn-primary w-full" data-testid="contact-whatsapp-button">Kirim pesan WhatsApp</a>
        </div>
        <div class="overflow-hidden rounded-2xl border border-stone-line lg:col-span-7">
            <iframe src="{{ $site['maps_embed'] ?? '' }}" class="h-full min-h-[460px] w-full" loading="lazy" title="Peta lokasi" data-testid="contact-map"></iframe>
        </div>
    </div>
@endsection
