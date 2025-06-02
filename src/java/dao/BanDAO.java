package dao;

import context.DBContext;
import entity.Ban;
import entity.ChiTietDatBan;
import entity.DatBan;
import entity.MonAn;
import entity.NguoiDung;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class BanDAO {

    public List<Ban> getAllBan() {
        List<Ban> list = new ArrayList<>();
        String sql = "SELECT * FROM Ban";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new Ban(
                    rs.getInt("ID_Ban"),
                    rs.getString("TenBan"),
                    rs.getString("Vitri"),
                    rs.getString("Trangthai")
                ));
            }
        } catch (Exception e) {
            System.err.println("Error getting tables: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    public int insertDatBanReturnId(int idNguoiDung, int idBan, String diaChi,String tenKH, Date thoiGianDat, int soNguoi,String Sdt, String ghiChu) {
        String sql = "INSERT INTO DatBan (ID_ND, ID_Ban, DiaChi,TenKH, ThoiGianDat, SoNguoi,Sdt, GhiChu) VALUES (?, ?, ?, ?, ?, ?,?, ?)";
        int generatedId = -1;

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, idNguoiDung);
            ps.setInt(2, idBan);
            ps.setString(3, diaChi);
            ps.setString(4, tenKH);
            ps.setTimestamp(5, new Timestamp(thoiGianDat.getTime()));
            ps.setInt(6, soNguoi);
            ps.setString(7, Sdt);
            ps.setString(8, ghiChu);
            
            

            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        generatedId = rs.getInt(1);
                    }
                }
            }
        } catch (Exception e) {
            System.err.println("Error inserting booking: " + e.getMessage());
            e.printStackTrace();
        }
        return generatedId;
    }
    
    public void copyCartToChiTietDatBan(int idND, int idDatBan) {
    String sql = """
        INSERT INTO ChiTietDatMon (ID_DatBan, ID_MonAn, SoLuong, ThanhTien)
        SELECT ?, ci.ID_MonAn, ci.SoLuong, ci.SoLuong * m.DonGia
        FROM CartItem ci
        JOIN MonAn m ON ci.ID_MonAn = m.ID_MonAn
        WHERE ci.ID_ND = ?
    """;

    String deleteCart_SQL = "DELETE FROM CartItem WHERE ID_ND = ?";

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        conn = new DBContext().getConnection();
        conn.setAutoCommit(false);

        // 1. Copy dữ liệu từ giỏ hàng sang ChiTietDatMon
        ps = conn.prepareStatement(sql);
        ps.setInt(1, idDatBan);
        ps.setInt(2, idND);
        ps.executeUpdate();

        // 2. Xoá giỏ hàng sau khi đã sao chép
        ps = conn.prepareStatement(deleteCart_SQL);
        ps.setInt(1, idND);
        ps.executeUpdate();

        conn.commit();
    } catch (Exception e) {
        try {
            if (conn != null) conn.rollback();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        e.printStackTrace();
        throw new RuntimeException("Không thể copy giỏ hàng sang chi tiết đặt bàn", e);
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
    
        public DatBan getThongTinDatBan(int idDatBan) {
    String sqlDatBan = """
        SELECT db.ID_DatBan, db.ThoiGianDat, db.SoNguoi, db.Sdt, db.DiaChi,
               db.TenKH, db.GhiChu, db.TrangThai,
               nd.ID_ND, nd.Email,
               b.ID_Ban, b.TenBan, b.Vitri
        FROM DatBan db
        JOIN NguoiDung nd ON db.ID_ND = nd.ID_ND
        JOIN Ban b ON db.ID_Ban = b.ID_Ban
        WHERE db.ID_DatBan = ?
    """;

    String sqlChiTiet = """
        SELECT ctd.ID_CTD, ctd.SoLuong, ctd.ThanhTien, ctd.GhiChu,
               ma.ID_MonAn, ma.TenMon, ma.DonGia,ma.Image
        FROM ChiTietDatMon ctd
        JOIN MonAn ma ON ctd.ID_MonAn = ma.ID_MonAn
        WHERE ctd.ID_DatBan = ?
    """;

    try (Connection conn = new DBContext().getConnection()) {
        DatBan datBan = null;

        // Lấy thông tin đặt bàn, người dùng, bàn
        try (PreparedStatement ps = conn.prepareStatement(sqlDatBan)) {
            ps.setInt(1, idDatBan);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    datBan = new DatBan();
                    datBan.setIdDatBan(rs.getInt("ID_DatBan"));
                    datBan.setThoiGianDat(rs.getTimestamp("ThoiGianDat"));
                    datBan.setSoNguoi(rs.getInt("SoNguoi"));
                    datBan.setSdt(rs.getString("Sdt"));
                    datBan.setDiaChi(rs.getString("DiaChi"));
                    datBan.setTenKH(rs.getString("TenKH"));
                    datBan.setGhiChu(rs.getString("GhiChu"));
                    datBan.setTrangThai(rs.getString("TrangThai"));

                    // Người đặt
                    NguoiDung nd = new NguoiDung();
                    nd.setId(rs.getInt("ID_ND"));
                    nd.setEmail(rs.getString("Email"));
                    datBan.setNguoiDung(nd);

                    // Bàn
                    Ban ban = new Ban();
                    ban.setIdBan(rs.getInt("ID_Ban"));
                    ban.setTenBan(rs.getString("TenBan"));
                    ban.setVitri(rs.getString("Vitri"));
                    datBan.setBan(ban);
                }
            }
        }

        if (datBan == null) return null;

        // Lấy danh sách món ăn đã đặt
        List<ChiTietDatBan> chiTietList = new ArrayList<>();
        try (PreparedStatement ps = conn.prepareStatement(sqlChiTiet)) {
            ps.setInt(1, idDatBan);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ChiTietDatBan ct = new ChiTietDatBan();
                    ct.setIdCTD(rs.getInt("ID_CTD"));
                    ct.setSoLuong(rs.getInt("SoLuong"));
                    ct.setThanhTien(rs.getDouble("ThanhTien"));
                    ct.setGhiChu(rs.getString("GhiChu"));

                    MonAn monAn = new MonAn();
                    monAn.setIdMonAn(rs.getInt("ID_MonAn"));
                    monAn.setTenMon(rs.getString("TenMon"));
                    monAn.setDonGia(rs.getInt("DonGia"));
                    monAn.setImage(rs.getString("Image"));
                    ct.setMonAn(monAn);

                    chiTietList.add(ct);
                }
            }
        }

        datBan.setChiTietDatBanList(chiTietList);

        // Tính tổng tiền và cập nhật vào DatBan
        double tongTien = 0;
        for (ChiTietDatBan ct : chiTietList) {
            tongTien += ct.getThanhTien();
        }
        datBan.setTongTien(tongTien);

        // Cập nhật tổng tiền vào DB
        String sqlUpdateTongTien = "UPDATE DatBan SET TongTien = ? WHERE ID_DatBan = ?";
        try (PreparedStatement ps = conn.prepareStatement(sqlUpdateTongTien)) {
            ps.setDouble(1, tongTien);
            ps.setInt(2, idDatBan);
            ps.executeUpdate();
        }

        return datBan;

    } catch (Exception e) {
        e.printStackTrace();
        throw new RuntimeException("Lỗi khi lấy thông tin đặt bàn", e);
    }
}
    public boolean capNhatTrangThaiDatBan(String idDatBan, String trangThaiMoi) {
    String sql = "UPDATE DatBan SET TrangThai = ? WHERE ID_DatBan = ?";

    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, trangThaiMoi);
        ps.setString(2, idDatBan);

        int rowsUpdated = ps.executeUpdate();
        return rowsUpdated > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
    public List<DatBan> getDatBanTheoNguoiDung(int idNguoiDung) {
    List<DatBan> list = new ArrayList<>();

    String sql = """
        SELECT db.ID_DatBan, db.ThoiGianDat, db.SoNguoi, db.Sdt, db.DiaChi, db.TenKH,
               db.GhiChu, db.TrangThai, db.TongTien,
               b.ID_Ban, b.TenBan, b.Vitri
        FROM DatBan db
        JOIN Ban b ON db.ID_Ban = b.ID_Ban
        WHERE db.ID_ND = ?
        ORDER BY db.ID_DatBan DESC
    """;

    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, idNguoiDung);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                DatBan db = new DatBan();
                db.setIdDatBan(rs.getInt("ID_DatBan"));
                db.setThoiGianDat(rs.getTimestamp("ThoiGianDat"));
                db.setSoNguoi(rs.getInt("SoNguoi"));
                db.setSdt(rs.getString("Sdt"));
                db.setDiaChi(rs.getString("DiaChi"));
                db.setTenKH(rs.getString("TenKH"));
                db.setGhiChu(rs.getString("GhiChu"));
                db.setTrangThai(rs.getString("TrangThai"));
                db.setTongTien(rs.getDouble("TongTien"));
                
                Ban ban = new Ban();
                    ban.setIdBan(rs.getInt("ID_Ban"));
                    ban.setTenBan(rs.getString("TenBan"));
                    ban.setVitri(rs.getString("Vitri"));
                    db.setBan(ban);
                
                list.add(db);
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
        public List<DatBan> getAllDatBan() {
    List<DatBan> list = new ArrayList<>();

    String sql = """
        SELECT db.ID_DatBan, db.ThoiGianDat, db.SoNguoi, db.Sdt, db.DiaChi, db.TenKH,
               db.GhiChu, db.TrangThai, db.TongTien,
               b.ID_Ban, b.TenBan, b.Vitri
        FROM DatBan db
        JOIN Ban b ON db.ID_Ban = b.ID_Ban
        
        ORDER BY db.ID_DatBan DESC
    """;

    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                DatBan db = new DatBan();
                db.setIdDatBan(rs.getInt("ID_DatBan"));
                db.setThoiGianDat(rs.getTimestamp("ThoiGianDat"));
                db.setSoNguoi(rs.getInt("SoNguoi"));
                db.setSdt(rs.getString("Sdt"));
                db.setDiaChi(rs.getString("DiaChi"));
                db.setTenKH(rs.getString("TenKH"));
                db.setGhiChu(rs.getString("GhiChu"));
                db.setTrangThai(rs.getString("TrangThai"));
                db.setTongTien(rs.getDouble("TongTien"));
                
                Ban ban = new Ban();
                    ban.setIdBan(rs.getInt("ID_Ban"));
                    ban.setTenBan(rs.getString("TenBan"));
                    ban.setVitri(rs.getString("Vitri"));
                    db.setBan(ban);
                
                list.add(db);
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
            public List<DatBan> getAllDatBanToday() {
    List<DatBan> list = new ArrayList<>();

    String sql = """
        SELECT db.ID_DatBan, db.ThoiGianDat, db.SoNguoi, db.Sdt, db.DiaChi, db.TenKH,
               db.GhiChu, db.TrangThai, db.TongTien,
               b.ID_Ban, b.TenBan, b.Vitri
        FROM DatBan db
        JOIN Ban b ON db.ID_Ban = b.ID_Ban
        WHERE CONVERT(date, db.ThoiGianDat) = CONVERT(date, GETDATE())
        ORDER BY db.ThoiGianDat DESC;
    """;

    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                DatBan db = new DatBan();
                db.setIdDatBan(rs.getInt("ID_DatBan"));
                db.setThoiGianDat(rs.getTimestamp("ThoiGianDat"));
                db.setSoNguoi(rs.getInt("SoNguoi"));
                db.setSdt(rs.getString("Sdt"));
                db.setDiaChi(rs.getString("DiaChi"));
                db.setTenKH(rs.getString("TenKH"));
                db.setGhiChu(rs.getString("GhiChu"));
                db.setTrangThai(rs.getString("TrangThai"));
                db.setTongTien(rs.getDouble("TongTien"));
                
                Ban ban = new Ban();
                    ban.setIdBan(rs.getInt("ID_Ban"));
                    ban.setTenBan(rs.getString("TenBan"));
                    ban.setVitri(rs.getString("Vitri"));
                    db.setBan(ban);
                
                list.add(db);
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}

    public static void main(String[] args) {
        BanDAO dao = new BanDAO();
//        List<Ban> list = dao.getAllBan();
//        System.out.println("Found " + list.size() + " tables");
//        for (Ban ban : list) {
//            System.out.println(ban);
//        }
//           DatBan list= dao.getThongTinDatBan(8);
//           System.out.println(list);
//            dao.capNhatTrangThaiDatBan("4", "Da thanh toan");
    List<DatBan> list =dao.getAllDatBanToday();
        System.out.println(list);
    }
}
