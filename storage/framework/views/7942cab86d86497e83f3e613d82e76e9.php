<?php $__env->startSection('title', 'Profil Madrasah'); ?>

<?php $__env->startSection('content'); ?>
    <?php if (isset($component)) { $__componentOriginala9d931d4f11b4d2850df99e991db1dca = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginala9d931d4f11b4d2850df99e991db1dca = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.page-hero','data' => ['title' => 'Profil Madrasah','eyebrow' => 'Tentang Kami','subtitle' => 'Mengenal sejarah, visi, misi, dan arah pengembangan MTsN 1 Bukittinggi.','crumbs' => ['Profil' => null]]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page-hero'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => 'Profil Madrasah','eyebrow' => 'Tentang Kami','subtitle' => 'Mengenal sejarah, visi, misi, dan arah pengembangan MTsN 1 Bukittinggi.','crumbs' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(['Profil' => null])]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginala9d931d4f11b4d2850df99e991db1dca)): ?>
<?php $attributes = $__attributesOriginala9d931d4f11b4d2850df99e991db1dca; ?>
<?php unset($__attributesOriginala9d931d4f11b4d2850df99e991db1dca); ?>
<?php endif; ?>
<?php if (isset($__componentOriginala9d931d4f11b4d2850df99e991db1dca)): ?>
<?php $component = $__componentOriginala9d931d4f11b4d2850df99e991db1dca; ?>
<?php unset($__componentOriginala9d931d4f11b4d2850df99e991db1dca); ?>
<?php endif; ?>

    <div class="container-x grid gap-12 py-20 lg:grid-cols-12" x-data="{ tab: 'sejarah' }">
        <aside class="lg:col-span-3">
            <nav class="sticky top-28 space-y-1" data-testid="profile-tabs">
                <?php $__currentLoopData = ['sejarah' => 'Sejarah', 'visimisi' => 'Visi & Misi', 'sambutan' => 'Sambutan Kepala', 'struktur' => 'Struktur Organisasi']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $l): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <button @click="tab = '<?php echo e($k); ?>'" :class="tab === '<?php echo e($k); ?>' ? 'bg-forest text-white' : 'text-ink/70 hover:bg-white'" class="flex w-full items-center justify-between rounded-xl px-4 py-3 text-left text-sm font-medium transition-colors" data-testid="profile-tab-<?php echo e($k); ?>">
                        <?php echo e($l); ?> <span :class="tab === '<?php echo e($k); ?>' ? 'text-gold' : 'text-transparent'">◆</span>
                    </button>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <div class="mt-6 space-y-1 border-t border-stone-line pt-6">
                    <a href="<?php echo e(route('teachers')); ?>" class="block rounded-xl px-4 py-3 text-sm text-emerald-brand hover:bg-white" data-testid="profile-teachers-link">Guru & Tendik →</a>
                    <a href="<?php echo e(route('facilities')); ?>" class="block rounded-xl px-4 py-3 text-sm text-emerald-brand hover:bg-white" data-testid="profile-facilities-link">Fasilitas →</a>
                </div>
            </nav>
        </aside>

        <div class="lg:col-span-9">
            <section x-show="tab === 'sejarah'" x-transition.opacity data-testid="profile-section-sejarah">
                <?php if($p = $pages->get('sejarah')): ?>
                    <?php if($p->image_url): ?><img src="<?php echo e($p->image_url); ?>" alt="" class="mb-10 aspect-[21/9] w-full rounded-2xl object-cover"><?php endif; ?>
                    <h2 class="text-3xl text-forest"><?php echo e($p->title); ?></h2>
                    <div class="prose-madrasah mt-6 max-w-3xl"><?php echo $p->content; ?></div>
                <?php endif; ?>
            </section>

            <section x-cloak x-show="tab === 'visimisi'" x-transition.opacity data-testid="profile-section-visimisi">
                <div class="relative overflow-hidden rounded-2xl bg-forest p-10 text-white grain">
                    <div class="songket absolute inset-0"></div>
                    <p class="relative text-[11px] font-semibold uppercase tracking-[0.25em] text-gold">Visi</p>
                    <div class="relative mt-4 font-serif text-2xl leading-relaxed sm:text-3xl"><?php echo strip_tags($pages->get('visi')?->content ?? ''); ?></div>
                </div>
                <div class="mt-10">
                    <p class="eyebrow">Misi</p>
                    <div class="prose-madrasah mt-6 max-w-3xl"><?php echo $pages->get('misi')?->content; ?></div>
                </div>
            </section>

            <section x-cloak x-show="tab === 'sambutan'" x-transition.opacity data-testid="profile-section-sambutan">
                <?php if($p = $pages->get('sambutan')): ?>
                    <div class="grid gap-10 md:grid-cols-5">
                        <img src="<?php echo e($p->image_url); ?>" alt="" class="aspect-[4/5] w-full rounded-2xl object-cover md:col-span-2">
                        <div class="md:col-span-3">
                            <h2 class="text-3xl text-forest"><?php echo e($p->title); ?></h2>
                            <div class="prose-madrasah mt-6"><?php echo $p->content; ?></div>
                            <?php if($headmaster): ?><p class="mt-4 font-serif text-lg text-forest"><?php echo e($headmaster->name); ?></p><?php endif; ?>
                        </div>
                    </div>
                <?php endif; ?>
            </section>

            <section x-cloak x-show="tab === 'struktur'" x-transition.opacity data-testid="profile-section-struktur">
                <h2 class="text-3xl text-forest"><?php echo e($pages->get('struktur')?->title); ?></h2>
                <div class="prose-madrasah mt-6 max-w-3xl"><?php echo $pages->get('struktur')?->content; ?></div>
                <div class="mt-10 grid gap-4 text-center text-sm">
                    <div class="mx-auto rounded-xl bg-forest px-8 py-4 text-white">Kepala Madrasah</div>
                    <div class="mx-auto h-6 w-px bg-gold"></div>
                    <div class="grid gap-3 sm:grid-cols-5">
                        <?php $__currentLoopData = ['Kepala TU', 'Waka Kurikulum', 'Waka Kesiswaan', 'Waka Sarpras', 'Waka Humas']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $r): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <div class="card px-3 py-4 font-medium text-forest"><?php echo e($r); ?></div>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </div>
                    <div class="mx-auto h-6 w-px bg-gold"></div>
                    <div class="mx-auto rounded-xl border border-dashed border-emerald-brand/40 px-8 py-4 text-ink/70">Wali Kelas · Guru Mata Pelajaran · Pembina Ekstrakurikuler</div>
                </div>
            </section>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/profile.blade.php ENDPATH**/ ?>