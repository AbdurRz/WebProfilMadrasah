<?php

namespace App\Providers;

use App\Models\Setting;
use Carbon\Carbon;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    public function register(): void {}

    public function boot(): void
    {
        Carbon::setLocale(config('app.locale'));
        Paginator::defaultView('partials.pagination');

        if (str_starts_with(config('app.url'), 'https://')) {
            URL::forceScheme('https');
        }

        View::composer(['layouts.*', 'public.*', 'partials.*'], function ($view) {
            static $settings;
            $settings ??= Schema::hasTable('settings') ? Setting::map() : [];
            $view->with('site', $settings);
        });
    }
}
