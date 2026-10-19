<?php $__env->startSection('title', 'Kontak'); ?>

<?php $__env->startSection('content'); ?>
    <?php if (isset($component)) { $__componentOriginala9d931d4f11b4d2850df99e991db1dca = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginala9d931d4f11b4d2850df99e991db1dca = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'components.page-hero','data' => ['title' => 'Hubungi Kami','eyebrow' => 'Layanan','subtitle' => 'Kami siap melayani informasi akademik, administrasi, dan kerja sama.','crumbs' => ['Kontak' => null]]] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? $attributes->all() : [])); ?>
<?php $component->withName('page-hero'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag): ?>
<?php $attributes = $attributes->except(\Illuminate\View\AnonymousComponent::ignoredParameterNames()); ?>
<?php endif; ?>
<?php $component->withAttributes(['title' => 'Hubungi Kami','eyebrow' => 'Layanan','subtitle' => 'Kami siap melayani informasi akademik, administrasi, dan kerja sama.','crumbs' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute(['Kontak' => null])]); ?>
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

    <div class="container-x grid gap-10 py-16 lg:grid-cols-12">
        <div class="space-y-4 lg:col-span-5">
            <?php $__currentLoopData = [['Alamat', $site['address'] ?? '', 'contact-address'], ['Telepon', $site['phone'] ?? '', 'contact-phone'], ['Email', $site['email'] ?? '', 'contact-email'], ['Jam Layanan', $site['office_hours'] ?? '', 'contact-hours']]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as [$l, $v, $id]): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="card p-6">
                    <p class="text-[11px] font-semibold uppercase tracking-[0.2em] text-gold"><?php echo e($l); ?></p>
                    <p class="mt-2 leading-7 text-forest" data-testid="<?php echo e($id); ?>"><?php echo e($v); ?></p>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <a href="https://wa.me/<?php echo e(preg_replace('/\D/', '', $site['whatsapp'] ?? '')); ?>?text=<?php echo e(urlencode('Assalamualaikum, saya ingin bertanya tentang MTsN 1 Bukittinggi')); ?>" target="_blank" rel="noopener" class="btn-primary w-full" data-testid="contact-whatsapp-button">Kirim pesan WhatsApp</a>
        </div>
        <div class="overflow-hidden rounded-2xl border border-stone-line lg:col-span-7">
            <iframe src="<?php echo e($site['maps_embed'] ?? ''); ?>" class="h-full min-h-[460px] w-full" loading="lazy" title="Peta lokasi" data-testid="contact-map"></iframe>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.public', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/public/contact.blade.php ENDPATH**/ ?>