<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DateTime;
use Carbon\Carbon;
class UserAdPackage extends Model
{
    use HasFactory;

    protected $table = 'user_ad_packages';
    protected $guarded = [];
    public function getCreatedAtAttribute($value){
        $carbonTimestamp = (string)Carbon::parse($value)->timezone('Asia/Riyadh');
        $dateTime = new DateTime($carbonTimestamp);
        return $dateTime->format("Y-m-d\TH:i:s.u\Z");
    }
    public function package(){
        return $this->belongsTo(AdPackage::class , 'package_id');
    }
}
