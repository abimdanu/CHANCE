<!-- resources/views/rooms/index.blade.php -->

<!DOCTYPE html>
<html>

<head>
    <title>CHANCE - Daftar Ruangan</title>
</head>

<body>
    <form action="{{ route('logout') }}" method="POST">
        @csrf
        <button type="submit">Logout</button>
    </form>

    <h1>CHANCE - Daftar Ruangan</h1>
    @php
        $user = Auth::user();
        $userSeat = App\Models\Seat::where('user_id', $user->id)->first();
    @endphp

    <h3>Halo, {{ $user->name }}!</h3>

    @if ($userSeat)
        <p>Anda sedang duduk pada kursi dengan kode : <b>{{ $userSeat->code }}</b> (Ruangan <b>{{ $userSeat->room->name }}</b>)</p>
    @endif

    <ul>
        @foreach ($rooms as $room)
            <li><a href="{{ route('rooms.show', $room) }}">{{ $room->name }}</a></li>
            <p></p>
        @endforeach
    </ul>
</body>

</html>
