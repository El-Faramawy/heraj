<?php

namespace App\Http\Controllers\Api\User;

use App\Enums\UserTypeEnum;
use App\Http\Controllers\Controller;
use App\Http\Traits\PaginateTrait;
use App\Models\VerifyAccount;
use App\Models\VerifyAccountImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Models\User;
use App\Models\PhoneToken;
use App\Http\Traits\PhotoTrait;
use App\Http\Traits\SmsTrait;

class AuthController extends Controller
{
    use PhotoTrait, PaginateTrait,SmsTrait;

    public function login(Request $request)
    {
        try {
            // validation
            $validator = Validator::make($request->all(), [
                'phone_code' => 'required',
                'phone' => 'required',
                'password' => 'required',
            ]);
            if ($validator->fails()) {
                return $this->apiResponse(null, $validator->errors(), 'simple', '422');
            }

            $data = $request->only('phone_code', 'phone', 'password', 'fcm_token');

            $credentials = ['phone_code' => $data['phone_code'], 'phone' => $data['phone'], 'password' => $data['password']];
            $token = user_api()->attempt($credentials);
            if ($token) {
                $user = User::where('id', user_api()->user()->id)->first();
                $user->token = $token;
                PhoneToken::updateOrCreate([
                    'user_id' => $user->id,
                    'phone_token' => $data['fcm_token'],
                    'type' => 'android',
                ]);
                return $this->apiResponse($user, '', 'simple');
            } else {
                return $this->apiResponse(null, 'خطا فى البيانات  ', 'simple', '409');
            }

        } catch (\Exception $ex) {
            return $this->apiResponse($ex->getCode(), $ex->getMessage(), 'simple', '422');
        }

    }

    //=======================================================================================================

    public function register(Request $request)
    {
        try {
            // validation
            $validator = Validator::make($request->all(), [
                'phone' => 'required|unique:users,phone',
                'email'=>'required|unique:users,email',
                'phone_code' => 'required',
                'name' => 'required',
                'password' => 'required'
            ]);
            if ($validator->fails()) {
                return $this->apiResponse(null, $validator->errors(), 'simple', '422');
            }
            $data = $request->except('fcm_token');
            $data['password'] = Hash::make($request->password);
            $data['type'] = UserTypeEnum::USER;
            if ($request->image && $request->image != null)
                $data['image'] = $this->saveImage($request->image, 'uploads/user');
            $user = User::create($data);

            $token = user_api()->login($user); // generate token
            $user = User::where('id', $user->id)->first();
            $user->token = $token;

            PhoneToken::updateOrCreate([
                'user_id' => $user->id,
                'phone_token' => $request->fcm_token,
                'type' => 'android',
            ]);

            return $this->apiResponse($user, '', 'simple');

        } catch (\Exception $ex) {
            return $this->apiResponse($ex->getCode(), $ex->getMessage(), 'simple', '422');
        }

    }

    //===========================================
    public function profile(Request $request)
    {
        $user = User::where('id', user_api()->user()->id)->first();
        $user->token = getToken();
        return $this->apiResponse($user, '', 'simple');
    }

    //===========================================
    public function update_profile(Request $request)
    {
        // validation
        $validator = Validator::make($request->all(), [
            'phone' => 'required|unique:users,phone,' . user_api()->user()->id,
            'phone_code' => 'required',
            'name' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $data = $request->except('password', 'image');
        if ($request->password && $request->password != null) {
            $data['password'] = Hash::make($request->password);
        }
        $user = User::where('id', user_api()->user()->id)->first();
        if ($request->image && $request->image != null)
            $data['image'] = $this->saveImage($request->image, 'uploads/user', $user->getAttributes()['image']);

        $user->update($data);
        $user->token = getToken();

        return $this->apiResponse($user, '', 'simple');

    }

    //=======================================================================================================
    public function logout(Request $request)
    {
        $validator = Validator::make($request->all(), [ // <---
            'token' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }

        if (!\auth()->check()) {
            return $this->apiResponse(null, 'logout once or token is not valid', 'simple');
        }

        PhoneToken::where(['user_id' => user_api()->user()->id, 'phone_token' => $request->token])->delete();

        $token = getToken();
        if ($token != null) {
            try {
                JWTAuth::setToken($token)->invalidate(); // logout user
                return $this->apiResponse(null, 'logout done', 'simple');
            } catch (TokenInvalidException $e) {
                return $this->apiResponse(null, 'done', 'simple');
            }
        } else {
            return $this->apiResponse(null, 'done', 'simple');
        }
    }

    //=======================================================================================================
    public function deleteAccount(Request $request)
    {
        $validator = Validator::make($request->all(), [ // <---
            'token' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }

        if (!\auth()->check()) {
            return $this->apiResponse(null, 'logout once or token is not valid', 'simple');
        }

        PhoneToken::where(['user_id' => user_api()->user()->id, 'phone_token' => $request->token])->delete();

        Auth::user()->delete();
        return $this->apiResponse(null, 'done', 'simple');

    }

    //=======================================================================================================

    public function verify_account(Request $request)
    {
        $validator = Validator::make($request->all(), [ // <---
            'image1' => 'required',
            'image2' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $data = [];
        $data['user_id'] = user_api()->id();
        $data['image1'] =  $this->saveImage($request->image1, 'uploads/VerifyAccount');
        $data['image2'] =  $this->saveImage($request->image2, 'uploads/VerifyAccount');
        $verify_account = VerifyAccount::create($data);
        if (isset($request->images)) {
            foreach ($request->images as $image) {
                VerifyAccountImage::create([
                    'user_id' => user_api()->id(),
                    'image' => $this->saveImage($image, 'uploads/VerifyAccountImage')
                ]);
            }
        }
        return $this->apiResponse($verify_account, 'done', 'simple');

    }
    
    public function ConfirmCode(Request $request ){
        $validator = Validator::make($request->all(), [ // <---
            'code' => 'required',
            'hashed_code' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null,$validator->errors(),'simple','422');
        }
        if(Hash::check($request->code, $request->hashed_code)){
            return $this->apiResponse(null,'correct','simple');
        }else{
            return $this->apiResponse(null,' الكود خطا','simple',409);
        }
    }
    
    public function get_code(Request $request){
        $validator = Validator::make($request->all(), [ // <---
            'phone' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null,$validator->errors(),'simple','422');
        }
        if (strlen($request->phone) == 11){
            return $this->apiResponse(Hash::make('111111'),'code sent successfully','simple');
        }else{
            $code = rand('100000', '999999');
            $this->sendOtp(strval($request->phone),' رمز تاكيد الهاتف لتطبيق Haraj Stations هو '.$code);
            return $this->apiResponse(["code"=>Hash::make($code),"code2"=>$code],'code sent successfully','simple');
        }
    }
    public function checkPhoneRegister(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'phone' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $user = User::where('phone', $request->phone)->first();
        if($user){
            return $this->apiResponse('', 'هذا الرقم مستخدم بالفعل', 'simple',401);
        }
        $code = rand('100000', '999999');
            $this->sendOtp(strval($request->phone_code.$request->phone),' رمز تاكيد الهاتف لتطبيق Haraj Stations هو '.$code);
        return $this->apiResponse(["code"=>Hash::make($code),"code2"=>$code], '', 'simple');
    }



}
