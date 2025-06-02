<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 270px;
            }
            
            /* Card styling */
            .card {
                border: none;
                border-radius: 15px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
                margin-bottom: 25px;
                background: #fff;
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            }

            .card-img-top {
                border-top-left-radius: 15px;
                border-top-right-radius: 15px;
                object-fit: cover;
                transition: transform 0.3s ease;
            }

            .card:hover .card-img-top {
                transform: scale(1.05);
            }

            .card-body {
                padding: 1.25rem;
            }

            .card-title a {
                color: #333;
                font-weight: 600;
                text-decoration: none;
                transition: color 0.3s;
            }

            .card-title a:hover {
                color: #ff6b6b;
            }

            .card-text {
                color: #666;
                font-size: 0.95rem;
                margin-bottom: 1rem;
            }

            /* Button styling */
            .btn-danger.btn-block {
                background: #ff6b6b;
                border: none;
                font-weight: 600;
                padding: 10px;
                transition: all 0.3s;
            }

            .btn-danger.btn-block:hover {
                background: #ff5252;
                transform: translateY(-2px);
            }

            .btn-success.btn-block {
                background: #2ecc71;
                border: none;
                font-weight: 500;
                padding: 10px;
                transition: all 0.3s;
            }

            .btn-success.btn-block:hover {
                background: #27ae60;
                transform: translateY(-2px);
            }

            /* Text truncation */
            .card-title.show_txt {
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: normal;
                min-height: 2.8em;
                max-height: 2.8em;
            }

            /* Responsive adjustments */
            @media (max-width: 768px) {
                .card {
                    margin-bottom: 20px;
                }
                
                .btn-danger.btn-block,
                .btn-success.btn-block {
                    padding: 8px;
                    font-size: 0.9rem;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="Home.jsp">Trang chủ</a></li>
                                <li class="breadcrumb-item"><a href="#">Danh mục</a></li>
                                <li class="breadcrumb-item active" aria-current="#">Danh mục con</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                <jsp:include page="Left.jsp"></jsp:include>

                    <div class="col-sm-9">
                        <div class="row">
                        <c:forEach  items="${listMonAn}" var="o">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <a href="detail?pid=${o.idMonAn}" ><img class="card-img-top" src="${o.image}" alt="Card image cap" ></a>
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a href="detail?pid=${o.idMonAn}" title="Xem chi tiết">${o.tenMon}</a></h4>
                                        <p class="card-text show_txt">${o.moTa}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block"><a href="detail?pid=${o.idMonAn}" >${o.donGia} VND</a></p>
                                            </div>
                                            <div class="col">
                                                <a href="addtocart?pid=${o.idMonAn}" class="btn btn-success btn-block">Thêm vào giỏ</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>

