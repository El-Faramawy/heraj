<?php

namespace App\Http\Controllers\Api\User;

use App\Enums\ProductTypeEnum;
use App\Http\Controllers\Controller;
use App\Http\Traits\PaginateTrait;
use App\Http\Traits\WithRelationTrait;
use App\Models\Category;
use App\Models\City;
use App\Models\Delivery;
use App\Models\Market;
use App\Models\Product;
use App\Models\Slider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class HomeController extends Controller
{
    use WithRelationTrait, PaginateTrait;

    public function index(Request $request)
    {
        $data = [];
        $slider = Product::where('has_ad', 1)->select('id', 'image');
        $data['sliders'] = $this->apiResponse($slider);
        $products = Product::inRandomOrder()->limit(20)/*->select('id','image','name','created_at','price')*/
        ->with('user', 'category', 'sub_category', 'city');
        $data['products'] = $this->apiResponse($products);
        $categories = Category::with($this->categoryRelations());
        $data['categories'] = $this->apiResponse($categories);
        $cities = City::with($this->cityRelations());
        $data['cities'] = $this->apiResponse($cities);

        return $this->apiResponse($data, null, 'simple');
    }

    //================================================================

    public function product_search(Request $request)
    {
        $products = Product::query();
        if (isset($request->category_id)) {
            $products->where('category_id', $request->category_id);
        }
        if (isset($request->sub_category_id)) {
            $products->where('sub_category_id', $request->sub_category_id);
        }
        if (isset($request->city_id)) {
            $products->where('city_id', $request->city_id);
        }
        if (isset($request->area_id)) {
            $products->where('area_id', $request->area_id);
        }
        if (isset($request->type)) {
            $products->where('type', $request->type);
        }else {
            $products->where('type', ProductTypeEnum::USER);
        }
        $products = $products->with('user', 'category', 'sub_category', 'city');
        return $this->apiResponse($products);
    }
    //================================================================
}
