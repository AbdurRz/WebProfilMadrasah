@extends('layouts.public')
@section('title', 'Profil Madrasah')

@section('content')
    <x-page-hero title="Profil Madrasah" eyebrow="Tentang Kami" subtitle="Mengenal sejarah, visi, misi, dan arah pengembangan MTsN 1 Bukittinggi." :crumbs="['Profil' => null]" />

    <div class="container-x grid gap-12 py-20 lg:grid-cols-12" x-data="{ tab: 'sejarah' }">
        <aside class="lg:col-span-3">
            <nav class="sticky top-28 space-y-1" data-testid="profile-tabs">
                @foreach (['sejarah' => 'Sejarah', 'visimisi' => 'Visi & Misi', 'sambutan' => 'Sambutan Kepala', 'struktur' => 'Struktur Organisasi'] as $k => $l)
                    <button @click="tab = '{{ $k }}'" :class="tab === '{{ $k }}' ? 'bg-forest text-white' : 'text-ink/70 hover:bg-white'" class="flex w-full items-center justify-between rounded-xl px-4 py-3 text-left text-sm font-medium transition-colors" data-testid="profile-tab-{{ $k }}">
                        {{ $l }} <span :class="tab === '{{ $k }}' ? 'text-gold' : 'text-transparent'">◆</span>
                    </button>
                @endforeach
                <div class="mt-6 space-y-1 border-t border-stone-line pt-6">
                    <a href="{{ route('teachers') }}" class="block rounded-xl px-4 py-3 text-sm text-emerald-brand hover:bg-white" data-testid="profile-teachers-link">Guru & Tendik →</a>
                    <a href="{{ route('facilities') }}" class="block rounded-xl px-4 py-3 text-sm text-emerald-brand hover:bg-white" data-testid="profile-facilities-link">Fasilitas →</a>
                </div>
            </nav>
        </aside>

        <div class="lg:col-span-9">
            <section x-show="tab === 'sejarah'" x-transition.opacity data-testid="profile-section-sejarah">
                @if ($p = $pages->get('sejarah'))
                    @if ($p->image_url)<img src="{{ $p->image_url }}" alt="" class="mb-10 aspect-[21/9] w-full rounded-2xl object-cover">@endif
                    <h2 class="text-3xl text-forest">{{ $p->title }}</h2>
                    <div class="prose-madrasah mt-6 max-w-3xl">{!! $p->content !!}</div>
                @endif
            </section>

            <section x-cloak x-show="tab === 'visimisi'" x-transition.opacity data-testid="profile-section-visimisi">
                <div class="relative overflow-hidden rounded-2xl bg-forest p-10 text-white grain">
                    <div class="songket absolute inset-0"></div>
                    <p class="relative text-[11px] font-semibold uppercase tracking-[0.25em] text-gold">Visi</p>
                    <div class="relative mt-4 font-serif text-2xl leading-relaxed sm:text-3xl">{!! strip_tags($pages->get('visi')?->content ?? '') !!}</div>
                </div>
                <div class="mt-10">
                    <p class="eyebrow">Misi</p>
                    <div class="prose-madrasah mt-6 max-w-3xl">{!! $pages->get('misi')?->content !!}</div>
                </div>
            </section>

            <section x-cloak x-show="tab === 'sambutan'" x-transition.opacity data-testid="profile-section-sambutan">
                @if ($p = $pages->get('sambutan'))
                    <div class="grid gap-10 md:grid-cols-5">
                        <img src="{{ $p->image_url }}" alt="" class="aspect-[4/5] w-full rounded-2xl object-cover md:col-span-2">
                        <div class="md:col-span-3">
                            <h2 class="text-3xl text-forest">{{ $p->title }}</h2>
                            <div class="prose-madrasah mt-6">{!! $p->content !!}</div>
                            @if ($headmaster)<p class="mt-4 font-serif text-lg text-forest">{{ $headmaster->name }}</p>@endif
                        </div>
                    </div>
                @endif
            </section>

            <section x-cloak x-show="tab === 'struktur'" x-transition.opacity data-testid="profile-section-struktur">
                <h2 class="text-3xl text-forest">{{ $pages->get('struktur')?->title }}</h2>
                <div class="prose-madrasah mt-6 max-w-3xl">{!! $pages->get('struktur')?->content !!}</div>
                <div class="mt-10 grid gap-4 text-center text-sm">
                    <div class="mx-auto rounded-xl bg-forest px-8 py-4 text-white">Kepala Madrasah</div>
                    <div class="mx-auto h-6 w-px bg-gold"></div>
                    <div class="grid gap-3 sm:grid-cols-5">
                        @foreach (['Kepala TU', 'Waka Kurikulum', 'Waka Kesiswaan', 'Waka Sarpras', 'Waka Humas'] as $r)
                            <div class="card px-3 py-4 font-medium text-forest">{{ $r }}</div>
                        @endforeach
                    </div>
                    <div class="mx-auto h-6 w-px bg-gold"></div>
                    <div class="mx-auto rounded-xl border border-dashed border-emerald-brand/40 px-8 py-4 text-ink/70">Wali Kelas · Guru Mata Pelajaran · Pembina Ekstrakurikuler</div>
                </div>
            </section>
        </div>
    </div>
@endsection
