/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control.Login;


import dao.DAO;
import entity.GoogleAccount;
import entity.NguoiDung;
import java.io.IOException;

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
@WebServlet(name = "oauth2callback", urlPatterns = {"/oauth2callback"})
public class oauth2callback extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        String error = request.getParameter("error");
        //neu nguoi dung huy uy quyen
        if(error != null) {
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        GoogleLogin gg = new GoogleLogin();
        String accessToken = gg.getToken(code);
        GoogleAccount account = gg.getUserInfo(accessToken);

        DAO dao =new DAO();

        if(dao.CheckAccount(account.getEmail())==null){
            dao.SignupGoogle(account.getEmail(), account.getId(), account.getName());
            System.out.println("chua tồn tại ");
        }
        
        NguoiDung nd = dao.login(account.getEmail(), account.getId());
            if(nd !=null){
            HttpSession session = request.getSession();
            session.setAttribute("acc", nd);
            
            
            int cartCount = dao.countCart(nd.getId());
            session.setAttribute("count", cartCount);
            response.sendRedirect("home");
            }
    }
   
    
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
