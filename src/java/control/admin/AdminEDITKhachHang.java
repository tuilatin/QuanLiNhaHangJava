package control.admin;


import dao.DAO2;
import entity.KhachHang;
import entity.NguoiDung;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AdminEDITKhachHang", urlPatterns = {"/editKH"})
public class AdminEDITKhachHang extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        NguoiDung account = (NguoiDung) session.getAttribute("acc");

        // Kiểm tra đăng nhập và quyền
        if (account == null || !"Quan Ly".equals(account.getVaitro())) {
            response.sendRedirect("login");
            return;
        }

        DAO2 dao = new DAO2();
        String idKH = request.getParameter("cid");

        // GET request - hiển thị form edit
        if ("GET".equalsIgnoreCase(request.getMethod())) {
            try {
                if (idKH == null || idKH.trim().isEmpty()) {
                    response.sendRedirect("adminkh");
                    return;
                }
                List<KhachHang> list = dao.getKHbyId(idKH);
                if (!list.isEmpty()) {
                    request.setAttribute("khachHang", list.get(0));
                    request.getRequestDispatcher("AdminEditKhachHang.jsp").forward(request, response);
                } else {
                    response.sendRedirect("adminkh");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("adminkh");
            }
            return;
        }

        // POST request - xử lý cập nhật
        try {
            // Lấy dữ liệu từ form
            String tenKH = request.getParameter("tenKH");
            String ngayThamGia = request.getParameter("ngayThamGia");
            String vaiTro = request.getParameter("vaiTro");

            // Kiểm tra dữ liệu
            if (idKH == null || idKH.trim().isEmpty()) {
                request.setAttribute("error", "ID khách hàng không được để trống!");
                response.sendRedirect("adminkh");
                return;
            }

            // Gọi DAO để cập nhật
            boolean success = dao.updateKhachHangBasic(idKH, tenKH, ngayThamGia, vaiTro);

            if (success) {
                response.sendRedirect("adminkh");
            } else {
                List<KhachHang> list = dao.getKHbyId(idKH);
                if (!list.isEmpty()) {
                    request.setAttribute("khachHang", list.get(0));
                    request.setAttribute("error", "Cập nhật thất bại. Vui lòng thử lại.");
                    request.getRequestDispatcher("AdminEditKhachHang.jsp").forward(request, response);
                } else {
                    response.sendRedirect("adminkh");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi xử lý: " + e.getMessage());
            List<KhachHang> list = dao.getKHbyId(idKH);
            if (!list.isEmpty()) {
                request.setAttribute("khachHang", list.get(0));
                request.getRequestDispatcher("AdminEditKhachHang.jsp").forward(request, response);
            } else {
                response.sendRedirect("adminkh");
            }
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
        return "Servlet xử lý cập nhật thông tin khách hàng";
    }
}
