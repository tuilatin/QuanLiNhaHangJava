<%-- 
    Document   : Cart
    Created on : Oct 31, 2020, 9:42:21 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <style>
        #quantityForm {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        label {
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        select {
            padding: 8px 12px;
            font-size: 16px;
            border: 2px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            color: #333;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        select:hover {
            border-color: #007bff;
        }

        select:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
    </style>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        
            <div class="shopping-cart">
                <div class="px-4 px-lg-0">

                    <div class="pb-5">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
                                    <c:if test="${empty listCart}">
                                <div class="alert alert-info" role="alert">
                                    Giỏ hàng của bạn đang trống
                                </div>
                            </c:if>

                            <c:if test="${not empty listCart}">
                                    <!-- Shopping cart table -->
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Đơn Giá</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Số Lượng</div>
                                                    </th>
                                                    <th scope="col" class="border-0 bg-light">
                                                        <div class="py-2 text-uppercase">Xóa</div>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${listCart}" var="o">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="p-2">
                                                            <img src="${o.monAn.image}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block">${o.monAn.tenMon}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                            </div>
                                                        </div>
                                                    </th>
                                                    <td class="align-middle"><strong>${o.monAn.donGia} VND</strong></td>
                                                    <td class="align-middle">
                                                        <form id="quantityForm${o.id}" action="updatesl" method="get" class="d-flex align-items-center">
                                                            <input type="hidden" name="id" value="${o.id}" />
                                                            <input type="hidden" name="cartid" value="${sessionScope.acc.id}" />
                                                            <select name="quantity" onchange="submitForm(${o.id})" class="form-control form-control-sm" style="width: 80px; margin-right: 10px;">
                                                                <c:forEach begin="1" end="100" var="i">
                                                                    <option value="${i}" ${o.soLuong == i ? 'selected' : ''}>${i}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </form>
                                                    </td>
                                                    <td class="align-middle">
                                                        <a href="deletecart?id=${o.id}" class="btn btn-danger btn-sm">
                                                            <i class="fa fa-trash"></i> Xóa
                                                        </a>
                                                    </td>
                                                </tr> 
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                       </c:if>
                                <script>
                                    function submitForm(id) {
                                        document.getElementById('quantityForm' + id).submit();
                                    }
                                </script>
                                <!-- End -->
                            </div>
                        </div>
                            <!-- Địa chỉ nhận hàng -->
<div class="p-4 mb-0 bg-white rounded shadow-sm d-flex align-items-center">
    <div class="mr-3" style="font-size: 1.5rem; color: red;">
        <i class="fa fa-map-marker" aria-hidden="true"></i>
    </div>
    <div style="flex-grow: 1;">
        <strong>Địa Chỉ Nhận Hàng</strong><br>
        <span><strong>${khachhang.tenKH} (+84) ${khachhang.sdt}</strong> &nbsp;
            ${khachhang.diaChi.soNhaDuong}, ${khachhang.diaChi.phuongXa}, ${khachhang.diaChi.quanHuyen}, ${khachhang.diaChi.tinhThanh}, ${khachhang.diaChi.ghiChu}</span>
        <span class="badge badge-danger ml-2">Mặc Định</span>
        <a href="informkh" class="ml-3" style="color: #007bff;">Thay Đổi</a>
    </div>
</div>




                        <div class="row py-5 p-4 bg-white rounded shadow-sm">
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Voucher</div>
                                <div class="p-4">
                                    <div class="input-group mb-4 border rounded-pill p-2">
                                        <input type="text" placeholder="Nhập Voucher" aria-describedby="button-addon3" class="form-control border-0">
                                        <div class="input-group-append border-0">
                                            <button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i>Sử dụng</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thành tiền</div>
                                <div class="p-4">
                                    <ul class="list-unstyled mb-4">
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng tiền hàng</strong><strong>${thanhtien} VND</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Phí vận chuyển</strong><strong>Free ship</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">VAT</strong><strong>0 VND</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng thanh toán</strong>
                                            <h5 class="font-weight-bold">${thanhtien} VND</h5>
                                        </li>
                                    </ul><a href="buy" class="btn btn-dark rounded-pill py-2 btn-block">Mua hàng</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>

</html>

