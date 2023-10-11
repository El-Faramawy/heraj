<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected $appends =['is_favourite','is_follow'];

    public function getImageAttribute(){
        return  get_file($this->attributes['image']);
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


}
