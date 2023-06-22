<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Seat extends Model
{
    use HasFactory;

    protected $fillable = [
        'room_id',
        'code',
        'status',
        'user_id'
    ];

    public function room()
    {
        return $this->belongsTo(Room::class);
    }
    public function user()
    {
        return $this->hasOne(User::class);
    }
}
