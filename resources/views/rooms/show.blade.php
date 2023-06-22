<!-- resources/views/rooms/show.blade.php -->

<!DOCTYPE html>
<html>

<head>
    <title>CHANCE - {{ $room->name }}</title>
</head>

<body>
    <a href="{{ route('rooms.index') }}" class="btn btn-primary">Kembali ke Daftar Ruangan</a>

    <h1>CHANCE - {{ $room->name }}</h1>

    <h2>Jumlah pengunjung: {{ $room->seats->where('status', 'occupied')->count() }}</h2>

    <h2>Seats</h2>
    @if (session('error'))
        <h1 class="alert alert-danger">
            {{ session('error') }}
        </h1>
    @endif
    <ul>
        @foreach ($room->seats as $seat)
            <li>
                <b>{{ $seat->code }}</b> - {{ $seat->status }}
                @if ($seat->status === 'empty')
                    <form method="POST" action="{{ route('check-in', [$room, $seat]) }}">
                        @csrf
                        <input type="text" name="code" placeholder="Enter code">
                        <button type="submit">Check In</button>
                    </form>
                    <br>
                @else
                    <form method="POST" action="{{ route('check-out', [$room, $seat]) }}">
                        @csrf
                        <button type="submit">Check-Out</button>
                    </form>
                    <br>
                @endif
            </li>
        @endforeach
    </ul>
</body>

</html>
