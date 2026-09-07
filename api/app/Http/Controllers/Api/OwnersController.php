<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Owner;

class OwnersController extends Controller
{
    public function index()
    {
        return Owner::orderBy("name", "asc")->get();
    }
}
