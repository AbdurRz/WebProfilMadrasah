<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('statistics', function (Blueprint $table) {
            $table->id();
            $table->string('academic_year', 9)->index();
            $table->enum('group', ['siswa', 'guru', 'rombel', 'prestasi', 'lulusan']);
            $table->string('label', 100);
            $table->unsignedInteger('value');
            $table->unsignedSmallInteger('sort')->default(0);
            $table->timestamps();
        });

        Schema::create('achievements', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('student_name')->nullable();
            $table->enum('level', ['kota', 'provinsi', 'nasional', 'internasional'])->default('kota');
            $table->enum('category', ['akademik', 'non-akademik', 'keagamaan'])->default('akademik');
            $table->string('rank', 50)->nullable();
            $table->unsignedSmallInteger('year');
            $table->text('description')->nullable();
            $table->string('image')->nullable();
            $table->timestamps();
        });

        Schema::create('galleries', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->string('slug')->unique();
            $table->text('description')->nullable();
            $table->string('cover_image')->nullable();
            $table->string('video_url')->nullable();
            $table->date('event_date')->nullable();
            $table->timestamps();
        });

        Schema::create('gallery_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('gallery_id')->constrained()->cascadeOnDelete();
            $table->string('image_path');
            $table->string('caption')->nullable();
            $table->timestamps();
        });

        Schema::create('teachers', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('nip', 30)->nullable();
            $table->string('position', 100);
            $table->string('subject', 100)->nullable();
            $table->string('photo')->nullable();
            $table->unsignedSmallInteger('sort')->default(0);
            $table->timestamps();
        });

        Schema::create('facilities', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('description')->nullable();
            $table->string('image')->nullable();
            $table->timestamps();
        });

        Schema::create('pages', function (Blueprint $table) {
            $table->id();
            $table->string('key', 50)->unique();
            $table->string('title');
            $table->longText('content')->nullable();
            $table->string('image')->nullable();
            $table->timestamps();
        });

        Schema::create('settings', function (Blueprint $table) {
            $table->id();
            $table->string('key', 80)->unique();
            $table->text('value')->nullable();
            $table->timestamps();
        });

        Schema::create('activity_logs', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->nullable()->constrained()->nullOnDelete();
            $table->string('action', 30);
            $table->string('subject_type', 80)->nullable();
            $table->unsignedBigInteger('subject_id')->nullable();
            $table->string('description');
            $table->string('ip_address', 45)->nullable();
            $table->timestamp('created_at')->useCurrent();
        });
    }

    public function down(): void
    {
        foreach (['activity_logs', 'settings', 'pages', 'facilities', 'teachers', 'gallery_items', 'galleries', 'achievements', 'statistics'] as $t) {
            Schema::dropIfExists($t);
        }
    }
};
