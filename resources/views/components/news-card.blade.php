@props(['post', 'size' => 'md'])
<article class="group">
    <a href="{{ route('news.show', $post) }}" class="block" data-testid="news-card-{{ $post->id }}">
        <div class="img-zoom relative mb-4 aspect-[16/10] overflow-hidden rounded-xl bg-sand-dark">
            <img src="{{ $post->cover_url }}" alt="{{ $post->title }}" loading="lazy" class="h-full w-full object-cover">
            @if ($post->category)
                <span class="absolute left-3 top-3 rounded-full bg-white/90 px-3 py-1 text-[11px] font-semibold text-emerald-brand backdrop-blur">{{ $post->category->name }}</span>
            @endif
        </div>
        <p class="mb-2 font-mono text-[11px] uppercase tracking-wider text-ink/50">{{ $post->published_at?->translatedFormat('d F Y') }}</p>
        <h3 class="{{ $size === 'lg' ? 'text-2xl' : 'text-lg' }} leading-snug text-forest transition-colors group-hover:text-emerald-brand">{{ $post->title }}</h3>
        @if ($size === 'lg')<p class="mt-3 line-clamp-3 text-sm leading-6 text-ink/65">{{ $post->summary }}</p>@endif
    </a>
</article>
