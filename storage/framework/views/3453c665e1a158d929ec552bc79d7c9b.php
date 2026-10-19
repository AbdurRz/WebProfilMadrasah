
<div id="splash" class="splash" role="dialog" aria-label="Animasi logo MTsN 1 Bukittinggi">
    <video id="splash-video" class="splash__video" playsinline preload="auto" aria-hidden="true">
        <source src="<?php echo e(asset('videos/logo-mtsn.mp4')); ?>" type="video/mp4">
    </video>
    <button type="button" id="splash-sound" class="splash__btn splash__sound" hidden>Nyalakan suara</button>
    <button type="button" id="splash-skip" class="splash__btn splash__skip">Lewati</button>
</div>

<style>
    .splash { position: fixed; inset: 0; z-index: 9999; background: #000; opacity: 1; transition: opacity .6s ease; }
    .splash--hide { opacity: 0; pointer-events: none; }
    .splash__video { width: 100%; height: 100%; object-fit: cover; }
    .splash__btn { position: absolute; bottom: 1.25rem; padding: .5rem 1rem; border: 1px solid rgba(255,255,255,.5); border-radius: 999px; background: rgba(0,0,0,.35); color: #fff; font-size: .8rem; cursor: pointer; backdrop-filter: blur(4px); }
    .splash__skip { right: 1.25rem; }
    .splash__sound { left: 1.25rem; }
    .splash__btn:hover { background: rgba(0,0,0,.6); }
    html.no-splash .splash { display: none; }
    html.splash-lock { overflow: hidden; }
</style>

<script>
    (function () {
        var root = document.documentElement;
        var splash = document.getElementById('splash');
        var video = document.getElementById('splash-video');
        var skip = document.getElementById('splash-skip');
        var sound = document.getElementById('splash-sound');
        var closed = false;

        function close() {
            if (closed) return;
            closed = true;
            try { sessionStorage.setItem('splashSeen', '1'); } catch (e) {}
            splash.classList.add('splash--hide');
            root.classList.remove('splash-lock');
            setTimeout(function () { splash.remove(); }, 700);
        }

        if (root.classList.contains('no-splash')) { splash.remove(); return; }

        root.classList.add('splash-lock');
        skip.addEventListener('click', close);
        video.addEventListener('ended', close);
        video.addEventListener('error', close);
        document.addEventListener('keydown', function (e) { if (e.key === 'Escape') close(); });

        // Coba putar dengan suara. Jika diblokir browser, putar tanpa suara.
        video.muted = false;
        var p = video.play();
        if (p && p.catch) {
            p.catch(function () {
                video.muted = true;
                sound.hidden = false;
                var q = video.play();
                if (q && q.catch) q.catch(close);
            });
        }

        sound.addEventListener('click', function () {
            video.muted = false;
            video.volume = 1;
            sound.hidden = true;
        });

        // Batas waktu pengaman jika video gagal dimuat atau macet.
        setTimeout(close, 8000);
    })();
</script>
<?php /**PATH E:\Kuliah\PPL\code\laravel\resources\views/partials/splash.blade.php ENDPATH**/ ?>