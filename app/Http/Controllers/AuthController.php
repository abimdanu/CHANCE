<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        // Validasi input
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        // Buat user baru
        $user = (new User())->register($request->only(['name', 'email', 'password']));

        // Redirect ke login
        return redirect('/login');
    }

    public function login(Request $request)
    {
        // Validasi input
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        // Cek login
        $credentials = $request->only('email', 'password');
        $user = User::where('email', $credentials['email'])->first();

        if (!$user || !Hash::check($credentials['password'], $user->password)) {
            return redirect()->back()->withInput()->withErrors([
                'email' => 'Email atau password salah.',
            ]);
        }

        // Login sukses
        auth()->login($user);
        // Periksa kategori pengguna
        if ($user->isAdmin === 1) {
            return redirect('/admin-rooms');
        } else {
            return redirect('/rooms');
        }
    }

    public function logout()
    {
        auth()->logout();
        return redirect('/login');
    }
}
