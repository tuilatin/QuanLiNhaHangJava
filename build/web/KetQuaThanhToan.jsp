<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông báo giao dịch</title>
    <!-- Bootstrap 4 CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery and Bootstrap 4 JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- FontAwesome -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <style>
        img {
            width: 200px;
            height: 270px;
        }
          .btn-chuyen-trang {
      display: inline-block;
      padding: 12px 24px;
      background: linear-gradient(135deg, #4CAF50, #81C784);
      color: white;
      text-decoration: none;
      font-size: 16px;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      transition: all 0.3s ease;
      margin-bottom: 10px;
    }

    .btn-chuyen-trang:hover {
      background: linear-gradient(135deg, #388E3C, #66BB6A);
      box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2);
      transform: translateY(-2px);
    }
    </style>
</head>
<body>

<jsp:include page="Menu.jsp"/>

<section style="margin-top: 50px; text-align: center;">
    <div>
        <img src="https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/Review-empty.png"
             alt="Transaction Status"
             style="width: 120px; height: 120px; margin-bottom: 20px;">
    </div>

    <!-- Giao dịch thành công -->
    <c:if test="${transResult == true}">
        <div>
            <h3 class="font-weight-bold text-success">
                Bạn đã giao dịch thành công! 
                <i class="fa fa-check-circle"></i>
            </h3>
            <p class="mt-3" style="font-size: 18px;">Vui lòng để ý số điện thoại của nhân viên tư vấn:</p>
            <strong class="text-danger" style="font-size: 24px;">0777777777</strong>
        </div>
    </c:if>

    <!-- Giao dịch thất bại -->
    <c:if test="${transResult == false}">
        <div>
            <h3 class="font-weight-bold text-danger">
                Đơn hàng giao dịch thất bại!
            </h3>
            <p class="mt-3" style="font-size: 18px;">Cảm ơn quý khách đã dùng dịch vụ của chúng tôi.</p>
            <p style="font-size: 18px;">Liên hệ tổng đài để được tư vấn:</p>
            <strong class="text-danger" style="font-size: 24px;">0777777***</strong>
        </div>
    </c:if>

    <!-- Đang xử lý giao dịch -->
    <c:if test="${transResult == null}">
        <div>
            <h3 class="font-weight-bold text-warning">
                Chúng tôi đã tiếp nhận đơn hàng, xin chờ quá trình xử lý!
            </h3>
            <p class="mt-3" style="font-size: 18px;">Vui lòng để ý số điện thoại của nhân viên tư vấn:</p>
            <strong class="text-danger" style="font-size: 24px;">0777777***</strong>
        </div>
        
    </c:if>
        <a href="donhang" class="btn-chuyen-trang">Về trang đơn hàng</a>
</section>

<jsp:include page="Footer.jsp"/>

</body>
</html>
