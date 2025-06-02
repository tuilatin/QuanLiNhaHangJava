<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi Tiết Đặt Bàn</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Poppins', sans-serif;
        }

        h2, h3, h4 {
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .table-responsive {
            background: #ffffff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.05);
        }

        .table thead th {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            color: white;
            font-weight: 600;
            text-align: center;
            vertical-align: middle;
            border: none;
            font-size: 15px;
        }

        .table tbody td {
            text-align: center;
            vertical-align: middle;
            padding: 15px;
            font-size: 14px;
        }

        .table tbody tr:hover {
            background-color: #eaf6ff;
            transition: background-color 0.3s ease;
            cursor: pointer;
        }

        .table img {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 8px;
            border: 1px solid #ddd;
        }

        .info-section {
            background-color: #ffffff;
            padding: 25px 30px;
            border-radius: 12px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 30px;
        }

        .info-section p {
            font-size: 15px;
            margin-bottom: 12px;
            color: #333;
        }

        .info-title {
            font-weight: 600;
            color: #2c3e50;
            display: inline-block;
            min-width: 160px;
        }

        .info-value {
            font-weight: 400;
            color: #555;
        }

        .button-container {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-bottom: 40px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.2s;
        }

        button:active {
            transform: scale(0.98);
        }

        .confirm-btn {
            background-color: #4CAF50;
            color: white;
        }

        .confirm-btn:hover {
            background-color: #45a049;
        }

        .cancel-btn {
            background-color: #f44336;
            color: white;
        }

        .cancel-btn:hover {
            background-color: #e53935;
        }

        .badge {
            padding: 8px 12px;
            font-size: 14px;
        }

        .badge-success { background-color: #28a745; }
        .badge-warning { background-color: #ffc107; color: #000; }
        .badge-danger  { background-color: #dc3545; }

        @media (max-width: 768px) {
            .table thead { display: none; }
            .table, .table tbody, .table tr, .table td {
                display: block;
                width: 100%;
            }
            .table tr {
                margin-bottom: 15px;
                background: #ffffff;
                border-radius: 8px;
                padding: 10px;
                box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
            }
            .table td {
                text-align: right;
                padding-left: 50%;
                position: relative;
            }
            .table td::before {
                content: attr(data-label);
                position: absolute;
                left: 10px;
                width: 45%;
                text-align: left;
                font-weight: bold;
                color: #555;
            }
            .info-title {
                display: block;
                margin-bottom: 5px;
                min-width: unset;
            }
            .info-value {
                display: block;
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
<jsp:include page="Menu.jsp"></jsp:include>
<div class="container">
    <h3 class="text-center">Chi Tiết Đặt Bàn</h3>

    <div class="info-section">
        <div class="row">
            <div class="col-md-6">
                <p><span class="info-title">Tên khách hàng:</span> <span class="info-value">${datBan.tenKH}</span></p>
                <p><span class="info-title">Số điện thoại:</span> <span class="info-value">${datBan.sdt}</span></p>
                <p><span class="info-title">Địa điểm dùng bữa:</span> <span class="info-value">${datBan.diaChi}</span></p>
            </div>
            <div class="col-md-6">
                <p><span class="info-title">Thời gian dùng bữa dự kiến:</span> <span class="info-value">${datBan.thoiGianDat}</span></p>
                <p><span class="info-title">Số người:</span> <span class="info-value">${datBan.soNguoi}</span></p>
                <p><span class="info-title">Trạng thái:</span> <span class="info-value">${datBan.trangThai}</span></p>
            </div>
        </div>
    </div>

    <div class="info-section">
        <div class="row">
            <div class="col-md-6">
                <p><span class="info-title">Tên bàn:</span> <span class="info-value">${datBan.ban.tenBan}</span></p>
                <p><span class="info-title">Vị trí:</span> <span class="info-value">${datBan.ban.vitri}</span></p>
            </div>
            <div class="col-md-6">
                <p><span class="info-title">Người đặt (email):</span> <span class="info-value">${datBan.nguoiDung.email}</span></p>
            </div>
        </div>
    </div>
            
                <c:if test="${not empty datBan.chiTietDatBanList }">
                    
                
    <h4 class="mb-3">Món Ăn Đã Đặt</h4>
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Hình Ảnh</th>
                    <th>Tên Món</th>
                    <th>Đơn Giá</th>
                    <th>Số Lượng</th>
                    <th>Thành Tiền</th>
                    <th>Ghi Chú</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${datBan.chiTietDatBanList}" var="item">
                    <tr>
                        <td><img src="${item.monAn.image}" alt="${item.monAn.tenMon}"></td>
                        <td>${item.monAn.tenMon}</td>
                        <td>${item.monAn.donGia} VND</td>
                        <td>${item.soLuong}</td>
                        <td><fmt:formatNumber value="${item.thanhTien}" type="currency" currencySymbol="₫"/></td>
                        <td>${datBan.ghiChu}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="4"><strong>Tổng cộng</strong></td>
                    <td colspan="2"><strong><fmt:formatNumber value="${datBan.tongTien}" type="currency" currencySymbol="₫"/></strong></td>
                </tr>
            </tbody>
        </table>
    </div>
   </c:if>

    <div class="button-container">
        <c:if test="${datBan.trangThai eq 'Da thanh toan' or datBan.trangThai eq 'Da xac nhan'}">
            <a href="huydondatban?idDB=${datBan.idDatBan}">
                <button class="cancel-btn">Xác Nhận Hủy</button>
            </a>
        </c:if>
    </div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>