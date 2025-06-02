/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.admin;

import dao.DAO2;
import entity.NguoiDung;
import entity.NhanVien;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
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
@WebServlet(name = "AdminEditKhachHang", urlPatterns = {"/editnhanvien"})
public class AdminEditNhanVien extends HttpServlet {

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
            if (!account.getVaitro().equals("Quan Ly")) {
                response.sendRedirect("login");
                return;
            }
            
        String id_nv = request.getParameter("id");
        try {
            // Lấy dữ liệu từ form
            
            String tenNV = request.getParameter("TenNV");
            String sdt = request.getParameter("SDT");
            String ngayVL = request.getParameter("NgayVL"); 
            String chucVu = request.getParameter("Chucvu");
            String tinhTrang = request.getParameter("Tinhtrang");

            // Validate dữ liệu
            if (id_nv == null || id_nv.trim().isEmpty()) {
                request.setAttribute("error", "ID nhân viên không được để trống!");
//                request.getRequestDispatcher("AdminEditNhanVien.jsp").forward(request, response);
                return;
            }

            // Gọi DAO để cập nhật
            DAO2 dao = new DAO2();
            boolean success = dao.updateNhanVienBasic(id_nv, tenNV, sdt, ngayVL, chucVu, tinhTrang);

            if (success) {
                request.setAttribute("message", "Cập nhật thành công!");
            } else {
                request.setAttribute("error", "Cập nhật thất bại!");
            }

            // Chuyển về trang quản lý
            request.getRequestDispatcher("adminnv").forward(request, response);
            
        } catch (Exception e) {
            System.out.println("Error in AdminEditNhanVien: " + e.getMessage());
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            DAO2 dao =new DAO2();
            NhanVien list =dao.getNhanVienById(id_nv);
            request.setAttribute("listnv", list);
            
            
//            request.getRequestDispatcher("AdminEditNhanVien.jsp").forward(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        
        try {
            DAO2 dao = new DAO2();
            List<NhanVien> list = dao.getNhanVienbyid(id);
            if (!list.isEmpty()) {
                request.setAttribute("nhanvien", list.get(0));
                request.getRequestDispatcher("AdminEditNhanVien.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Không tìm thấy nhân viên!");
                request.getRequestDispatcher("adminnv").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Error in doGet: " + e.getMessage());
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            request.getRequestDispatcher("adminnv").forward(request, response);
        }
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        try {
            // Lấy dữ liệu từ form
            String id_nv = request.getParameter("id");
            String tenNV = request.getParameter("TenNV");
            String sdt = request.getParameter("SDT");
            String ngayVL = request.getParameter("NgayVL"); 
            String chucVu = request.getParameter("Chucvu");
            String tinhTrang = request.getParameter("Tinhtrang");

            // Validate dữ liệu
            if (id_nv == null || id_nv.trim().isEmpty()) {
                request.setAttribute("error", "ID nhân viên không được để trống!");
                request.getRequestDispatcher("adminnv").forward(request, response);
                return;
            }

            // Gọi DAO để cập nhật
            DAO2 dao = new DAO2();
            boolean success = dao.updateNhanVienBasic(id_nv, tenNV, sdt, ngayVL, chucVu, tinhTrang);

            if (success) {
                request.setAttribute("message", "Cập nhật thành công!");
                response.sendRedirect("adminnv");
            } else {
                request.setAttribute("error", "Cập nhật thất bại!");
                request.getRequestDispatcher("AdminEditNhanVien.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Error in doPost: " + e.getMessage());
            request.setAttribute("error", "Lỗi: " + e.getMessage());
            request.getRequestDispatcher("AdminEditNhanVien.jsp").forward(request, response);
        }
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
