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
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Manage <b>Customer</b></h2>
                    </div>
                    <div class="col-sm-6">
                        <a href="#addCustomerModal" class="btn btn-success" data-toggle="modal">
                            <i class="material-icons">&#xE147;</i> <span>Add New Customer</span>
                        </a>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>
                            <span class="custom-checkbox">
                                <input type="checkbox" id="selectAll">
                                <label for="selectAll"></label>
                            </span>
                        </th>
                        <th>ID</th>
                        <th>Tên khách hàng</th>
                        <th>Email</th>
                        <th>Ngày tham gia</th>
                        <th>Doanh số</th>
                        <th>Điểm tích lũy</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listKH}" var="o">
                        <tr>
                            <td><input type="checkbox" name="options[]" value="${o.idKH}"></td>
                            <td>${o.idKH}</td>
                            <td>${o.tenKH}</td>
                            <td>${o.nguoiDung.email}</td>
                            <td>${o.ngayThamGia}</td>
                            <td>${o.doanhSo}</td>
                            <td>${o.diemTichLuy}</td>
                            <td>
                                <a href="editKH?cid=${o.idKH}" class="edit">
                                    <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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
