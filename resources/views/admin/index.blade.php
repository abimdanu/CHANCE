<!-- resources/views/rooms/index.blade.php -->

<!DOCTYPE html>
<html>

<head>
    <title>CHANCE - Daftar Ruangan (ADMIN)</title>
</head>

<body>
    <form action="{{ route('logout') }}" method="POST">
        @csrf
        <button type="submit">Logout</button>
    </form>

    <h1>CHANCE - Daftar Ruangan (Admin)</h1>

    <ul>
        @foreach ($rooms as $room)
            <li><a href="{{ route('admin.show', $room) }}">{{ $room->name }}</a></li>
            <p></p>
        @endforeach
    </ul>
</body>

</html>
