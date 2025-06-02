<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Customer</title>
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
    </style>
</head>
<body>

<jsp:include page="Menu.jsp" />
<div class="main-container">
  
    
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-header">
                        <h4>Edit Customer</h4>
                    </div>
                    <div class="card-body">
                        <form action="informkh" method="get">
                            <input type="hidden" name="id" value="${khachhang.idKH}">

                            <div class="form-group">
                                <label>Họ tên khách hàng</label>
                                <input name="tenKH" type="text" class="form-control" required value="${khachhang.tenKH}">
                            </div>

                            <div class="form-group">
                                <label>Số điện thoại</label>
                                <div style="display: flex;">
                                    <span style="padding: 6px 12px; background: #eee; border: 1px solid #ccc; border-right: none; border-radius: 4px 0 0 4px; display: flex; align-items: center;">+84</span>
                                    <input name="sdt" type="text" class="form-control" required
                                           value="${khachhang.sdt}"
                                           pattern="\d{9}"
                                           maxlength="9"
                                           title="Vui lòng nhập đúng 9 chữ số"
                                           style="border-radius: 0 4px 4px 0; border-left: none;">
                                </div>
                            </div>

                            <h5 class="mt-4">Địa chỉ</h5>


                            <div class="form-group">
                                <label>Tỉnh / Thành phố</label>
                                <input name="tinhThanh" type="text" class="form-control" required value="${khachhang.diaChi.tinhThanh}">
                            </div>
                                                       
                            <div class="form-group">
                                <label>Quận / Huyện</label>
                                <input name="quanHuyen" type="text" class="form-control" required value="${khachhang.diaChi.quanHuyen}">
                            </div>                            
                            
                            <div class="form-group">
                                <label>Phường / Xã</label>
                                <input name="Phuongxa" type="text" class="form-control" required value="${khachhang.diaChi.phuongXa}">
                            </div>
                                
                            <div class="form-group">
                                <label>Số nhà / Tên đường</label>
                                <input name="soNhaDuong" type="text" class="form-control" required value="${khachhang.diaChi.soNhaDuong}">
                            </div>
                            
                            <div class="form-group">
                                <label>Ghi chú</label>
                                <input name="ghiChu" type="text" class="form-control" required value="${khachhang.diaChi.ghiChu}">
                            </div>





                            


                            <div class="modal-footer">
                                <a href="home" class="btn btn-default">Hủy</a>
                                <input type="submit" class="btn btn-success" value="Cập nhật">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="Footer.jsp" />
</body>
</html>
