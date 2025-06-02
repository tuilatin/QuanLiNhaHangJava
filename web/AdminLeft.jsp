<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Thêm link CDN vào <head> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">


<style>
  .sidebar {
    width: 200px;
    background-color: #f8f9fa;
    height: 100vh;
    padding-top: 20px;
    box-shadow: 2px 0 5px rgba(0,0,0,0.1);
    overflow-y: auto;
  }

  .menu-item {
    cursor: pointer;
    position: relative;
  }

  .menu-item > a {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 20px;
    color: #000;
    text-decoration: none;
    font-weight: bold;
    transition: background 0.3s;
  }

  .menu-item > a:hover {
    background-color: #e9ecef;
  }

  .submenu {
    display: none;
    padding-left: 10px;
  }

  .submenu a {
    display: block;
    padding: 8px 20px;
    color: #000;
    text-decoration: none;
    font-weight: normal;
  }

  .submenu a:hover {
    background-color: #dee2e6;
  }

  .active > .submenu {
    display: block;
  }

  .arrow {
    transition: transform 0.3s ease;
  }

  .active .arrow {
    transform: rotate(180deg);
  }
</style>

<div class="sidebar">
    <div class="menu-item" onclick="toggleMenu(this)">
    <a href="#">📊 Thống kê <span class="arrow"><i class="fas fa-chevron-down"></i></span></a>
    <div class="submenu">
        <a href="thongkemonth">Thông kê tháng Này</a>
      <a href="thongkeday">Doanh thu hôm nay</a>
      <a href="#">Theo món bán chạy</a>
      <a href="#">Báo cáo theo thời gian</a>
    </div>
  </div>
    
      <div class="menu-item" onclick="toggleMenu(this)">
    <a href="#">🧾 Quản lí Đơn hàng <span class="arrow"><i class="fas fa-chevron-down"></i></span></a>
    <div class="submenu">
        <a href="dshoadon">Danh sách đơn hàng</a>
      <a href="hoadonchuatt">Hóa đơn Chưa Thanh Toán</a>
      <a href="hoadondahuy">Hóa đơn đã hủy</a>
    </div>
  </div>
    
    <div class="menu-item" onclick="toggleMenu(this)">
    <a href="#">📅 Đặt bàn <span class="arrow"><i class="fas fa-chevron-down"></i></span></a>
    <div class="submenu">
      <a href="adDsdatban">Lịch đặt bàn</a>
      <a href="getdatbantoday">Lịch đặt bàn hôm nay</a>
      
    </div>
  </div>
    
    <div class="menu-item" onclick="toggleMenu(this)">
    <a href="#">📋 Thực đơn <span class="arrow"><i class="fas fa-chevron-down"></i></span></a>
    <div class="submenu">
      <a href="manager">Danh sách món ăn</a>
      <a href="#addEmployeeModal"   data-toggle="modal">Thêm món ăn</a>
                           
      <a href="#">Ẩn/hiện món</a>
    </div>
  </div>
      <div class="menu-item" onclick="toggleMenu(this)">
    <a href="#">👨‍💼 Nhân viên <span class="arrow"><i class="fas fa-chevron-down"></i></span></a>
    <div class="submenu">
      <a href="adminnv">Danh sách nhân viên</a>
      <a href="#">Phân quyền</a>
      
    </div>
  </div>
  <div class="menu-item" onclick="toggleMenu(this)">
    <a href="#">🧍‍♂️ Khách hàng <span class="arrow"><i class="fas fa-chevron-down"></i></span></a>
    <div class="submenu">
      <a href="adminkh">Danh sách khách hàng</a>
      
      <a href="#">Lịch sử đặt hàng</a>
    </div>
  </div>
  

  
  

</div>

<script>
  function toggleMenu(clickedItem) {
    const menuItems = document.querySelectorAll('.menu-item');
    menuItems.forEach(item => {
      if (item !== clickedItem) {
        item.classList.remove('active');
      }
    });
    clickedItem.classList.toggle('active');
  }
</script>
