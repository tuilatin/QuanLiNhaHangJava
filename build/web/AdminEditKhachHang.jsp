<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa thông tin khách hàng</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
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
        
        .error-message {
            color: red;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<jsp:include page="AdminMenu.jsp" />
<div class="main-container">
    <jsp:include page="AdminLeft.jsp" />
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card mt-4">
                    <div class="card-header">
                        <h4>Chỉnh sửa thông tin khách hàng</h4>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty error}">
                            <div class="error-message">${error}</div>
                        </c:if>
                        
                        <form action="editKH" method="post">
                            <input type="hidden" name="cid" value="${khachHang.idKH}">

                            <div class="form-group">
                                <label>Tên khách hàng</label>
                                <input name="tenKH" type="text" class="form-control" required value="${khachHang.tenKH}">
                            </div>

                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" value="${khachHang.nguoiDung.email}" readonly>
                            </div>

                            <div class="form-group">
                                <label>Ngày tham gia</label>
                                <input name="ngayThamGia" type="text" class="form-control" required 
                                       value="${khachHang.ngayThamGia}">
                            </div>

                            <div class="form-group">
                                <label>Doanh số</label>
                                <input type="number" class="form-control" value="${khachHang.doanhSo}" readonly>
                            </div>

                            <div class="form-group">
                                <label>Điểm tích lũy</label>
                                <input type="number" class="form-control" value="${khachHang.diemTichLuy}" readonly>
                            </div>

                            <div class="form-group">
                                <label>Vai trò</label>
                                <select name="vaiTro" class="form-control" required>
                                    <option value="Khach Hang" ${khachHang.nguoiDung.vaitro eq 'Khach Hang' ? 'selected' : ''}>Khách Hàng</option>
                                    <option value="Nhan Vien" ${khachHang.nguoiDung.vaitro eq 'Nhan Vien' ? 'selected' : ''}>Nhân Viên</option>
                                    <option value="Nhan Vien Kho" ${khachHang.nguoiDung.vaitro eq 'Nhan Vien Kho' ? 'selected' : ''}>Nhân Viên Kho</option>
                                    <option value="Quan Ly" ${khachHang.nguoiDung.vaitro eq 'Quan Ly' ? 'selected' : ''}>Quản Lý</option>
                                </select>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                                <a href="adminkh" class="btn btn-secondary ml-2">Hủy</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
