<?php

namespace Database\Factories;

use App\Models\Seat;
use Illuminate\Database\Eloquent\Factories\Factory;

class SeatFactory extends Factory
{
    protected $model = Seat::class;

    public function definition()
    {
        return [
            'code' => $this->faker->unique()->regexify('[A-Z][0-9]{2}'),
            'status' => 'empty',
        ];
    }
}
