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
use App\Models\Rate;
use Illuminate\Support\Facades\File;
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
            'sub_category_id' => 'exists:sub_categories,id',
            'price' => 'required',
            'name' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $productCount = Product::whereDate('created_at',date('Y-m-d'))
            ->where('user_id',user_api()->id())->count();
        if (user_api()->user()->package){
            if (user_api()->user()->package->daily_ads > $productCount){
                $data = $request->except('images');
                $data['user_id'] = user_api()->id();
                $product = Product::create($data);
            }else {
                return $this->apiResponse(null, 'نفذت محاولاتك لاضافة اعلان اليوم', 'simple', '422');
            }
        }elseif ($productCount == 0){
            $data = $request->except('images');
            $data['user_id'] = user_api()->id();
            $product = Product::create($data);
        }else{
            return $this->apiResponse(null, 'نفذت محاولاتك لاضافة اعلان اليوم', 'simple', '422');
        }


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
    public function update(Request $request , $id)
    {
        $validator = Validator::make($request->all(), [
            'description' => 'required',
//            'id' => 'required|exists:products,id',
            'city_id' => 'required|exists:cities,id',
            'area_id' => 'required|exists:areas,id',
            'category_id' => 'required|exists:categories,id',
            'sub_category_id' => 'exists:sub_categories,id',
            'price' => 'required',
            'name' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $data = $request->except('images');
        $data['user_id'] = user_api()->id();
        $product = Product::find($id)->update($data);
        $product = Product::find($id);
        if (isset($request->images)){
            $productImage = ProductImage::where('product_id',$id)->get();
            foreach($productImage as $im){
                $image = $im->image;
                $path =strstr($image,"uploads/productImage");
                if(File::exists($path)) {
                    File::delete($path);
                }
                $im->delete();
            }
            foreach ($request->images as $key=>$image) {
                $productImage = ProductImage::create([
                    'product_id' => $id,
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
        $product = Product::where('id',$request->id)->with('user', 'category', 'sub_category', 'city','images','comments.user','comments.replies.user')->first();
        $product->similar_products = Product::where('category_id',$product->category_id)
            ->inRandomOrder()->limit(9)->select('id','image')->get();
        if (user_api()->check()){
            $product->is_rate = Rate::where(['product_id'=>$product->id , 'user_id'=>user_api()->id()])->first();
        }else{
            $product->is_rate = null;
        }
        $user = User::where('id',$product->user_id)->first();
        $user->update(['views'=> $user->views + 1]);
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
