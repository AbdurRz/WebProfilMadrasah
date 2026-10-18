<?php

use App\Http\Controllers\Admin;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\PpdbController;
use App\Http\Controllers\StudentAffairsController;
use App\Http\Controllers\PublicController;
use Illuminate\Support\Facades\Route;

Route::get('/', HomeController::class)->name('home');

Route::controller(PublicController::class)->group(function () {
    Route::get('/profil', 'profile')->name('profile');
    Route::get('/profil/guru', 'teachers')->name('teachers');
    Route::get('/profil/fasilitas', 'facilities')->name('facilities');
    Route::get('/berita', 'news')->name('news.index');
    Route::get('/berita/{post}', 'newsShow')->name('news.show');
    Route::get('/pengumuman', 'announcements')->name('announcements.index');
    Route::get('/pengumuman/{announcement}', 'announcementShow')->name('announcements.show');
    Route::get('/agenda', 'agenda')->name('agenda');
    Route::get('/statistik', 'statistics')->name('statistics');
    Route::get('/prestasi', 'achievements')->name('achievements');
    Route::get('/galeri', 'galleries')->name('galleries.index');
    Route::get('/galeri/{gallery}', 'galleryShow')->name('galleries.show');
    Route::get('/kontak', 'contact')->name('contact');
});

Route::controller(StudentAffairsController::class)->group(function () {
    Route::get('/kesiswaan/ekstrakurikuler', 'extracurriculars')->name('extracurriculars.index');
    Route::get('/kesiswaan/ekstrakurikuler/{extracurricular}', 'extracurricularShow')->name('extracurriculars.show');
    Route::get('/kesiswaan/osim', 'osim')->name('osim');
    Route::get('/unduhan', 'downloads')->name('downloads');
    Route::get('/unduhan/{document}/download', 'download')->name('downloads.file');
});

Route::controller(PpdbController::class)->prefix('ppdb')->name('ppdb.')->group(function () {
    Route::get('/', 'index')->name('index');
    Route::post('/daftar', 'store')->middleware('throttle:5,1')->name('store');
    Route::get('/berhasil', 'success')->name('success');
    Route::get('/cek-status', 'check')->middleware('throttle:20,1')->name('check');
});

Route::prefix('admin')->name('admin.')->group(function () {
    Route::middleware('guest')->group(function () {
        Route::get('login', [Admin\AuthController::class, 'showLogin'])->name('login');
        Route::post('login', [Admin\AuthController::class, 'login'])->middleware('throttle:20,1')->name('login.attempt');
    });

    Route::middleware(['auth', 'role:admin,editor'])->group(function () {
        Route::post('logout', [Admin\AuthController::class, 'logout'])->name('logout');
        Route::get('/', Admin\DashboardController::class)->name('dashboard');

        Route::resource('posts', Admin\PostController::class)->except('show');
        Route::resource('categories', Admin\CategoryController::class)->except('show');
        Route::resource('announcements', Admin\AnnouncementController::class)->except('show');
        Route::resource('events', Admin\EventController::class)->except('show');
        Route::resource('galleries', Admin\GalleryController::class)->except('show');
        Route::delete('gallery-items/{item}', [Admin\GalleryController::class, 'destroyItem'])->name('gallery-items.destroy');
        Route::resource('achievements', Admin\AchievementController::class)->except('show');
        Route::resource('documents', Admin\DocumentController::class)->except('show');
        Route::resource('extracurriculars', Admin\ExtracurricularController::class)->except('show');
        Route::resource('osim', Admin\OsimMemberController::class)->except('show');

        Route::middleware('role:admin')->group(function () {
            Route::resource('statistics', Admin\StatisticController::class)->except('show');
            Route::resource('teachers', Admin\TeacherController::class)->except('show');
            Route::resource('facilities', Admin\FacilityController::class)->except('show');
            Route::get('pages', [Admin\PageController::class, 'index'])->name('pages.index');
            Route::get('pages/{page}/edit', [Admin\PageController::class, 'edit'])->name('pages.edit');
            Route::put('pages/{page}', [Admin\PageController::class, 'update'])->name('pages.update');
            Route::get('settings', [Admin\SettingController::class, 'edit'])->name('settings.edit');
            Route::put('settings', [Admin\SettingController::class, 'update'])->name('settings.update');
            Route::resource('users', Admin\UserController::class)->except('show');
            Route::get('logs', Admin\ActivityLogController::class)->name('logs');
            Route::get('ppdb', [Admin\PpdbController::class, 'index'])->name('ppdb.index');
            Route::get('ppdb/export', [Admin\PpdbController::class, 'export'])->name('ppdb.export');
            Route::get('ppdb/{registration}', [Admin\PpdbController::class, 'show'])->name('ppdb.show');
            Route::put('ppdb/{registration}', [Admin\PpdbController::class, 'update'])->name('ppdb.update');
            Route::delete('ppdb/{registration}', [Admin\PpdbController::class, 'destroy'])->name('ppdb.destroy');
            Route::get('ppdb/{registration}/dokumen/{type}', [Admin\PpdbController::class, 'document'])->name('ppdb.document');
        });
    });
});
