package control.admin;

import dao.DAO;
import entity.NguoiDung;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "UpdateTrangThaiMonAn", urlPatterns = {"/updateTrangThaiMonAn"})
public class UpdateTrangThaiMonAn extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        request.setCharacterEncoding("UTF-8");
        
        String id = request.getParameter("id");
        String trangThai = request.getParameter("trangThai");
        
        DAO dao = new DAO();
        boolean success = dao.updateByIdProduct(id, trangThai);
        
        PrintWriter out = response.getWriter();
        if (success) {
            out.print("Cập nhật thành công");
        } else {
            out.print("Cập nhật thất bại");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
} 