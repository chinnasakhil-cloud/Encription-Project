package com.app.action;


import com.app.utility.DBConnectionn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dataowner_reg")
@MultipartConfig(maxFileSize = 161748002)
public class dataowner_reg extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String status = "waiting";
        String accesskey = "waiting";

        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBConnectionn.getConnection();
            String sqlQuery = "INSERT INTO dataownerregister(name, password, email, mobile, gender, address, city, status, accesskey) VALUES(?,?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(sqlQuery);
            ps.setString(1, name);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, mobile);
            ps.setString(5, gender);  // Corrected order
            ps.setString(6, address);
            ps.setString(7, city);
            ps.setString(8, status);
            ps.setString(9, accesskey);
            
            int no = ps.executeUpdate();
            if (no > 0) {
                response.sendRedirect("Ownerlogin.jsp?msg=success");
            } else {
                response.sendRedirect("Ownerlogin.jsp?msg=failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Ownerlogin.jsp?msg=exist");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
