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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author chaitu
 */
@WebServlet("/datauser_reg")
@MultipartConfig(maxFileSize = 161748002)
public class datauser_reg extends HttpServlet {

   
  @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        //response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        //Part filepart=request.getPart("image");
        String status = "waiting";
        String accesskey = "waiting";
        //InputStream is = filepart.getInputStream();
        //String ImageName = filepart.getSubmittedFileName();
        //String accesskey = "notGenerated";
        //out.println("Print name"+name);
        Connection con = null;
        PreparedStatement ps = null;
        try  {
            con = DBConnectionn.getConnection();
            String sqlQuery = "insert into datauserregister(name,password,email,mobile,gender,address,city,status,accesskey) values(?,?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(sqlQuery);
            ps.setString(1, name);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, mobile);
            ps.setString(5, gender);
            ps.setString(6, address);
            ps.setString(7, city);
            //ps.setBinaryStream(10,is,is.available());
            ps.setString(8, status);
            ps.setString(9, accesskey);
            int no = ps.executeUpdate();
            if(no>0){
                response.sendRedirect("Userlogin.jsp?msg=success");
            }else{
                response.sendRedirect("Userlogin.jsp?msg=failed");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Userlogin.jsp?msg=exist");
        }finally{
            try{
                ps.close();
                con.close();
            }catch (Exception e) {
        }
    }
    }

    }

    
