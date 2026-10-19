<?php $__env->startSection('title', 'Pengaturan Situs'); ?>

<?php $__env->startSection('content'); ?>
    <form method="post" action="<?php echo e(route('admin.settings.update')); ?>" class="card max-w-4xl p-6 sm:p-8" data-testid="settings-form">
        <?php echo csrf_field(); ?> <?php echo method_field('PUT'); ?>
        <div class="grid gap-6 md:grid-cols-2">
            <?php $__currentLoopData = $fields; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $f): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php [$label, $type] = $f; ?>
                <div class="<?php echo e($type === 'textarea' || $type === 'url' ? 'md:col-span-2' : ''); ?>">
                    <label for="<?php echo e($key); ?>" class="field-label"><?php echo e($label); ?></label>
                    <?php if($type === 'select'): ?>
                        <select id="<?php echo e($key); ?>" name="<?php echo e($key); ?>" class="field-input" data-testid="setting-<?php echo e($key); ?>">
                            <?php $__currentLoopData = $f[2]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $ov => $ol): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?><option value="<?php echo e($ov); ?>" <?php if(old($key, $values[$key] ?? '') == $ov): echo 'selected'; endif; ?>><?php echo e($ol); ?></option><?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    <?php elseif($type === 'textarea'): ?>
                        <textarea id="<?php echo e($key); ?>" name="<?php echo e($key); ?>" rows="3" class="field-input" data-testid="setting-<?php echo e($key); ?>"><?php echo e(old($key, $values[$key] ?? '')); ?></textarea>
                    <?php else: ?>
                        <input id="<?php echo e($key); ?>" type="<?php echo e($type); ?>" name="<?php echo e($key); ?>" value="<?php echo e(old($key, $values[$key] ?? '')); ?>" class="field-input" data-testid="setting-<?php echo e($key); ?>">
                    <?php endif; ?>
                    <?php $__errorArgs = [$key];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?><p class="mt-1 text-xs text-red-600"><?php echo e($message); ?></p><?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
        <button class="btn-primary mt-8" data-testid="settings-submit-button">Simpan pengaturan</button>
    </form>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/admin/settings.blade.php ENDPATH**/ ?>