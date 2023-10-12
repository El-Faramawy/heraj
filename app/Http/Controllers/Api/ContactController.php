<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Traits\PaginateTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Contact;

class ContactController extends Controller
{
    use PaginateTrait;
    public function contact_us(Request $request){
        $validator = Validator::make($request->all(),[
            'name'=>'required',
            'mail'=>'required',
            'subject'=>'required',
            'message'=>'required',
        ]);
        if ($validator->fails()){
            return $this->apiResponse(null, $validator->errors(), 'simple', '422');
        }
        $data = $request->only('name','mail','subject','message');
        $contact = Contact::create($data);

        return $this->apiResponse($contact);

    }

    //**************************************************************************
    //***********************************************************************************
    //*************************************************************************
    public function contact_with_user(Request $request){
        $validator = Validator::make($request->all(),[
            'name'=>'required',
            'mail'=>'required',
            'subject'=>'required',
            'message'=>'required',
        ]);
        if ($validator->fails()){
            return apiResponse(null,$validator->errors(),'422');
        }
        $data = $request->only('name','mail','subject','message');
            $data['user_id'] = user_api()->user()->id;
        $contact = Contact::create($data);

        return apiResponse($contact);

    }
}
