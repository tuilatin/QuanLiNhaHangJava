<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
.navbar {
  background: rgba(33, 37, 41, 0.95) !important;
  border-radius: 0 0 12px 12px;
  box-shadow: 0 4px 16px rgba(0,0,0,0.08);
  padding: 0.5rem 0;
}
.navbar-brand {
  font-weight: bold;
  font-size: 1.7rem;
  letter-spacing: 2px;
  color: #00d4ff !important;
}
.navbar-nav .nav-link {
  color: #f8f9fa !important;
  font-weight: 500;
  font-size: 1.08rem;
  margin: 0 0.5rem;
  border-radius: 6px;
  transition: background 0.2s, color 0.2s;
}
.navbar-nav .nav-link:hover, .navbar-nav .nav-link:focus {
  background: #00d4ff22;
  color: #00d4ff !important;
}
.btn-success, .btn-success:visited {
  background: linear-gradient(90deg, #00d4ff 0%, #28a745 100%);
  border: none;
  color: #fff !important;
  font-weight: 600;
  border-radius: 6px;
  transition: box-shadow 0.2s, background 0.2s;
}
.btn-success:hover, .btn-success:focus {
  background: linear-gradient(90deg, #28a745 0%, #00d4ff 100%);
  color: #fff !important;
  box-shadow: 0 2px 8px rgba(0,212,255,0.12);
}
.btn-secondary {
  background: #343a40;
  border: none;
  color: #fff;
}
.input-group-sm .form-control {
  border-radius: 6px 0 0 6px;
}
.input-group-append .btn {
  border-radius: 0 6px 6px 0;
}
.jumbotron {
  background: linear-gradient(90deg, #e0f7fa 0%, #fff 100%);
  border-radius: 0 0 18px 18px;
  margin-bottom: 1.5rem;
  box-shadow: 0 2px 12px rgba(0,212,255,0.07);
}
.jumbotron-heading {
  color: #007bff;
  font-weight: bold;
}
.lead.text-muted {
  color: #333 !important;
}
.chat-fixed-btn {
  position: fixed;
  right: 32px;
  bottom: 32px;
  z-index: 9999;
  box-shadow: 0 4px 16px rgba(0,212,255,0.18);
  padding: 0.75rem 1.25rem;
  font-size: 1.1rem;
  border-radius: 50px;
  display: flex;
  align-items: center;
  gap: 8px;
  background: linear-gradient(90deg, #00d4ff 0%, #28a745 100%);
  color: #fff !important;
  font-weight: 600;
  transition: background 0.2s, box-shadow 0.2s, transform 0.2s;
}
.chat-fixed-btn:hover, .chat-fixed-btn:focus {
  background: linear-gradient(90deg, #28a745 0%, #00d4ff 100%);
  color: #fff !important;
  box-shadow: 0 6px 24px rgba(0,212,255,0.22);
  transform: translateY(-2px) scale(1.04);
  text-decoration: none;
}
</style>
<!--begin of menu-->
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="home">TB</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                
                <c:if test="${sessionScope.acc!=null}"> 
                    <c:if test="${sessionScope.acc.vaitro eq 'Nhan Vien'}">
                       
                        <li class="nav-item">
                            <a class="nav-link" href="#">Chức Năng Nhân Viên</a>
                        </li>
                    </c:if>
                        
                        
                       
                        
                    <c:if test="${sessionScope.acc.vaitro eq 'Quan Ly'}">
                        <li class="nav-item">
                        <a class="nav-link" href="thongkemonth">Admin manager </a>
                        </li>
                    </c:if>
                        <li class="nav-item">
                             <a class="nav-link" href="informkh">Hello ${sessionScope.acc.tenND}</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="logout">Đăng xuất</a>
                        </li>
                </c:if>
                        
                        
                <c:if test="${sessionScope.acc==null}">
                    <li class="nav-item">
                    <a class="nav-link" href="Login.jsp">Đăng nhập</a>
                </li>
                </c:if>
                
                
            </ul>

            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Ban tìm gì...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3" href="cart?cartid=${sessionScope.acc.id}">
                    <i class="fa fa-shopping-cart" ></i> Giỏ hàng
                    <span class="badge badge-light">${count}</span>
                </a>
                
            </form>
                <a class="btn btn-success btn-sm ml-3" href="donhang">
                    Đơn hàng của tôi
                    
                </a>
                
                <a class="btn btn-success btn-sm ml-3" href="datban?cartid=${sessionScope.acc.id}">
                     Đăt bàn
                    <span class="badge badge-light">${count}</span>
                </a>
                <a class="btn btn-success btn-sm ml-3" href="dsdatban">
                     Danh sách bàn
                    <span class="badge badge-light"></span>
                </a>
                
                    <c:if test="${sessionScope.acc.vaitro eq 'Khach Hang'}">
                        <a class="btn btn-success chat-fixed-btn" href="chat.jsp?nhan=3">
                          <i class="fa fa-comments"></i> Liên hệ nhân viên
                          <span class="badge badge-light"></span>
                        </a>
                    </c:if>
                
                    <c:if test="${sessionScope.acc.vaitro eq 'Nhan Vien' or
                          sessionScope.acc.vaitro eq 'Admin'}">
                        <a class="btn btn-success btn-sm ml-3" href="chat.jsp">
                     Phản hồi tin nhắn
                    <span class="badge badge-light"></span>
                </a>
                    </c:if>
        </div>
    </div>
</nav>
<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Nhà Hàng Hải Sản Chất Lượng Cao</h1>
        <p class="lead text-muted mb-0">Uy tín tạo nên thương hiệu với hơn 10 năm, sẽ mang đến cho quý khách hàng dịch vụ tốt nhất</p>
    </div>
</section>
<!--end of menu-->
