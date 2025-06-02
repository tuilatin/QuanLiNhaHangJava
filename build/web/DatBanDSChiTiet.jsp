<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Lịch sử đơn hàng & Đặt bàn</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <style>
        .table-wrapper {
            margin: 30px auto;
            background: #fff;
            padding: 20px 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .table-title {
            margin-bottom: 15px;
        }

        .table-title h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
            font-weight: bold;
        }

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

        .btn-primary {
            margin: 20px 0;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 8px;
        }

        h3.section-title {
            margin-top: 40px;
            color: #333;
            font-weight: bold;
        }
    </style>
</head>
<body>

<jsp:include page="Menu.jsp" />

<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2><b>${title}</b> <h2 style="color: red;">${time}</h2></h2>
                </div>
            </div>
        </div>



        <!-- Lịch sử đặt bàn -->
        <h3 class="section-title">Lịch sử đặt bàn</h3>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID Đặt Bàn</th>
                         <th>Tên Bàn</th>
                        <th>Ngày Đặt</th>
                        
                        <th>Giờ Đặt</th>
                       <th>Số Người</th>
                        <th>Trạng Thái</th>
                        <th>Tiền Cọc</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listDatBan}" var="datban">
                        <tr onclick="window.location='chitietdatban?id=${datban.idDatBan}'" style="cursor: pointer;">
                            <td>${datban.idDatBan}</td>
                            <td>${datban.ban.tenBan}</td>
                            <td><fmt:formatDate value="${datban.thoiGianDat}" pattern="dd/MM/yyyy"/></td>
                            
                            <td><fmt:formatDate value="${datban.thoiGianDat}" pattern="HH:mm"/></td>
                            
                            <td>${datban.soNguoi}</td>
                            <td>${datban.trangThai}</td>
                            <td>${datban.tongTien}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Nút quay lại -->
        <a href="home"><button type="button" class="btn btn-primary">Back to home</button></a>
    </div>
</div>

</body>
</html>
