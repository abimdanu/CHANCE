<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CHANCE - Register</title>
</head>
<body>
    <h1>DAFTAR</h1>
    <br>

    <form method="POST" action="{{ route('register') }}">
        @csrf

        <label for="name">Name</label>
        <input type="text" id="name" name="name" required>
        <br><br>
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>
        <br><br>
        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>
        <br><br>
        <button type="submit">Daftar</button>

        <br>
        <a href="{{ route('login') }}">Sudah punya akun?</a>
    </form>
</body>
</html>


