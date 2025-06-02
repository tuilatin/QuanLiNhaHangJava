<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Employee</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
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
    </style>
</head>
<body>

<jsp:include page="AdminMenu.jsp" />
<div class="main-container">
    <jsp:include page="AdminLeft.jsp" />
    
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-header">
                        <h4>Edit Employee</h4>
                    </div>
                    <div class="card-body">
                        <form action="editnhanvien" method="post">
                            <input type="hidden" name="id" value="${nhanvien.id}">

                            <div class="form-group">
                                <label>Họ tên</label>
                                <input name="TenNV" type="text" class="form-control" required value="${nhanvien.tenNV}">
                            </div>

                            <div class="form-group">
                                <label>Ngày vào làm</label>
                                <input name="NgayVL" type="text" class="form-control" required value="${nhanvien.ngayVL}">
                            </div>

                            <div class="form-group">
                                <label>Số điện thoại</label>
                                <input name="SDT" type="text" class="form-control" required value="${nhanvien.sdt}">
                            </div>

                            <div class="form-group">
                                <label>Chức vụ</label>
                                <select name="Chucvu" class="form-control" required>
                                    <option value="Phuc vu" ${nhanvien.chucVu eq 'Phuc vu' ? 'selected' : ''}>Phục vụ</option>
                                    <option value="Tiep tan" ${nhanvien.chucVu eq 'Tiep tan' ? 'selected' : ''}>Tiếp tân</option>
                                    <option value="Thu ngan" ${nhanvien.chucVu eq 'Thu ngan' ? 'selected' : ''}>Thu ngân</option>
                                    <option value="Bep" ${nhanvien.chucVu eq 'Bep' ? 'selected' : ''}>Bếp</option>
                                    <option value="Kho" ${nhanvien.chucVu eq 'Kho' ? 'selected' : ''}>Kho</option>
                                    <option value="Quan ly" ${nhanvien.chucVu eq 'Quan ly' ? 'selected' : ''}>Quản lý</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Tình trạng</label>
                                <select name="Tinhtrang" class="form-control" required>
                                    <option value="Dang lam viec" ${nhanvien.tinhTrang eq 'Dang lam viec' ? 'selected' : ''}>Đang làm việc</option>
                                    <option value="Da nghi viec" ${nhanvien.tinhTrang eq 'Da nghi viec' ? 'selected' : ''}>Đã nghỉ việc</option>
                                </select>
                            </div>

                            <div class="modal-footer">
                                <a href="adminnv" class="btn btn-default">Hủy</a>
                                <input type="submit" class="btn btn-success" value="Cập nhật">
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
