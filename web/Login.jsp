<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
  body {
    background: #f7f7f7;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  #logreg-forms {
    width: 100%;
    max-width: 400px;
    padding: 30px;
    margin: auto;
    background: #fff;
    box-shadow: 0 8px 16px rgba(0,0,0,0.1);
    border-radius: 10px;
  }

  #logreg-forms form {
    width: 100%;
  }

  #logreg-forms .form-signin {
    margin-bottom: 15px;
  }

  .form-control {
    margin-bottom: 15px;
    height: 45px;
    border-radius: 5px;
  }

  .btn-block {
    height: 45px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 5px;
  }

  h1 {
    margin-bottom: 25px;
    font-weight: bold;
    color: #333;
  }

  .text-danger {
    text-align: center;
    margin-bottom: 20px;
  }

  hr {
    margin: 20px 0;
  }

  .form-check-label {
    margin-left: 5px;
  }

  .btn-primary {
    background-color: #007bff;
    border: none;
  }

  .btn-success {
    background-color: #28a745;
    border: none;
  }

  .btn-success:hover,
  .btn-primary:hover {
    opacity: 0.9;
  }

  .btn-google {
    color: #444;
    background-color: #fff;
    border: 1px solid #bbb;
    box-shadow: 0 2px 4px 0 rgba(0,0,0,0.05);
    font-weight: 500;
  }

  .btn-google:hover {
    background: #f7f7f7;
    color: #222;
    border: 1px solid #bbb;
  }

  .or-separator {
    display: flex;
    align-items: center;
    text-align: center;
    margin: 20px 0 10px 0;
  }
  .or-separator span {
    flex: 1;
    color: #888;
    font-weight: 500;
    position: relative;
  }
  .or-separator span:before,
  .or-separator span:after {
    content: '';
    flex: 1;
    border-bottom: 1px solid #ddd;
    margin: 0 10px;
  }
</style>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đăng nhập</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">

  
</head>

<body>

  <div id="logreg-forms">
    <form class="form-signin" action="login" method="post">
      <h1 class="text-center">Đăng nhập</h1>
      <p class="text-danger">${mess}</p>

      <input name="email" type="text" class="form-control" placeholder="Email" required autofocus>
      <input name="password" type="password" class="form-control" placeholder="Mật khẩu" required>

      <div class="form-group form-check text-left">
        <input name="remember" value="1" type="checkbox" class="form-check-input" id="rememberCheck">
        <label class="form-check-label" for="rememberCheck">Ghi nhớ đăng nhập</label>
      </div>

      <button class="btn btn-success btn-block" type="submit">
        <i class="fas fa-sign-in-alt"></i> Đăng nhập
      </button>

      <hr>

      <a href="Signup.jsp" class="btn btn-primary btn-block">
        <i class="fas fa-user-plus"></i> Đăng ký tài khoản mới
      </a>
      <div class="or-separator">
        <span>Hoặc</span>
      </div>
    </form>
        <a href="LoginGoogleServlet" class="btn btn-google btn-block">
          <img src="https://developers.google.com/identity/images/g-logo.png" style="width:20px; margin-right:8px; margin-top:-3px;"> Đăng nhập bằng Google
        </a>
      
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
