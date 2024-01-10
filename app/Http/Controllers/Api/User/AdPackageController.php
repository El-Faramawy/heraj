<?php

namespace App\Http\Controllers\Api\User;

use App\Enums\UserTypeEnum;
use App\Http\Controllers\Controller;
use App\Http\Traits\PaginateTrait;
use App\Http\Traits\PhotoTrait;
use App\Http\Traits\WithRelationTrait;
use App\Models\Category;
use App\Models\Package;
use App\Models\Product;
use App\Models\User;
use App\Models\UserPackage;
use App\Models\UserRate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PackageController extends Controller
{
    use WithRelationTrait, PaginateTrait, PhotoTrait;

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'package_id' => 'required|exists:packages,id',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }

        $data = $request->only('package_id');
        $package = Package::where('id', $request->package_id)->first();
        $data['user_id'] = user_api()->user()->id;

        $userOldPackage = user_api()->user()->package;
        if ($userOldPackage){
            if ($userOldPackage->id == $package->id){
                if (date('Y-m-d') >= $userOldPackage->end_date){
                    $data['start_date'] = date('Y-m-d');
                    $data['end_date'] = date('Y-m-d', strtotime('+' . $package->period . 'month'));
                }else{
                    $data['start_date'] = $userOldPackage->end_date;
                    $data['end_date'] = date('Y-m-d', strtotime($userOldPackage->end_date .'+' . $package->period . 'month'));
                }
            }else{
                $data['start_date'] = date('Y-m-d');
                $data['end_date'] = date('Y-m-d', strtotime('+' . $package->period . 'month'));
            }

        }else{
            $data['start_date'] = date('Y-m-d');
            $data['end_date'] = date('Y-m-d', strtotime('+' . $package->period . 'month'));
        }
        UserPackage::where('user_id',user_api()->id())->delete();
        $userPackage = UserPackage::create($data);

        return $this->apiResponse($userPackage, '', 'simple');
    }

    //================================================================
    public function addPannerAd(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $product = Product::where('id', $request->product_id)->first();
        $productCount = Product::where(['has_ad' => 1, 'user_id' => user_api()->id()])->count();
        if (user_api()->user()->package) {
            if (user_api()->user()->package->panner_ads > $productCount) {
                $product->update(['has_ad'=> 1]);
                return $this->apiResponse($product, '', 'simple');
            } else {
                return $this->apiResponse(null, 'نفذت محاولاتك لاضافة اعلان ', 'simple', '422');
            }
        }
        return $this->apiResponse(null, 'نفذت محاولاتك لاضافة اعلان ', 'simple', '422');

    }
    //================================================================
    public function deletePannerAd(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $product = Product::where('id', $request->product_id)->first();
        $product->update(['has_ad'=> 0]);
        return $this->apiResponse($product, '', 'simple');

    }

    //================================================================
    public function packages()
    {
        $data = Package::query();
        return $this->apiResponse($data);
    }
}
