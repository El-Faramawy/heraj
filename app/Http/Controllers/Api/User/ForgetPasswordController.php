<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Http\Traits\PaginateTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\User;

class ForgetPasswordController extends Controller
{
    use PaginateTrait;

    //===========================================
    public function update_password(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required|exists:users,phone',
            'password' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }

        $user = User::where('phone', $request->phone)->first();
        if ($request->password && $request->password != null) {
            $user->update(['password'=>Hash::make($request->password)]);
        }

        return $this->apiResponse($user, '', 'simple');

    }
    //===========================================
    public function checkPhone(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required|exists:users,phone',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $user = User::where('phone', $request->phone)->first();
        return $this->apiResponse($user, '', 'simple');
    }


}
