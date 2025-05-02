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
    
    public static void main(String[] args) {
        DAONhanVienTin dao = new DAONhanVienTin();
        List<MonAn> listBan = dao.getListMonAn();
        
        for (MonAn ban : listBan) {
            System.out.println(ban.toString());
        }
    }
}
