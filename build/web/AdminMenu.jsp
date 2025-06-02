<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
  .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 60px;
    padding: 0 20px;
    background-color: #fff;
    border-bottom: 1px solid #ccc;
  }

  .logo {
    display: flex;
    align-items: center;
    font-size: 18px;
    font-weight: bold;
    color: #123c7a;
  }

  .logo::before {
    content: '';
    background-image: url('https://via.placeholder.com/30');
    width: 30px;
    height: 30px;
    border-radius: 50%;
    background-size: cover;
    margin-right: 10px;
  }

  .search-bar {
    display: flex;
    align-items: center;
  }

  .search-bar input {
    padding: 6px 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  .search-bar button {
    background: none;
    border: none;
    cursor: pointer;
    padding: 6px;
  }

  .user-menu {
    position: relative;
    display: flex;
    align-items: center;
    cursor: pointer;
  }

  .user-menu img.avatar {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    margin-right: 8px;
  }

  .user-menu .username {
    font-size: 14px;
    color: #123c7a;
  }

  .user-menu .arrow {
    margin-left: 5px;
  }

  .dropdown {
    display: none;
    position: absolute;
    top: 100%;
    right: 0;
    background-color: #ffffff;
    box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
    border: 1px solid #ccc;
    border-radius: 4px;
    width: 180px;
    z-index: 1000;
  }

  .dropdown a {
    display: block;
    padding: 10px;
    text-decoration: none;
    color: #000;
    font-size: 14px;
  }

  .dropdown a:hover {
    background-color: #f1f1f1;
  }
</style>

<header class="header">
  <div class="logo">Administration</div>

  <div class="search-bar">
    <input type="text" placeholder="Search">
    <button><span>🔍</span></button>
  </div>

  <div class="user-menu" onclick="toggleUserDropdown()">
    <img src="https://via.placeholder.com/30" alt="Avatar" class="avatar">
    <span class="username">Administrator</span>
    <span class="arrow">▼</span>
    <div class="dropdown" id="userDropdown">
      <a href="#">Thông tin cá nhân</a>
  
      <a href="logout">Đăng xuất</a>
    </div>
  </div>
</header>

<script>
  function toggleUserDropdown() {
    const dropdown = document.getElementById("userDropdown");
    dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
  }

  window.addEventListener('click', function (e) {
    const userMenu = document.querySelector('.user-menu');
    const dropdown = document.getElementById("userDropdown");
    if (!userMenu.contains(e.target)) {
      dropdown.style.display = "none";
    }
  });
</script>
