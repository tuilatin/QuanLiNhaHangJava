<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    body {
        background-color: #f0f2f5;
        font-family: 'Poppins', sans-serif;
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order History</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <div class="container mt-5">
            <h2 class="text-center mb-4">Order History</h2>
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
                            
                    <c:if test="${orderList[0].status eq 'Da huy'}">
                        <a href="home">
                            <button class="confirm-btn">Mua lại</button>
                        </a>
                    </c:if>

                    <c:if test="${orderList[0].status ne 'Da huy'}">
                        <a href="huydon?idHD=${orderList[0].orderID}">
                            <button class="cancel-btn">Xác Nhận Hủy</button>
                        </a>
                              <a href="#">
                              <button class="received-btn">Đã Nhận Hàng</button>
                            </a>
                          </div>
                    </c:if>

                            
                        </div>   
                         
                          

        <!-- Add some custom styles -->
        <style>
            .badge {
                padding: 8px 12px;
                font-size: 14px;
            }
            .badge-success {
                background-color: #28a745;
            }
            .badge-warning {
                background-color: #ffc107;
                color: #000;
            }
            .badge-danger {
                background-color: #dc3545;
            }
            .table td, .table th {
                vertical-align: middle;
            }
        </style>

        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html> 