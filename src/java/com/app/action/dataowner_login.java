/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import com.app.utility.DBConnectionn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author chaitu
 */
@WebServlet("/dataowner_login")
public class dataowner_login extends HttpServlet {

  /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    String name = request.getParameter("name");
    String password = request.getParameter("password"); // Use "password" instead of "upass"
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String status = null;
    String accesskey = null;
    String email = null;
    
    

    try {
        con = DBConnectionn.getConnection();
        String sqlQuery = "SELECT status, accesskey, email FROM dataownerregister WHERE name = ? AND password = ?";
        ps = con.prepareStatement(sqlQuery);
        ps.setString(1, name);
        ps.setString(2, password);
        rs = ps.executeQuery();
        if (rs.next()) {
            status = rs.getString("status");
            accesskey = rs.getString("accesskey");
            email = rs.getString("email");
        } else {
            response.sendRedirect("Ownerlogin.jsp?msg=notexist");
            return; // Ensure to return after redirect
        }
        
        if (status != null && status.equalsIgnoreCase("activated")) {
            HttpSession session = request.getSession();
            session.setAttribute("accesskey", accesskey);
            session.setAttribute("name", name);
            session.setAttribute("email", email);
            response.sendRedirect("ownerhome.jsp?msg=success");
        } else {
            response.sendRedirect("Ownerlogin.jsp?msg=notactivated");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("Ownerlogin.jsp?msg=error");
    } finally {
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
