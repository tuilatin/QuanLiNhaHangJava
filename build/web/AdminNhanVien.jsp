<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý nhân viên</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f7f9fc;
            min-height: 100vh;
        }

        .main-container {
            display: flex;
            min-height: 100vh;
            width: 100%;
            
            
        }

        .row {
            margin: 0;
            width: 100%;
            flex: 1;
            margin-left: 10px;
        }

        .table-wrapper {
            background: white;
            padding: 2px;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
            margin: 20px;
            width: calc(100% - 40px);
        }

        .table-title {
            background: #435d7d;
            color: #fff;
            padding: 16px 30px;
            margin: -20px -20px 10px;
            border-radius: 3px 3px 0 0;
        }

        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }

        .table-title .btn {
            float: right;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            padding: 6px 12px;
            margin-left: 5px;
        }

        .table {
            width: 100%;
            margin-bottom: 0;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }

        .table-hover tbody tr:hover {
            background: #f5f5f5;
        }

        @media screen and (max-width: 768px) {
            .main-container {
                flex-direction: column;
            }
            
            .table-wrapper {
                margin: 10px;
                width: calc(100% - 20px);
                overflow-x: auto;
            }
            
            .table-title {
                padding: 12px 15px;
            }
            
            .table-title h2 {
                font-size: 20px;
            }
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

    <div class="row">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Quản lý <b>Nhân viên</b></h2>
                    </div>
                    <div class="col-sm-6 text-right">
                        <a href="#addModal" class="btn btn-success" data-toggle="modal">
                            <i class="material-icons">&#xE147;</i> <span>Thêm nhân viên</span>
                        </a>
                    </div>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Họ tên</th>
                        <th>Email</th>
                        <th>SĐT</th>
                        <th>Ngày vào làm</th>
                        <th>Chức vụ</th>
                        <th>Trạng thái</th>
                        <th>Sửa</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listnv}" var="nv">
                        <tr>
                            <td>${nv.id}</td>
                            <td>${nv.tenNV}</td>
                            <td>${nv.nguoiDung.email}</td>
                            <td>${nv.sdt}</td>
                            <td>${nv.ngayVL}</td>
                            <td>${nv.chucVu}</td>
                            <td>
                                ${nv.tinhTrang}
                            </td>
                            <td>
                                <a href="editnhanvien?id=${nv.id}" class="edit">
                                    <i class="material-icons" title="Sửa">&#xE254;</i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Modal thêm nhân viên -->
            <div id="addModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="addnhanvien" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Thêm nhân viên</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>Họ tên</label>
                                    <input name="hoTen" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Email</label>
                                    <input name="email" type="email" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>SĐT</label>
                                    <input name="sdt" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Ngày vào làm</label>
                                    <input name="ngayVaoLam" type="date" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Chức vụ</label>
                                    <select name="chucVu" class="form-control" required>
                                        <option value="Phuc vu">Phục vụ</option>
                                        <option value="Tiep tan">Tiếp tân</option>
                                        <option value="Thu ngan">Thu ngân</option>
                                        <option value="Bep">Bếp</option>
                                        <option value="Kho">Kho</option>
                                        <option value="Quan ly">Quản lý</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Trạng thái</label>
                                    <select name="trangThai" class="form-control" required>
                                        <option value="Dang lam viec">Đang làm việc</option>
                                        <option value="Da nghi viec">Đã nghỉ việc</option>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                                <input type="submit" class="btn btn-success" value="Thêm">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Xử lý thay đổi trạng thái -->
            <script>
                function xuLyCheckbox(id) {
                    const checkbox = document.getElementById("checkbox_" + id);
                    const trangThai = checkbox.checked ? "Dang lam viec" : "Da nghi viec";

                    fetch("updateTrangThaiNhanVien", {
                        method: "POST",
                        headers: { "Content-Type": "application/x-www-form-urlencoded" },
                        body: "id=" + id + "&trangThai=" + trangThai
                    })
                    .then(response => response.text())
                    .then(data => {
                        alert(data);
                        if(data === "Cập nhật thành công") {
                            location.reload();
                        }
                    })
                    .catch(error => alert("Lỗi: " + error));
                }
            </script>
        </div>
    </div>
</div>
</body>
</html>
