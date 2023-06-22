<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Auth;

class User extends Authenticatable
{
    protected $fillable = ['name', 'email', 'password'];
    public function seat()
    {
        return $this->belongsTo(Seat::class);
    }

    public function register($userData)
    {
        $userData['password'] = Hash::make($userData['password']);
        return $this->create($userData);
    }

    public function attemptLogin($email, $password)
    {
        $user = $this->where('email', $email)->first();

        if ($user && Hash::check($password, $user->password)) {
            return $user;
        }

        return null;
    }
}
