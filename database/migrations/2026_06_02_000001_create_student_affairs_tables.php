<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('documents', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->enum('category', ['silabus', 'formulir', 'regulasi', 'lainnya'])->default('lainnya')->index();
            $table->string('description', 500)->nullable();
            $table->string('file');
            $table->unsignedInteger('downloads')->default(0);
            $table->boolean('is_published')->default(true);
            $table->timestamps();
        });

        Schema::create('extracurriculars', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('slug')->unique();
            $table->enum('category', ['keagamaan', 'olahraga', 'seni', 'akademik', 'kepanduan'])->default('akademik');
            $table->string('coach_name')->nullable();
            $table->string('schedule')->nullable();
            $table->string('location')->nullable();
            $table->text('description')->nullable();
            $table->string('cover_image')->nullable();
            $table->foreignId('gallery_id')->nullable()->constrained()->nullOnDelete();
            $table->timestamps();
        });

        Schema::create('osim_members', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('position', 100);
            $table->string('class_name', 20)->nullable();
            $table->string('period', 9);
            $table->string('photo')->nullable();
            $table->unsignedSmallInteger('sort')->default(0);
            $table->timestamps();
        });

        Schema::create('ppdb_registrations', function (Blueprint $table) {
            $table->id();
            $table->string('registration_number', 20)->unique();
            $table->string('academic_year', 9)->index();
            $table->string('full_name');
            $table->string('nisn', 10);
            $table->enum('gender', ['L', 'P']);
            $table->string('birth_place', 100);
            $table->date('birth_date');
            $table->string('previous_school');
            $table->text('address');
            $table->string('parent_name');
            $table->string('parent_phone', 20);
            $table->string('email')->nullable();
            $table->text('achievement_note')->nullable();
            $table->string('doc_kk')->nullable();
            $table->string('doc_rapor')->nullable();
            $table->enum('status', ['baru', 'diverifikasi', 'diterima', 'ditolak'])->default('baru')->index();
            $table->text('admin_note')->nullable();
            $table->timestamps();
            $table->unique(['academic_year', 'nisn']);
        });
    }

    public function down(): void
    {
        foreach (['ppdb_registrations', 'osim_members', 'extracurriculars', 'documents'] as $t) {
            Schema::dropIfExists($t);
        }
    }
};
