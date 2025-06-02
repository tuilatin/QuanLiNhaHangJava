<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <style>
        .table-wrapper {
            margin: 30px auto;
            background: #fff;
            padding: 20px 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .table-title {
            margin-bottom: 15px;
        }

        .table-title h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .table-responsive {
            overflow-x: auto;
        }

        table.table {
            width: 100%;
            background-color: #fff;
            border-collapse: separate;
            border-spacing: 0;
        }

        table.table th, table.table td {
            border-top: 1px solid #dee2e6;
            padding: 12px 15px;
            text-align: center;
            vertical-align: middle;
        }

        table.table thead th {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            border-top: none;
            font-size: 16px;
        }

        table.table tbody tr {
            background-color: #f9f9f9;
            transition: all 0.3s ease;
        }

        table.table tbody tr:hover {
            background-color: #e9f5ff;
            transform: scale(1.005);
            box-shadow: 0 2px 10px rgba(0, 123, 255, 0.2);
            cursor: pointer;
        }

        table.table tbody td {
            font-size: 15px;
            color: #333;
        }

        .btn-primary {
            margin: 20px 0;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 8px;
        }

        h3.section-title {
            margin-top: 40px;
            color: #333;
            font-weight: bold;
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
                    <h2><b>${title}</b> <h2 style="color: red;">${time}</h2></h2>
                </div>
            </div>
        </div>



        <!-- Lịch sử đặt bàn -->
        <h3 class="section-title">Lịch sử đặt bàn</h3>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>ID Đặt Bàn</th>
                         <th>Tên Bàn</th>
                        <th>Ngày Đặt</th>
                        
                        <th>Giờ Đặt</th>
                       <th>Số Người</th>
                        <th>Trạng Thái</th>
                        <th>Tiền Cọc</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listDatBan}" var="datban">
                        <tr onclick="window.location='adDatBanchitiet?id=${datban.idDatBan}'" style="cursor: pointer;">
                            <td>${datban.idDatBan}</td>
                            <td>${datban.ban.tenBan}</td>
                            <td><fmt:formatDate value="${datban.thoiGianDat}" pattern="dd/MM/yyyy"/></td>
                            
                            <td><fmt:formatDate value="${datban.thoiGianDat}" pattern="HH:mm"/></td>
                            
                            <td>${datban.soNguoi}</td>
                            <td>${datban.trangThai}</td>
                            <td>${datban.tongTien}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Nút quay lại -->
        <a href="home"><button type="button" class="btn btn-primary">Back to home</button></a>
    </div>
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

    

</div>
</body>
</html>
