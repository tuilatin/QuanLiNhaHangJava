<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <a class="nav-link" href="NhanVienJSP/NhanVienHomeTin.jsp">Chức Năng Nhân Viên</a>
                        </li>
                    </c:if>
                        
                        
                       
                        
                    <c:if test="${sessionScope.acc.vaitro eq 'Quan Ly'}">
                        <li class="nav-item">
                        <a class="nav-link" href="thongkemonth">Admin manager </a>
                        </li>
                    </c:if>
                        <li class="nav-item">
                             <a class="nav-link" href="informkh">Hello ${sessionScope.acc.email}</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="logout">Logout</a>
                        </li>
                </c:if>
                        
                        
                <c:if test="${sessionScope.acc==null}">
                    <li class="nav-item">
                    <a class="nav-link" href="Login.jsp">Login</a>
                </li>
                </c:if>
                
                
            </ul>

            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
                <a class="btn btn-success btn-sm ml-3" href="cart?cartid=${sessionScope.acc.id}">
                    <i class="fa fa-shopping-cart" ></i> Cart
                    <span class="badge badge-light">${count}</span>
                </a>
                
            </form>
                <a class="btn btn-success btn-sm ml-3" href="donhang">
                    <i class="fa fa-shopping-cart" ></i> My orders
                    
                </a>
                
                <a class="btn btn-success btn-sm ml-3" href="#">
                    <i class="fa fa-shopping-cart" ></i> Đặt bàn
                    
                </a>
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
