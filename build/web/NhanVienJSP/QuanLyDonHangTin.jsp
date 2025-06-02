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
                <th>ID đặt bàn</th>
                <th>Bàn đang ăn</th>
                <th>Tầng</th>
                <th>Xem chi tiết</th> <!-- Thêm cột -->
            </tr>
        </thead>  
        <tbody>
            <c:forEach items="${listBan}" var="ban">
                <tr>
                    <td>${ban.idBan}</td>
                    <td>${ban.tenBan}</td>
                    <td>${ban.vitri}</td>
                    <td>
                        <a class="btn-detail" href="#" onclick="loadContent('ChiTietDatMonControlTin?id=${ban.idBan}')">
                            Xem chi tiết
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
