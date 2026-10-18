<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ActivityLog;

class ActivityLogController extends Controller
{
    public function __invoke()
    {
        return view('admin.logs', ['logs' => ActivityLog::with('user')->latest('created_at')->paginate(25)]);
    }
}
