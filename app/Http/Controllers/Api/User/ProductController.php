<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Http\Traits\PaginateTrait;
use App\Http\Traits\PhotoTrait;
use App\Http\Traits\WithRelationTrait;
use App\Models\Addition;
use App\Models\AdditionCategory;
use App\Models\Category;
use App\Models\Market;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    use WithRelationTrait, PaginateTrait, PhotoTrait;

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'description' => 'required',
            'city_id' => 'required|exists:cities,id',
            'area_id' => 'required|exists:areas,id',
            'category_id' => 'required|exists:categories,id',
            'sub_category_id' => 'required|exists:sub_categories,id',
            'price' => 'required',
            'name' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $data = $request->except('images');
        $data['user_id'] = user_api()->id();
        $product = Product::create($data);

        if (isset($request->images)){
            foreach ($request->images as $key=>$image) {
                $productImage = ProductImage::create([
                    'product_id' => $product->id,
                    'image' => $this->saveImage($image, 'uploads/productImage')
                ]);
                if ($key == 0){
                    $product['image'] = $productImage->image;
                    $product->save();
                }
            }
        }

        $product = Product::where('id', $product->id)->with($this->productRelations())->first();
        return $this->apiResponse($product, '', 'simple');

    }
    //===================================================
    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'description' => 'required',
            'id' => 'required|exists:products,id',
            'city_id' => 'required|exists:cities,id',
            'area_id' => 'required|exists:areas,id',
            'category_id' => 'required|exists:categories,id',
            'sub_category_id' => 'required|exists:sub_categories,id',
            'price' => 'required',
            'name' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $data = $request->except('images');
        $data['user_id'] = user_api()->id();
        $product = Product::find($request->id)->update($data);

        if (isset($request->images)){
            foreach ($request->images as $key=>$image) {
                $productImage = ProductImage::create([
                    'product_id' => $product->id,
                    'image' => $this->saveImage($image, 'uploads/productImage')
                ]);
                if ($key == 0){
                    $product['image'] = $productImage->image;
                    $product->save();
                }
            }
        }

        $product = Product::where('id', $request->id)->with($this->productRelations())->first();
        return $this->apiResponse($product, '', 'simple');

    }
    //===================================================
    public function one_product(Request $request){
        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:products,id',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $product = Product::where('id',$request->id)->with('user', 'category', 'sub_category', 'city','images','comments.replies')->first();
        $product->similar_products = Product::where('category_id',$product->category_id)
            ->inRandomOrder()->limit(9)->select('id','image')->get();
        return $this->apiResponse($product, '', 'simple');
    }
    //===================================================
    public function user_products(Request $request){
        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:users,id',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $user = User::where('id', $request->id)->
        with('user_products.category', 'user_products.sub_category', 'user_products.city')->first();
        $category_ids = array_unique($user->user_products->pluck('category_id')->toArray());
        $user->categories = Category::whereIn('id', $category_ids)->get();
        foreach ($user->categories as $category) {
            $category->products = $user->user_products()->where('category_id', $category->id)
                ->with('category', 'sub_category', 'city')->get();
        }
        return $this->apiResponse($user, '', 'simple');
    }
    //===================================================
    public function delete(Request $request){
        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:products,id',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        Product::where('id',$request->id)->delete();
        return $this->apiResponse('done', '', 'simple');
    }

}
