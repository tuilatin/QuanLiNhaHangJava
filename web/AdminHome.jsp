<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản trị hệ thống</title>
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

        .card {
            background: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            margin-bottom: 20px;
            cursor: pointer;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

        .table th, .table td {
            padding: 12px 10px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        .badge {
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 12px;
            display: inline-block;
        }

        .badge-success {
            background-color: #e0f9f1;
            color: #2e9d74;
        }

        .badge-warning {
            background-color: #fff6e0;
            color: #b98a20;
        }

        .btn-detail {
            background-color: #28a745;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            font-size: 13px;
            cursor: pointer;
        }

        .btn-detail:hover {
            background-color: #218838;
        }

        .tab-list {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
        }

        .tab-list a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            padding-bottom: 4px;
        }

        .tab-list a.active {
            color: #0056b3;
            border-bottom: 2px solid #0056b3;
        }

        .search-box {
            float: right;
            margin-bottom: 10px;
        }

        .search-box input {
            padding: 6px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

    </style>
</head>
<body>

<jsp:include page="AdminMenu.jsp" />
<div class="main-container">
    <jsp:include page="AdminLeft.jsp" />

    <div class="content">
        <h2>Lịch sử đặt bàn</h2>

        <div class="card">
            <button class="btn-primary">+ Tạo đơn đặt bàn</button>

            <div class="tab-list">
                <a href="#" class="active">Tất cả</a>
                <a href="#">Chưa nhận bàn</a>
                <a href="#">Đã nhận bàn</a>
                <a href="#">Đã huỷ</a>
                <a href="#">Đã hoàn thành</a>
            </div>

            <div class="search-box">
                <input type="text" placeholder="Nhập từ khóa tìm kiếm...">
            </div>

            <table class="table">
                <thead>
                <tr>
                    <th>Dự kiến nhận bàn</th>
                    <th>Khách hàng</th>
                    <th>Đặt cọc</th>
                    <th>Số khách</th>
                    <th>Khu vực/Bàn</th>
                    <th>Trạng thái</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>02/06/2023 (8 - 10 giờ)</td>
                    <td>Hồ Anh Hòa<br>0865787333</td>
                    <td>0 đ</td>
                    <td>3</td>
                    <td>Sảnh chính, bàn 2</td>
                    <td><span class="badge badge-success">Đã hoàn thành</span></td>
                    <td><button class="btn-detail">👁️ Chi tiết</button></td>
                </tr>
                <tr>
                    <td>02/06/2023 (10 - 12 giờ)</td>
                    <td>Hồ Anh Hòa<br>0865787333</td>
                    <td>0 đ</td>
                    <td>2</td>
                    <td>, bàn</td>
                    <td><span class="badge badge-warning">Chưa nhận bàn</span></td>
                    <td><button class="btn-detail">👁️ Chi tiết</button></td>
                </tr>
                <!-- Thêm các dòng tương tự nếu cần -->
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
