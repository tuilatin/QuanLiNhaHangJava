/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import entity.*;
import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;
import java.util.Map;
public class DAONhanVienTin {
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    Map<Integer, String> loaiMonMap = new HashMap<>(); 
    
        public Map<Integer, String> getLoaiMonMap() {
        String query = "SELECT * FROM LoaiMonAn";
        try (Connection conn = new DBContext().getConnection()) {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()) {
                loaiMonMap.put(rs.getInt("ID_Loai"), rs.getString("TenLoai"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return loaiMonMap;
    }
    
        public List<Ban> getListBan(){
            List<Ban> listBan = new ArrayList<>();
            String query = "select * from Ban";
            try(Connection conn = new DBContext().getConnection()) {
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
                while(rs.next()){
                    Ban ban = new Ban();
                    ban.setIdBan(rs.getInt("ID_Ban"));
                    ban.setTenBan(rs.getString("TenBan"));
                    ban.setVitri(rs.getString("Vitri"));
                    ban.setTrangthai(rs.getString("Trangthai"));
                    listBan.add(ban);

                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return listBan;
        }
        
        public List<MonAn> getListMonAn(){
            List<MonAn> listMonAn = new ArrayList<>();
            String query = "select M.*, L.TenLoai\n" +
                            "from Monan M, LoaiMonAn L\n" +
                            "where M.ID_Loai = L.ID_Loai";
            try(Connection conn = new DBContext().getConnection()) {
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
                while(rs.next()){
                    MonAn monAn = new MonAn();
                    monAn.setIdMonAn(rs.getInt("id_MonAn"));
                    monAn.setTenMon(rs.getString("tenMon"));
                    monAn.setDonGia(rs.getInt("donGia"));
                    monAn.setIdLoai(rs.getInt("ID_Loai"));
                    monAn.setMoTa(rs.getString("moTa"));
                    monAn.setImage(rs.getString("image"));
                    monAn.setTrangThai(rs.getString("trangThai"));
                    // Get TenLoai from LoaiMon and set it in MonAn object
                    // Add the MonAn object to the list
                    listMonAn.add(monAn);

                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return listMonAn;
        }
    
        public int insertDatBan(Connection conn, int idBan, int soNguoi) throws Exception {
            String sql = "INSERT INTO DatBan (ID_Ban, ThoiGianDat, SoNguoi) VALUES (?, GETDATE(), ?)";
            PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS); // Đúng!
            ps.setInt(1, idBan);
            ps.setInt(2, soNguoi);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
        if (rs.next()) {
            return rs.getInt(1);
        }
            return 0; // hoặc throw exception nếu cần
        }
        
        
        public void insertChiTietDatMon(Connection conn, int idDatBan, int idMonAn, int soLuong, int thanhTien) throws Exception {
            String sql = "INSERT INTO ChiTietDatMon (ID_DatBan, ID_MonAn, SoLuong, Thanhtien) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, idDatBan);
            ps.setInt(2, idMonAn);
            ps.setInt(3, soLuong);
            ps.setInt(4, thanhTien);
            ps.executeUpdate();
        }
        
        public void updateTrangThaiBan(Connection conn, int idBan, String trangThai) throws Exception {
            String sql = "UPDATE Ban SET Trangthai = ? WHERE ID_Ban = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, trangThai);
            ps.setInt(2, idBan);
            ps.executeUpdate();
        }
        
        public int getDonGiaMonAn(Connection conn, int idMonAn) throws Exception {
            String sql = "SELECT DonGia FROM MonAn WHERE ID_MonAn = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, idMonAn);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("DonGia");
            }
            return 0; // hoặc throw exception nếu không tìm thấy
        }
        
        public List<ChiTietDatMon> getMonAnTheoBan(int idBan) {
            List<ChiTietDatMon> list = new ArrayList<>();
            String query = "SELECT m.TenMon, m.DonGia, SUM(c.SoLuong) AS SoLuong\n" +
                "FROM Ban b, DatBan d, ChiTietDatMon c, MonAn m\n" +
                "WHERE b.ID_Ban = d.ID_Ban AND d.ID_DatBan = c.ID_DatBan AND c.ID_MonAn = m.ID_MonAn\n" +
                "AND b.ID_Ban = ?\n" +
                "GROUP BY m.TenMon, m.DonGia;";
            try (Connection conn = new DBContext().getConnection()) {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, idBan);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ChiTietDatMon ctd = new ChiTietDatMon();
                ctd.setTenMon(rs.getString("TenMon"));
                ctd.setDonGia(rs.getInt("DonGia"));
                ctd.setSoLuong(rs.getInt("SoLuong"));
                list.add(ctd);
            }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return list;
        }
        
        public List<Ban> getBanDangAn(){
            List<Ban> listBanDangAn = new ArrayList<>();
            String query = "select * from ban where Trangthai = 'Dang dung bua'";
            try(Connection conn = new DBContext().getConnection()) {
                ps = conn.prepareStatement(query);
                rs = ps.executeQuery();
                while(rs.next()){
                    Ban banAn = new Ban();
                    banAn.setIdBan(rs.getInt("ID_Ban"));
                    banAn.setTenBan(rs.getString("TenBan"));
                    banAn.setVitri(rs.getString("Vitri"));
                    // Get TenLoai from LoaiMon and set it in MonAn object
                    // Add the MonAn object to the list
                    listBanDangAn.add(banAn);

                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return listBanDangAn;
        }
        
        public String getTenBanById(int idBan) {
            String tenBan = "";
            String query = "SELECT TenBan FROM Ban WHERE ID_Ban = ?";
            try (Connection conn = new DBContext().getConnection()) {
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, idBan);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    tenBan = rs.getString("TenBan");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return tenBan;
        }

}
     