<!-- resources/views/seats/check_in.blade.php -->

<!DOCTYPE html>
<html>

<head>
    <title>CHANCE - Check In</title>
</head>

<body>
    <h1>CHANCE - Check In</h1>

    <p>Berhasil Check-in pada kursi {{ $seat->code }}.</p>
    <p>Kode: {{ $code }}</p>

    <a href="{{ route('rooms.show', $seat->room) }}">Kembali</a>

</body>

</html>
