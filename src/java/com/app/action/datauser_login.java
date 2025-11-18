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
@WebServlet("/datauser_login")
public class datauser_login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String status = null;
        String accesskey = null;
        String email = null;
       
        try {
            con = DBConnectionn.getConnection();
            String sqlQuery = "SELECT status, accesskey, email FROM datauserregister WHERE name = ? AND password = ?";
            ps = con.prepareStatement(sqlQuery);
            ps.setString(1, name);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                status = rs.getString("status");
                accesskey = rs.getString("accesskey");
                email = rs.getString("email");

                if (status.equalsIgnoreCase("activated")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("accesskey", accesskey);
                    session.setAttribute("name", name);
                    session.setAttribute("email", email);
                    response.sendRedirect("userhome.jsp?msg=success");
                } else {
                    response.sendRedirect("Userlogin.jsp?msg=notactivated");
                }
            } else {
                response.sendRedirect("Userlogin.jsp?msg=notexist");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Userlogin.jsp?msg=error");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
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
        return "Short description";
    }
}
