<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 400px; /* Set a maximum width for the form */
            margin: auto; /* Center the form */
        }
    </style>
    <title>Sign Up</title>
</head>
<body>
    <div class="container mt-5 form-container">
        <h1 class="text-center">Sign up</h1>
        <form action="signup" method="post" class="mt-4">
            <p class="text-danger">${mess}</p>
            <div class="form-group">
                <input name="email" type="text" class="form-control" placeholder="Email" required autofocus>
            </div>
            <div class="form-group">
                <input name="password" type="password" class="form-control" placeholder="Password" required>
            </div>
            <div class="form-group">
                <input name="repassword" type="password" class="form-control" placeholder="Repeat Password" required>
            </div>
            <button class="btn btn-primary btn-block" type="submit">Sign Up</button>
            <a href="Login.jsp" class="btn btn-link btn-block">Back</a>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>