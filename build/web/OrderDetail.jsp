<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .product-img {
            width: 80px;
            height: 80px;
            object-fit: cover;
        }
        .summary-box {
            border-top: 1px solid #ddd;
            margin-top: 20px;
            padding-top: 10px;
        }
        .btn-order {
            background-color: #ee4d2d;
            color: white;
            font-weight: bold;
        }
        .table td, .table th {
            vertical-align: middle;
        }
        .address-box, .shipping-box, .voucher-box {
            border: 1px solid #ddd;
            padding: 15px;
            margin-top: 10px;
        }
        .total-price {
            font-weight: bold;
            font-size: 1.25rem;
        }
        .discount {
            color: red;
        }
    </style>
</head>
<body>

<jsp:include page="Menu.jsp" />

<div class="container mt-4 mb-5">
    <!-- Địa chỉ -->
    <div class="address-box">
        <strong>Địa Chỉ Nhận Hàng</strong>
        <p class="mb-0">${user.fullname} | ${user.phone} - ${user.address} <a href="#">[Thay Đổi]</a></p>
    </div>

    <!-- Danh sách sản phẩm -->
    <div class="table-responsive">
        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th>Sản phẩm</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cartItems}">
                    <tr>
                        <td>
                            <div class="d-flex align-items-center">
                                <img src="${item.image}" class="product-img mr-3" alt="">
                                <div>
                                    <strong>${item.name}</strong><br>
                                    <small>${item.description}</small>
                                </div>
                            </div>
                        </td>
                        <td>${item.price} đ</td>
                        <td>${item.quantity}</td>
                        <td>${item.price * item.quantity} đ</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Vận chuyển -->
    <div class="shipping-box">
        <strong>Phương thức vận chuyển:</strong> Vận chuyển nhanh - 15.000 đ <a href="#">[Thay đổi]</a>
    </div>

    <!-- Voucher -->
    <div class="voucher-box">
        <strong>Voucher của Shop:</strong> -${discount} đ <a href="#">[Chọn Voucher]</a>
    </div>
    

    <!-- Tổng kết -->
    <div class="summary-box text-right">
        <p>Tổng tiền hàng: <strong>${subtotal} đ</strong></p>
        <p>Phí vận chuyển: <strong>15.000 đ</strong></p>
        <p class="discount">Voucher giảm: <strong>- ${discount} đ</strong></p>
        <h5 class="total-price">Tổng thanh toán: <strong class="text-danger">${subtotal + 15000 - discount} đ</strong></h5>

        <form action="checkout" method="post">
            <button type="submit" class="btn btn-order btn-lg">ĐẶT HÀNG</button>
        </form>
    </div>
</div>

<jsp:include page="Footer.jsp" />

</body>
</html>