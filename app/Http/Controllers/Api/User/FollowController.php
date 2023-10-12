<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Http\Traits\PaginateTrait;
use App\Http\Traits\WithRelationTrait;
use App\Models\Favourate;
use App\Models\Following;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FollowController extends Controller
{
    use WithRelationTrait, PaginateTrait;

    public function add_delete_follow(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'exists:products,id',
            'following_user_id' => 'exists:users,id',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $data = $request->only('product_id','following_user_id');
        $data['follower_user_id'] = user_api()->user()->id;
        $follow = Following::where($data);

        if ($follow->count()>0){
            $follow->delete();
        }else{
            Following::create($data);
        }

        return $this->apiResponse(null, 'done', 'simple');
    }


}
