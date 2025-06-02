<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đặt bàn & Giỏ hàng</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: 'Roboto', sans-serif;
            margin: 0;
        }

        .reservation-form, .order-summary, .table-responsive {
            background: #fff;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
        }

        h3 {
            font-size: 20px;
            margin-bottom: 20px;
            color: #2c512f;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 15px;
        }

        .form-group-floating {
            position: relative;
            flex: 1;
        }

        .form-group-floating input,
        .form-group-floating select,
        .form-group-floating textarea {
            width: 100%;
            padding: 14px 10px 6px;
            font-size: 14px;
            border-radius: 6px;
            border: 1px solid #ccc;
            background: none;
        }

        .form-group-floating label {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            background: white;
            padding: 0 5px;
            color: #888;
            pointer-events: none;
            transition: 0.2s ease all;
        }

        .form-group-floating input:focus + label,
        .form-group-floating input:not(:placeholder-shown) + label,
        .form-group-floating select:focus + label,
        .form-group-floating select:not([value=""]) + label,
        .form-group-floating textarea:focus + label,
        .form-group-floating textarea:not(:placeholder-shown) + label {
            top: 0;
            font-size: 12px;
            color: #333;
        }

        .form-group-floating textarea {
            resize: none;
            height: 80px;
        }

        .submit-btn button {
            padding: 10px 20px;
            border-radius: 25px;
            background-color: #e1a300;
            border: none;
            color: white;
            font-weight: bold;
        }

        .submit-btn button:hover {
            background-color: #c89398;
        }

        .floor-buttons button {
            margin: 2px;
            padding: 12px 20px;
            font-size: 19px;
            border: none;
            border-radius: 6px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }

        .floor-buttons button:hover,
        .floor-buttons button.active {
            background-color: #0056b3;
        }

        .table-list {
            display: none;
            grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
            gap: 10px;
            max-width: 1000px;
            margin: 0 auto;
        }

        .table-list.active {
            display: grid;
        }

        .table-card {
            border: 2px dashed #ddd;
            padding: 10px;
            text-align: center;
            border-radius: 8px;
            background-color: white;
        }

        .table-card:hover {
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            border-color: #007bff;
        }

        .table-card label {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 5px;
        }

        .table-card input[type="radio"] {
            transform: scale(1.2);
        }

        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>

<jsp:include page="Menu.jsp"></jsp:include>

<div class="container py-5">
    <!-- Shopping Cart -->
    
    <c:if test="${empty listCart}">
        <div class="alert alert-info" role="alert">
            Giỏ hàng của bạn đang trống
        </div>
    </c:if>
    
    <c:if test="${not empty listCart}">
    <div class="row mb-4">
        <div class="col-12">
            <div class="table-responsive">
                <table class="table">
                    <thead class="bg-light">
                        
                            <tr>
                            <th>Sản Phẩm</th>
                            <th>Đơn Giá</th>
                            <th>Số Lượng</th>
                            <th>Xóa</th>
                        </tr>
                        
                    </thead>
                    <tbody>
                        <c:forEach items="${listCart}" var="o">
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <img src="${o.monAn.image}" width="70" class="img-fluid rounded shadow-sm mr-3">
                                        <div>
                                            <h5 class="mb-0"><a href="#" class="text-dark">${o.monAn.tenMon}</a></h5>
                                        </div>
                                    </div>
                                </td>
                                <td><strong>${o.monAn.donGia} VND</strong></td>
                                <td>
                                    <form id="quantityForm${o.id}" action="updatedatban" method="post" class="d-flex">
                                        <input type="hidden" name="id" value="${o.id}" />
                                        <input type="hidden" name="cartid" value="${sessionScope.acc.id}" />
                                        <select name="quantity" onchange="submitForm(${o.id})" class="form-control form-control-sm" style="width: 80px;">
                                            <c:forEach begin="1" end="100" var="i">
                                                <option value="${i}" ${o.soLuong == i ? 'selected' : ''}>${i}</option>
                                            </c:forEach>
                                        </select>
                                    </form>
                                </td>
                                <td>
                                    <a href="deletecartdatban?id=${o.id}" class="btn btn-danger btn-sm">
                                        <i class="fa fa-trash"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    </c:if>
    
    
    
    
    
    

    <h2 class="mb-3">Danh sách bàn theo tầng</h2>
    <form class="reservation-form" action="datbannow" method="get">

        <!-- Floor Switch Buttons -->
        <div class="floor-buttons mb-3">
            <button type="button" class="floor-btn active" onclick="showFloor('floor1', event)">Tầng 1</button>
            <button type="button" class="floor-btn" onclick="showFloor('floor2', event)">Tầng 2</button>
            <button type="button" class="floor-btn" onclick="showFloor('floor3', event)">Tầng 3</button>
        </div>

        <!-- Floor Tables -->
        <c:forEach var="floor" items="${['Tầng 1', 'Tầng 2', 'Tầng 3']}">
            <div class="table-list ${floor == 'Tầng 1' ? 'active' : ''}" id="floor${floor.substring(5)}">
                <c:forEach var="ban" items="${listBan}">
                    <c:if test="${ban.vitri == floor || ban.vitri == floor.replace('Tầng', 'Tang')}">
                        <div class="table-card">
                            <label>
                                <input type="radio" name="selectedTable" value="${ban.idBan}" required>
                                <strong>${ban.tenBan}</strong>
                                <p>${ban.vitri}</p>
                                <p>${ban.trangthai}</p>
                            </label>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </c:forEach>

        <!-- Reservation Info -->
        <div class="row">
            <div class="col-md-6">
                <h3>Thông tin đặt bàn</h3>
                <div class="form-row">
                    <div class="form-group-floating">
                        <select  name="" required>
                            <option value="Cơ sở 1, Trường Trinh">Cơ sở 1, Trường Trinh</option>
                            <option value="Cơ sở 2, Trần Duy Hưng">Cơ sở 2, Trần Duy Hưng</option>
                            <option value="Cơ sở 3, Ngô Quyền">Cơ sở 3, Ngô Quyền</option>
                        </select>
                        <label>Chi nhánh</label>
                    </div>
                    <div class="form-group-floating">
                        <input type="text" name="hoTen" placeholder=" " required>
                        <label>Họ tên</label>
                    </div>
                    <div class="form-group-floating">
                        <input type="date" name="ngayDat" placeholder=" " 
                            min="<%= java.time.LocalDate.now() %>" 
                            value="<%= java.time.LocalDate.now() %>"
                            required>
                        <label>Ngày đặt</label>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group-floating">
                        <input type="number" name="soNguoi" placeholder=" " min="1" value="1" required>
                        <label>Số khách</label>

                    </div>
                    <div class="form-group-floating">
                        <input type="tel" name="soDienThoai" placeholder=" " pattern="[0-9]{10,11}" required title="Số điện thoại phải có 10-11 số">
                        <label>Số điện thoại</label>
                    </div>
                    <div class="form-group-floating">
                        <select name="khungGio" required>
                        <option value="" selected disabled hidden>Chọn khung giờ</option>
                        <option value="07:00">07:00 - 08:00</option>
                        <option value="08:00">08:00 - 09:00</option>
                        <option value="09:00">09:00 - 10:00</option>
                        <option value="10:00">10:00 - 11:00</option>
                        <option value="11:00">11:00 - 12:00</option>
                        <option value="12:00">12:00 - 13:00</option>
                        <option value="13:00">13:00 - 14:00</option>
                        <option value="14:00">14:00 - 15:00</option>
                        <option value="15:00">15:00 - 16:00</option>
                        <option value="16:00">16:00 - 17:00</option>
                        <option value="17:00">17:00 - 18:00</option>
                        <option value="18:00">18:00 - 19:00</option>
                        <option value="19:00">19:00 - 20:00</option>
                        <option value="20:00">20:00 - 21:00</option>
                        <option value="21:00">21:00 - 22:00</option>
                        <option value="22:00">22:00 - 23:00</option>
                        <option value="23:00">23:00 - 00:00</option>
                        
                    </select>

                        <label>Khung giờ</label>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group-floating" style="flex: 1 1 100%">
                        <textarea name="ghiChu" placeholder=" "></textarea>
                        <label>Lời nhắn</label>
                    </div>
                </div>

<!--                <div class="submit-btn">
                    <button type="submit">
                        <i class="fas fa-paper-plane"></i> Gửi đơn đặt bàn
                    </button>
                </div>-->
            </div>

            <!-- Order Summary -->
            <div class="col-md-6">
                <div class="order-summary">
                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thành tiền</div>
                    <div class="p-3">
                        <ul class="list-unstyled">
                            <li class="d-flex justify-content-between py-2 border-bottom">
                                <strong class="text-muted">Tạm tính</strong><strong>${thanhtien} VND</strong>
                            </li>
                            
                            <li class="d-flex justify-content-between py-2 border-bottom">
                                <strong class="text-muted">VAT</strong><strong>0 VND</strong>
                            </li>
                            <li class="d-flex justify-content-between py-2 border-bottom">
                                <strong class="text-muted">Tổng thanh toán</strong>
                                <h5 class="font-weight-bold">${thanhtien} VND</h5>
                            </li>
                        </ul>
                            <button type="submit" class="btn btn-dark rounded-pill py-2 btn-block">
                                    Đặt bàn Ngay
                        </button>
                </div>
                </div>
            </div>
        </div>
    </form>
</div>

<script>
    function submitForm(id) {
        document.getElementById('quantityForm' + id).submit();
    }

    function showFloor(floorId, event) {
        document.querySelectorAll('.table-list').forEach(el => el.classList.remove('active'));
        document.querySelectorAll('.floor-btn').forEach(btn => btn.classList.remove('active'));
        document.getElementById(floorId).classList.add('active');
        event.target.classList.add('active');
    }

    // Kiểm tra ngày đặt
    document.addEventListener('DOMContentLoaded', function() {
        var dateInput = document.querySelector('input[name="ngayDat"]');
        dateInput.addEventListener('change', function() {
            var selectedDate = new Date(this.value);
            var today = new Date();
            today.setHours(0, 0, 0, 0);

            if (selectedDate < today) {
                alert('Không thể chọn ngày trong quá khứ!');
                this.value = today.toISOString().split('T')[0];
            }
        });
    });
</script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
