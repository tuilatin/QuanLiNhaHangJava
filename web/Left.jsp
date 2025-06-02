<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .card.bg-light {
        border: none;
        border-radius: 15px;
        box-shadow: 50 4px 30px rgba(0, 0, 0, 0.08);
        overflow: hidden;
    }

    .card-header {
        background: linear-gradient(45deg, #2196F3, #1976D2) !important;
        padding: 15px;
        font-size: 1.1rem;
        font-weight: 600;
        border: none;
    }

    .card-header i {
        margin-right: 10px;
    }

    .category_block {
        padding: 10px;
    }

    .list-group-item {
        border: none;
        padding: 12px 20px;
        margin-bottom: 5px;
        border-radius: 10px;
        transition: all 0.3s ease;
        background: #f8f9fa;
    }

    .list-group-item:hover {
        background: #e3f2fd;
        transform: translateX(5px);
    }

    .list-group-item.active {
        background: linear-gradient(45deg, #1976D2, #2196F3);
        border: none;
    }

    .list-group-item a {
        color: #333;
        text-decoration: none;
        font-weight: 500;
        display: block;
        transition: color 0.3s ease;
    }

    .list-group-item:hover a {
        color: #1976D2;
    }

    .list-group-item.active a {
        color: white;
    }

    .alert-warning {
        background-color: #fff3cd;
        color: #856404;
        border: none;
        border-radius: 10px;
        padding: 15px;
        margin: 10px;
        font-size: 0.9rem;
    }
</style>
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Các loại món ăn: </div>
        <c:if test="${empty loai}">
            <div class="alert alert-warning">Không có dữ liệu loại món</div>
        </c:if>
        <ul class="list-group category_block">
            <c:forEach items="${loai}" var="o">
                <li class="list-group-item text-white ${tag == o.ID_Loai ? "active" : ""}">
                    <a href="category?cid=${o.ID_Loai}">${o.tenLoai}</a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>