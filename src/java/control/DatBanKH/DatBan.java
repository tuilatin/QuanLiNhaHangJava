/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.DatBanKH;

import dao.BanDAO;
import entity.NguoiDung;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "DatBan", urlPatterns = {"/datbannow"})
public class DatBan extends HttpServlet {

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
        HttpSession session = request.getSession();
            NguoiDung account = (NguoiDung) session.getAttribute("acc");
            if (account == null) {
                response.sendRedirect("login");
                return;
            }
            
        
        
        
        try {
            // Lấy thông tin từ form
            String chiNhanh = request.getParameter("chiNhanh");
            String hoTen = request.getParameter("hoTen");
            String ngayDatStr = request.getParameter("ngayDat");
            String khungGio = request.getParameter("khungGio");
            String soDienThoai = request.getParameter("soDienThoai");
            int soNguoi = Integer.parseInt(request.getParameter("soNguoi"));
            String ghiChu = request.getParameter("ghiChu");
            int idtable =Integer.parseInt(request.getParameter("selectedTable"));

            // Ghép ngày và giờ thành Date
            String fullDateTimeStr = ngayDatStr + " " + khungGio + ":00";
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date thoiGianDat = sdf.parse(fullDateTimeStr);

            // Gọi DAO để lưu
            BanDAO dao = new BanDAO();
            int idDatBan = dao.insertDatBanReturnId(account.getId(), idtable, chiNhanh,hoTen, thoiGianDat, soNguoi,soDienThoai, ghiChu);
            dao.copyCartToChiTietDatBan(account.getId(), idDatBan);
            
            entity.DatBan list= dao.getThongTinDatBan(idDatBan);
            
            if(list.getTongTien()>0){
                request.setAttribute("datBan", list);
            request.getRequestDispatcher("DatBanChiTiet.jsp").forward(request, response);
                return;
            }else{
                dao.capNhatTrangThaiDatBan(idDatBan+"", "Da xac nhan");
                 response.sendRedirect("dsdatban");
                 return;
            }
            
            
            
//            if (idDatBan > 0) {
//                request.setAttribute("thongBao", "Đặt bàn thành công! Mã đơn: #" + idDatBan);
//            } else {
//                request.setAttribute("thongBao", "Đặt bàn thất bại!");
//            }
//            response.sendRedirect("chitietthanhtoan");
            

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("thongBao", "Lỗi xử lý đặt bàn: " + e.getMessage());
        }

        request.getRequestDispatcher("thongbao.jsp").forward(request, response);
         
         
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
