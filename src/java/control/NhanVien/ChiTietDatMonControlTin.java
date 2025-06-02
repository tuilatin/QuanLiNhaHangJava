/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.NhanVien;

import dao.DAONhanVienTin;
import entity.ChiTietDatMon;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ChiTietDatMonControlTin", urlPatterns = {"/ChiTietDatMonControlTin"})
public class ChiTietDatMonControlTin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChiTietDatMonControlTin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChiTietDatMonControlTin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         int idBan = Integer.parseInt(request.getParameter("id"));
    DAONhanVienTin dao = new DAONhanVienTin();
    
    // Lấy danh sách món theo bàn
    List<ChiTietDatMon> dsMon = dao.getMonAnTheoBan(idBan);
    
    // Lấy tên bàn
    String tenBan = dao.getTenBanById(idBan);
    
    // Đẩy dữ liệu sang JSP
    request.setAttribute("dsMon", dsMon);
    request.setAttribute("idBan", idBan);
    request.setAttribute("tenBan", tenBan); // Thêm tên bàn
    request.getRequestDispatcher("/NhanVienJSP/ChiTietDatMon.jsp").forward(request, response);
    }

}
