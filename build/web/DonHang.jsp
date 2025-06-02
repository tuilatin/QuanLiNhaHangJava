<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<style>
    /* Container của bảng */
    .table-wrapper {
        margin: 30px auto;
        background: #fff;
        padding: 20px 25px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    /* Phần tiêu đề */
    .table-title {
        margin-bottom: 15px;
    }

    .table-title h2 {
        font-size: 24px;
        color: #333;
        margin-bottom: 10px;
        font-weight: bold;
    }

    /* Bảng */
    .table-responsive {
        overflow-x: auto;
    }

    table.table {
        width: 100%;
        background-color: #fff;
        border-collapse: separate;
        border-spacing: 0;
    }

    table.table th, table.table td {
        border-top: 1px solid #dee2e6;
        padding: 12px 15px;
        text-align: center;
        vertical-align: middle;
    }

    table.table thead th {
        background-color: #007bff;
        color: #fff;
        font-weight: bold;
        border-top: none;
        font-size: 16px;
    }

    table.table tbody tr {
        background-color: #f9f9f9;
        transition: all 0.3s ease;
    }

    table.table tbody tr:hover {
        background-color: #e9f5ff;
        transform: scale(1.005);
        box-shadow: 0 2px 10px rgba(0, 123, 255, 0.2);
        cursor: pointer;
    }

    table.table tbody td {
        font-size: 15px;
        color: #333;
    }

    /* Nút "Back to Home" */
    .btn-primary {
        margin: 20px 0;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 8px;
    }

    /* Hiệu ứng tổng tiền (optional nếu bạn muốn áp dụng sau này) */
    .total-section {
        background-color: #f8f9fa;
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 20px;
    }

    .total-amount {
        font-size: 1.4em;
        color: #dc3545;
        font-weight: bold;
    }

    .total-text {
        color: #28a745;
        font-style: italic;
    }
</style>

<!DOCTYPE html>
<html>
<head>
    <title>Lịch sử đơn hàng</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="Menu.jsp" />

  <div class="table-wrapper">
            <div class="table-title">
                
                
    <div class="row">
        <div class="col-sm-6">
            <h2> <b>${title}</b> <h2 style="color: red;">${time}</h2>
</h2>
            
         </div>
    </div>
</div>

<div class="table-responsive">
        
    <table class="table table-striped table-hover">
    <thead>
        <tr>
            <th>ID Hóa đơn</th>
            <th>Trạng thái</th>
            <th>Ngày tạo</th>
            <th>Tiền món ăn</th>
            <th>Voucher</th>
            <th>Giảm</th>
            <th>Tổng tiền</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${listHD}" var="hd">
            <!-- Thêm onclick để khi click vào dòng thì không chuyển hướng -->
            <tr onclick="window.location='chitiethd?id=${hd.idHoaDon}'" style="cursor: pointer;">
                <td>${hd.idHoaDon}</td>
                <td>${hd.trangThai}</td>
                <td>${hd.ngayHD}</td>
                <td>${hd.tienMonAn}</td>
                <td>${hd.codeVoucher}</td>
                <td>${hd.tienGiam}</td>
                <td>${hd.tongTien}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</div>

        </div>

        <a href="home"><button type="button" class="btn btn-primary">Back to home</button></a>
    </div>

<style>
    .total-section {
        background-color: #f8f9fa;
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 20px;
    }
    .total-amount {
        font-size: 1.2em;
        color: #dc3545;
        font-weight: bold;
    }
    .total-text {
        color: #28a745;
        font-style: italic;
    }
</style>

<%--<jsp:include page="Footer.jsp" />--%>
</body>
</html>
