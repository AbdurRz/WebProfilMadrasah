<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Statistic extends Model
{
    protected $fillable = ['academic_year', 'group', 'label', 'value', 'sort'];

    protected $casts = ['value' => 'integer'];
}
