/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Ban;
import entity.NguoiDung;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FPT
 */
public class chatDAO {
        public List<NguoiDung> getAllNguoiLienLac(int idND) {
    List<NguoiDung> list = new ArrayList<>();
    String sql = "SELECT nd.*, MAX(tn.ThoiGian) AS ThoiGianMoiNhat\n" +
                 "FROM TinNhan tn\n" +
                 "JOIN NguoiDung nd ON nd.ID_ND = \n" +
                 "    CASE \n" +
                 "        WHEN tn.GuiTu = ? THEN tn.GuiDen\n" +
                 "        ELSE tn.GuiTu\n" +
                 "    END\n" +
                 "WHERE tn.GuiTu = ? OR tn.GuiDen = ?\n" +
                 "GROUP BY nd.ID_ND, nd.Email, nd.Matkhau, nd.VerifyCode, nd.Trangthai, nd.Vaitro, nd.TenND\n" +
                 "ORDER BY ThoiGianMoiNhat DESC;";

    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, idND); // CASE logic
        ps.setInt(2, idND); // WHERE tn.GuiTu = ?
        ps.setInt(3, idND); // WHERE tn.GuiDen = ?

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            NguoiDung nd = new NguoiDung(
                rs.getInt("ID_ND"),
                rs.getString("Email"),
                rs.getString("Matkhau"),
                rs.getString("VerifyCode"),
                rs.getString("Trangthai"),
                rs.getString("Vaitro"),
                rs.getString("TenND") // nếu có cột này
            );
            list.add(nd);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
        public NguoiDung getNguoiDungById(String idND) {
    String sql = "SELECT * FROM NguoiDung WHERE ID_ND = ?";
    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, idND);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return new NguoiDung(
                rs.getInt("ID_ND"),
                rs.getString("Email"),
                rs.getString("Matkhau"),
                rs.getString("VerifyCode"),
                rs.getString("Trangthai"),
                rs.getString("Vaitro"),
                rs.getString("TenND") // nếu bảng có cột này
            );
        }
    } catch (Exception e) {
        System.err.println("Error in getNguoiDungById: " + e.getMessage());
        e.printStackTrace();
    }
    return null;
}
        public List<NguoiDung> searchNguoiDung(String keyword) {
    List<NguoiDung> list = new ArrayList<>();
    String sql = "SELECT * FROM NguoiDung WHERE Email LIKE ? OR TenND LIKE ? "
            + " or ID_ND LIKE ?";

    try (Connection conn = new DBContext().getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        String searchPattern = "%" + keyword + "%";
        ps.setString(1, searchPattern);
        ps.setString(2, searchPattern);
        ps.setString(3, searchPattern);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            NguoiDung nd = new NguoiDung(
                rs.getInt("ID_ND"),
                rs.getString("Email"),
                rs.getString("Matkhau"),
                rs.getString("VerifyCode"),
                rs.getString("Trangthai"),
                rs.getString("Vaitro"),
                rs.getString("TenND")
            );
            list.add(nd);
        }

    } catch (Exception e) {
        System.err.println("Error in searchNguoiDung: " + e.getMessage());
        e.printStackTrace();
    }

    return list;
}



    public static void main(String[] args) {
        chatDAO dao=new chatDAO();
        List<NguoiDung> list=dao.searchNguoiDung("nv1");
        System.out.println(list);
    }
}
