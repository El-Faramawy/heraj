<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Http\Traits\PaginateTrait;
use App\Http\Traits\WithRelationTrait;
use App\Models\Favourate;
use App\Models\Following;
use App\Models\Report;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ReportController extends Controller
{
    use PaginateTrait;

    public function add_report(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'message' => 'required',
            'type' => 'required',
            'type_id' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $data = $request->only('message','type','type_id');
        $data['user_id'] = user_api()->user()->id;
        $report = Report::create($data);

        return $this->apiResponse($report, 'done', 'simple');
    }


}
