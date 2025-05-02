<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="product-management">
    <div class="search-bar">
        <input type="text" placeholder="Quản lý sản phẩm" />
        <button class="search-button">
            <i class="fas fa-search"></i>
        </button>
    </div>

    <table class="product-table">
        <thead>
            <tr>
                <th>Hình ảnh</th>
                <th>Tên sản phẩm</th>
                <th>Loại Món</th>
                <th>Giá</th>
                <th>Trạng thái</th>
            </tr>
        </thead>
        <tbody>
                <c:forEach items="${listMonAn}" var="monAn">
                <tr>
                    <td>
                        <img src="${monAn.image}" 
                             alt="${monAn.tenMon}" 
                             class="product-image" />
                    </td>
                    <td>${monAn.tenMon}</td>
                    <td>${listMonMap[monAn.idLoai]}</td>
                    <td class="price">
                        <fmt:formatNumber value="${monAn.donGia}" type="currency" 
                                        currencySymbol="" maxFractionDigits="0"/>đ
                    </td>
                    <td>
                        <span class="status-badge">${monAn.trangThai}</span>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>