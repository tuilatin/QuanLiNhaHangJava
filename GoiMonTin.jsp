<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="order-container">
    <!-- Header -->
    <div class="header">
        <div class="customer-info">
            <select class="customer-select">
                <option>Hồ Anh Hòa - 0865787133</option>
                <option>Khách hàng khác</option>
            </select>
            <button class="add-customer-btn">
                <i class="fas fa-plus"></i>
            </button>
        </div>
        <div class="table-info">
            <select class="table-select">
                <option>Bàn 3 - Sảnh chính - Tối đa 5 người</option>
                <option>Bàn khác</option>
            </select>
        </div>
    </div>

    <!-- Main Content -->
    <div class="content">
        <!-- Left Side - Menu -->
        <div class="menu-section">
            <!-- Menu Tabs -->
            <div class="menu-tabs">
                <button class="tab-btn active">Đồ ăn</button>
                <button class="tab-btn">Đồ uống</button>
                <button class="tab-btn">Combo</button>
            </div>

            <!-- Menu Grid -->
            <div class="menu-grid">
                <div class="menu-item">
                    <img src="path/to/chach-chien.jpg" alt="Chạch chiên sả ớt">
                    <div class="item-name">Chạch chiên sả ớt</div>
                    <div class="item-price">150.000đ</div>
                </div>
                <div class="menu-item">
                    <img src="path/to/salad.jpg" alt="Salad rau củ quả">
                    <div class="item-name">Salad rau củ quả</div>
                    <div class="item-price">120.000đ</div>
                </div>
                <!-- Thêm các món khác tương tự -->
            </div>
        </div>

        <!-- Right Side - Order Summary -->
        <div class="order-summary">
            <div class="summary-header">
                <div class="column">Mặt hàng</div>
                <div class="column">SL</div>
                <div class="column">Thành tiền</div>
            </div>

            <div class="order-items">
                <div class="order-item">
                    <div class="item-name">Chạch chiên sả ớt</div>
                    <div class="item-quantity">
                        <button class="quantity-btn minus">-</button>
                        <input type="text" value="1" class="quantity-input">
                        <button class="quantity-btn plus">+</button>
                    </div>
                    <div class="item-total">150.000đ</div>
                    <button class="remove-item">×</button>
                </div>
            </div>

            <div class="order-total">
                <div class="total-label">Tổng tiền</div>
                <div class="total-amount">150.000đ</div>
            </div>

            <div class="action-buttons">
                <button class="action-btn cancel">Quay lại</button>
                <button class="action-btn save">Lưu lại</button>
                <button class="action-btn confirm">Thanh toán</button>
            </div>
        </div>
    </div>
</div>

