<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <div class="card bg-light mb-3">
        <div class="card-header bg-success text-white text-uppercase">Last product</div>
        <div class="card-body">
            <img class="img-fluid" src="https://image.yes24.vn/Upload/ProductImage/GmarketSport/2058803_L.jpg?width=550&height=550" />
            <h5 class="card-title">Giày đi chơi tết</h5>
            <p class="card-text">Comfortable Sports Shoes Men Athletic Outdoor Cushioning Sneakers for Walking&Jogging (EUR Size 39-48)</p>
            <p class="bloc_left_price">100 VND</p>
        </div>
    </div>
</div>