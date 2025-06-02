/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.admin;

import dao.DAO;
import entity.LoaiMon;
import entity.MonAn;
import entity.NguoiDung;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "EditMonAn", urlPatterns = {"/editproduct"})
public class EditMonAn extends HttpServlet {

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
        
        try {
            // Get parameters
            String id = request.getParameter("pid");
            String tenMon = request.getParameter("TenMon");
            String image = request.getParameter("Image");
            String donGia = request.getParameter("DonGia");
            String trangThai = request.getParameter("TrangThai");
            String moTa = request.getParameter("MoTa");
            String idLoai = request.getParameter("ID_Loai");
            
            // Basic validation
            if (id == null || id.trim().isEmpty()) {
                throw new IllegalArgumentException("ID món ăn không được để trống");
            }
            
            if (tenMon == null || tenMon.trim().isEmpty()) {
                throw new IllegalArgumentException("Tên món không được để trống");
            }
            
            if (donGia == null || donGia.trim().isEmpty()) {
                throw new IllegalArgumentException("Đơn giá không được để trống");
            }
            
            try {
                int price = Integer.parseInt(donGia);
                if (price <= 0) {
                    throw new IllegalArgumentException("Đơn giá phải lớn hơn 0");
                }
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Đơn giá không hợp lệ");
            }
            
            // Get current user
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
            
            // Update product
            DAO dao = new DAO();
            boolean success = dao.updateMonAnByID(id, tenMon, donGia, idLoai, moTa, image, trangThai);
            
            if (!success) {
                throw new Exception("Không thể cập nhật món ăn. Vui lòng thử lại.");
            }
            
            // Redirect to manager page on success
            response.sendRedirect("manager");
            
        } catch (Exception e) {
            // Set error message and forward back to edit page
            request.setAttribute("error", e.getMessage());
            
            // Get product and categories for the form
            DAO dao = new DAO();
            String id = request.getParameter("pid");
            MonAn product = dao.getMonAnByID(id);
            List<LoaiMon> listC = dao.getAllCategory();
            
            request.setAttribute("product", product);
            request.setAttribute("listCC", listC);
            
            request.getRequestDispatcher("AdminEditMon.jsp").forward(request, response);
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
