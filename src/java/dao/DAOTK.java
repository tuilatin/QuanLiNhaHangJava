
package dao;

import context.DBContext;
import entity.MonAn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DAOTK {
      ////////////// /// THỐNG KÊ ////////////////////////////////////////////


             //Đếm số lượng hóa đơn theo tháng


         public int getSoLuongHoaDonTrongThang(int thang, int nam) {
    int soLuongHoaDon = 0;
    String sql = "SELECT COUNT(*) AS SoLuongHoaDon " +
                 "FROM HoaDon " +
                 "WHERE MONTH(NgayHD) = ? AND YEAR(NgayHD) = ?";
    try (
        Connection con = DBContext.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)
    ) {
        ps.setInt(1, thang);
        ps.setInt(2, nam);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                soLuongHoaDon = rs.getInt("SoLuongHoaDon");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return soLuongHoaDon;
}

//Tổng doanh thu (Tổng tiền thanh toán sau giảm giá) trong tháng
public double getTongDoanhThuTrongThang(int thang, int nam) {
    double tongDoanhThu = 0;
    String sql = "SELECT SUM(Tongtien) AS TongDoanhThu " +
                 "FROM HoaDon " +
                 "WHERE MONTH(NgayHD) = ? AND YEAR(NgayHD) = ?"
            + " AND Trangthai='Da thanh toan'";
    try (Connection con = DBContext.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, thang);
        ps.setInt(2, nam);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                tongDoanhThu = rs.getDouble("TongDoanhThu");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return tongDoanhThu;
}
//3. Tổng tiền đã giảm từ voucher trong tháng
    public double getTongTienGiamTrongThang(int thang, int nam) {
    double tongTienGiam = 0;
    String sql = "SELECT SUM(TienGiam) AS TongTienGiam " +
                 "FROM HoaDon " +
                 "WHERE MONTH(NgayHD) = ? AND YEAR(NgayHD) = ?";
    try (Connection con = DBContext.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, thang);
        ps.setInt(2, nam);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                tongTienGiam = rs.getDouble("TongTienGiam");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return tongTienGiam;
}
//4. Tổng số sản phẩm đã bán trong tháng
    public int getTongSanPhamBanTrongThang(int thang, int nam) {
    int tongSanPham = 0;
    String sql = "SELECT SUM(ct.SoLuong) AS TongSanPham " +
                 "FROM CTHD ct " +
                 "INNER JOIN HoaDon hd ON ct.ID_HoaDon = hd.ID_HoaDon " +
                 "WHERE MONTH(hd.NgayHD) = ? AND YEAR(hd.NgayHD) = ?";
    try (Connection con = DBContext.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, thang);
        ps.setInt(2, nam);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                tongSanPham = rs.getInt("TongSanPham");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return tongSanPham;
}

//    Lấy danh sách món ăn bán chạy theo tháng
    public List<Object[]> getDanhSachMonAnBanChay(int thang, int nam) {
    List<Object[]> list = new ArrayList<>();
    String sql = "SELECT ma.TenMon, SUM(ct.SoLuong) AS TongSoLuong " +
                 "FROM CTHD ct " +
                 "JOIN MonAn ma ON ct.ID_MonAn = ma.ID_MonAn " +
                 "JOIN HoaDon hd ON ct.ID_HoaDon = hd.ID_HoaDon " +
                 "WHERE MONTH(hd.NgayHD) = ? AND YEAR(hd.NgayHD) = ? " +
                 "GROUP BY ma.TenMon " +
                 "ORDER BY TongSoLuong DESC";
    try (Connection con = DBContext.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, thang);
        ps.setInt(2, nam);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                String tenMonAn = rs.getString("TenMon");
                int tongSoLuong = rs.getInt("TongSoLuong");
                list.add(new Object[]{tenMonAn, tongSoLuong});
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
    public List<MonAn> getTop5MonAnBanChay(int thang, int nam) {
    List<MonAn> list = new ArrayList<>();
    String sql = "SELECT TOP 5 ma.ID_MonAn, ma.TenMon, SUM(ct.SoLuong) AS TongSoLuong " +
                 "FROM CTHD ct " +
                 "JOIN MonAn ma ON ct.ID_MonAn = ma.ID_MonAn " +
                 "JOIN HoaDon hd ON ct.ID_HoaDon = hd.ID_HoaDon " +
                 "WHERE MONTH(hd.NgayHD) = ? AND YEAR(hd.NgayHD) = ? " +
                 "GROUP BY ma.ID_MonAn, ma.TenMon " +
                 "ORDER BY TongSoLuong DESC";
    try (Connection con = DBContext.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, thang);
        ps.setInt(2, nam);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                MonAn mon = new MonAn();
                mon.setIdMonAn(rs.getInt("ID_MonAn"));
                mon.setTenMon(rs.getString("TenMon"));
                mon.setSoLuong(rs.getInt("TongSoLuong")); // bạn nhớ thêm trường soLuong vào class MonAn
                list.add(mon);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
    
    
              //Đếm số lượng hóa đơn theo tháng


         public int getSoLuongHoaDonTrongNgay(int ngay, int thang, int nam) {
    int soLuongHoaDon = 0;
    String sql = "SELECT COUNT(*) AS SoLuongHoaDon " +
                 "FROM HoaDon " +
                 "WHERE DAY(NgayHD)=? AND MONTH(NgayHD) = ? AND YEAR(NgayHD) = ?";
    try (
        Connection con = DBContext.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)
    ) {
        ps.setInt(1, ngay);
        ps.setInt(2, thang);
        ps.setInt(3, nam);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                soLuongHoaDon = rs.getInt("SoLuongHoaDon");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return soLuongHoaDon;
}

//Tổng doanh thu (Tổng tiền thanh toán sau giảm giá) trong tháng
public double getTongDoanhThuTrongNgay(int ngay, int thang, int nam) {
    double tongDoanhThu = 0;
    String sql = "SELECT SUM(Tongtien) AS TongDoanhThu " +
                 "FROM HoaDon " +
                 "WHERE DAY(NgayHD)=? AND MONTH(NgayHD) = ? AND YEAR(NgayHD) = ?"
            + "AND Trangthai='Da thanh toan' ";
    try (Connection con = DBContext.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, ngay);
        ps.setInt(2, thang);
        ps.setInt(3, nam);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                tongDoanhThu = rs.getDouble("TongDoanhThu");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return tongDoanhThu;
}
//3. Tổng tiền đã giảm từ voucher trong tháng
    public double getTongTienGiamTrongNgay(int ngay, int thang, int nam) {
    double tongTienGiam = 0;
    String sql = "SELECT SUM(TienGiam) AS TongTienGiam " +
                 "FROM HoaDon " +
                 "WHERE DAY(NgayHD)=? AND MONTH(NgayHD) = ? AND YEAR(NgayHD) = ?";
    try (Connection con = DBContext.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, ngay);
        ps.setInt(2, thang);
        ps.setInt(3, nam);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                tongTienGiam = rs.getDouble("TongTienGiam");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return tongTienGiam;
}
//4. Tổng số sản phẩm đã bán trong tháng
    public int getTongSanPhamBanTrongNgay(int ngay, int thang, int nam) {
    int tongSanPham = 0;
    String sql = "SELECT SUM(ct.SoLuong) AS TongSanPham " +
                 "FROM CTHD ct " +
                 "INNER JOIN HoaDon hd ON ct.ID_HoaDon = hd.ID_HoaDon " +
                 "WHERE DAY(NgayHD)=? AND MONTH(hd.NgayHD) = ? AND YEAR(hd.NgayHD) = ?";
    try (Connection con = DBContext.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, ngay);
        ps.setInt(2, thang);
        ps.setInt(3, nam);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                tongSanPham = rs.getInt("TongSanPham");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return tongSanPham;
}

  
}
