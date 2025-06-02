<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="container">
  <div class="left-panel">
    <!--khung tìm kiếm-->

    <div class="d-flex gap-3">
      <!-- Dropdown chọn người 
      <div class="w-50">
        <select class="form-select w-100">
          <option>Bàn đang ăn</option>
          <option>Khách mua về</option>
        </select>
      </div>-->

      <!-- Dropdown chọn bàn -->
      <div class="w-50">
        <select  id="selectBan" class="form-select select2 w-100">
           <c:forEach var="ban" items="${listBan}">
            <option value="${ban.idBan}">${ban.tenBan} - ${ban.vitri} - ${ban.trangthai}</option>
          </c:forEach>
        </select>
      </div>
    </div>

    <input type="search" class="form-control" placeholder="Tìm kiếm món ăn" />

    <!-- Danh sách món ăn -->
    <div class="food-grid">
      <!-- Một món -->
      <c:forEach var="monAn" items="${listMonAn}">
        <div class="food-item" 
             data-id="${monAn.idMonAn}" 
             data-ten="${monAn.tenMon}" 
             data-gia="${monAn.donGia}">
          <img class="anhMonAn" src="${monAn.image}" alt="${monAn.tenMon}" />
          <p>${monAn.tenMon}</p>
          <p>
               <fmt:formatNumber value="${monAn.donGia}" type="number" maxFractionDigits="0" /> Đ
          </p>
        </div>
        <!-- Thêm các món khác tương tự -->
      </c:forEach>
    </div>
  </div>

  <div class="right-panel">
    <h3>Số bàn: <span id="soBanHienThi"></span></h3>
    <p class="gioHang">Giỏ hàng</p>
    <!-- thêm vào giỏ hàng -->
    
    <div class="cart-items" id="cartItems">
        <!-- Các món ăn sẽ được thêm vào đây -->
    </div>

    <!-- Tính tổng tiền -->
    <div class="khoangTrang">
        
        <div class="buttons">
          <hr />
          <p>Tổng tiền: <strong>0 Đ</strong></p>
          <div class="phanTrai">
            <button class="cancel">Xóa tất cả</button>
            <button class="save">Xác nhận gọi món</button>
          </div>
        </div>
    </div>
  </div>
</div>

<!-- JS thư viện -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
        $(document).ready(function () {
          $(".select2").select2();

              // Bắt sự kiện click vào món ăn
           // Bắt sự kiện click vào món ăn
      $(".food-item").on("click", function () {
        // Lấy dữ liệu trực tiếp từ thuộc tính data bằng .attr()
        const idMonAn = $(this).attr("data-id");
        const tenMon = $(this).attr("data-ten");
        const gia = parseInt($(this).attr("data-gia"));

        if (tenMon && !isNaN(gia)) {
            // Kiểm tra món đã có trong giỏ chưa
            let $item = $("#cartItems .cart-item[data-ten='" + tenMon + "']");
            if ($item.length > 0) {
              // Nếu đã có thì không thêm nữa, có thể hiện thông báo nếu muốn
              // alert("Món này đã có trong giỏ hàng!");
              return;
            }

            // Tạo HTML món trong giỏ hàng (sử dụng chuỗi thông thường thay vì template string)
              const html = '<div class="cart-item" data-id="' + idMonAn + '" data-ten="' + tenMon + '" data-gia="' + gia + '">\n\
                            <div class="item-info">\n\
                                <span class="item-name">' + tenMon + '</span>\n\
                                <span class="item-price">' + gia.toLocaleString("vi-VN") + ' Đ</span>\n\
                            </div>\n\
                            <div class="cart-actions">\n\
                              <button class="minus">-</button>\n\
                              <input class="item-qty" value="1" min="1" style="width:20px;text-align:center;">\n\
                              <button class="plus">+</button>\n\
                              <button class="remove">Xóa</button>\n\
                            </div>\n\
                        </div>';

            // Thêm vào giỏ hàng
            $("#cartItems").append(html);

            // Cập nhật tổng tiền
            updateTotal();
        } else {
          console.error("Không thể lấy thông tin món ăn:", tenMon, gia);
        }
      });


        // Tăng số lượng
        $("#cartItems").on("click", ".plus", function () {
            let $item = $(this).closest(".cart-item");
            let $qtyInput = $item.find(".item-qty");
            let qty = parseInt($qtyInput.val());
            $qtyInput.val(qty + 1);
            updateTotal();
        });


        // Giảm số lượng
        $("#cartItems").on("click", ".minus", function () {
            let $item = $(this).closest(".cart-item");
            let $qtyInput = $item.find(".item-qty");
            let qty = parseInt($qtyInput.val());
            if (qty > 1) {
                $qtyInput.val(qty - 1);
            } else {
                $item.remove();
            }
            updateTotal();
        });

// Khi nhập số lượng trực tiếp
        $("#cartItems").on("input", ".item-qty", function () {
            let val = parseInt($(this).val());
            if (isNaN(val) || val < 1) {
                $(this).val(1);
            }
            updateTotal();
        });

        // Xóa món
        $("#cartItems").on("click", ".remove", function () {
            $(this).closest(".cart-item").remove();
            updateTotal();
        });

            function updateTotal() {
                let total = 0;
                $("#cartItems .cart-item").each(function () {
                    const gia = parseInt($(this).attr("data-gia"));
                    const qty = parseInt($(this).find(".item-qty").val());
                    if (!isNaN(gia) && !isNaN(qty)) {
                        total += gia * qty;
                    }
    });
    $(".buttons p strong").text(total.toLocaleString("vi-VN") + " Đ");
}
      // Nút xoá tất cả
      $(".cancel").click(function () {
        $("#cartItems").empty();
        updateTotal();
      });
      
      //cập nhật số bàn khi click vào option
      $("#selectBan").on("change", function() {
        var text = $(this).find("option:selected").text(); // Lấy toàn bộ text của option
        var soBan = text.split(" - ").slice(0, 2).join(" - "); // Lấy 2 phần đầu: tên bàn và vị trí
        $("#soBanHienThi").text(soBan);
      });
      
      $(".save").on("click", function() {
        // 1. Lấy ID bàn (giả sử value của select là idBan)
        var idBan = $("#selectBan").val();

        // 2. Lấy danh sách món trong giỏ hàng
        var dsMon = [];
        $("#cartItems .cart-item").each(function() {
            dsMon.push({
                idMonAn: $(this).attr("data-id"),
                soLuong: $(this).find(".item-qty").val()
            });
        });

        // 3. Kiểm tra dữ liệu trước khi gửi
        if (!idBan) {
            alert("Vui lòng chọn bàn!");
            return;
        }
        if (dsMon.length === 0) {
            alert("Giỏ hàng đang trống!");
            return;
        }

        // 4. Gửi dữ liệu lên server bằng AJAX
        $.ajax({
            url: "/web_nhahang/GoiMonTin", // Thay bằng endpoint thực tế của bạn
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                idBan: idBan,
                dsMon: dsMon
            }),
            success: function(res) {
                alert("Gọi món thành công!");
                // Xử lý sau khi thành công (ví dụ: xóa giỏ hàng, reload trang...)
                $("#cartItems").empty();
                $(".buttons p strong").text("0 Đ");
            },
            error: function(xhr) {
                alert("Có lỗi xảy ra: " + xhr.responseText);
            }
        });
}); 
  });
  
</script>
