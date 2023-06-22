<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RoomController;
use App\Http\Controllers\AuthController;

Route::get('/', function () {
    return view('welcome');
});


Route::get('/register', function () {
    return view('register');
});
Route::post('/register', [AuthController::class, 'register'])->name('register');

Route::get('/login', function () {
    return view('login');
});
Route::post('/login', [AuthController::class, 'login'])->name('login');

Route::middleware('auth')->group(function () {
    // Halaman-halaman yang memerlukan autentikasi
    Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

    Route::get('/rooms', [RoomController::class, 'index'])->name('rooms.index');
    Route::get('/rooms/{room}', [RoomController::class, 'show'])->name('rooms.show');
    
    Route::post('/rooms/{room}/seats/{seat}/check-in', [RoomController::class, 'checkIn'])->name('check-in');
    Route::post('/rooms/{room}/seats/{seat}/check-out', [RoomController::class, 'checkOut'])->name('check-out');
    
    Route::get('/admin-rooms', [RoomController::class, 'admin'])->name('admin.index');
    Route::get('/admin-rooms/{room}', [RoomController::class, 'adminShow'])->name('admin.show');
    Route::post('/admin-rooms/{room}/seats/{seat}/admin-change', [RoomController::class, 'adminChange'])->name('admin-change');
});
