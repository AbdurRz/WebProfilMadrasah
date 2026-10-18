<?php if($paginator->hasPages()): ?>
    <nav class="mt-12 flex items-center justify-between gap-4" aria-label="Paginasi" data-testid="pagination">
        <p class="text-sm text-ink/60">Halaman <span class="font-mono text-ink"><?php echo e($paginator->currentPage()); ?></span> dari <span class="font-mono text-ink"><?php echo e($paginator->lastPage()); ?></span></p>
        <div class="flex items-center gap-1.5">
            <?php if($paginator->onFirstPage()): ?>
                <span class="rounded-full border border-stone-line px-4 py-2 text-sm text-ink/30">Sebelumnya</span>
            <?php else: ?>
                <a href="<?php echo e($paginator->previousPageUrl()); ?>" class="rounded-full border border-stone-line bg-white px-4 py-2 text-sm hover:border-emerald-brand hover:text-emerald-brand" data-testid="pagination-prev">Sebelumnya</a>
            <?php endif; ?>
            <?php $__currentLoopData = $elements; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $element): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php if(is_array($element)): ?>
                    <?php $__currentLoopData = $element; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $page => $url): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php if($page == $paginator->currentPage()): ?>
                            <span class="hidden h-9 w-9 place-items-center rounded-full bg-forest font-mono text-sm text-white sm:grid"><?php echo e($page); ?></span>
                        <?php else: ?>
                            <a href="<?php echo e($url); ?>" class="hidden h-9 w-9 place-items-center rounded-full font-mono text-sm hover:bg-sand-dark sm:grid"><?php echo e($page); ?></a>
                        <?php endif; ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                <?php endif; ?>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            <?php if($paginator->hasMorePages()): ?>
                <a href="<?php echo e($paginator->nextPageUrl()); ?>" class="rounded-full border border-stone-line bg-white px-4 py-2 text-sm hover:border-emerald-brand hover:text-emerald-brand" data-testid="pagination-next">Berikutnya</a>
            <?php else: ?>
                <span class="rounded-full border border-stone-line px-4 py-2 text-sm text-ink/30">Berikutnya</span>
            <?php endif; ?>
        </div>
    </nav>
<?php endif; ?>
<?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/partials/pagination.blade.php ENDPATH**/ ?>