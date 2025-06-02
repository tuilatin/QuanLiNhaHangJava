<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <div class="container">
            <div class="row">
                <div class="col-md-8 mx-auto">
                    <div class="card">
                        <div class="card-header">
                            <h4>Edit Product</h4>
                        </div>
                        <div class="card-body">
                            <%--<c:if test="${not empty error}">--%>
                                <!--<div class="alert alert-danger">-->
                                    <!--${error}-->
                                <!--</div>-->
                            <%--</c:if>--%>
                            <form action="editproduct" method="post">
                                <input type="" name="pid" value="${product.idMonAn}">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="TenMon" type="text" class="form-control" required value="${product.tenMon}">
                                </div>
                                <div class="form-group">
                                    <label>Image URL</label>
                                    <input name="Image" type="text" class="form-control" required value="${product.image}">
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input name="DonGia" type="number" class="form-control" required value="${product.donGia}">
                                </div>
                                
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="MoTa" class="form-control" rows="3" required>${product.moTa}</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Status</label>
                                    <select name="TrangThai" class="form-control" required>
                                        <option value="Dang kinh doanh" ${product.trangThai eq 'Dang kinh doanh' ? 'selected' : ''}>Đang kinh doanh</option>
                                        <option value="Ngung kinh doanh" ${product.trangThai eq 'Ngung kinh doanh' ? 'selected' : ''}>Ngừng kinh doanh</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="ID_Loai" class="form-control">
                                        <c:forEach items="${listCC}" var="o">
                                            <option value="${o.ID_Loai}" ${product.idLoai == o.ID_Loai ? "selected" : ""}>${o.tenLoai}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Update Product</button>
                                <a href="manager" class="btn btn-secondary">Cancel</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html> 