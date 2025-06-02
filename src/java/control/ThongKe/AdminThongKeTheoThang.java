/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.ThongKe;

import dao.DAO;
import dao.DAOTK;
import entity.MonAn;
import entity.NguoiDung;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import static java.util.Calendar.DAY_OF_MONTH;
import static java.util.Calendar.MONTH;
import static java.util.Calendar.YEAR;
import static java.util.Calendar.getInstance;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author FPT
 */
@WebServlet(name = "AdminThongKe", urlPatterns = {"/thongkemonth"})
public class AdminThongKeTheoThang extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session= request.getSession();
        NguoiDung account = (NguoiDung) session.getAttribute("acc");
        if (account == null ) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }
        if (!account.getVaitro().equals("Quan Ly")) {
            response.sendRedirect("login");
            return;
        }
        DAOTK dao =new DAOTK();
        
        java.util.Calendar calendar = getInstance();
        int ngay = calendar.get(DAY_OF_MONTH);
        int thang = calendar.get(MONTH) + 1;
        int nam = calendar.get(YEAR);
        
        LocalDate today = LocalDate.now();
        
        int currentMonth = today.getMonthValue(); // Tháng hiện tại (1–12)
        int currentYear = today.getYear();        // Năm hiện tại

        // Gọi DAO để lấy dữ liệu thống kê
        int soLuongHoaDon = dao.getSoLuongHoaDonTrongThang(thang, nam);
        double tongDoanhThu = dao.getTongDoanhThuTrongThang(thang, nam);
        int tongSanPhamBanRa = dao.getTongSanPhamBanTrongThang(thang, nam);
        double tongTienGiam = dao.getTongTienGiamTrongThang(thang, nam);
        
        List<Object[]> objects = dao.getDanhSachMonAnBanChay(thang, nam);
        List<MonAn> listMonAn=dao.getTop5MonAnBanChay(4, 2025);

        // Đẩy dữ liệu ra JSP
        request.setAttribute("soLuongHoaDon", soLuongHoaDon);
        request.setAttribute("tongDoanhThu", tongDoanhThu);
        request.setAttribute("tongSanPhamBanRa", tongSanPhamBanRa);
        request.setAttribute("tongTienGiam", tongTienGiam);
        
        request.setAttribute("objects", objects);
        request.setAttribute("thang", thang);
        request.setAttribute("nam", nam);
        
        request.setAttribute("top5",listMonAn);

        // Chuyển tới trang JSP để hiển thị
        request.getRequestDispatcher("AdminThongKe.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
