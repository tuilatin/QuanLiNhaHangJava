/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.DiaChi;
import entity.KhachHang;
import entity.NguoiDung;
import entity.NhanVien;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FPT
 */
public class DAO2 {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public KhachHang getKhachHangByID_ND(int idND) {
        String sql = "SELECT * FROM KhachHang WHERE ID_ND = ?";
        KhachHang kh = null;

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idND);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    kh = new KhachHang();
                    kh.setIdKH(rs.getInt("ID_KH"));
                    kh.setTenKH(rs.getString("TenKH"));
                    kh.setNgayThamGia(rs.getString("Ngaythamgia"));
                    kh.setDoanhSo(rs.getInt("Doanhso"));
                    kh.setDiemTichLuy(rs.getInt("Diemtichluy"));
                    kh.setIdND(rs.getInt("ID_ND"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kh;
    }

    public List<NhanVien> getAllNhanVien() {
        List<NhanVien> list = new ArrayList<>();
        String query = """
            SELECT nv.*, nd.Email, nd.Matkhau, nd.VerifyCode, nd.Trangthai AS TrangThaiND, nd.Vaitro
            FROM NhanVien nv
            JOIN NguoiDung nd ON nv.ID_ND = nd.ID_ND
            ORDER BY nv.ID_NV
        """;

        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                NhanVien nv = new NhanVien();
                nv.setId(rs.getInt("ID_NV"));
                nv.setTenNV(rs.getString("TenNV"));
                nv.setNgayVL(rs.getString("NgayVL"));
                nv.setSdt(rs.getString("SDT"));
                nv.setChucVu(rs.getString("Chucvu"));
                nv.setIdNguoiDung(rs.getInt("ID_ND"));
                nv.setIdNguoiQuanLy(rs.getObject("ID_NQL") != null ? rs.getInt("ID_NQL") : null);
                
                // Tạo đối tượng NguoiDung và set cho NhanVien
                NguoiDung nd = new NguoiDung();
                nd.setId(rs.getInt("ID_ND"));
                nd.setEmail(rs.getString("Email"));
                nd.setMatkhau(rs.getString("Matkhau"));
                nd.setVerifyCode(rs.getString("VerifyCode"));
                nd.setTrangthai(rs.getString("TrangThaiND"));
                nd.setVaitro(rs.getString("Vaitro"));
                nv.setNguoiDung(nd);
                
                list.add(nv);
            }
        } catch (Exception e) {
            System.out.println("Error in getAllNhanVien: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
      public boolean updateNhanVienBasic(
        String id_nv,
        String tenNV,
        String sdt,
        String ngayVL,
        String chucVu,
        String tinhTrang
    ) {
        String sql = "UPDATE NhanVien SET TenNV = ?, SDT = ?, NgayVL = ?, Chucvu = ?, Tinhtrang = ? WHERE ID_NV = ?";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, tenNV);
            ps.setString(2, sdt);
            ps.setString(3, ngayVL);
            ps.setString(4, chucVu);
            ps.setString(5, tinhTrang);
            ps.setString(6, id_nv);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (Exception e) {
            System.out.println("Error updating employee: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public NhanVien getNhanVienById(String id) {
        String query = "SELECT * FROM NhanVien WHERE ID_NV = ?";
        
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                NhanVien nv = new NhanVien();
                nv.setId(rs.getInt("ID_NV"));
                nv.setTenNV(rs.getString("TenNV"));
                nv.setSdt(rs.getString("SDT"));
                nv.setNgayVL(rs.getString("NgayVL"));
                nv.setChucVu(rs.getString("Chucvu"));
                nv.setTinhTrang(rs.getString("Tinhtrang"));
                return nv;
            }
        } catch (Exception e) {
            System.out.println("Error in getNhanVienById: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
    
    public List<NhanVien> getNhanVienbyid(String id) {
    List<NhanVien> list = new ArrayList<>();
    String query = """
        SELECT nv.*, nd.Email, nd.Matkhau, nd.VerifyCode, nd.Trangthai AS TrangThaiND, nd.Vaitro
        FROM NhanVien nv
        JOIN NguoiDung nd ON nv.ID_ND = nd.ID_ND
        WHERE nv.ID_NV = ?
        ORDER BY nv.ID_NV
    """;

    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {

        ps.setString(1, id); // ✅ Gán giá trị id vào câu SQL

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                NhanVien nv = new NhanVien();
                nv.setId(rs.getInt("ID_NV"));
                nv.setTenNV(rs.getString("TenNV"));
                nv.setNgayVL(rs.getString("NgayVL"));
                nv.setSdt(rs.getString("SDT"));
                nv.setChucVu(rs.getString("Chucvu"));
                nv.setIdNguoiDung(rs.getInt("ID_ND"));
                nv.setIdNguoiQuanLy(rs.getObject("ID_NQL") != null ? rs.getInt("ID_NQL") : null);

                NguoiDung nd = new NguoiDung();
                nd.setId(rs.getInt("ID_ND"));
                nd.setEmail(rs.getString("Email"));
                nd.setMatkhau(rs.getString("Matkhau"));
                nd.setVerifyCode(rs.getString("VerifyCode"));
                nd.setTrangthai(rs.getString("TrangThaiND"));
                nd.setVaitro(rs.getString("Vaitro"));
                nv.setNguoiDung(nd);

                list.add(nv);
            }
        }

    } catch (Exception e) {
        System.out.println("Error in getNhanVienbyid: " + e.getMessage());
        e.printStackTrace();
    }
    return list;
}

    public List<KhachHang> getAllKhachHang() {
    List<KhachHang> list = new ArrayList<>();
    String query = """
        SELECT kh.*, nd.Email, nd.Matkhau, nd.VerifyCode, nd.Trangthai AS TrangThaiND, nd.Vaitro
        FROM KhachHang kh
        JOIN NguoiDung nd ON kh.ID_ND = nd.ID_ND
        ORDER BY kh.ID_KH
    """;

    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(query);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            KhachHang kh = new KhachHang();
            kh.setIdKH(rs.getInt("ID_KH"));
            kh.setTenKH(rs.getString("TenKH"));
            kh.setNgayThamGia(rs.getString("ngayThamGia"));
            kh.setDoanhSo(rs.getInt("Doanhso"));
            kh.setDiemTichLuy(rs.getInt("Diemtichluy"));
            kh.setIdND(rs.getInt("ID_ND"));

            // Tạo đối tượng NguoiDung tương ứng
            NguoiDung nd = new NguoiDung();
            nd.setId(rs.getInt("ID_ND"));
            nd.setEmail(rs.getString("Email"));
            nd.setMatkhau(rs.getString("Matkhau"));
            nd.setVerifyCode(rs.getString("VerifyCode"));
            nd.setTrangthai(rs.getString("TrangThaiND"));
            nd.setVaitro(rs.getString("Vaitro"));

            kh.setNguoiDung(nd);

            list.add(kh);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    

    return list;
}
        
    public List<KhachHang> getKHbyId(String id) {
    List<KhachHang> list = new ArrayList<>();
    String query = """
        SELECT kh.*, nd.Email, nd.Matkhau, nd.VerifyCode, nd.Trangthai AS TrangThaiND, nd.Vaitro
        FROM KhachHang kh
        JOIN NguoiDung nd ON kh.ID_ND = nd.ID_ND
        WHERE kh.ID_KH = ?
        ORDER BY kh.ID_KH
    """;

    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {

        // ⚠️ Phải set parameter trước khi executeQuery
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            KhachHang kh = new KhachHang();
            kh.setIdKH(rs.getInt("ID_KH"));
            kh.setTenKH(rs.getString("TenKH"));
            kh.setNgayThamGia(rs.getString("Ngaythamgia"));
            kh.setDoanhSo(rs.getInt("Doanhso"));
            kh.setDiemTichLuy(rs.getInt("Diemtichluy"));
            kh.setIdND(rs.getInt("ID_ND"));

            NguoiDung nd = new NguoiDung();
            nd.setId(rs.getInt("ID_ND"));
            nd.setEmail(rs.getString("Email"));
            nd.setMatkhau(rs.getString("Matkhau"));
            nd.setVerifyCode(rs.getString("VerifyCode"));
            nd.setTrangthai(rs.getString("TrangThaiND"));
            nd.setVaitro(rs.getString("Vaitro"));

            kh.setNguoiDung(nd);

            list.add(kh);
        }

        rs.close(); // đóng ResultSet nếu dùng riêng
    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}   
    
    public boolean updateKhachHangBasic(String idKH, String tenKH, String ngayThamGia, String vaiTro) {
        String sql = "UPDATE KhachHang SET TenKH = ?, NgayThamGia = ? WHERE ID_KH = ?";
        
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, tenKH);
            ps.setString(2, ngayThamGia);
            ps.setString(3, idKH);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (Exception e) {
            System.out.println("Error updating customer: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    public KhachHang getKhachHangByIdND(int idND) {
    String sql = "SELECT kh.ID_KH, kh.TenKH, kh.Ngaythamgia, kh.Doanhso, kh.Diemtichluy, kh.ID_ND, " +
             "kh.Sdt, dc.ID_DC, dc.SoNhaDuong, dc.PhuongXa, dc.QuanHuyen, dc.TinhThanh, dc.GhiChu, dc.MacDinh " +
             "FROM KhachHang kh " +
             "JOIN NguoiDung nd ON kh.ID_ND = nd.ID_ND " +
             "LEFT JOIN DiaChi dc ON kh.ID_KH = dc.ID_KH AND dc.MacDinh = 1 " +
             "WHERE kh.ID_ND = ?";

    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, idND);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            KhachHang kh = new KhachHang();
            kh.setIdKH(rs.getInt("ID_KH"));
            kh.setTenKH(rs.getString("TenKH"));
            kh.setSdt(rs.getInt("Sdt"));
            kh.setNgayThamGia(rs.getString("Ngaythamgia"));
            kh.setDoanhSo(rs.getInt("Doanhso"));
            kh.setDiemTichLuy(rs.getInt("Diemtichluy"));
            kh.setIdND(rs.getInt("ID_ND"));

            NguoiDung nd = new NguoiDung();
            nd.setId(rs.getInt("ID_ND"));
            
            kh.setNguoiDung(nd);
                DiaChi dc = new DiaChi();
            if (rs.getInt("ID_DC") != 0) {
                
                dc.setIdDC(rs.getInt("ID_DC"));
                dc.setSoNhaDuong(rs.getString("SoNhaDuong"));
                dc.setPhuongXa(rs.getString("PhuongXa"));
                dc.setQuanHuyen(rs.getString("QuanHuyen"));
                dc.setTinhThanh(rs.getString("TinhThanh"));
                dc.setGhiChu(rs.getString("GhiChu"));
                dc.setMacDinh(rs.getBoolean("MacDinh"));
                // bạn có thể thêm vào kh.setDiaChi(dc); nếu bạn cập nhật entity KhachHang
                
            }
            kh.setDiaChi(dc);

            return kh;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}
    
   public void capNhatThongTinKhachHang(
    int idND, String tenKH, int sdt,
    String soNhaDuong, String phuongXa, String quanHuyen,
    String tinhThanh, String ghiChu
) {
    String sqlGetIdKH = "SELECT ID_KH FROM KhachHang WHERE ID_ND = ?";
    String sqlUpdateKH = "UPDATE KhachHang SET TenKH = ?, Sdt = ? WHERE ID_ND = ?";
    String sqlUpdateDC = "UPDATE DiaChi SET soNhaDuong = ?, phuongXa = ?, quanHuyen = ?, tinhThanh = ?, ghiChu = ? WHERE ID_KH = ? AND macDinh = 1";

    try (Connection conn = new DBContext().getConnection()) {
        conn.setAutoCommit(false);

        int idKH = -1;

        // Lấy idKH từ idND
        try (PreparedStatement psGet = conn.prepareStatement(sqlGetIdKH)) {
            psGet.setInt(1, idND);
            ResultSet rs = psGet.executeQuery();
            if (rs.next()) {
                idKH = rs.getInt("ID_KH");
            } else {
                System.out.println("Không tìm thấy khách hàng với ID_ND: " + idND);
                return;
            }
        }

        // Cập nhật thông tin KhachHang (tên và sdt)
        try (PreparedStatement psKH = conn.prepareStatement(sqlUpdateKH)) {
            psKH.setString(1, tenKH);
            psKH.setInt(2, sdt);
            psKH.setInt(3, idND);
            psKH.executeUpdate();
        }

        // Cập nhật địa chỉ mặc định
        try (PreparedStatement psDC = conn.prepareStatement(sqlUpdateDC)) {
            psDC.setString(1, soNhaDuong);
            psDC.setString(2, phuongXa);
            psDC.setString(3, quanHuyen);
            psDC.setString(4, tinhThanh);
            psDC.setString(5, ghiChu);
            psDC.setInt(6, idKH);
            psDC.executeUpdate();
        }

        conn.commit();
        System.out.println("Cập nhật thành công.");

    } catch (Exception e) {
        e.printStackTrace();
    }
}


    public static void main(String[] args) {
        DAO2 dao=new DAO2();
        KhachHang list=dao.getKhachHangByIdND(1);
        System.out.println(list);
    }
    

}
