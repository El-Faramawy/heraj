<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DateTime;
use Carbon\Carbon;
class Product extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected $appends =['is_favourite','is_follow','rate'];

    public function getImageAttribute(){
        return  get_file($this->attributes['image']);
    }
    // public function getCivilDefenseLicenseAttribute(){
    //     return  get_file($this->attributes['civil_defense_license']);
    // }
    // public function getMunicipalLicenseAttribute(){
    //     return  get_file($this->attributes['municipal_license']);
    // }
    public function getVideoAttribute(){
        return  get_file($this->attributes['video']);
    }
    public function getVideoCoverAttribute(){
        return  get_file($this->attributes['video_cover']);
    }
    public function getCreatedAtAttribute($value){
        $carbonTimestamp = (string)Carbon::parse($value)->timezone('Asia/Riyadh');
        $dateTime = new DateTime($carbonTimestamp);
        return $dateTime->format("Y-m-d\TH:i:s.u\Z");
    }
    //===================  IsFavourite ===========================
    public function getIsFavouriteAttribute(){
        if (user_api()->check()){
            $favourites = Favourate::where(['user_id' => user_api()->user()->id , 'product_id' => $this->attributes['id'] ] )->count();
            if ($favourites > 0)
                return 'yes';
            else
                return 'no';
        }else{
            return 'no';
        }
    }
    //===================  is_follow ===========================
    public function getIsFollowAttribute(){
        if (user_api()->check()){
            $following = Following::where(['follower_user_id' => user_api()->user()->id , 'product_id' => $this->attributes['id'] ] )->count();
            if ($following > 0)
                return 'yes';
            else
                return 'no';
        }else{
            return 'no';
        }
    }

    //===================  category ===========================
    public function category()
    {
        return $this->belongsTo(Category::class);
    }
    //===================  user ===========================
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    //===================  sub_category ===========================
    public function sub_category()
    {
        return $this->belongsTo(SubCategory::class);
    }
    //===================  area ===========================
    public function area()
    {
        return $this->belongsTo(Area::class);
    }
    //===================  city ===========================
    public function city()
    {
        return $this->belongsTo(City::class);
    }
    //===================  images ===========================
    public function images()
    {
        return $this->hasMany(ProductImage::class);
    }
    //===================  comments ===========================
    public function comments()
    {
        return $this->hasMany(ProductComment::class);
    }
    //===================  comments ===========================
    public function getRateAttribute(){
        $rates = Rate::where('product_id',$this->attributes['id']);
        $rates_count = $rates->count();
        if ($rates_count > 0){
            $rates_sum = $rates->sum('rate1') + $rates->sum('rate2');
            return $rates_sum / ($rates_count * 2);
        }
        return  0;
    }

}
