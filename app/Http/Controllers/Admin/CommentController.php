<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ProductComment;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class CommentController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()){
            $areas =ProductComment::where('product_id',$request->product_id)->latest()->get();
            return Datatables::of($areas)
                ->escapeColumns([])
                ->make(true);
        }
        return view('Admin.Comment.index');
    }

}
