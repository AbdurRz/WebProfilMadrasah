@if ($paginator->hasPages())
    <nav class="mt-12 flex items-center justify-between gap-4" aria-label="Paginasi" data-testid="pagination">
        <p class="text-sm text-ink/60">Halaman <span class="font-mono text-ink">{{ $paginator->currentPage() }}</span> dari <span class="font-mono text-ink">{{ $paginator->lastPage() }}</span></p>
        <div class="flex items-center gap-1.5">
            @if ($paginator->onFirstPage())
                <span class="rounded-full border border-stone-line px-4 py-2 text-sm text-ink/30">Sebelumnya</span>
            @else
                <a href="{{ $paginator->previousPageUrl() }}" class="rounded-full border border-stone-line bg-white px-4 py-2 text-sm hover:border-emerald-brand hover:text-emerald-brand" data-testid="pagination-prev">Sebelumnya</a>
            @endif
            @foreach ($elements as $element)
                @if (is_array($element))
                    @foreach ($element as $page => $url)
                        @if ($page == $paginator->currentPage())
                            <span class="hidden h-9 w-9 place-items-center rounded-full bg-forest font-mono text-sm text-white sm:grid">{{ $page }}</span>
                        @else
                            <a href="{{ $url }}" class="hidden h-9 w-9 place-items-center rounded-full font-mono text-sm hover:bg-sand-dark sm:grid">{{ $page }}</a>
                        @endif
                    @endforeach
                @endif
            @endforeach
            @if ($paginator->hasMorePages())
                <a href="{{ $paginator->nextPageUrl() }}" class="rounded-full border border-stone-line bg-white px-4 py-2 text-sm hover:border-emerald-brand hover:text-emerald-brand" data-testid="pagination-next">Berikutnya</a>
            @else
                <span class="rounded-full border border-stone-line px-4 py-2 text-sm text-ink/30">Berikutnya</span>
            @endif
        </div>
    </nav>
@endif
