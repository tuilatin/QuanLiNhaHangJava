package control.NhanVien;

import entity.NguoiDung;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "NhanVienHomeControlTin", urlPatterns = {"/NhanVienHomeTin"})
public class NhanVienHomeControlTin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        NguoiDung account = (NguoiDung) session.getAttribute("acc");
        
        if (account == null) {
            response.sendRedirect("login");
            return;
        }
        
        if (!account.getVaitro().equals("Nhan Vien")) {
            response.sendRedirect("login");
            return;
        }

        request.getRequestDispatcher("NhanVienHomeTin.jsp").forward(request, response);
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