<?php

namespace Database\Seeders;

use App\Models\Room;
use App\Models\Seat;
use Illuminate\Database\Seeder;

class RoomsTableSeeder extends Seeder
{
    public function run()
    {
        $rooms = Room::factory()->count(4)->create(['capacity' => 15]);

        foreach ($rooms as $room) {
            Seat::factory()->count(15)->create(['room_id' => $room->id]);
        }
    }
}
