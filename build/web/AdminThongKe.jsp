<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản trị hệ thống</title>
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   
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
        /* CSS thêm cho phần thống kê */
        .card-stat {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border-radius: 20px;
            padding: 25px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            transition: transform 0.3s;
            height: 180px;
        }
        .card-stat:hover {
            transform: translateY(-8px);
        }
        .card-stat i {
            font-size: 2.8rem;
        }
        .top-products {
            margin-top: 40px;
            background: #ffffff;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }
        .top-products table {
            width: 100%;
        }
        .top-products thead {
            background-color: #764ba2;
            color: white;
        }
        canvas {
            background: #ffffff;
            border-radius: 20px;
            padding: 20px;
            margin-top: 40px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }
        .wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: #f0f2f5;
}
.form-container {
    background: #fff;
    padding: 15px 20px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}
.form-container form {
    display: flex;
    align-items: center;
    gap: 10px; /* Khoảng cách giữa label, input và button */
}
.form-container label {
    font-weight: bold;
    font-size: 14px;
    white-space: nowrap; /* Không cho label xuống dòng */
}
.form-container input[type="date"] {
    padding: 6px 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 6px;
}
.form-container button {
    background-color: #4CAF50;
    color: white;
    padding: 7px 15px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
}
.form-container button:hover {
    background-color: #45a049;
}

    </style>

</head>

<body>

<jsp:include page="AdminMenu.jsp" />
<div class="main-container">
    <jsp:include page="AdminLeft.jsp" />
    
    <div class="content">
        <!-- Bắt đầu phần content thống kê -->
            <div class="form-container">
                <form action="tkchonngay" method="post">
                    <label for="ngayThangNam">Chọn ngày:</label>
                    <input type="date" id="ngayThangNam" name="ngayThangNam" required><br><br>

                    <button type="submit">Thông kê</button>
                </form>
            </div>
        <div class="container py-5">
          <h2 class="text-center mb-5"><i class="bi bi-graph-up-arrow"></i> Thông kê doanh thu: ${ngay} Tháng ${thang}, năm${nam}</h2>

          <div class="row g-4 text-center">
            <div class="col-md-4">
              <div class="card-stat">
                <i class="bi bi-receipt-cutoff mb-2"></i>
                <h5 class="mt-3">Tổng số hóa đơn</h5>
                <h2>${soLuongHoaDon} </h2>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card-stat">
                <i class="bi bi-cash-stack mb-2"></i>
                <h5 class="mt-3">Tổng doanh thu</h5>
                <h2>${tongDoanhThu} VND</h2>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card-stat">
                <i class="bi bi-box2-heart mb-2"></i>
                <h5 class="mt-3">Sản phẩm bán ra</h5>
                <h2>${tongSanPhamBanRa} món</h2>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card-stat">
                <i class="bi bi-percent mb-2"></i>
                <h5 class="mt-3">Giảm giá đã áp dụng</h5>
                <h2>${tongTienGiam} VND</h2>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card-stat">
                <i class="bi bi-patch-check mb-2"></i>
                <h5 class="mt-3">Đơn thành công</h5>
                <h2>${soLuongDonThanhCong}</h2>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card-stat">
                <i class="bi bi-clock-history mb-2"></i>
                <h5 class="mt-3">Đơn chưa thanh toán</h5>
                <h2>${soLuongDonChuaThanhToan}</h2>
              </div>
            </div>
          </div>

          <div class="top-products mt-5">
            <h2>Thống kê món ăn bán chạy tháng ${thang}/${nam}</h2>
               
            <table border="1" cellpadding="5">
                <thead>
                  <tr>
                      <th>Tên món ăn</th>
                      <th>Số lượng bán</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach var="o" items="${top5}">
                    <tr>
                        <td>${o.tenMon}</td>
                        <td>${o.soLuong}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
          </div>
        </div>

        <!-- Kết thúc phần content -->
    </div>

</div>

</body>
</html>
