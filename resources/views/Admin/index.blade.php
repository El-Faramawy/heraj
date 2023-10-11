@extends('layouts.admin.app')
@section('page_title') الرئيسية @endsection
<link href="{{url('Admin')}}/assets/plugins/select2/select2.min.css" rel="stylesheet"/>
@section('content')
    @if(in_array(51,admin()->user()->permission_ids))

        <!-- ROW -->
        <div class="row">
            <div class="col-lg-12 ">
                <div class="card">
                    <div class="card-status bg-blue br-tr-7 br-tl-7"></div>
                    <div class="card-header">
                        <div class="card-title">البحث بالتاريخ </div>
                        <div class="card-options">
                            <a href="#" class="card-options-collapse" data-toggle="card-collapse"><i class="fe fe-chevron-up"></i></a>
                            <a href="#" class="card-options-remove" data-toggle="card-remove"><i class="fe fe-x"></i></a>
                        </div>
                    </div>
                    <div class="card-body">
                        <p class="mg-b-20 mg-sm-b-40">اختر تاريخ البداية و النهاية</p>
                        <form class="wd-200 mg-b-30 row" action="{{route('home')}}">
                            <div class="input-group col-5">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fa fa-calendar tx-16 lh-0 op-6"></i>
                                    </div>
                                </div>
                                <input class="form-control fc-datepicker order_filter" name="created_from" value="{{$created_from}}" placeholder="تاريخ البداية " type="text">
                            </div>
                            <div class="input-group col-5">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="fa fa-calendar tx-16 lh-0 op-6"></i>
                                    </div>
                                </div>
                                <input class="form-control fc-datepicker order_filter" name="created_to" value="{{$created_to}}" placeholder="تاريخ النهاية " type="text">
                            </div>
                            <input type="submit" class="btn btn-success-light col-2" value="بحث">
                        </form>
                    </div>
                </div>
            </div>
        </div><!-- COL END -->

        <div class="row">
            <a href="{{in_array(1,admin()->user()->permission_ids) ? route('admins.index') : '#'}}" class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card bg-primary img-card box-primary-shadow">
                    <div class="card-body">
                        <div class="d-flex">
                            <div class="text-white">
                                <h2 class="mb-0 number-font">{{$admin_count}}</h2>
                                <p class="text-white mb-0">المشرفين </p>
                            </div>
                            <div class="mr-auto"> <i class="fa fa-user text-white fs-30 ml-2 mt-2"></i> </div>
                        </div>
                    </div>
                </div>
            </a><!-- COL END -->
            <a href="{{in_array(5,admin()->user()->permission_ids) ? route('users.index') : '#'}}" class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card bg-blue img-card box-primary-shadow">
                    <div class="card-body">
                        <div class="d-flex">
                            <div class="text-white">
                                <h2 class="mb-0 number-font">{{$user_count}}</h2>
                                <p class="text-white mb-0">العملاء </p>
                            </div>
                            <div class="mr-auto"> <i class="fa fa-user text-white fs-30 ml-2 mt-2"></i> </div>
                        </div>
                    </div>
                </div>
            </a><!-- COL END -->

            <a href="{{in_array(60,admin()->user()->permission_ids) ? route('categories.index') : '#'}}" class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card  bg-success img-card box-success-shadow">
                    <div class="card-body">
                        <div class="d-flex">
                            <div class="text-white">
                                <h2 class="mb-0 number-font">{{$category_count}}</h2>
                                <p class="text-white mb-0">المطاعم</p>
                            </div>
                            <div class="mr-auto"> <i class="fa fa-building text-white fs-30 ml-2 mt-2"></i> </div>
                        </div>
                    </div>
                </div>
            </a><!-- COL END -->

            <a href="{{in_array(11,admin()->user()->permission_ids) ? route('deliveries.index') : '#'}}" class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card bg-info img-card box-info-shadow">
                    <div class="card-body">
                        <div class="d-flex">
                            <div class="text-white">
                                <h2 class="mb-0 number-font">{{$order_count}}</h2>
                                <p class="text-white mb-0">المناديب</p>
                            </div>
                            <div class="mr-auto"> <i class="fa fa-motorcycle text-white fs-30 ml-2 mt-2"></i> </div>
                        </div>
                    </div>
                </div>
            </a><!-- COL END -->
            <a href="{{in_array(39,admin()->user()->permission_ids) ? route('orders.index') : '#'}}" class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card bg-info img-card box-info-shadow">
                    <div class="card-body">
                        <div class="d-flex">
                            <div class="text-white">
                                <h2 class="mb-0 number-font">{{$order_count}}</h2>
                                <p class="text-white mb-0">كل الطلبات</p>
                            </div>
                            <div class="mr-auto"> <i class="fa fa-cart-plus text-white fs-30 ml-2 mt-2"></i> </div>
                        </div>
                    </div>
                </div>
            </a><!-- COL END -->
            <a href="{{in_array(19,admin()->user()->permission_ids) ? route('contacts.index') : '#'}}" class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card bg-warning img-card box-primary-shadow">
                    <div class="card-body">
                        <div class="d-flex">
                            <div class="text-white">
                                <h2 class="mb-0 number-font">{{$contact_count}}</h2>
                                <p class="text-white mb-0">رسائل التواصل </p>
                            </div>
                            <div class="mr-auto"> <i class="fa fa-user text-white fs-30 ml-2 mt-2"></i> </div>
                        </div>
                    </div>
                </div>
            </a><!-- COL END -->

            <a href="{{in_array(72,admin()->user()->permission_ids) ? route('sliders.index') : '#'}}" class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card bg-secondary img-card box-secondary-shadow">
                    <div class="card-body">
                        <div class="d-flex">
                            <div class="text-white">
                                <h2 class="mb-0 number-font">{{$slider_count}}</h2>
                                <p class="text-white mb-0">صور العرض</p>
                            </div>
                            <div class="mr-auto"> <i class="fa fa-bar-chart text-white fs-30 ml-2 mt-2"></i> </div>
                        </div>
                    </div>
                </div>
            </a><!-- COL END -->


            <a href="{{in_array(60,admin()->user()->permission_ids) ? route('categories.index') : '#'}}" class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
                <div class="card  bg-green img-card box-success-shadow">
                    <div class="card-body">
                        <div class="d-flex">
                            <div class="text-white">
                                <h2 class="mb-0 number-font">{{$category_count}}</h2>
                                <p class="text-white mb-0">الاقسام</p>
                            </div>
                            <div class="mr-auto"> <i class="fa fa-bars text-white fs-30 ml-2 mt-2"></i> </div>
                        </div>
                    </div>
                </div>
            </a><!-- COL END -->

{{--            <a href="{{in_array(84,admin()->user()->permission_ids) ? route('contacts.index') : '#'}}" class="col-sm-12 col-md-6 col-lg-6 col-xl-3">--}}
{{--                <div class="card  bg-info img-card box-success-shadow">--}}
{{--                    <div class="card-body">--}}
{{--                        <div class="d-flex">--}}
{{--                            <div class="text-white">--}}
{{--                                <h2 class="mb-0 number-font">{{$brand_count}}</h2>--}}
{{--                                <p class="text-white mb-0">الموديلات</p>--}}
{{--                            </div>--}}
{{--                            <div class="mr-auto"> <i class="fa fa-building text-white fs-30 ml-2 mt-2"></i> </div>--}}
{{--                        </div>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--            </a><!-- COL END -->--}}
        </div>
        <!-- ROW -->
        <!-- ROW-2 -->
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xl-12">
                <div class="card overflow-hidden" style="height: 95%!important;">
                    <div class="card-header">
                        <h3 class="card-title">الطلبات المنتهية لمدة 10 أيام</h3>
                    </div>
                    <div class="card-body pb-0">
                        <div class="">
                            <div class="d-flex">
                                <div class="">
                                    <p class="mb-1">الطلبات </p>
                                    <h2 class="mb-1  number-font">{{$total_income}}</h2>
                                    {{--                                    <p class="text-muted  mb-0"><span class="text-muted fs-13 ml-2">(+{{$total_income}})</span> اجمالى المبيعات </p>--}}
                                    {{--                                    <p class="text-muted  mb-0"><span class="text-muted fs-13 ml-2">(+{{$total_profit}})</span> اجمالى الربح </p>--}}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="chart-wrapper">
                        <canvas id="widgetChart1"  class=""></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-12 col-sm-12 col-xl-6">
                <div class="card " style="height: 95%!important;">
                    <div class="card-header">
                        <h3 class="card-title">طلبات حسب الحالة </h3>
                    </div>
                    <div class="card-body">
                        <div class="">
                            <canvas id="canvasDoughnut" class="chartsh"></canvas>
                        </div>
                        <div class="mt-5 fs-12">
                            <div class="float-right ml-3"><span class="dot-label bg-info  ml-1"></span><span class="">جديد</span></div>
                            <div class="float-right ml-3"><span class="dot-label bg-canvas1  ml-1"></span><span class="">مقبول</span></div>
                            <div class="float-right ml-3"><span class="dot-label bg-primary secondary ml-1"></span><span class="">فى المطعم</span></div>
                            <div class="float-right ml-3"><span class="dot-label bg-secondary secondary ml-1"></span><span class="">جارى التوصيل</span></div>
                            <div class="float-right ml-3"><span class="dot-label bg-secondary1 ml-1"></span><span class="">منتهى</span></div>
                            <div class="float-right ml-3"><span class="dot-label bg-canvas2 ml-1"></span><span class="">ملغى  </span></div>
                            <div class="float-right ml-3"><span class="dot-label bg-dark ml-1"></span><span class="">مرفوض  </span></div>
                        </div>
                    </div>
                </div>
            </div>

{{--        </div>--}}
{{--        <!-- ROW-2 END -->--}}
{{--        <div class="row">--}}
            <div class="col-lg-6 col-md-12 col-sm-12 col-xl-6">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">العملاء الاكثر شراء</h3>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table card-table border table-vcenter text-nowrap align-items-center">
                                <thead class="">
                                <tr>
                                    <th>اسم العميل</th>
                                    <th>عدد مرات الشراء</th>
                                    <th>اجمالى المبيعات</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($most_purchase_clients as $client)
                                    <tr>
                                        <td>{{$client->name}}
{{--                                            <br><span class="text-muted">{{$client->email}}</span>--}}
                                            <br><span class="text-muted">{{$client->phone}}</span>
                                        </td>
                                        <td class="font-weight-semibold fs-15">{{$client->orders_count}}</td>
                                        <td class="font-weight-semibold fs-15">{{$client['orders']->sum('total')}}</td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
{{--            <div class="col-lg-6 col-md-12 col-sm-12 col-xl-6">--}}
{{--                <div class="card">--}}
{{--                    <div class="card-header">--}}
{{--                        <h3 class="card-title">القطع الاكثر مبيعا</h3>--}}
{{--                    </div>--}}
{{--                    <div class="card-body">--}}
{{--                        <div class="table-responsive">--}}
{{--                            <table class="table card-table border table-vcenter text-nowrap align-items-center">--}}
{{--                                <thead class="">--}}
{{--                                <tr>--}}
{{--                                    <th>اسم القطعة</th>--}}
{{--                                    <th>عدد مرات البيع</th>--}}
{{--                                </tr>--}}
{{--                                </thead>--}}
{{--                                <tbody>--}}
{{--                                @foreach($most_sell_parts as $part)--}}
{{--                                    <tr>--}}
{{--                                        <td>--}}
{{--                                            <img src="{{$part->brand->sub_category->category->image??''}}" alt="img" class="h-7 w-7">--}}
{{--                                            <p class="d-inline-block align-middle mb-0 mr-1">--}}
{{--                                                <a href="" class="d-inline-block align-middle mb-0 product-name text-dark font-weight-semibold">--}}
{{--                                                    {{$part->brand->sub_category->category->name??''}}</a>--}}
{{--                                                <br>--}}
{{--                                                <span class="text-muted fs-13">{{$part->brand->sub_category->name??''}}</span><br>--}}
{{--                                                <span class="text-muted fs-13">{{$part->brand->name??''}}</span><br>--}}
{{--                                                <span class="text-muted fs-13">{{$part->name??''}}</span>--}}
{{--                                            </p>--}}
{{--                                        </td>--}}
{{--                                        <td>{{$part->order_details_count}}</td>--}}
{{--                                    </tr>--}}
{{--                                @endforeach--}}
{{--                                </tbody>--}}
{{--                            </table>--}}
{{--                        </div>--}}
{{--                    </div>--}}
{{--                </div>--}}
{{--            </div>--}}
        </div>
    @endif
@endsection
@push('admin_js')

    {{--    #######################  filter ##############################--}}
    <script src="{{url('Admin')}}/assets/plugins/bootstrap-daterangepicker/moment.min.js"></script>
    <script src="{{url('Admin')}}/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- INTERNAL  TIMEPICKER JS -->
    <script src="{{url('Admin')}}/assets/plugins/time-picker/jquery.timepicker.js"></script>
    <script src="{{url('Admin')}}/assets/plugins/time-picker/toggles.min.js"></script>

    <!-- INTERNAL DATEPICKER JS-->
    <script src="{{url('Admin')}}/assets/plugins/date-picker/spectrum.js"></script>
    <script src="{{url('Admin')}}/assets/plugins/date-picker/jquery-ui.js"></script>
    <script src="{{url('Admin')}}/assets/plugins/input-mask/jquery.maskedinput.js"></script>

    <!--INTERNAL  FORMELEMENTS JS -->
    <script src="{{url('Admin')}}/assets/js/form-elements.js"></script>
    <script src="{{url('Admin')}}/assets/js/select2.js"></script>

    <!-- INTERNAL SELECT2 JS -->
    <script src="{{url('Admin')}}/assets/plugins/select2/select2.full.min.js"></script>

    {{--    #######################  charts ##############################--}}

    <script>
        var ctx = document.getElementById("widgetChart1");
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: [
                    @foreach($chart_day_array as $day)
                        '{{$day}}' ,
                    @endforeach
                ],
                type: 'line',
                datasets: [{
                    data:[
                        @foreach($chart_order_array as $order)
                            {{$order}} ,
                        @endforeach
                    ],
                    label: '',
                    backgroundColor: 'rgba(156, 82, 253,0.8)',
                    borderColor: '#9c52fd',
                },]
            },
            options: {
                maintainAspectRatio: false,
                legend: {
                    display: false
                },
                responsive: true,
                tooltips: {
                    mode: 'index',
                    titleFontSize: 12,
                    titleFontColor: '#000',
                    bodyFontColor: '#000',
                    backgroundColor: '#fff',
                    cornerRadius: 0,
                    intersect: false,
                },
                scales: {
                    xAxes: [{
                        gridLines: {
                            color: 'transparent',
                            zeroLineColor: 'transparent'
                        },
                        ticks: {
                            fontSize: 2,
                            fontColor: 'transparent'
                        }
                    }],
                    yAxes: [{
                        display: false,
                        ticks: {
                            display: false,
                        }
                    }]
                },
                title: {
                    display: false,
                },
                elements: {
                    line: {
                        borderWidth: 2
                    },
                    point: {
                        radius: 0,
                        hitRadius: 10,
                        hoverRadius: 4
                    }
                }
            }
        });

        //*********************************************//
        /*-----canvasDoughnut-----*/
        if ($('#canvasDoughnut').length) {
            var ctx = document.getElementById("canvasDoughnut").getContext("2d");
            new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: ['جديد','مقبول','فى المطعم','جارى التوصيل','منتهى','ملغى','مرفوض'],
                    datasets: [{
                        data: [{{$new_order_count}},{{$accepted_order_count}},{{$marker_order_count}}
                            ,{{$delivery_order_count}},{{$ended_order_count}},{{$canceled_order_count}},{{$refused_order_count}}],
                        backgroundColor: ['#2f89f5', "#156dd2", "#525ce5", "#9c52fd", "#24e4ac", "#ec5444", "#425e8d"],
                        borderColor:'transparent',
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    legend: {
                        display: false
                    },
                    cutoutPercentage: 65,
                }
            });
        }
        /*-----canvasDoughnut-----*/
    </script>


    <script>
        $(document).ready(function() {
            $('.card-options-collapse').click();
        })
    </script>

@endpush
