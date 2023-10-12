<?php

namespace App\Http\Controllers\Api\User;

use App\Enums\UserTypeEnum;
use App\Http\Controllers\Controller;
use App\Http\Traits\PaginateTrait;
use App\Http\Traits\PhotoTrait;
use App\Http\Traits\WithRelationTrait;
use App\Models\Addition;
use App\Models\AdditionCategory;
use App\Models\Category;
use App\Models\Following;
use App\Models\Market;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\Rate;
use App\Models\User;
use App\Models\UserRate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CompanyController extends Controller
{
    use WithRelationTrait, PaginateTrait, PhotoTrait;

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'company_name' => 'required',
            'company_username' => 'required|unique:users,company_username,' . user_api()->user()->id,
            'company_description' => 'required',
//            'company_image' => 'required',
//            'company_panner' => 'required'
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $data = $request->all();
        $data['type'] = UserTypeEnum::USER;
        $user = user_api()->user();
        $user->update($data);

        return $this->apiResponse($user, '', 'simple');
    }

    //===================================================
    public function one_company(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:users,id',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $user = User::where('id', $request->id)->
        with('company_products.category', 'company_products.sub_category', 'company_products.city')->first();
        $category_ids = array_unique($user->company_products->pluck('category_id')->toArray());
        $user->categories = Category::whereIn('id', $category_ids)->get();
        foreach ($user->categories as $category) {
            $category->products = $user->company_products()->where('category_id', $category->id)
                ->with('category', 'sub_category', 'city')->get();
        }
        return $this->apiResponse($user, '', 'simple');
    }

    //================================================================
    public function product_search(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:users,id',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $user = User::where('id', $request->id)->
        with('company_products.category', 'company_products.sub_category', 'company_products.city')->first();
        if (isset($request->category_id)) {
            $user->company_products->where('category_id', $request->category_id);
        }
        if (isset($request->text)) {
            $user->company_products->where('name', 'like', '%' . $request->text . '%');
        }
        return $this->apiResponse($user->company_products, '', 'simple');
    }

    //================================================================
    public function add_rate(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
            'comment' => 'required',
            'rate' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $rate = UserRate::where(['rated_user_id' => $request->user_id, 'user_id' => user_api()->id()])->first();
        if ($rate) {
            return $this->apiResponse(null, 'لقد سجلت تقييمك من قبل', 'simple', '422');
        }
        $data = $request->all();
        $data['user_id'] = user_api()->id();
        $data['rated_user_id'] = $request->user_id;
        $storedData = UserRate::create($data);

        return $this->apiResponse($storedData, 'done', 'simple');
    }

    //================================================================
    public function followers(Request $request)
    {
        $follows = Following::where('following_user_id', user_api()->id())->with('following_user');
        return $this->apiResponse($follows);
    }
}
