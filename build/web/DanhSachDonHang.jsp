<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%!
    // Hàm chuyển số thành chữ
    public String numberToWords(double number) {
        long numberLong = (long) number;
        String[] units = {"", "một", "hai", "ba", "bốn", "năm", "sáu", "bảy", "tám", "chín", "mười",
                "mười một", "mười hai", "mười ba", "mười bốn", "mười lăm", "mười sáu", "mười bảy", "mười tám", "mười chín"};
        String[] tens = {"", "", "hai mươi", "ba mươi", "bốn mươi", "năm mươi", "sáu mươi", "bảy mươi", "tám mươi", "chín mươi"};
        
        if (numberLong == 0) return "không";
        
        if (numberLong < 20) return units[(int)numberLong];
        
        if (numberLong < 100) {
            int ten = (int)numberLong/10;
            int unit = (int)numberLong%10;
            return tens[ten] + (unit > 0 ? " " + units[unit] : "");
        }
        
        if (numberLong < 1000) {
            int hundred = (int)numberLong/100;
            int remainder = (int)numberLong%100;
            return units[hundred] + " trăm" + (remainder > 0 ? " " + numberToWords(remainder) : "");
        }
        
        if (numberLong < 1000000) {
            int thousand = (int)numberLong/1000;
            int remainder = (int)numberLong%1000;
            return numberToWords(thousand) + " nghìn" + (remainder > 0 ? " " + numberToWords(remainder) : "");
        }
        
        if (numberLong < 1000000000) {
            int million = (int)numberLong/1000000;
            int remainder = (int)numberLong%1000000;
            return numberToWords(million) + " triệu" + (remainder > 0 ? " " + numberToWords(remainder) : "");
        }
        
        return "số quá lớn";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Lịch sử đơn hàng</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="Menu.jsp" />

<div class="container mt-5">
    <h2>Lịch sử đơn hàng</h2>

    <c:set var="orderItems">
        <c:out value="${pageContext.request.setAttribute('orderItems', [
            {'orderID': 101, 'orderDate': '2025-04-19 10:00:00', 'status': 'Đã giao', 'total': 500, 
             'productName': 'Giày Nike', 'image': 'https://via.placeholder.com/150', 'productPrice': 250, 'quantity': 1, 'subtotal': 250},
            {'orderID': 101, 'orderDate': '2025-04-19 10:00:00', 'status': 'Đã giao', 'total': 500, 
             'productName': 'Áo Hoodie', 'image': 'https://via.placeholder.com/150', 'productPrice': 125, 'quantity': 2, 'subtotal': 250},
            {'orderID': 102, 'orderDate': '2025-04-20 15:30:00', 'status': 'Chờ xử lý', 'total': 300,
             'productName': 'Túi xách', 'image': 'https://via.placeholder.com/150', 'productPrice': 150, 'quantity': 2, 'subtotal': 300}
        ])}" />
    </c:set>

    <c:if test="${empty orderItems}">
        <p>Không có đơn hàng nào.</p>
    </c:if>
    <c:if test="${not empty orderItems}">
        <c:set var="currentOrderID" value="-1" />
        <c:forEach var="item" items="${orderItems}" varStatus="status">
            <c:if test="${item.orderID != currentOrderID}">
                <c:set var="currentOrderID" value="${item.orderID}" />
                <hr/>
                <h4>Đơn hàng #${item.orderID}</h4>
                <p>Ngày đặt: ${item.orderDate}</p>
                <p>Trạng thái: ${item.status}</p>
            </c:if>

            <!-- Hiển thị sản phẩm -->
            <div class="card mb-3">
                <div class="row no-gutters">
                    <div class="col-md-3">
                        <img src="${item.image}" class="card-img" alt="${item.productName}">
                    </div>
                    <div class="col-md-9">
                        <div class="card-body">
                            <h5 class="card-title">${item.productName}</h5>
                            <p>Giá: ${item.productPrice} VNĐ</p>
                            <p>Số lượng: ${item.quantity}</p>
                            <p>Tạm tính: ${item.subtotal} VNĐ</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Hiện tổng tiền nếu là sản phẩm cuối cùng của đơn -->
            <c:choose>
                <c:when test="${status.index + 1 == fn:length(orderItems) || item.orderID != orderItems[status.index + 1].orderID}">
                    <div class="total-section">
                        <h5>Tổng tiền đơn hàng:</h5>
                        <p class="total-amount">${item.total} VNĐ</p>
                        <c:set var="totalAmount" value="${item.total}" />
                        <p class="total-text">Bằng chữ: <%= numberToWords((Double) pageContext.getAttribute("totalAmount")) %> đồng</p>
                    </div>
                </c:when>
            </c:choose>
        </c:forEach>
    </c:if>
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

<jsp:include page="Footer.jsp" />
</body>
</html>
