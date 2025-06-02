/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Ban;
import entity.CartItem;
import entity.HoaDon;
import entity.HoaDon_TrangThai;
import entity.LoaiMon;
import entity.MonAn;
import entity.NguoiDung;
import entity.OrderItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author FPT
 */
public class DAO {
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<MonAn> getAllProduct() {
        List<MonAn> list = new ArrayList<>();
        String query = "select * from MonAn";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new MonAn(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                    ));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(ps != null) ps.close();
                if(conn != null) conn.close();
            } catch(Exception e) {
                System.out.println("Error closing: " + e.getMessage());
            }
        }
        return list;
    }
    
    public NguoiDung login(String email, String password) {
    String query = "SELECT * FROM NguoiDung WHERE Email = ? AND Matkhau = ?";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, email);
        ps.setString(2, password);
        rs = ps.executeQuery();
        if (rs.next()) {
            return new NguoiDung(
                rs.getInt("ID_ND"),
                rs.getString("Email"),
                rs.getString("Matkhau"),
                rs.getString("VerifyCode"),
                rs.getString("Trangthai"),
                rs.getString("Vaitro"),
                rs.getString("tenND")
            );
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}
    
    public NguoiDung CheckAccount(String email) {
       
        String query = "SELECT * FROM NguoiDung WHERE Email = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            
            rs = ps.executeQuery();
            if (rs.next()) {
           return 
                  new NguoiDung(
                        rs.getInt("ID_ND"),
                        rs.getString("Email"),
                        rs.getString("Matkhau"),
                        rs.getString("VerifyCode"),
                        rs.getString("Trangthai"),
                        rs.getString("Vaitro"),
                        rs.getString("TenND")
                         );
              }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(ps != null) ps.close();
                if(conn != null) conn.close();
            } catch(Exception e) {
                System.out.println("Error closing: " + e.getMessage());
            }
        }
        return null;
    }
        
    public void Signup(String Email, String Matkhau) {
    String query = "INSERT INTO NguoiDung (Email, Matkhau) VALUES (?, ?)";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, Email);
        ps.setString(2, Matkhau);
        ps.executeUpdate(); // dùng cho INSERT, UPDATE, DELETE
    } catch (Exception e) {
        System.out.println("Error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            System.out.println("Error closing: " + e.getMessage());
        }
    }
}
        
        public void SignupGoogle(String Email, String Matkhau, String Ten) {
    String query = "INSERT INTO NguoiDung (Email, Matkhau, TenND) VALUES (?, ?, ?)";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, Email);
        ps.setString(2, Matkhau);
        ps.setString(3, Ten);
        ps.executeUpdate(); // dùng cho INSERT, UPDATE, DELETE
    } catch (Exception e) {
        System.out.println("Error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            System.out.println("Error closing: " + e.getMessage());
        }
    }
}
        public List<LoaiMon> getAllCategory() {
        List<LoaiMon> listC = new ArrayList<>();
        String query = "select * from LoaiMonAn";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            if(conn == null) {
                System.out.println("Connection failed!");
                return listC;
            }
            System.out.println("Connected to database successfully!");
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                LoaiMon loaiMon = new LoaiMon(
                    rs.getInt(1),
                    rs.getString(2)
                );
                System.out.println("Found category: ID=" + loaiMon.getID_Loai() + ", Name=" + loaiMon.getTenLoai());
                listC.add(loaiMon);
            }
            System.out.println("Total categories found: " + listC.size());
        } catch (Exception e) {
            System.out.println("Error in getAllCategory: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(ps != null) ps.close();
                if(conn != null) conn.close();
            } catch(Exception e) {
                System.out.println("Error closing: " + e.getMessage());
            }
        }
        return listC;
    }
        
        public List<MonAn> getCategorybycid(String ID_Loai) {
        List<MonAn> listC = new ArrayList<>();
        String query = "SELECT * FROM MonAn WHERE ID_Loai = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ID_Loai);
            rs = ps.executeQuery();
            while (rs.next()) {
                listC.add(new MonAn(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                ));
            }
            System.out.println("Found " + listC.size() + " products for category ID: " + ID_Loai);
        } catch (Exception e) {
            System.out.println("Error in getCategorybycid: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(ps != null) ps.close();
                if(conn != null) conn.close();
            } catch(Exception e) {
                System.out.println("Error closing: " + e.getMessage());
            }
        }
        return listC;
    }
        
        public List<MonAn> SearchByName(String txt) {
        List<MonAn> list = new ArrayList<>();
        String query = "SELECT * FROM MonAn WHERE TenMon like ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,"%" + txt + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new MonAn(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                ));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(ps != null) ps.close();
                if(conn != null) conn.close();
            } catch(Exception e) {
                System.out.println("Error closing: " + e.getMessage());
            }
        }
        return list;
    }
        
        public MonAn getMonAn(String id) {
       
        String query = "SELECT * FROM MonAn WHERE ID_MonAn = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
           return 
                  new MonAn(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(ps != null) ps.close();
                if(conn != null) conn.close();
            } catch(Exception e) {
                System.out.println("Error closing: " + e.getMessage());
            }
        }
        return null;
    }
        
        public void addToCart(int userID, int productID, int quantity) {
    String query = "INSERT INTO CartItem (ID_ND, ID_MonAn, SoLuong)"
            + " VALUES (?, ?, ?)";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, userID);
        ps.setInt(2, productID);
        ps.setInt(3, quantity);
        ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
               //tải giỏ hàng
        public List<CartItem> getCartByUser(int userID) {
    List<CartItem> list = new ArrayList<>();
    String query = "SELECT c.ID, c.SoLuong, m.* "
            + "FROM CartItem c JOIN MonAn m ON c.ID_MonAn = m.ID_MonAn "
            + "WHERE c.ID_ND = ?";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, userID);
        rs = ps.executeQuery();
        while (rs.next()) {
            MonAn monAn = new MonAn(
                
                rs.getInt("ID_MonAn"),
                rs.getString("TenMon"),
                rs.getInt("DonGia"),
                rs.getInt("ID_Loai"),
                rs.getString("MoTa"),
                rs.getString("Image"),
                rs.getString("TrangThai")
            );
            CartItem item = new CartItem();
            item.setId(rs.getInt("ID"));
            item.setUserId(userID);
            item.setMonAn(monAn);
            item.setSoLuong(rs.getInt("SoLuong"));
            list.add(item);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
        public void deleteCartbyId(int ID) {
    String query = "DELETE FROM CartItem WHERE ID = ?";

    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, ID);
        ps.executeUpdate();
    } catch (Exception e) {
        System.out.println("Error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            System.out.println("Error closing: " + e.getMessage());
        }
    }
}
        
        //  ĐẾM SỐ LƯỢNG TRONG GIỎ HÀNG
    public int countCart(int userID) {
    String query = "SELECT COUNT(*) FROM CartItem WHERE ID_ND = ?";
    int count = 0;

    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, userID);
        rs = ps.executeQuery();
        if (rs.next()) {
            count = rs.getInt(1); // Lấy giá trị COUNT(*) ở cột đầu tiên
        }
    } catch (Exception e) {
        System.out.println("Error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            System.out.println("Error closing: " + e.getMessage());
        }
    }

    return count;
}
    
    public boolean updateSoLuongMon(int idND, int id, int soLuongMoi) {
    String sql = "UPDATE CartItem " +
                 "SET SoLuong = ? " +
                 "WHERE ID_ND = ? AND ID = ? AND SoLuong > 0";
    try (Connection con = DBContext.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        
        // Set các tham số cho câu lệnh SQL
        ps.setInt(1, soLuongMoi);      // Số lượng mới
        ps.setInt(2, idND);            // ID người dùng
        ps.setInt(3, id);         // ID món ăn

        // Kiểm tra số lượng có hợp lệ và cập nhật
        int rowsAffected = ps.executeUpdate();
        
        // Nếu ít nhất một dòng được cập nhật, trả về true
        return rowsAffected > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false; // Nếu không có dòng nào được cập nhật, trả về false
}

    
        //Thành tiền
    public double thanhTien(int userID) {
    double total = 0;
    String query = "SELECT SUM(ci.SoLuong * m.DonGia) AS TotalAmount " +
                   "FROM CartItem ci " +
                   "JOIN MonAn m ON ci.ID_MonAn = m.ID_MonAn " +
                   "WHERE ci.ID_ND = ?";

    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, userID);
        rs = ps.executeQuery();
        if (rs.next()) {
            total = rs.getDouble("TotalAmount"); // Lấy tổng tiền
        }
    } catch (Exception e) {
        System.out.println("Lỗi khi tính tổng tiền: " + e.getMessage());
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            System.out.println("Lỗi đóng kết nối: " + e.getMessage());
        }
    }

    return total;
}

    
    public int insertHoaDon(int idND, int idBan, String codeVoucher) {
    String sql = """
        INSERT INTO HoaDon (ID_ND, ID_Ban, Code_Voucher)
        VALUES (?, ?, ?)
    """;
    String copyCTHD_SQL = """
        INSERT INTO CTHD (ID_HoaDon, ID_MonAn, SoLuong, Thanhtien)
        SELECT ?, ci.ID_MonAn, ci.SoLuong, ci.SoLuong * m.DonGia
        FROM CartItem ci JOIN MonAn m ON ci.ID_MonAn = m.ID_MonAn
        WHERE ci.ID_ND = ?
    """;

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(sql, java.sql.Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1, idND);
        ps.setInt(2, idBan);
        ps.setString(3, codeVoucher);

        int rows = ps.executeUpdate();
        if (rows > 0) {
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Trả về ID_HoaDon vừa tạo
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    return -1; // Lỗi
}
    
    public HoaDon datHang(int idND, String codeVoucher) {
    String insertHD_SQL = """
        INSERT INTO HoaDon (ID_ND, Code_Voucher)
        VALUES (?, ?)
    """;

    String getTotal_SQL = """
        SELECT SUM(ci.SoLuong * m.DonGia)
        FROM CartItem ci JOIN MonAn m ON ci.ID_MonAn = m.ID_MonAn
        WHERE ci.ID_ND = ?
    """;

    String getDiscount_SQL = "SELECT Phantram FROM Voucher WHERE Code_Voucher = ?";

    String updateHD_SQL = """
        UPDATE HoaDon
        SET TienMonAn = ?, TienGiam = ?, TongTien = ?
        WHERE ID_HoaDon = ?
    """;

    String copyCTHD_SQL = """
        INSERT INTO CTHD (ID_HoaDon, ID_MonAn, SoLuong, ThanhTien)
        SELECT ?, ci.ID_MonAn, ci.SoLuong, ci.SoLuong * m.DonGia
        FROM CartItem ci JOIN MonAn m ON ci.ID_MonAn = m.ID_MonAn
        WHERE ci.ID_ND = ?
    """;

    String deleteCart_SQL = "DELETE FROM CartItem WHERE ID_ND = ?";

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        conn = new DBContext().getConnection();
        conn.setAutoCommit(false);

        // 1. Thêm hóa đơn mới
        ps = conn.prepareStatement(insertHD_SQL, java.sql.Statement.RETURN_GENERATED_KEYS);
        ps.setInt(1, idND);
        ps.setString(2, codeVoucher);
        
        ps.executeUpdate();

        rs = ps.getGeneratedKeys();
        int idHoaDon = -1;
        if (rs.next()) {
            idHoaDon = rs.getInt(1);
        }

        if (idHoaDon == -1) {
            throw new RuntimeException("Không lấy được ID hóa đơn vừa tạo!");
        }

        // 2. Tính tổng tiền món ăn
        double tienMonAn = 0;
        ps = conn.prepareStatement(getTotal_SQL);
        ps.setInt(1, idND);
        ResultSet rsTotal = ps.executeQuery();
        if (rsTotal.next()) {
            tienMonAn = rsTotal.getDouble(1);
        }

        // 3. Lấy % giảm giá (nếu có)
        int phanTram = 0;
        if (codeVoucher != null && !codeVoucher.trim().isEmpty()) {
            ps = conn.prepareStatement(getDiscount_SQL);
            ps.setString(1, codeVoucher);
            ResultSet rsVC = ps.executeQuery();
            if (rsVC.next()) {
                phanTram = rsVC.getInt("Phantram");
            }
        }

        // 4. Cập nhật tổng tiền vào hóa đơn
        double tienGiam = tienMonAn * phanTram / 100.0;
        double tongTien = tienMonAn - tienGiam;

        ps = conn.prepareStatement(updateHD_SQL);
        ps.setDouble(1, tienMonAn);
        ps.setDouble(2, tienGiam);
        ps.setDouble(3, tongTien);
        ps.setInt(4, idHoaDon);
        ps.executeUpdate();

        // 5. Copy chi tiết hóa đơn
        ps = conn.prepareStatement(copyCTHD_SQL);
        ps.setInt(1, idHoaDon);
        ps.setInt(2, idND);
        ps.executeUpdate();

        // 6. Xóa giỏ hàng
        ps = conn.prepareStatement(deleteCart_SQL);
        ps.setInt(1, idND);
        ps.executeUpdate();

        conn.commit();

        // 7. Trả về đối tượng HoaDon
        HoaDon hoaDon = new HoaDon();
        hoaDon.setIdHoaDon(idHoaDon);
        hoaDon.setIdKH(idND);
        hoaDon.setIdBan(0); // vì không đặt bàn, có thể để 0 hoặc null tuỳ DB
        hoaDon.setNgayHD(new java.util.Date()); // ngày hiện tại
        hoaDon.setTienMonAn(tienMonAn);
        hoaDon.setCodeVoucher(codeVoucher);
        hoaDon.setTienGiam(tienGiam);
        hoaDon.setTongTien(tongTien);
        hoaDon.setTrangThai("Đang xử lý");
        hoaDon.setNguoiDung(null); // Bạn có thể set nếu cần
        hoaDon.setBan(null);       // Bạn có thể set nếu cần

        return hoaDon;

    } catch (Exception e) {
        try {
            if (conn != null) conn.rollback();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        e.printStackTrace();
        throw new RuntimeException("Đặt hàng thất bại", e);
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

  
    public List<HoaDon> getAllHoaDonByUser(int idND) {
    List<HoaDon> list = new ArrayList<>();
    String sql = "SELECT \n" +
                "    hd.ID_HoaDon,\n" +
                "    nd.Email AS Email,\n" +
                "    b.TenBan AS TenBan,\n" +
                "    hd.NgayHD,\n" +
                "    hd.TienMonAn,\n" +
                "    hd.Code_Voucher,\n" +
                "    hd.TienGiam,\n" +
                "    hd.Tongtien,\n" +
                "    hd.Trangthai\n" +
                " FROM HoaDon hd\n" +
                " LEFT JOIN NguoiDung nd ON hd.ID_ND = nd.ID_ND\n" +
                " LEFT JOIN Ban b ON hd.ID_Ban = b.ID_Ban\n" +
                " WHERE hd.ID_ND = ?\n" +         // <--- thêm điều kiện WHERE
                " ORDER BY hd.ID_HoaDon DESC;";
    try (
        Connection con = DBContext.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)
    ) {
        ps.setInt(1, idND);  // set ID_ND vào dấu ?
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                HoaDon hd = new HoaDon();
                hd.setIdHoaDon(rs.getInt("ID_HoaDon"));
                hd.setNgayHD(rs.getDate("NgayHD"));
                hd.setTienMonAn(rs.getDouble("TienMonAn"));
                hd.setCodeVoucher(rs.getString("Code_Voucher"));
                hd.setTienGiam(rs.getDouble("TienGiam"));
                hd.setTongTien(rs.getDouble("Tongtien"));
                hd.setTrangThai(rs.getString("Trangthai"));

                // Set liên kết NguoiDung
                NguoiDung nd = new NguoiDung();
                nd.setEmail(rs.getString("Email"));
                hd.setNguoiDung(nd);

                // Set liên kết Ban
                Ban ban = new Ban();
                ban.setTenBan(rs.getString("TenBan"));
                hd.setBan(ban);

                list.add(hd);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
        public boolean updateTrangThaiHuy(int idHoaDon) {
    String sql = "UPDATE HoaDon SET Trangthai = 'Da huy' WHERE ID_HoaDon = ?";
    try (Connection conn = DBContext.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        
        ps.setInt(1, idHoaDon);
        int rowsAffected = ps.executeUpdate();
        
        return rowsAffected > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

        
        public boolean capNhatTrangThaiHoaDon(String idHoaDon, String trangThaiMoi) {
    String sql = "UPDATE HoaDon SET TrangThai = ? WHERE ID_HoaDon = ?";
    
    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        
        ps.setString(1, trangThaiMoi);
        ps.setString(2, idHoaDon);
        
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0;
        
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}


public List<OrderItem> getOrderItemsByID_hoaDon(int idHoadon) {
    List<OrderItem> list = new ArrayList<>();
    String sql = """
        WITH OrderSummary AS (
            SELECT 
                HD.ID_HoaDon,
                HD.NgayHD,
                HD.Trangthai,
                HD.Tongtien,
                HD.ID_Ban,
                B.TenBan,
                HD.Code_Voucher,
                V.Mota AS VoucherMota,
                V.Phantram,
                MA.ID_MonAn,
                MA.TenMon,
                MA.Image,
                MA.DonGia,
                SUM(CTHD.SoLuong) as TongSoLuong,
                SUM(CTHD.SoLuong * MA.DonGia) as ThanhTien
            FROM HoaDon HD
            LEFT JOIN Ban B ON HD.ID_Ban = B.ID_Ban
            LEFT JOIN Voucher V ON HD.Code_Voucher = V.Code_Voucher
            JOIN CTHD ON HD.ID_HoaDon = CTHD.ID_HoaDon
            JOIN MonAn MA ON CTHD.ID_MonAn = MA.ID_MonAn
            WHERE HD.ID_HoaDon = ?
            GROUP BY 
                HD.ID_HoaDon, HD.NgayHD, HD.Trangthai, HD.Tongtien,
                HD.ID_Ban, B.TenBan, HD.Code_Voucher, V.Mota, V.Phantram,
                MA.ID_MonAn, MA.TenMon, MA.Image, MA.DonGia
        )
        SELECT 
            os.ID_HoaDon as orderID,
            os.NgayHD as orderDate,
            os.Trangthai as status,
            os.Tongtien as total,
            os.TenBan as tableName,
            os.VoucherMota as voucherName,
            os.Phantram as voucherDiscount,
            os.TenMon as productName,
            os.Image as productImage,
            os.DonGia as productPrice,
            os.TongSoLuong as quantity,
            os.ThanhTien as subtotal
        FROM OrderSummary os
        ORDER BY os.NgayHD DESC, os.ID_HoaDon DESC
    """;

    try (Connection conn = DBContext.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        
        ps.setInt(1, idHoadon);
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
            OrderItem item = new OrderItem();
            item.setOrderID(rs.getInt("orderID"));
            item.setOrderDate(rs.getDate("orderDate"));
            item.setStatus(rs.getString("status"));
            item.setTotal(rs.getDouble("total"));
            item.setTableName(rs.getString("tableName"));
            item.setVoucherName(rs.getString("voucherName"));
            item.setVoucherDiscount(rs.getInt("voucherDiscount"));
            item.setProductName(rs.getString("productName"));
            item.setProductImage(rs.getString("productImage"));
            item.setProductPrice(rs.getDouble("productPrice"));
            item.setQuantity(rs.getInt("quantity"));
            item.setSubtotal(rs.getDouble("subtotal"));
            list.add(item);
        }
    } catch (Exception e) {
        System.out.println("Error getting order items: " + e.getMessage());
        e.printStackTrace();
    }

    return list;
}

public boolean updateByIdProduct(String id,String trangThai) {
    String query = "UPDATE MonAn SET TrangThai = ? WHERE ID_MonAn = ?";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setString(1, trangThai);
        ps.setString(2, id);
        int result = ps.executeUpdate();
        return result > 0; // Trả về true nếu xóa thành công
        
    } catch (Exception e) {
        System.out.println("Error deleting product with ID " + id + ": " + e.getMessage());
        e.printStackTrace();
        return false;
    } finally {
        try {
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        } catch(Exception e) {
            System.out.println("Error closing: " + e.getMessage());
        }
    }
}

    public void insertMonAn(String tenMon, String donGia, String idLoai, String moTa, String image, String trangThai) {
    String sql = "INSERT INTO MonAn (TenMon, DonGia, ID_Loai, MoTa, Image, TrangThai) VALUES (?, ?, ?, ?, ?, ?)";

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(sql);
        ps.setString(1, tenMon);
        ps.setString(2, donGia);
        ps.setString(3, idLoai);
        ps.setString(4, moTa);
        ps.setString(5, image);
        ps.setString(6, trangThai);

        ps.executeUpdate();
        
    } catch (Exception e) {
        System.out.println("Lỗi khi thêm món ăn: " + e.getMessage());
        e.printStackTrace();
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            System.out.println("Lỗi khi đóng kết nối: " + e.getMessage());
        }
    }
}

    public boolean updateMonAnByID(String id, String tenMon, String donGia, String idLoai, String moTa, String image, String trangThai) {
        String query = "UPDATE MonAn SET TenMon=?, DonGia=?, ID_Loai=?, MoTa=?, Image=?, TrangThai=? WHERE ID_MonAn=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, tenMon);
            ps.setString(2, donGia);
            ps.setString(3, idLoai);
            ps.setString(4, moTa);
            ps.setString(5, image);
            ps.setString(6, trangThai);
            ps.setString(7, id);
            
            int result = ps.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            System.out.println("Error updating product with ID " + id + ": " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            try {
                if(ps != null) ps.close();
                if(conn != null) conn.close();
            } catch(Exception e) {
                System.out.println("Error closing: " + e.getMessage());
            }
        }
    }

    public MonAn getMonAnByID(String id) {
        String query = "SELECT * FROM MonAn WHERE ID_MonAn = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new MonAn(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getInt(3),
                    rs.getInt(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7)
                );
            }
        } catch (Exception e) {
            System.out.println("Error getting product with ID " + id + ": " + e.getMessage());
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(ps != null) ps.close();
                if(conn != null) conn.close();
            } catch(Exception e) {
                System.out.println("Error closing: " + e.getMessage());
            }
        }
        return null;
    }
    
    
    
    public List<HoaDon> getAllHoaDon() {
    List<HoaDon> list = new ArrayList<>();
    String sql = "SELECT \n" +
                "    hd.ID_HoaDon,\n" +
                "    nd.Email AS Email,\n" +
                "    b.TenBan AS TenBan,\n" +
                "    hd.NgayHD,\n" +
                "    hd.TienMonAn,\n" +
                "    hd.Code_Voucher,\n" +
                "    hd.TienGiam,\n" +
                "    hd.Tongtien,\n" +
                "    hd.Trangthai\n" +
                "FROM HoaDon hd\n" +
                "LEFT JOIN NguoiDung nd ON hd.ID_ND = nd.ID_ND\n" +
                "LEFT JOIN Ban b ON hd.ID_Ban = b.ID_Ban\n" +
                "ORDER BY hd.ID_HoaDon DESC;";
    try (
        Connection con = DBContext.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery()
    ) {
        while (rs.next()) {
            HoaDon hd = new HoaDon();
            hd.setIdHoaDon(rs.getInt("ID_HoaDon"));
            hd.setNgayHD(rs.getDate("NgayHD"));
            hd.setTienMonAn(rs.getDouble("TienMonAn"));
            hd.setCodeVoucher(rs.getString("Code_Voucher"));
            hd.setTienGiam(rs.getDouble("TienGiam"));
            hd.setTongTien(rs.getDouble("Tongtien"));
            hd.setTrangThai(rs.getString("Trangthai"));

            // Set liên kết NguoiDung
            NguoiDung nd = new NguoiDung();
            nd.setEmail(rs.getString("Email"));
            hd.setNguoiDung(nd);

            // Set liên kết Ban
            Ban ban = new Ban();
            ban.setTenBan(rs.getString("TenBan"));
            hd.setBan(ban);

            list.add(hd);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}

        public List<HoaDon> getHoaDonbyDate() {
    List<HoaDon> list = new ArrayList<>();
    String sql = "SELECT \n" +
                "    hd.ID_HoaDon,\n" +
                "    nd.Email AS Email,\n" +
                "    b.TenBan,\n" +
                "    hd.NgayHD,\n" +
                "    hd.TienMonAn,\n" +
                "    hd.Code_Voucher,\n" +
                "    hd.TienGiam,\n" +
                "    hd.Tongtien,\n" +
                "    hd.Trangthai\n" +
                "FROM HoaDon hd\n" +
                "LEFT JOIN NguoiDung nd ON hd.ID_ND = nd.ID_ND\n" +
                "LEFT JOIN Ban b ON hd.ID_Ban = b.ID_Ban\n" +
                "WHERE CAST(hd.NgayHD AS DATE) = CAST(GETDATE() AS DATE)\n" +
                "ORDER BY hd.ID_HoaDon DESC;";
    try (
        Connection con = DBContext.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery()
    ) {
        while (rs.next()) {
            HoaDon hd = new HoaDon();
            hd.setIdHoaDon(rs.getInt("ID_HoaDon"));
            hd.setNgayHD(rs.getDate("NgayHD"));
            hd.setTienMonAn(rs.getDouble("TienMonAn"));
            hd.setCodeVoucher(rs.getString("Code_Voucher"));
            hd.setTienGiam(rs.getDouble("TienGiam"));
            hd.setTongTien(rs.getDouble("Tongtien"));
            hd.setTrangThai(rs.getString("Trangthai"));

            // Set liên kết NguoiDung
            NguoiDung nd = new NguoiDung();
            nd.setEmail(rs.getString("Email"));
            hd.setNguoiDung(nd);

            // Set liên kết Ban
            Ban ban = new Ban();
            ban.setTenBan(rs.getString("TenBan"));
            hd.setBan(ban);

            list.add(hd);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
        
            public List<HoaDon> getHoaDonbyWeek() {
    List<HoaDon> list = new ArrayList<>();
    String sql = "SELECT \n" +
            "    hd.ID_HoaDon,\n" +
            "    nd.Email AS Email,\n" +
            "    b.TenBan,\n" +
            "    hd.NgayHD,\n" +
            "    hd.TienMonAn,\n" +
            "    hd.Code_Voucher,\n" +
            "    hd.TienGiam,\n" +
            "    hd.Tongtien,\n" +
            "    hd.Trangthai\n" +
            "FROM HoaDon hd\n" +
            "LEFT JOIN NguoiDung nd ON hd.ID_ND = nd.ID_ND\n" +
            "LEFT JOIN Ban b ON hd.ID_Ban = b.ID_Ban\n" +
            "WHERE DATEPART(WEEK, hd.NgayHD) = DATEPART(WEEK, GETDATE())\n" +
            "  AND DATEPART(YEAR, hd.NgayHD) = DATEPART(YEAR, GETDATE())\n" +
            "ORDER BY hd.ID_HoaDon DESC;";
    try (
        Connection con = DBContext.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery()
    ) {
        while (rs.next()) {
            HoaDon hd = new HoaDon();
            hd.setIdHoaDon(rs.getInt("ID_HoaDon"));
            hd.setNgayHD(rs.getDate("NgayHD"));
            hd.setTienMonAn(rs.getDouble("TienMonAn"));
            hd.setCodeVoucher(rs.getString("Code_Voucher"));
            hd.setTienGiam(rs.getDouble("TienGiam"));
            hd.setTongTien(rs.getDouble("Tongtien"));
            hd.setTrangThai(rs.getString("Trangthai"));

            // Set liên kết NguoiDung
            NguoiDung nd = new NguoiDung();
            nd.setEmail(rs.getString("Email"));
            hd.setNguoiDung(nd);

            // Set liên kết Ban
            Ban ban = new Ban();
            ban.setTenBan(rs.getString("TenBan"));
            hd.setBan(ban);

            list.add(hd);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
            
                     public List<HoaDon> getHoaDonbyMonth() {
    List<HoaDon> list = new ArrayList<>();
    String sql = "SELECT \n " +
                "    hd.ID_HoaDon,\n" +
                "    nd.Email ,\n" +
                "    b.TenBan,\n" +
                "    hd.NgayHD,\n" +
                "    hd.TienMonAn,\n" +
                "    hd.Code_Voucher,\n" +
                "    hd.TienGiam,\n" +
                "    hd.Tongtien,\n" +
                "    hd.Trangthai\n" +
                "FROM HoaDon hd\n" +
                "LEFT JOIN NguoiDung nd ON hd.ID_ND = nd.ID_ND\n" +
                "LEFT JOIN Ban b ON hd.ID_Ban = b.ID_Ban\n" +
                "WHERE DATEPART(MONTH, hd.NgayHD) = DATEPART(MONTH, GETDATE())\n" +
                "  AND DATEPART(YEAR, hd.NgayHD) = DATEPART(YEAR, GETDATE())\n" +
                "ORDER BY hd.ID_HoaDon DESC;";
    try (
        Connection con = DBContext.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery()
    ) {
        while (rs.next()) {
            HoaDon hd = new HoaDon();
            hd.setIdHoaDon(rs.getInt("ID_HoaDon"));
            hd.setNgayHD(rs.getDate("NgayHD"));
            hd.setTienMonAn(rs.getDouble("TienMonAn"));
            hd.setCodeVoucher(rs.getString("Code_Voucher"));
            hd.setTienGiam(rs.getDouble("TienGiam"));
            hd.setTongTien(rs.getDouble("Tongtien"));
            hd.setTrangThai(rs.getString("Trangthai"));

            // Set liên kết NguoiDung
            NguoiDung nd = new NguoiDung();
            nd.setEmail(rs.getString("Email"));
            hd.setNguoiDung(nd);

            // Set liên kết Ban
            Ban ban = new Ban();
            ban.setTenBan(rs.getString("TenBan"));
            hd.setBan(ban);

            list.add(hd);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
            
                public List<HoaDon> getHoaDonbyYear() {
    List<HoaDon> list = new ArrayList<>();
    String sql = "SELECT \n" +
                "    hd.ID_HoaDon,\n" +
                "    nd.Email AS Email,\n" +
                "    b.TenBan,\n" +
                "    hd.NgayHD,\n" +
                "    hd.TienMonAn,\n" +
                "    hd.Code_Voucher,\n" +
                "    hd.TienGiam,\n" +
                "    hd.Tongtien,\n" +
                "    hd.Trangthai\n" +
                "FROM HoaDon hd\n" +
                "LEFT JOIN NguoiDung nd ON hd.ID_ND = nd.ID_ND\n" +
                "LEFT JOIN Ban b ON hd.ID_Ban = b.ID_Ban\n" +
                "WHERE MONTH(hd.NgayHD) = MONTH(GETDATE())\n" +
                "  AND YEAR(hd.NgayHD) = YEAR(GETDATE())\n" +
                "ORDER BY hd.ID_HoaDon DESC;";
    try (
        Connection con = DBContext.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery()
    ) {
        while (rs.next()) {
            HoaDon hd = new HoaDon();
            hd.setIdHoaDon(rs.getInt("ID_HoaDon"));
            hd.setNgayHD(rs.getDate("NgayHD"));
            hd.setTienMonAn(rs.getDouble("TienMonAn"));
            hd.setCodeVoucher(rs.getString("Code_Voucher"));
            hd.setTienGiam(rs.getDouble("TienGiam"));
            hd.setTongTien(rs.getDouble("Tongtien"));
            hd.setTrangThai(rs.getString("Trangthai"));

            // Set liên kết NguoiDung
            NguoiDung nd = new NguoiDung();
            nd.setEmail(rs.getString("Email"));
            hd.setNguoiDung(nd);

            // Set liên kết Ban
            Ban ban = new Ban();
            ban.setTenBan(rs.getString("TenBan"));
            hd.setBan(ban);

            list.add(hd);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
                

                public List<HoaDon> getHoaDonDaHuy() {
    List<HoaDon> list = new ArrayList<>();
    String sql = "SELECT \n" +
            "    hd.ID_HoaDon,\n" +
            "    nd.Email ,\n" +
            "    b.TenBan,\n" +
            "    hd.NgayHD,\n" +
            "    hd.TienMonAn,\n" +
            "    hd.Code_Voucher,\n" +
            "    hd.TienGiam,\n" +
            "    hd.Tongtien,\n" +
            "    hd.Trangthai\n" +
            "FROM HoaDon hd\n" +
            "LEFT JOIN NguoiDung nd ON hd.ID_ND = nd.ID_ND\n" +
            "LEFT JOIN Ban b ON hd.ID_Ban = b.ID_Ban\n" +
            "where hd.Trangthai ='Da huy'\n" +
            "ORDER BY hd.ID_HoaDon DESC;";
    try (
        Connection con = DBContext.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery()
    ) {
        while (rs.next()) {
            HoaDon hd = new HoaDon();
            hd.setIdHoaDon(rs.getInt("ID_HoaDon"));
            hd.setNgayHD(rs.getDate("NgayHD"));
            hd.setTienMonAn(rs.getDouble("TienMonAn"));
            hd.setCodeVoucher(rs.getString("Code_Voucher"));
            hd.setTienGiam(rs.getDouble("TienGiam"));
            hd.setTongTien(rs.getDouble("Tongtien"));
            hd.setTrangThai(rs.getString("Trangthai"));

            // Set liên kết NguoiDung
            NguoiDung nd = new NguoiDung();
            nd.setEmail(rs.getString("Email"));
            hd.setNguoiDung(nd);

            // Set liên kết Ban
            Ban ban = new Ban();
            ban.setTenBan(rs.getString("TenBan"));
            hd.setBan(ban);

            list.add(hd);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
         public List<HoaDon> getHoaDonChuaThanhToan() {
    List<HoaDon> list = new ArrayList<>();
    String sql = "SELECT \n" +
            "    hd.ID_HoaDon,\n" +
            "    nd.Email ,\n" +
            "    b.TenBan,\n" +
            "    hd.NgayHD,\n" +
            "    hd.TienMonAn,\n" +
            "    hd.Code_Voucher,\n" +
            "    hd.TienGiam,\n" +
            "    hd.Tongtien,\n" +
            "    hd.Trangthai\n" +
            "FROM HoaDon hd\n" +
            "LEFT JOIN NguoiDung nd ON hd.ID_ND = nd.ID_ND\n" +
            "LEFT JOIN Ban b ON hd.ID_Ban = b.ID_Ban\n" +
            "where hd.Trangthai ='Chua thanh toan'\n" +
            "ORDER BY hd.ID_HoaDon DESC;";
    try (
        Connection con = DBContext.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery()
    ) {
        while (rs.next()) {
            HoaDon hd = new HoaDon();
            hd.setIdHoaDon(rs.getInt("ID_HoaDon"));
            hd.setNgayHD(rs.getDate("NgayHD"));
            hd.setTienMonAn(rs.getDouble("TienMonAn"));
            hd.setCodeVoucher(rs.getString("Code_Voucher"));
            hd.setTienGiam(rs.getDouble("TienGiam"));
            hd.setTongTien(rs.getDouble("Tongtien"));
            hd.setTrangThai(rs.getString("Trangthai"));

            // Set liên kết NguoiDung
            NguoiDung nd = new NguoiDung();
            nd.setEmail(rs.getString("Email"));
            hd.setNguoiDung(nd);

            // Set liên kết Ban
            Ban ban = new Ban();
            ban.setTenBan(rs.getString("TenBan"));
            hd.setBan(ban);

            list.add(hd);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
         
         public List<HoaDon_TrangThai> getTrangThaiByIdHoaDon(int idHoaDon) {
    List<HoaDon_TrangThai> list = new ArrayList<>();
    String sql = "SELECT ID, ID_HoaDon, TrangThai, NguoiCapNhat, GhiChu, NgayThayDoi " +
                 "FROM HoaDon_TrangThai WHERE ID_HoaDon = ? ORDER BY NgayThayDoi ASC";
    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, idHoaDon);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            HoaDon_TrangThai hdt = new HoaDon_TrangThai();
            hdt.setId(rs.getInt("ID"));
            hdt.setIdHoaDon(rs.getInt("ID_HoaDon"));
            hdt.setTrangThai(rs.getString("TrangThai"));
            hdt.setNguoiCapNhat(rs.getString("NguoiCapNhat"));
            hdt.setGhiChu(rs.getString("GhiChu"));
            hdt.setNgayThayDoi(rs.getTimestamp("NgayThayDoi"));
            list.add(hdt);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}

      

    
    public static void main(String[] args) {
        DAO dao= new DAO();
//        dao.insertHoaDon(1, 1, "VC10");
//        dao.layThongTinHoaDon(1);
//      dao.deletebyIdProduct("8");
//        dao.getMonAnByID("1");
//        dao.insertMonAn("sd", 213, "idLoai", "moTa", "image", "Dang kinh doanh");
//          List<HoaDon> list=  dao.getAllHoaDon();
//          System.out.println(list);
//          List<HoaDon> list1=dao.getHoaDonbyDate();
//          System.out.println(list1);
//          List<Object[]>objects=  dao.getDanhSachMonAnBanChay(4,2025);
//          for (Object[] o : objects) {
//      System.out.println(o[0] + " - " + o[1]);
//       List<MonAn> list= dao.getTop5MonAnBanChay(4, 2025);
//        System.out.println(list);
//dao.capNhatTrangThaiHoaDon("40","Da Thanh toan");
       List<HoaDon> list =dao.getHoaDonbyMonth();
        System.out.println(list);
  }

    
    
    }

    
    
    
    
        

