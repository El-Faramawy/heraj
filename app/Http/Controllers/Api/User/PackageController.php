<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Http\Traits\PaginateTrait;
use App\Http\Traits\PhotoTrait;
use App\Http\Traits\WithRelationTrait;
use App\Models\AdPackage;
use App\Models\Package;
use App\Models\Product;
use App\Models\UserAdPackage;
use App\Models\UserPackage;
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
        $data['start_date'] = date('Y-m-d');

        $userOldPackage = user_api()->user()->package;
        if ($userOldPackage) {
            if ($userOldPackage->id == $package->id) {
                if (date('Y-m-d') >= $userOldPackage->end_date) {
//                    $data['start_date'] = date('Y-m-d');
                    $data['end_date'] = date('Y-m-d', strtotime('+' . ($package->period+$package->free_months_number) . 'month'));
                } else {
//                    $data['start_date'] = $userOldPackage->end_date;
                    $data['end_date'] = date('Y-m-d', strtotime($userOldPackage->end_date . '+' . ($package->period+$package->free_months_number) . 'month'));
                }
            } else {
//                $data['start_date'] = date('Y-m-d');
                $data['end_date'] = date('Y-m-d', strtotime('+' . ($package->period+$package->free_months_number) . 'month'));
            }

        } else {
//            $data['start_date'] = date('Y-m-d');
            $data['end_date'] = date('Y-m-d', strtotime('+' . ($package->period+$package->free_months_number) . 'month'));
        }
        UserPackage::where('user_id', user_api()->id())->delete();
        $userPackage = UserPackage::create($data);

        return $this->apiResponse($userPackage, '', 'simple');
    }

    //================================================================
    public function ad_store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'package_id' => 'required|exists:ad_packages,id',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }

        $data = $request->only('package_id');
        $package = AdPackage::where('id', $request->package_id)->first();
        $data['user_id'] = user_api()->user()->id;
        $data['start_date'] = date('Y-m-d');

        $userOldPackage = user_api()->user()->ad_package;
        if ($userOldPackage) {
            if ($userOldPackage->id == $package->id) {
                if (date('Y-m-d') >= $userOldPackage->end_date) {
//                    $data['start_date'] = date('Y-m-d');
                    $data['end_date'] = date('Y-m-d', strtotime('+' . $package->period . 'month'));
                } else {
//                    $data['start_date'] = $userOldPackage->end_date;
                    $data['end_date'] = date('Y-m-d', strtotime($userOldPackage->end_date . '+' . $package->period . 'month'));
                }
            } else {
//                $data['start_date'] = date('Y-m-d');
                $data['end_date'] = date('Y-m-d', strtotime('+' . $package->period . 'month'));
            }

        } else {
//            $data['start_date'] = date('Y-m-d');
            $data['end_date'] = date('Y-m-d', strtotime('+' . $package->period . 'month'));
        }
        UserAdPackage::where('user_id', user_api()->id())->delete();
        $userAdPackage = UserAdPackage::create($data);

        return $this->apiResponse($userAdPackage, '', 'simple');
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
        if (user_api()->user()->ad_package) {
            if (user_api()->user()->ad_package->panner_ads > $productCount) {
                $product->update(['has_ad' => 1]);
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
        $product->update(['has_ad' => 0]);
        return $this->apiResponse($product, '', 'simple');

    }

    //================================================================
    public function packages()
    {
        $data = Package::query();
        return $this->apiResponse($data);
    }

    //================================================================
    public function ad_packages()
    {
        $data = AdPackage::query();
        return $this->apiResponse($data);
    }

    public function create_payment(Request $request)
    {
        $currentTimestamp = time();
        $url = 'https://secure.telr.com/gateway/order.json';

        $data = [
            "method" => "create",
            "store" => 29511,
            "authkey" => "Rfqk-czBQ4^XTXPf",
            "language"=>"ar",
            "framed" => 0,
            "order" => [
                "cartid" => $currentTimestamp,
                "test" => "1",
                "amount" => $request->amount,
                "currency" => "SAR",
                "description" => "My purchase"
            ],
            "customer" => [
                "email" => $request->email,
                "phone" => $request->phone,
                "ref" => "",
                "name" => [
                    "forenames" => "",
                    "surname" => "",
                ],
                "address" => [
                    "line1" => "SA",
                    "line2" => "Saudi Arabia",
                    "city" => "Riyadh",
                    "country" => "Saudi Arabia",
                    "state" => "Riyadh",
                    "areacode" => "",
                    "mobile" => $request->phone
                ],
            ],
            "return" => [
                "authorised" => "https://www.mysite.com/success",
                "declined" => "https://www.mysite.com/failed",
                "cancelled" => "https://www.mysite.com/cancelled"
            ]
        ];

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            'Content-Type: application/json',
            'accept: application/json',
        ]);

        $response = curl_exec($ch);

        curl_close($ch);
        return $this->apiResponse(json_decode($response), '', 'simple');
    }
}
