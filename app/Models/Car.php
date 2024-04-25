<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    use HasFactory;
    protected $table = 'cars';
    protected $guarded = [];
    
    public function marque()
    {
        return $this->belongsTo(Marque::class, 'marque_id');
    }

    public function carmodel()
    {
        return $this->belongsTo(CarModel::class, 'model_id');
    }

    public function bodytype()
    {
        return $this->belongsTo(BodyType::class);
    }

    public function fueltype()
    {
        return $this->belongsTo(FuelType::class, 'fueltype_id');
    }

    public function engine()
    {
        return $this->belongsTo(Engine::class, 'fueltype_id');
    }

    public function country()
    {
        return $this->belongsTo(Country::class, 'country_id');
    }

    public function state()
    {
        return $this->belongsTo(State::class, 'state_id');
    }

    public function carimages()
    {
        return $this->hasMany(CarImages::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
