<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<a href="http://localhost:8080/web_nhahang/NhanVienJSP/NhanVienHomeTin.jsp" style="
    display: inline-block;
    background-color: #4CAF50; 
    color: white; 
    padding: 10px 20px; 
    text-decoration: none;
    border-radius: 4px; 
    margin-bottom: 20px;
    font-size: 16px;
">
    Quay lại
</a>
<h2>Chi tiết món ăn của ${tenBan}</h2>
<table border="1">
    <tr>
        <th>Tên món</th>
        <th>Đơn giá</th>
        <th>Số lượng</th>
    </tr>
    <c:forEach var="item" items="${dsMon}">
        <tr>
            <td>${item.tenMon}</td>
            <td>${item.donGia}</td>
            <td>${item.soLuong}</td>
        </tr>
    </c:forEach>
</table>

<style>
/* Dán CSS ở đây hoặc link file .css bên ngoài */
table {
    width: 60%;
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 16px;
    font-family: Arial, sans-serif;
}

table th, table td {
    border: 1px solid #ddd;
    padding: 12px 15px;
    text-align: center;
}

table th {
    background-color: #4CAF50;
    color: white;
}

table tr:nth-child(even) {
    background-color: #f9f9f9;
}

table tr:hover {
    background-color: #f1f1f1;
    transition: background-color 0.3s;
}

h2 {
    font-size: 24px;
    font-weight: bold;
    margin: 10px 0;
    color: #333;
}
</style>
