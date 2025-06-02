/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.DiaChi;

import dao.DAO2;
import entity.KhachHang;
import entity.NguoiDung;
import entity.NhanVien;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DiaChiControl", urlPatterns = {"/informkh"})
public class infoKhachHangcontrol extends HttpServlet {

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
        
    request.setCharacterEncoding("UTF-8");
        HttpSession session= request.getSession();
        NguoiDung account = (NguoiDung) session.getAttribute("acc");
            if (account == null ) {
                response.sendRedirect("login");
                return;
            }
//            if (!account.getVaitro().equals("Khach Hang")) {
//                response.sendRedirect("login");
//                return;
//            }
            
//        String id_nd = request.getParameter("id");
//        int idND = Integer.parseInt(request.getParameter("id"));
        try {
            // Lấy dữ liệu từ form
            
            
String tenKH = request.getParameter("tenKH");
int sdt = Integer.parseInt(request.getParameter("sdt"));
String soNhaDuong = request.getParameter("soNhaDuong");
String phuongXa = request.getParameter("Phuongxa");
String quanHuyen = request.getParameter("quanHuyen");
String tinhThanh = request.getParameter("tinhThanh");
String ghiChu = request.getParameter("ghiChu");

            // Validate dữ liệu
//            if (id_nd == null || id_nd.trim().isEmpty()) {
//                request.setAttribute("error", "ID nhân viên không được để trống!");
////                request.getRequestDispatcher("AdminEditNhanVien.jsp").forward(request, response);
//                return;
//            }

            // Gọi DAO để cập nhật
            DAO2 dao = new DAO2();
            dao.capNhatThongTinKhachHang(account.getId(), tenKH, sdt, soNhaDuong, phuongXa, quanHuyen, tinhThanh, ghiChu);

//            if (success) {
//                request.setAttribute("message", "Cập nhật thành công!");
//            } else {
//                request.setAttribute("error", "Cập nhật thất bại!");
//            }

            // Chuyển về trang quản lý
            request.getRequestDispatcher("home").forward(request, response);
            
        } catch (Exception e) {
            System.out.println("Error in AdminEditNhanVien: " + e.getMessage());
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            DAO2 dao =new DAO2();
            KhachHang list =dao.getKhachHangByIdND(account.getId());
            request.setAttribute("khachhang", list);
            
            
            request.getRequestDispatcher("InfoKhachHang.jsp").forward(request, response);
        }
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
