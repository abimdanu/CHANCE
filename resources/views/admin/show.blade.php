<!-- resources/views/admin/show.blade.php -->

<!DOCTYPE html>
<html>
<head>
    <title>ADMIN - Ruangan {{ $room->name }}</title>
</head>

<body>
    <a href="{{ route('admin.index') }}" class="btn btn-primary">Kembali ke Daftar Ruangan</a>

    <h1>ADMIN - Ruangan {{ $room->name }}</h1>

    <h2>Jumlah pengunjung: {{ $room->seats->where('status', 'occupied')->count() }}</h2>

    <ul>
        @foreach ($room->seats as $seat)
            <li>{{ $seat->code }} - {{ $seat->status }}</li>
            <form action="{{ route('admin-change', [$room, $seat]) }}" method="POST">
                @csrf
                <button type="submit">Ubah Status</button>
            </form>
            <p></p>
        @endforeach
    </ul>
</body>
</html>
