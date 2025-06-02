<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý khách hàng</title>

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

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/manager.css" rel="stylesheet" type="text/css"/>
    
    <style>
        .edit i {
            color: red;
            transition: 0.3s ease;
            font-size: 20px;
        }

        .edit:hover i {
            color: Blue;
            transform: scale(1.2);
            cursor: pointer;
        }
        
    </style>
</head>

<body>
<jsp:include page="AdminMenu.jsp" />




<div class="main-container">
    <jsp:include page="AdminLeft.jsp" />
    

    <div class="container">
        <div class="d-flex flex-wrap gap-2 my-3">
            <a href="hoadondate" class="btn btn-primary">Hóa đơn hôm nay</a>
            <a href="hoadonweek" class="btn btn-primary">Hóa đơn tuần này</a>
            <a href="hoadonmonth" class="btn btn-primary">Hóa đơn tháng này</a>
            <a href="hoadonyear" class="btn btn-primary">Hóa đơn năm nay</a>
            <a href="dshoadon" class="btn btn-primary">Tất cả hóa đơn</a>
        </div>

        <div class="table-wrapper">
            <div class="table-title">
                
                
    <div class="row">
        <div class="col-sm-6">
            <h2> <b>${title}</b> <h2 style="color: red;">${time}</h2>
</h2>
            
         </div>
    </div>
</div>

<div class="table-responsive">
        
    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>ID Hóa đơn</th>
            <th>Người tạo</th>
            <th>Bàn</th>
            <th>Ngày tạo</th>
            <th>Tiền món ăn</th>
            <th>Voucher</th>
            <th>Giảm</th>
            <th>Tổng tiền</th>
            <th>Trạng thái</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listHD}" var="hd">
            <tr>
                <td>${hd.idHoaDon}</td>
                <td>${hd.nguoiDung.email}</td>
                <td>${hd.ban.tenBan}</td>
                <td>${hd.ngayHD}</td>
                <td>${hd.tienMonAn}</td>
                <td>${hd.codeVoucher}</td>
                <td>${hd.tienGiam}</td>
                <td>${hd.tongTien}</td>
                <td>${hd.trangThai}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

        </div>

        <a href="home"><button type="button" class="btn btn-primary">Back to home</button></a>
    </div>

    <!-- Modal thêm khách hàng -->
    <div id="addCustomerModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="addcustomer" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Customer</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Name</label>
                            <input name="TenKH" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input name="Email" type="email" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>SĐT</label>
                            <input name="SDT" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <input name="DiaChi" type="text" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Status</label>
                            <select name="TrangThai" class="form-control">
                                <option value="Hoạt động">Hoạt động</option>
                                <option value="Ngừng">Ngừng</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-success" value="Add">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function xuLyCheckbox(idKH) {
            const checkbox = document.getElementById("checkbox_" + idKH);
            const trangThai = checkbox.checked ? "Hoạt động" : "Ngừng";

            fetch("updateTrangThaiKhachHang", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "id=" + idKH + "&trangThai=" + trangThai
            })
            .then(response => response.text())
            .then(data => {
                alert(data);
                if (data === "Cập nhật thành công") location.reload();
            })
            .catch(error => alert("Lỗi: " + error));
        }
    </script>

</div>
</body>
</html>
