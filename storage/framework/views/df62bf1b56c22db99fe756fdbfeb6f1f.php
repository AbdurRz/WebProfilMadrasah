<?php $__env->startSection('content'); ?>
    
    <section class="relative overflow-hidden bg-forest text-white grain" data-testid="home-hero">
        <div class="songket absolute inset-0 opacity-70"></div>
        <div class="container-x relative grid items-center gap-12 py-16 lg:grid-cols-12 lg:py-24">
            <div class="lg:col-span-6">
                <p class="rise mb-6 inline-flex items-center gap-3 rounded-full border border-gold/30 bg-white/5 px-4 py-1.5 text-xs text-gold-soft backdrop-blur">
                    <span class="h-1.5 w-1.5 rounded-full bg-gold"></span> Terakreditasi <?php echo e($site['accreditation'] ?? 'A'); ?> · Kementerian Agama RI
                </p>
                <h1 class="rise rise-1 text-4xl leading-[1.08] sm:text-5xl lg:text-6xl" data-testid="hero-title"><?php echo e($site['hero_title'] ?? ''); ?></h1>
                <p class="rise rise-2 mt-6 max-w-xl text-base leading-8 text-white/70 md:text-lg"><?php echo e($site['hero_subtitle'] ?? ''); ?></p>
                <div class="rise rise-3 mt-9 flex flex-wrap gap-3">
                    <a href="<?php echo e(route('profile')); ?>" class="btn-gold" data-testid="hero-profile-button">Kenali Madrasah</a>
                    <a href="<?php echo e(route('news.index')); ?>" class="btn border border-white/25 text-white hover:bg-white hover:text-forest" data-testid="hero-news-button">Berita Terbaru</a>
                </div>
            </div>
            <div class="relative lg:col-span-6">
                <div class="rise rise-2 relative ml-auto aspect-[4/5] w-full max-w-md overflow-hidden rounded-[2rem] rounded-tr-[7rem] border border-white/10 sm:aspect-[5/5]">
                    <img src="https://images.unsplash.com/photo-1689669060288-400996a38dcd?w=1200&q=75" alt="Jam Gadang Bukittinggi" class="h-full w-full object-cover">
                    <div class="absolute inset-0 bg-gradient-to-t from-forest/70 via-transparent"></div>
                    <p class="absolute bottom-5 right-5 text-right text-xs uppercase tracking-[0.2em] text-white/80">Kota Bukittinggi · Sumatera Barat</p>
                </div>
                <div class="rise rise-4 absolute -bottom-6 left-0 hidden w-60 rounded-2xl border border-white/10 bg-white p-5 text-ink shadow-2xl sm:block lg:-left-4">
                    <p class="text-[11px] uppercase tracking-[0.2em] text-ink/50">Peserta didik <?php echo e($year); ?></p>
                    <p class="mt-1 font-mono text-4xl font-bold text-emerald-brand"><?php echo e(number_format($quick['Peserta Didik'], 0, ',', '.')); ?></p>
                    <p class="mt-1 text-xs text-ink/60">dalam <?php echo e($quick['Rombongan Belajar']); ?> rombongan belajar</p>
                </div>
            </div>
        </div>
    </section>

    
    <?php if($announcements->isNotEmpty()): ?>
        <section class="border-b border-stone-line bg-white" data-testid="announcement-ticker">
            <div class="container-x flex items-center gap-4 py-3">
                <a href="<?php echo e(route('announcements.index')); ?>" class="shrink-0 rounded-full bg-gold px-3 py-1 text-[11px] font-bold uppercase tracking-wider text-forest">Pengumuman</a>
                <div class="relative flex-1 overflow-hidden [mask-image:linear-gradient(90deg,transparent,#000_6%,#000_94%,transparent)]">
                    <div class="marquee flex w-max gap-12 whitespace-nowrap text-sm">
                        <?php $__currentLoopData = [1, 2]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $_): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php $__currentLoopData = $announcements; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $a): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <a href="<?php echo e(route('announcements.show', $a)); ?>" class="text-ink/75 hover:text-emerald-brand">◆ <?php echo e($a->title); ?></a>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                </div>
            </div>
        </section>
    <?php endif; ?>

    
    <section class="container-x py-20" data-testid="quick-stats">
        <div class="grid gap-px overflow-hidden rounded-2xl border border-stone-line bg-stone-line sm:grid-cols-2 lg:grid-cols-4">
            <?php $__currentLoopData = $quick; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $label => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="bg-white p-8" x-data="counter(<?php echo e((int) $value); ?>)">
                    <p class="font-mono text-5xl font-bold text-forest" x-text="value.toLocaleString('id-ID')" data-testid="quick-stat-<?php echo e(Str::slug($label)); ?>"><?php echo e($value); ?></p>
                    <p class="mt-3 text-sm text-ink/60"><?php echo e($label); ?></p>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
        <a href="<?php echo e(route('statistics')); ?>" class="mt-4 inline-flex items-center gap-2 text-sm font-medium text-emerald-brand link-underline" data-testid="quick-stats-more-link">Lihat statistik lengkap →</a>
    </section>

    
    <?php if($welcome): ?>
        <section class="container-x grid items-center gap-12 pb-24 lg:grid-cols-12">
            <div class="relative lg:col-span-5">
                <div class="aspect-[4/5] overflow-hidden rounded-[2rem] rounded-bl-[6rem]">
                    <img src="<?php echo e($welcome->image_url); ?>" alt="<?php echo e($headmaster?->name); ?>" loading="lazy" class="h-full w-full object-cover">
                </div>
                <div class="absolute -right-4 -top-4 -z-10 h-full w-full rounded-[2rem] border-2 border-gold/40"></div>
            </div>
            <div class="lg:col-span-7 lg:pl-8">
                <p class="eyebrow">Sambutan</p>
                <h2 class="mt-4 text-3xl leading-tight text-forest sm:text-4xl"><?php echo e($welcome->title); ?></h2>
                <div class="prose-madrasah mt-6 line-clamp-[8]"><?php echo $welcome->content; ?></div>
                <?php if($headmaster): ?>
                    <div class="mt-6 border-l-2 border-gold pl-4">
                        <p class="font-serif text-lg text-forest"><?php echo e($headmaster->name); ?></p>
                        <p class="text-sm text-ink/55"><?php echo e($headmaster->position); ?></p>
                    </div>
                <?php endif; ?>
                <a href="<?php echo e(route('profile')); ?>" class="btn-ghost mt-8" data-testid="welcome-readmore-button">Profil lengkap</a>
            </div>
        </section>
    <?php endif; ?>

    
    <section class="bg-white py-24">
        <div class="container-x">
            <div class="mb-12 flex flex-wrap items-end justify-between gap-4">
                <div>
                    <p class="eyebrow">Kabar Madrasah</p>
                    <h2 class="mt-3 text-3xl text-forest sm:text-4xl">Berita terbaru</h2>
                </div>
                <a href="<?php echo e(route('news.index')); ?>" class="btn-ghost" data-testid="home-all-news-button">Semua berita</a>
            </div>
            <div class="grid gap-10 lg:grid-cols-12">
                <?php if($featured): ?>
                    <div class="lg:col-span-7"><?php if (isset($component)) { $__componentOriginal1a2825a6708c27e00d3538c2a0d29d90 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal1a2825a6708c27e00d3538c2a0d29d90 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.news-card','data' => ['post' => $featured,'size' => 'lg']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('news-card'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['post' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($featured),'size' => 'lg']); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal1a2825a6708c27e00d3538c2a0d29d90)): ?>
<?php $attributes = $__attributesOriginal1a2825a6708c27e00d3538c2a0d29d90; ?>
<?php unset($__attributesOriginal1a2825a6708c27e00d3538c2a0d29d90); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal1a2825a6708c27e00d3538c2a0d29d90)): ?>
<?php $component = $__componentOriginal1a2825a6708c27e00d3538c2a0d29d90; ?>
<?php unset($__componentOriginal1a2825a6708c27e00d3538c2a0d29d90); ?>
<?php endif; ?></div>
                <?php endif; ?>
                <div class="divide-y divide-stone-line lg:col-span-5">
                    <?php $__currentLoopData = $posts->where('id', '!=', $featured?->id)->take(4); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $post): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <a href="<?php echo e(route('news.show', $post)); ?>" class="group flex gap-5 py-5 first:pt-0" data-testid="home-news-item-<?php echo e($post->id); ?>">
                            <img src="<?php echo e($post->cover_url); ?>" alt="" loading="lazy" class="h-20 w-28 shrink-0 rounded-lg object-cover">
                            <div>
                                <p class="font-mono text-[11px] uppercase text-ink/50"><?php echo e($post->published_at?->translatedFormat('d M Y')); ?> · <?php echo e($post->category?->name); ?></p>
                                <h3 class="mt-1.5 text-base leading-snug text-forest group-hover:text-emerald-brand"><?php echo e($post->title); ?></h3>
                            </div>
                        </a>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
            </div>
        </div>
    </section>

    
    <section class="container-x grid gap-12 py-24 lg:grid-cols-12">
        <div class="min-w-0 lg:col-span-7">
            <div class="mb-8 flex items-end justify-between gap-4">
                <div><p class="eyebrow">Kalender</p><h2 class="mt-3 text-3xl text-forest">Agenda mendatang</h2></div>
                <a href="<?php echo e(route('agenda')); ?>" class="text-sm font-medium text-emerald-brand link-underline" data-testid="home-agenda-link">Kalender lengkap →</a>
            </div>
            <div class="space-y-3">
                <?php $__empty_1 = true; $__currentLoopData = $events; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $event): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                    <div class="card flex items-center gap-6 p-5 transition-[border-color,transform] hover:-translate-y-0.5 hover:border-emerald-brand/40" data-testid="home-event-<?php echo e($event->id); ?>">
                        <div class="w-16 shrink-0 text-center">
                            <p class="font-mono text-3xl font-bold text-emerald-brand"><?php echo e($event->starts_at->format('d')); ?></p>
                            <p class="text-[11px] uppercase tracking-wider text-ink/50"><?php echo e($event->starts_at->translatedFormat('M Y')); ?></p>
                        </div>
                        <div class="h-12 w-px bg-stone-line"></div>
                        <div class="min-w-0">
                            <p class="text-[11px] font-semibold uppercase tracking-wider text-gold"><?php echo e($event->category); ?></p>
                            <p class="truncate font-medium text-forest"><?php echo e($event->title); ?></p>
                            <p class="text-sm text-ink/55"><?php echo e($event->starts_at->format('H.i')); ?> WIB · <?php echo e($event->location); ?></p>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                    <p class="text-sm text-ink/60">Belum ada agenda mendatang.</p>
                <?php endif; ?>
            </div>
        </div>
        <div class="min-w-0 lg:col-span-5">
            <div class="relative h-full overflow-hidden rounded-2xl bg-emerald-brand p-8 text-white grain">
                <div class="songket absolute inset-0 opacity-50"></div>
                <div class="relative">
                    <p class="text-[11px] font-semibold uppercase tracking-[0.25em] text-gold">Papan Informasi</p>
                    <h2 class="mt-3 text-3xl">Pengumuman resmi</h2>
                    <ul class="mt-8 space-y-5">
                        <?php $__currentLoopData = $announcements; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $a): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li class="border-b border-white/15 pb-5 last:border-0">
                                <a href="<?php echo e(route('announcements.show', $a)); ?>" class="group block" data-testid="home-announcement-<?php echo e($a->id); ?>">
                                    <?php if (isset($component)) { $__componentOriginalb3f3930a96171a12366c9551b2dd3c07 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginalb3f3930a96171a12366c9551b2dd3c07 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.priority-badge','data' => ['priority' => $a->priority]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('priority-badge'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['priority' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($a->priority)]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginalb3f3930a96171a12366c9551b2dd3c07)): ?>
<?php $attributes = $__attributesOriginalb3f3930a96171a12366c9551b2dd3c07; ?>
<?php unset($__attributesOriginalb3f3930a96171a12366c9551b2dd3c07); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalb3f3930a96171a12366c9551b2dd3c07)): ?>
<?php $component = $__componentOriginalb3f3930a96171a12366c9551b2dd3c07; ?>
<?php unset($__componentOriginalb3f3930a96171a12366c9551b2dd3c07); ?>
<?php endif; ?>
                                    <p class="mt-2 font-medium leading-snug group-hover:text-gold"><?php echo e($a->title); ?></p>
                                    <p class="mt-1 text-xs text-white/55">Berlaku s.d. <?php echo e($a->ends_at?->translatedFormat('d F Y') ?? '—'); ?></p>
                                </a>
                            </li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </ul>
                    <a href="<?php echo e(route('announcements.index')); ?>" class="btn-gold mt-4" data-testid="home-all-announcements-button">Semua pengumuman</a>
                </div>
            </div>
        </div>
    </section>

    
    <section class="bg-sand-dark/60 py-24">
        <div class="container-x">
            <div class="mb-12 grid gap-6 lg:grid-cols-2 lg:items-end">
                <div><p class="eyebrow">Prestasi</p><h2 class="mt-3 text-3xl text-forest sm:text-4xl">Mengharumkan nama madrasah</h2></div>
                <p class="text-sm leading-7 text-ink/65 lg:text-right">Capaian peserta didik di bidang akademik, keagamaan, seni, dan olahraga — dari tingkat kota hingga nasional.</p>
            </div>
            <div class="grid gap-6 sm:grid-cols-2 lg:grid-cols-4">
                <?php $__currentLoopData = $achievements; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $ach): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="group card overflow-hidden <?php echo e($i % 2 ? 'lg:translate-y-8' : ''); ?>" data-testid="home-achievement-<?php echo e($ach->id); ?>">
                        <div class="img-zoom aspect-[4/3] overflow-hidden"><img src="<?php echo e($ach->image_url); ?>" alt="<?php echo e($ach->title); ?>" loading="lazy" class="h-full w-full object-cover"></div>
                        <div class="p-5">
                            <p class="font-mono text-xs text-gold"><?php echo e($ach->rank); ?> · <?php echo e(ucfirst($ach->level)); ?> · <?php echo e($ach->year); ?></p>
                            <p class="mt-2 font-serif text-lg leading-snug text-forest"><?php echo e($ach->title); ?></p>
                            <p class="mt-1 text-sm text-ink/55"><?php echo e($ach->student_name); ?></p>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
            <a href="<?php echo e(route('achievements')); ?>" class="btn-ghost mt-16" data-testid="home-all-achievements-button">Lihat semua prestasi</a>
        </div>
    </section>

    
    <section class="container-x py-24">
        <div class="mb-10 flex items-end justify-between">
            <div><p class="eyebrow">Galeri</p><h2 class="mt-3 text-3xl text-forest sm:text-4xl">Lensa kegiatan</h2></div>
            <a href="<?php echo e(route('galleries.index')); ?>" class="text-sm font-medium text-emerald-brand link-underline" data-testid="home-gallery-link">Buka galeri →</a>
        </div>
        <div class="grid auto-rows-[180px] grid-cols-2 gap-4 md:grid-cols-4">
            <?php $__currentLoopData = $galleries; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $g): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <a href="<?php echo e(route('galleries.show', $g)); ?>" class="img-zoom group relative overflow-hidden rounded-2xl <?php echo e($i === 0 ? 'col-span-2 row-span-2' : ''); ?>" data-testid="home-gallery-<?php echo e($g->id); ?>">
                    <img src="<?php echo e($g->cover_url); ?>" alt="<?php echo e($g->title); ?>" loading="lazy" class="h-full w-full object-cover">
                    <div class="absolute inset-0 bg-gradient-to-t from-forest/80 via-forest/0 opacity-80 transition-opacity group-hover:opacity-100"></div>
                    <p class="absolute bottom-4 left-4 right-4 text-sm font-medium text-white"><?php echo e($g->title); ?></p>
                </a>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </section>

    
    <section class="container-x">
        <div class="relative overflow-hidden rounded-[2rem] bg-forest px-8 py-14 text-white grain sm:px-14">
            <div class="songket absolute inset-0"></div>
            <div class="relative grid items-center gap-8 lg:grid-cols-3">
                <div class="lg:col-span-2">
                    <h2 class="text-3xl sm:text-4xl">Bergabung bersama keluarga besar MTsN 1 Bukittinggi.</h2>
                    <p class="mt-3 text-white/70">Informasi Penerimaan Peserta Didik Baru, persyaratan, dan jadwal seleksi.</p>
                </div>
                <div class="flex flex-wrap gap-3 lg:justify-end">
                    <a href="<?php echo e(route('ppdb.index')); ?>" class="btn-gold" data-testid="cta-ppdb-button">Daftar PPDB</a>
                    <a href="<?php echo e(route('contact')); ?>" class="btn border border-white/25 text-white hover:bg-white hover:text-forest" data-testid="cta-contact-button">Hubungi kami</a>
                </div>
            </div>
        </div>
    </section>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/home.blade.php ENDPATH**/ ?>