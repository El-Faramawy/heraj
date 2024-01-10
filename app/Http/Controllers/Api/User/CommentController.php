<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Http\Traits\NotificationTrait;
use App\Http\Traits\PaginateTrait;
use App\Models\ProductComment;
use App\Models\ProductReply;
use App\Models\Rate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CommentController extends Controller
{
    use  PaginateTrait;
    use  NotificationTrait;

    public function add_comment(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
            'comment' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $data = $request->only('comment', 'product_id');
        $data['user_id'] = user_api()->id();
        $comment = ProductComment::create($data);

        $comment = ProductComment::where('id',$comment->id)->with('user')->first();
        $this->sendFCMNotification([$comment->product->user_id], 'لديك كومنت جديد', $comment->comment );

        return $this->apiResponse($comment, 'done', 'simple');
    }

    //================================================================
    public function add_reply(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'comment_id' => 'required|exists:product_comments,id',
            'reply' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $data = $request->only('comment_id', 'reply');
        $data['user_id'] = user_api()->id();
        $comment = ProductReply::create($data);

        $comment = ProductReply::where('id',$comment->id)->with('user')->first();
        $this->sendFCMNotification([$comment->user_id], 'لديك رد جديد', $comment->reply );

        return $this->apiResponse($comment, 'done', 'simple');
    }

    //================================================================
    public function add_rate(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required|exists:products,id',
            'comment' => 'required',
            'rate1' => 'required',
            'rate2' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $rate = Rate::where(['product_id' => $request->product_id, 'user_id' => user_api()->id()])->first();
        if ($rate) {
            return $this->apiResponse(null, 'لقد سجلت تقييمك من قبل', 'simple', '422');
        }
        $data = $request->all();
        $data['user_id'] = user_api()->id();
        $storedData = Rate::create($data);

        return $this->apiResponse($storedData, 'done', 'simple');
    }
    //================================================================

}
