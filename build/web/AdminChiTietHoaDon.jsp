<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý khách hàng</title>

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
        h2 {
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

    .table {
        margin-bottom: 0;
        color: #333;
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

    .table tfoot td {
        text-align: right;
        font-weight: bold;
        background: #f8f9fa;
        font-size: 16px;
        border-top: 2px solid #dee2e6;
    }

    /* Responsive: thu gọn table trên mobile */
    @media (max-width: 768px) {
        .table thead {
            display: none;
        }
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
    }


  

    .button-container {
      display: flex;
      gap: 15px;
      justify-content: center;
      margin-bottom: 40px;
    }

    a {
      text-decoration: none;
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

    /* Nút Xác Nhận */
    .confirm-btn {
      background-color: #4CAF50; /* Màu xanh lá */
      color: white;
    }

    .confirm-btn:hover {
      background-color: #45a049;
    }

    /* Nút Hủy */
    .cancel-btn {
      background-color: #f44336; /* Màu đỏ */
      color: white;
    }

    .cancel-btn:hover {
      background-color: #e53935;
    }

    /* Nút Đã Nhận Hàng */
    .received-btn {
      background-color: #2196F3; /* Màu xanh dương */
      color: white;
    }

    .received-btn:hover {
      background-color: #1976D2;
    }
    </style>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/manager.css" rel="stylesheet" type="text/css"/>
    
    <style>
        .edit i {
            color: red;
            transition: 0.3s ease;
            font-size: 20px;
        }

        .edit:hover i {
            color: Blue;
            transform: scale(1.2);
            cursor: pointer;
        }
    </style>
    <style>
.order-status-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    font-family: Arial, sans-serif;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.order-status-table th, .order-status-table td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: center;
}

.order-status-table th {
    background-color: #f2f2f2;
    font-weight: bold;
}

.order-status-table tr:nth-child(even) {
    background-color: #fafafa;
}

.order-status-table tr:hover {
    background-color: #f1f1f1;
}

/* Trạng thái */
.status {
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 0.9em;
    font-weight: bold;
    display: inline-block;
    color: black ;
}

/* Màu cho từng trạng thái */
.status-pending {
    background-color: #f0ad4e; /* vàng */
}

.status-confirmed {
    background-color: #5bc0de; /* xanh dương nhạt */
}

.status-cancelled {
    background-color: #d9534f; /* đỏ */
}

.status-delivered {
    background-color: #5cb85c; /* xanh lá */
}
</style>

</head>

<body>
<jsp:include page="AdminMenu.jsp" />
<div class="main-container">
    <jsp:include page="AdminLeft.jsp" />

    <div class="container">
        <div class="table-wrapper">
                       <h2 class="text-center mb-4">Thông tin đơn hàng</h2>
                       
                       <div class="p-4 mb-0 bg-white rounded shadow-sm d-flex align-items-center">
    <div class="mr-3" style="font-size: 1.5rem; color: red;">
        <i class="fa fa-map-marker" aria-hidden="true"></i>
    </div>
    <div style="flex-grow: 1;">
        <strong>Địa Chỉ Nhận Hàng</strong><br>
        <span><strong>${khachhang.tenKH} (+84) ${khachhang.sdt}</strong> &nbsp;
            ${khachhang.diaChi.soNhaDuong}, ${khachhang.diaChi.phuongXa}, ${khachhang.diaChi.quanHuyen}, ${khachhang.diaChi.tinhThanh}, ${khachhang.diaChi.ghiChu}</span>

    </div>
</div>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Status</th>
                            <th>Product</th>
                            <th>Image</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${orderList}" var="order">
                            <tr>
                                <td>${order.orderID}</td>
                                <td>${order.orderDate}</td>
                                <td>
                                    <span class="">
                                        ${order.status}
                                    </span>
                                </td>
                                <td>${order.productName}</td>
                                <td>
                                    <img src="${order.productImage}" alt="${order.productName}" style="width: 50px; height: 50px;">
                                </td>
                                <td>${order.productPrice} VND</td>
                                <td>${order.quantity}</td>
                                <td>${order.subtotal} VND</td>
                               
                                
                            </tr>
                            
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="7" class="text-right"><strong>Total Order Amount:</strong></td>
                            <td><strong>${orderList[0].total} VND</strong></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
                        
        </div>
                                               <div class="button-container">
                                                   
                    <c:if test="${orderList[0].status eq 'Cho xac nhan' 
                                  or orderList[0].status eq 'Da thanh toan'
                          or orderList[0].status eq 'Chua thanh toan'}">
                        <a href="capnhat?idHD=${orderList[0].orderID}&trangthai=Da xac nhan">
                            <button class="confirm-btn"> Xác nhận đơn hàng </button>
                        </a>
                    </c:if>
                    <c:if test="${orderList[0].status eq 'Da xac nhan'}">
                        <a href="capnhat?idHD=${orderList[0].orderID}&trangthai=Dang chuan bi hang">
                            <button class="confirm-btn">Chuẩn bị hàng</button>
                        </a>
                    </c:if>
                     <c:if test="${orderList[0].status eq 'Dang chuan bi hang'}">
                        <a href="capnhat?idHD=${orderList[0].orderID}&trangthai=Dang giao hang">
                            <button class="confirm-btn">Giao hàng</button>
                        </a>
                    </c:if>
                    <c:if test="${orderList[0].status eq 'Dang giao hang'}">
                        <a href="capnhat?idHD=${orderList[0].orderID}&trangthai=Giao thanh cong">
                            <button class="confirm-btn">Giao hàng thành công </button>
                        </a>
                        <a href="capnhat?idHD=${orderList[0].orderID}&trangthai=Giao that bai">
                            <button class="cancel-btn">Giao hàng thất bại</button>
                        </a>
                    </c:if>
                                                    

                    <c:if test="${orderList[0].status eq 'Cho xac nhan' 
                                  or orderList[0].status eq 'Chua thanh toan'
                          or orderList[0].status eq 'Da thanh toan'
                          or orderList[0].status eq 'Dang chuan bi hang'
                          or orderList[0].status eq 'Da xac nhan'}">
                        <a href="capnhat?idHD=${orderList[0].orderID}&trangthai=Da huy">
                            <button class="cancel-btn">Xác Nhận Hủy</button>
                        </a>
                                                     
                    </c:if>
                    <c:if test="${orderList[0].status eq 'Da huy'}">
                        <a href="capnhat?idHD=${orderList[0].orderID}&trangthai=Hoan tien">
                            <button class="confirm-btn">Hoàn tiền</button>
                        </a>
                    </c:if>  
                        </div>
                        <%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.HoaDon_TrangThai" %>

<%
    List<HoaDon_TrangThai> listTrangThai = (List<HoaDon_TrangThai>) request.getAttribute("listTrangThai");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
%>

<table class="order-status-table">
    <tr>
        <th>Thời gian (Ngày - Giờ)</th>
        <th>Trạng thái</th>
     
        
    </tr>
    <%
        if (listTrangThai != null) {
            for (HoaDon_TrangThai hdt : listTrangThai) {
                String statusClass = "";
                if (hdt.getTrangThai().toLowerCase().contains("chờ xác nhận")) {
                    statusClass = "status-pending";
                } else if (hdt.getTrangThai().toLowerCase().contains("đã xác nhận")) {
                    statusClass = "status-confirmed";
                } else if (hdt.getTrangThai().toLowerCase().contains("đã hủy")) {
                    statusClass = "status-cancelled";
                } else if (hdt.getTrangThai().toLowerCase().contains("đã giao")) {
                    statusClass = "status-delivered";
                }
    %>
    <tr>
        <td class="timestamp"><%= sdf.format(hdt.getNgayThayDoi()) %></td>
        <td><span class="status <%= statusClass %>"><%= hdt.getTrangThai() %></span></td>

        
    </tr>
    <%
            }
        }
    %>
</table>
        <a href="home"><button type="button" class="btn btn-primary">Back to home</button></a>
    </div>

    <!-- Modal thêm khách hàng -->


    <script>
        function xuLyCheckbox(idKH) {
            const checkbox = document.getElementById("checkbox_" + idKH);
            const trangThai = checkbox.checked ? "Hoạt động" : "Ngừng";

            fetch("updateTrangThaiKhachHang", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "id=" + idKH + "&trangThai=" + trangThai
            })
            .then(response => response.text())
            .then(data => {
                alert(data);
                if (data === "Cập nhật thành công") location.reload();
            })
            .catch(error => alert("Lỗi: " + error));
        }
    </script>

</div>
</body>
</html>
