<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thanh toán đặt bàn</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
     <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0px;
      background-color: #f9f9f9;
    }

    .container {
      max-width: 1000px;
      margin: auto;
    }

    .back-button {
      padding: 6px 12px;
      border: 1px solid #ccc;
      background-color: white;
      cursor: pointer;
      margin-bottom: 10px;
    }

    .title {
      text-align: center;
      color: darkgreen;
    }

    .content {
      display: flex;
      gap: 20px;
      flex-wrap: wrap;
    }

    .box {
      background: white;
      border: 1px solid #ddd;
      border-radius: 5px;
      padding: 15px;
      flex: 1;
      min-width: 300px;
    }

    .box h3 {
      background-color: #e0efff;
      padding: 10px;
      margin: -15px -15px 15px -15px;
      border-bottom: 1px solid #ccc;
      color: green;
    }

    .order-info p {
      margin: 5px 0;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }

    th, td {
      border: 1px solid #ccc;
      text-align: center;
      padding: 8px;
    }

    th {
      background-color: #f0f8ff;
    }

    .payment-summary {
      margin-top: 10px;
    }

    .payment-summary p {
      display: flex;
      justify-content: space-between;
      margin: 8px 0;
    }

    .total {
      color: red;
      font-weight: bold;
    }

    .payment-methods label {
      display: block;
      margin-bottom: 8px;
    }

    .submit-button {
      background-color: #2bb673;
      color: white;
      padding: 10px 20px;
      border: none;
      margin-top: 10px;
      cursor: pointer;
      width: 100%;
      font-size: 16px;
      border-radius: 4px;
    }
  </style>
</head>
<body>
<jsp:include page="Menu.jsp"/>

<div class="container">
    <button class="back-button" onclick="history.back()">&lt; Quay lại</button>
    <h2 class="title">THANH TOÁN TRƯỚC CHO ĐƠN ĐẶT BÀN</h2>

    <div class="content">
        <!-- Thông tin đơn -->
        <div class="order-info box">
            <h3>Thông tin đơn đặt bàn</h3>
            <p><strong>Email:</strong> ${datBan.nguoiDung.email}</p>
            <p><strong>Tên người đặt bàn:</strong> ${datBan.tenKH}</p>
            <p><strong>Điện thoại:</strong> ${datBan.sdt}</p>
            <p><strong>Thời gian dùng bữa dự kiến:</strong>
                <fmt:formatDate value="${datBan.thoiGianDat}" pattern="dd/MM/yyyy (HH:mm)"/>
            </p>
            <p><strong>Địa điểm dùng bữa:</strong> ${datBan.diaChi}</p>

            <br><br>
            <h3>Thực đơn đặt trước</h3>
            <table>
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Món ăn</th>
                    <th>Giá bán</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="tongTien" value="0"/>
                <c:forEach var="item" items="${datBan.chiTietDatBanList}" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${item.monAn.tenMon}</td>
                        <td><fmt:formatNumber value="${item.monAn.donGia}" type="currency" currencySymbol="₫"/></td>
                        <td>${item.soLuong}</td>
                        <td><fmt:formatNumber value="${item.thanhTien}" type="currency" currencySymbol="₫"/></td>
                    </tr>
                    <%--<c:set var="tongTien" value="${tongTien + item.thanhTien}"/>--%>
                </c:forEach>
                <tr>
                    <td colspan="4"><strong>Tổng cộng</strong></td>
                    <td><strong><fmt:formatNumber value="${datBan.tongTien}" type="currency" currencySymbol="₫"/></strong></td>
                </tr>
                </tbody>
            </table>
        </div>

        <!-- Thanh toán -->
        <div class="box">
            <h3>THANH TOÁN</h3>
            <div class="payment-summary">
                <p><span>Tạm tính:</span><span><fmt:formatNumber value="${datBan.tongTien}" type="currency" currencySymbol="₫"/></span></p>
                <p><span>Khuyến mãi:</span><span>-</span></p>
                <p class="total"><span>Tổng cộng (VAT):</span><span><fmt:formatNumber value="${datBan.tongTien}" type="currency" currencySymbol="₫"/></span></p>
            </div>

            <div class="payment-methods">
                <p><strong>Phương thức thanh toán</strong></p>
                <label><input type="radio" name="method"> Thanh toán qua ví VNPAY</label>
                <label><input type="radio" name="method"> Chuyển khoản ngân hàng</label>
            </div>
                
            <form action="paymentdb" method="post">
                     <input type="hidden" name="idHD" value="${datBan.idDatBan}">
                        <input type="hidden" name="totalBill" value="${datBan.tongTien}">
                   <button type="submit" class="submit-button">THANH TOÁN</button>
            </form>
               
            
        </div>
    </div>
</div>

</body>
</html>
