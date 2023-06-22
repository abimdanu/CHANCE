<?php

namespace App\Http\Controllers;

use App\Models\Room;
use App\Models\Seat;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;

class RoomController extends Controller
{
    public function index()
    {
        $rooms = Room::all();
        return view('rooms.index', compact('rooms'));
    }
    public function admin() {
        $rooms = Room::all();
        return view('admin.index', compact('rooms'));
    }

    public function show(Room $room)
    {
        $room->load('seats');
        return view('rooms.show', compact('room'));
    }
    public function adminShow(Room $room) {
        $room->load('seats');
        return view('admin.show', compact('room'));
    }

    public function adminChange(Request $request, Room $room, Seat $seat)
    {
        $user = Auth::user(); // Mengambil pengguna yang sedang login

        if ($seat->status === 'occupied') {
            $seat->status = 'empty';
            $seat->user_id = null;
        } else {
            $seat->status = 'occupied';
            $seat->user_id = $user->id;
        }
        $seat->save();

        return redirect()->back();
    }
    public function checkIn(Request $request, Room $room, Seat $seat)
    {
        $user = Auth::user(); // Mengambil pengguna yang sedang login
        $code = $request->input('code');

        // Periksa apakah pengguna sudah memiliki Check-In aktif
        $hasActiveCheckIn = $room->seats()
        ->where('user_id', auth()->user()->id)
        ->where('status', 'occupied')
        ->exists();

        if ($hasActiveCheckIn) {
            Session::flash('error', 'Anda sudah memiliki check-in aktif!');
            return redirect()->back();
        }

        $hasOtherActiveCheckIn = Seat::where('user_id', $user->id)
            ->where('room_id', '!=', $room->id)
            ->where('status', 'occupied')
            ->exists();

        if ($hasOtherActiveCheckIn) {
            Session::flash('error', 'Anda sudah memiliki Check-In aktif di ruangan lain!');
            return redirect()->back();
        }

        // Periksa apakah kode yang dimasukkan sesuai dengan kursi yang dipilih
        if ($seat->code === $code) {
            // Periksa apakah kursi masih kosong
            if ($seat->status === 'empty') {
                $seat->status = 'occupied';
                $seat->user_id = $user->id;
                $seat->save();

                // Tambahkan logika penambahan jumlah pengunjung jika perlu

                return view('seats.check_in', compact('seat', 'code'));
            } else {
                Session::flash('error', 'Kursi sudah terisi!');
                return redirect()->back();
            }
        } else {
            Session::flash('error', 'Kode tidak valid!');
            return redirect()->back();
        }
    }

    public function checkOut(Room $room, Seat $seat)
    {
        $user = Auth::user(); // Mengambil pengguna yang sedang login

        // Periksa apakah pengguna memiliki Check-In aktif pada kursi yang akan Check-Out
        if ($seat->user_id === $user->id) {
            $seat->status = 'empty';
            $seat->user_id = null;
            $seat->save();

            return redirect()->back();
        } else {
            Session::flash('error', 'Anda tidak bisa melakukan Check-Out pada kursi ini!');
            return redirect()->back();
        }
    }
}
