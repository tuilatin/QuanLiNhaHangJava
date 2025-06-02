<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản trị hệ thống</title>
   
<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
        background-color: #f7f9fc;
    }

    .main-container {
        display: flex;
    }

    .content {
        flex-grow: 1;
        padding: 20px;
    }

    .content h2 {
        color: #123c7a;
        margin-bottom: 20px;
    }
</style>
</head>
<body>

<jsp:include page="AdminMenu.jsp" />
<div class="main-container">
    <jsp:include page="AdminLeft.jsp" />

    <!--content-->
    
    
</div>

</body>
</html>
