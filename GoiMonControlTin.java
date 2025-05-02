/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.NhanVien;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DAONhanVienTin;
import entity.MonAn;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 *
 * @author Admin
 */
@WebServlet(name = "GoiMonControlTin", urlPatterns = {"/GoiMonTin"})
public class GoiMonControlTin extends HttpServlet {

     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<MonAn> listMonAn = new DAONhanVienTin().getListMonAn();
        Map<Integer, String> listMonMap = new DAONhanVienTin().getLoaiMonMap();
        request.setAttribute("listMonAn", listMonAn);
        request.setAttribute("listMonMap", listMonMap);
        request.getRequestDispatcher("/NhanVienJSP/GoiMonTin.jsp").forward(request, response);
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
    }// </editor-fold>

}


