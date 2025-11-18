<%-- 
    Document   : Download
    Created on : Sep 6, 2024, 2:33:25 PM
    Author     : chait
--%>

<%@page import="com.app.utility.DBConnectionn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Double Encryption</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header class="header">
        <a href="#" class="logo">Double Encryption Technique for Sharing and Storing the Images in the Cloud</a>
        <nav class="navbar">
            <a href="userhome.jsp">Home</a>
            <a href="viewfiles.jsp">View Files</a>
            <a href="Download.jsp" class="active">Download</a>
            <a href="Userlogin.jsp">Logout</a>
        </nav>
    </header>

    <div class="container4">
        <center>
            <h1 style="color: black; font-size: 40px;">Download files</h1>
            <br>
            <table border="1" cellspacing="1px" cellpadding="10px" width="800px" style="color:whitesmoke">
                <thead style="color: black">    
                <tr>
                        <th>S.NO</th>
                        <th>File Name</th>
                        <th>Message</th>
                        <th>Seckey</th>
                        <th>Request Date</th>                              
                        <th>Action</th>
                    </tr>
                </thead>
                    <%
                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    int sno = 0;
                    String filename = null;
                    try {
                        con = DBConnectionn.getConnection();
                        String query = "SELECT * FROM filerequest WHERE status = ?";
                        ps = con.prepareStatement(query);
                        ps.setString(1, "Permitted");
                        rs = ps.executeQuery();
                        while (rs.next()) {
                            sno++;
                            int id = rs.getInt(1);
                            String sts = rs.getString("status");
                            filename = rs.getString("filename");
                            String seckeys = rs.getString("seckeys");
                    %>
                    <tr>
                        <td><%= sno %></td>
                        <td><%= rs.getString("filename") %></td>     
                        <td><%= rs.getString("message") %></td>     
                        <td><%= rs.getString("seckeys") %></td>     
                        <td><%= rs.getDate("reqdate") %></td>
                        <td><a style="color: greenyellow; text-decoration: none" href="ImageDownloadServlet?filename=<%= filename %>&seckeys=<%= seckeys %>">Download</a></td>
                    </tr>
                    <%
                        }
                    } catch (Exception e) {
                        System.out.println("Getting Cloud Clients " + e.getMessage());
                    } finally {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (con != null) con.close();
                    }
                    %>
                </table>

        </center>  
    </div>
</body>
</html>
