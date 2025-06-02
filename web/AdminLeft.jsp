<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <a href="#">📊 Thống kê <span class="arrow">▼</span></a>
    <div class="submenu">
        <a href="thongkemonth">Thông kê tháng Này</a>
      <a href="thongkeday">Doanh thu hôm nay</a>
      <a href="#">Theo món bán chạy</a>
      <a href="#">Báo cáo theo thời gian</a>
    </div>
  </div>
    
      <div class="menu-item" onclick="toggleMenu(this)">
    <a href="#">🧾 Hóa đơn <span class="arrow">▼</span></a>
    <div class="submenu">
        <a href="dshoadon">Danh sách đơn hàng</a>
      <a href="hoadonchuatt">Hóa đơn Chưa Thanh Toán</a>
      <a href="hoadondahuy">Hóa đơn đã hủy</a>
    </div>
  </div>
    
    <div class="menu-item" onclick="toggleMenu(this)">
    <a href="#">📋 Thực đơn <span class="arrow">▼</span></a>
    <div class="submenu">
      <a href="manager">Danh sách món ăn</a>
      <a href="#addEmployeeModal"   data-toggle="modal">Thêm món ăn</a>
                           
      <a href="#">Ẩn/hiện món</a>
    </div>
  </div>
      <div class="menu-item" onclick="toggleMenu(this)">
    <a href="#">👨‍💼 Nhân viên <span class="arrow">▼</span></a>
    <div class="submenu">
      <a href="adminnv">Danh sách nhân viên</a>
      <a href="#">Phân quyền</a>
      <a href="#">Chấm công</a>
    </div>
  </div>
  <div class="menu-item" onclick="toggleMenu(this)">
    <a href="#">🧍‍♂️ Khách hàng <span class="arrow">▼</span></a>
    <div class="submenu">
      <a href="adminkh">Danh sách khách hàng</a>
      <a href="#">Khách VIP</a>
      <a href="#">Lịch sử đặt hàng</a>
    </div>
  </div>
  

  <div class="menu-item" onclick="toggleMenu(this)">
    <a href="#">📅 Đặt bàn <span class="arrow">▼</span></a>
    <div class="submenu">
      <a href="#">Lịch đặt bàn</a>
      <a href="#">Xác nhận đặt chỗ</a>
      <a href="#">Quản lý sơ đồ bàn</a>
    </div>
  </div>
  <div class="menu-item" onclick="toggleMenu(this)">
    <a href="#">📦 Mặt hàng <span class="arrow">▼</span></a>
    <div class="submenu">
      <a href="#">Tất cả mặt hàng</a>
      <a href="#">Loại hàng hóa</a>
      <a href="#">Tồn kho</a>
    </div>
  </div>
  
  <div class="menu-item" onclick="toggleMenu(this)">
    <a href="#">🧃 Combo <span class="arrow">▼</span></a>
    <div class="submenu">
      <a href="#">Tạo combo mới</a>
      <a href="#">Danh sách combo</a>
      <a href="#">Khuyến mãi combo</a>
    </div>
  </div>

  <div class="menu-item" onclick="toggleMenu(this)">
    <a href="#">⚙️ Hệ thống <span class="arrow">▼</span></a>
    <div class="submenu">
      <a href="#">Thiết lập chung</a>
      <a href="#">Giao diện</a>
      <a href="#">Sao lưu dữ liệu</a>
    </div>
  </div>
  <div class="menu-item" onclick="toggleMenu(this)">
    <a href="#">🏠 Thiết lập nhà hàng <span class="arrow">▼</span></a>
    <div class="submenu">
      <a href="#">Thông tin nhà hàng</a>
      <a href="#">Giờ hoạt động</a>
      <a href="#">Khu vực phục vụ</a>
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
