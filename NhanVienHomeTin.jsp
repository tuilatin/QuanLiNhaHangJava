<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Trang Nhân Viên</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
    />
    <link rel="stylesheet" href="../css/StyleNhanVienTin.css" />
    <link rel="stylesheet" href="../css/StyleThucDonTin.css" />
    <link rel="stylesheet" href="../css/StyleBanAnTin.css" />
    <link rel="stylesheet" href="../css/StyleGoiMonTin.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
      // Hàm AJAX để load nội dung vào khung content
      function loadContent(pageUrl) {
        console.log("Loading: " + pageUrl); // Debug
        $.ajax({
          url: "${pageContext.request.contextPath}/" + pageUrl,
          type: "GET",
          success: function (response) {
            console.log("Success response:", response); // Debug
            $("#content").html(response);
          },
          error: function (xhr, status, error) {
            console.log("Error:", error); // Debug
            console.log("Status:", status);
            console.log("Response:", xhr.responseText);
          },
        });
      }
    </script>
  </head>
  <body>
    <div class="header">
      <div>Nhà Hàng</div>
      <div class="right">
        Xin chào nv1 &nbsp;|&nbsp;
        <a href="Home" style="color: #fff; text-decoration: underline"
          >Đăng xuất</a
        >
      </div>
    </div>
    <div class="main-container">
      <div class="sidebar">
        <div class="menu-box">
          <h4><i class="material-icons">menu</i> Menu Chức Năng</h4>
          <ul>
            <li>
              <a href="#" onclick="loadContent('BanAnTin')"
                ><i class="material-icons">event_seat</i> Bàn Ăn</a
              >
            </li>
            <li>
              <a href="#" onclick="loadContent('HoaDon.jsp')"
                ><i class="material-icons">receipt</i> Hóa Đơn</a
              >
            </li>
            <li>
              <a href="#" onclick="loadContent('ThucDonTin')"
                ><i class="material-icons">restaurant_menu</i> Thực Đơn</a
              >
            </li>
            <li>
              <a href="#" onclick="loadContent('GoiMonTin')"
                ><i class="material-icons">shopping_cart</i> Gọi Món</a
              >
            </li>
            <li>
              <a href="#" onclick="loadContent('QuanLyDonHang.jsp')"
                ><i class="material-icons">assignment</i> Quản Lý Đơn Hàng</a
              >
            </li>
            <li>
              <a href="#" onclick="loadContent('LichSuLamViec.jsp')"
                ><i class="material-icons">history</i> Lịch Sử Làm Việc</a
              >
            </li>
            <li>
              <a href="#" onclick="loadContent('YeuCauNhapKho.jsp')"
                ><i class="material-icons">inventory_2</i> Yêu Cầu Nhập Kho</a
              >
            </li>
          </ul>
        </div>
      </div>
      <div class="content" id="content">
        <!-- Nội dung sẽ được load vào đây -->
        <p>Chọn chức năng từ menu bên trái</p>
      </div>
    </div>
  </body>
</html>
