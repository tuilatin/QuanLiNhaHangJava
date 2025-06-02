/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.KhachHang;

import dao.DAO;
import dao.DAO2;
import entity.CartItem;
import entity.KhachHang;
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
@WebServlet(name = "UpdateSoLuong", urlPatterns = {"/updatesl"})
public class UpdateSoLuong extends HttpServlet {

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
            DAO dao = new DAO();
        try {
            int id = Integer.parseInt(request.getParameter("id")); // ID món ăn cần cập nhật
             int quantity = Integer.parseInt(request.getParameter("quantity"));
             
            boolean isUpdated = dao.updateSoLuongMon(account.getId(), id, quantity);

            if (isUpdated) {
                System.out.println("Cập nhật số lượng món thành công!");
            } else {
                System.out.println("Không thể cập nhật số lượng món.");
            }
        } catch (Exception e) {
        }
        
        int cartid =Integer.parseInt(request.getParameter("cartid"));

        
        List<CartItem> list1 =dao.getCartByUser(cartid);
        request.setAttribute("listCart", list1);
        
        // thành tiền
            double thanhTien=dao.thanhTien(account.getId());
            session.setAttribute("thanhtien", thanhTien);
            request.setAttribute("khachhang", list1);
        
            DAO2 dao2 =new DAO2();
            KhachHang list2 =dao2.getKhachHangByIdND(account.getId());
            request.setAttribute("khachhang", list2);   
            
        request.getRequestDispatcher("Cart.jsp").forward(request, response);
        

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
