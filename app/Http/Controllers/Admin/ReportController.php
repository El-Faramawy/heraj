<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Traits\NotificationTrait;
use App\Models\Report;
use App\Models\User;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class ReportController extends Controller
{
    use NotificationTrait;

    public function index(Request $request)
    {
        if ($request->ajax()) {
            $reports = Report::latest()->get();
            return Datatables::of($reports)
                ->addColumn('action', function ($item) {
                    if (in_array(21, admin()->user()->permission_ids)) {
                        return '
                        <button class="btn btn-default btn-danger btn-sm mb-2 mb-xl-0 delete"
                             data-id="' . $item->id . '" ><i class="fa fa-trash-o text-white"></i>
                        </button>
                       ';
                    }
                })->editColumn('type', function ($item) {
                    if ($item->type == 'product') return 'منتج';
                    elseif ($item->type == 'user') return 'مستخدم';
                    elseif ($item->type == 'comment') return 'كومنت';
                    else return 'رد على كومنت';
                })->editColumn('reporter_user', function ($item) {
                    return $item->reporter_user ? '<a href="' . url("admin/users?user_id=" . $item->reporter_user->id) . '" >' . $item->reporter_user->name . '</a>' : '';
                })->editColumn('user', function ($item) {
                    if ($item->type == 'product') $user =  $item->product?->user;
                    elseif ($item->type == 'user') $user =  $item->user;
                    elseif ($item->type == 'comment') $user =  $item->comment?->user;
                    else $user =  $item->reply?->user;
                    return $user ? '<a href="' . url("admin/users?user_id=" . $user->id) . '" >' . $user->name . '</a>' : '';
                })->editColumn('product', function ($item) {
                    return $item->product ? $item->product->name . '<br> # ' . $item->product->id : '';
                })->editColumn('comment', function ($item) {
                    return $item->comment->comment ?? '';
                })->editColumn('reply', function ($item) {
                    return $item->reply->reply ?? '';
                })->addColumn('checkbox', function ($item) {
                    return '<input type="checkbox" class="sub_chk" data-id="' . $item->id . '">';
                })
                ->escapeColumns([])
                ->make(true);
        }

        return view('Admin.Report.index');
    }

    ################ multiple Delete  #################
    public function multiDelete(Request $request)
    {
        $ids = explode(",", $request->ids);
        Report::whereIn('id', $ids)->delete();

        return response()->json(
            [
                'code' => 200,
                'message' => 'تم الحذف بنجاح'
            ]);
    }

    ################ Delete Contact #################
    public function destroy(Report $report)
    {
        $report->delete();
        return response()->json(
            [
                'code' => 200,
                'message' => 'تم الحذف بنجاح'
            ]);
    }

}
