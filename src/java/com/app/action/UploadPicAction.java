/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.action;

import com.app.utility.DBConnectionn;
import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author chaitu
 */
@WebServlet("/UploadPicAction")
@MultipartConfig(maxFileSize = 161748002)
public class UploadPicAction extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String message = request.getParameter("message");
        String en_key = request.getParameter("key");
        int key = Integer.parseInt(en_key);

        // Retrieve username from the session
        String username = (String) request.getSession().getAttribute("name");
        
        if (username == null) {
            response.sendRedirect("Ownerlogin.jsp?msg=sessionexpired");
            return;
        }

        Part filepart = request.getPart("image");
        String fileName = filepart.getSubmittedFileName();  // Get the filename

        InputStream is = filepart.getInputStream();
        byte[] data = new byte[is.available()];
        is.read(data);
        int i = 0;
        for (byte b : data) {
            data[i] = (byte) (b ^ key);
            i++;
        }
        InputStream cryptoImg = new ByteArrayInputStream(data);

        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBConnectionn.getConnection();
            String sqlQuery = "INSERT INTO uploadimage(message, seckeys, name, image, filename) VALUES(?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sqlQuery);
            ps.setString(1, message);
            ps.setString(2, en_key);
            ps.setString(3, username);
            ps.setBinaryStream(4, cryptoImg);
            ps.setString(5, fileName);  // Include the filename in the insert

            int no = ps.executeUpdate();
            if (no > 0) {
                response.sendRedirect("fileupload.jsp?msg=success");
            } else {
                response.sendRedirect("fileupload.jsp?msg=failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("fileupload.jsp?msg=exist");
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
