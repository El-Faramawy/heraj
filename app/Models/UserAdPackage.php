<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserAdPackage extends Model
{
    use HasFactory;

    protected $table = 'user_ad_packages';
    protected $guarded = [];

    public function package(){
        return $this->belongsTo(AdPackage::class , 'package_id');
    }
}
