<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class DeleteUsersController extends Controller
{
    public function delete_users(){
        User::where('id','!=',0)->delete();
        return apiResponse(null, 'done');
    }
}
