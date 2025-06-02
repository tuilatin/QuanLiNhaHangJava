/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.NhanVien;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DAONhanVienTin;
import entity.*;
import java.io.BufferedReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.google.gson.Gson;
import context.DBContext;
import java.sql.Connection;

/**
 *
 * @author Admin
 */
@WebServlet(name = "GoiMonControlTin", urlPatterns = {"/GoiMonTin"})
public class GoiMonControlTin extends HttpServlet {

     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<MonAn> listMonAn = new DAONhanVienTin().getListMonAn();
        Map<Integer, String> listMonMap = new DAONhanVienTin().getLoaiMonMap();
        List<Ban> listBan = new DAONhanVienTin().getListBan();
        request.setAttribute("listBan", listBan);
        request.setAttribute("listMonAn", listMonAn);
        request.setAttribute("listMonMap", listMonMap);
        request.getRequestDispatcher("/NhanVienJSP/GoiMonTin.jsp").forward(request, response);
    }
     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    StringBuilder sb = new StringBuilder();
    BufferedReader reader = request.getReader();
    String line;
    while ((line = reader.readLine()) != null) {
        sb.append(line);
    }
    String json = sb.toString();

    Gson gson = new Gson();
    GoiMonRequest goiMon = gson.fromJson(json, GoiMonRequest.class);

    Connection conn = null;
    try {
        conn = DBContext.getConnection();
        DAONhanVienTin dao = new DAONhanVienTin();

        int idDatBan = dao.insertDatBan(conn, goiMon.getIdBan(), 1);

        for (MonAn mon : goiMon.getDsMon()) {
            int donGia = dao.getDonGiaMonAn(conn, mon.getIdMonAn());
            int thanhTien = donGia * mon.getSoLuong();
            dao.insertChiTietDatMon(conn, idDatBan, mon.getIdMonAn(), mon.getSoLuong(), thanhTien);
        }

        dao.updateTrangThaiBan(conn, goiMon.getIdBan(), "Dang dung bua");

        response.setContentType("application/json");
        response.getWriter().write("{\"status\":\"success\"}");
    } catch (Exception e) {
        e.printStackTrace();
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.setContentType("text/plain");
        response.getWriter().write("Loi: " + e.getMessage());
    }finally {
        if (conn != null) try { conn.close(); } catch (Exception ex) {}
    }
}
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}


