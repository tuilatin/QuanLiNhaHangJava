<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f7f9fc;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-container {
            background: white;
            padding: 40px 30px;
            border-radius: 15px;
            max-width: 420px;
            width: 100%;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.1);
        }

        .form-container h1 {
            margin-bottom: 30px;
            font-weight: bold;
            font-size: 28px;
            color: #333;
        }

        .form-control {
            border-radius: 8px;
            padding: 12px;
            font-size: 16px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            transition: background 0.3s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-link {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .btn-link:hover {
            text-decoration: underline;
        }

        .text-danger {
            font-size: 14px;
            margin-bottom: 10px;
        }
    </style>
    <title>Sign Up</title>
</head>
<body>

    <div class="form-container">
        <h1 class="text-center">Sign Up</h1>
        <form action="signup" method="post">
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
            <a href="Login.jsp" class="btn btn-link btn-block text-center">Back</a>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>
