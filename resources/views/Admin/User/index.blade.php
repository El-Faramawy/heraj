@extends('layouts.admin.app')
@section('page_title') المستخدمين @endsection
<link href="{{url('admin')}}/assets/plugins/select2/select2.min.css" rel="stylesheet"/>
@section('content')
    <div class="row">
        <div class="col-md-12 col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title" >المستخدمين</h3>
                    <div class="mr-auto pageheader-btn">
                        @if(in_array(7,admin()->user()->permission_ids))
                            <a href="#" id="multiDeleteBtn" class="btn btn-danger btn-icon text-white">
                                            <span>
                                                <i class="fa fa-trash-o"></i>
                                            </span> حذف المحدد
                            </a>
                        @endif
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="exportexample" class="table table-striped table-responsive-lg  card-table table-vcenter text-nowrap mb-0 table-primary align-items-center mb-0">
                            <thead class="bg-primary text-white">
                            <tr>
                                <th class="text-white"><input type="checkbox" id="master"></th>
                                <th class="text-white">#</th>
                                <th class="text-white">الصورة</th>
                                <th class="text-white">الاسم</th>
                                <th class="text-white">رقم الهاتف</th>
                                <th class="text-white">النقاط</th>
                                <th class="text-white">المحفظة</th>
                                <th class="text-white">الطلبات</th>
                                <th class="text-white">حظر</th>
                                <th class="text-white">تحكم</th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>


                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
@push('admin_js')
    <script>
        var  columns =[
            {data: 'checkbox', name: 'checkbox', orderable: false, searchable: false},
            {data: 'id', name: 'id'},
            {data: 'image', name: 'image'},
            {data: 'name', name: 'name'},
            {data: 'phone', name: 'phone'},
            {data: 'points', name: 'points'},
            {data: 'wallet', name: 'wallet'},
            {data: 'orders', name: 'orders'},
            {data: 'block', name: 'block'},
            {data: 'action', name: 'action', orderable: false, searchable: false},
        ];
        //======================== addBtn =============================

    </script>
    @include('layouts.admin.inc.ajax',['url'=>'users'])
    @include('Admin.User.parts.block',['url'=>'users'])

    <script>
        // Make Better Using Ajax
        var timer = null;
        $(document).on('focusin  ', '.points_number', function (event) {
            var old_val = $(this).val();
            // $(document).on('change focusout ', '.points_number' , function (event) {
            $(document).on('keyup  ', '.points_number', function (event) {
                clearTimeout(timer);
                var id = $(this).attr("data_id")
                var points_number = $(this).val()
                var url = $(this).attr("href")
                if (old_val != points_number && points_number != '') {
                    timer = setTimeout(function () {
                        $.ajax({
                            type: 'POST',
                            url: url,
                            data: {
                                '_token': "{{csrf_token()}}",
                                'id': id,
                                'points': points_number,
                            },
                            success: function (data) {
                                if (data.success == 'true') {
                                    my_toaster(data.message)
                                    $('#exportexample').DataTable().ajax.reload(null, false);
                                }
                            }
                        })
                    }, 3000)
                }
            });
            // });
        });
    </script>


@endpush
