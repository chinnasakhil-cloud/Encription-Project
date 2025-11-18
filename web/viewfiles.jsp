<%-- 
    Document   : viewfiles
    Created on : Sep 6, 2024, 10:30:10 AM
    Author     : chait
--%>
<%@page import="com.app.utility.DBConnectionn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Double Encryption</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header class="header"><a href="#" class="logo">Double Encryption Technique for Sharing and Storing the Images in the Cloud </a>
    <nav class="navbar">
        <a href="userhome.jsp">Home</a>
        <a href="viewfiles.jsp" class="active">View Files</a>
        <a href="Download.jsp">Download</a>
        <a href="Userlogin.jsp">Logout</a>
    </nav>
</header>
    <div class="container4">
        <center><h3 style="color: black; font-size: 40px;"><b>View Image Details</b></h3>
            <br>
        <table border="1">
            <thead>
                <tr border="1" cellspacing="1px" cellpadding="10px" width="800px" style="color:black">
                    <th>S.No</th>
                    <th>file name</th>
                    <th>Message</th>
                    <th>Seckeys</th>
                    <th>Encrypted Image</th>
                    <th>File Request</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    int sno = 0;
                    try {
                        con = DBConnectionn.getConnection();
                        String sqlQuery = "SELECT * FROM uploadimage";
                        ps = con.prepareStatement(sqlQuery);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                            sno++;
                            int id = rs.getInt("id");
                            String message = rs.getString("message");
                            String seckeys = rs.getString("seckeys");
                            String filename = rs.getString("filename");
                            String name = rs.getString("name");

                            Blob imageBlob = rs.getBlob("image");
                            byte[] imgData = null;
                            String base64Image = "";
                            if (imageBlob != null) {
                                imgData = imageBlob.getBytes(1, (int) imageBlob.length());
                                base64Image = Base64.getEncoder().encodeToString(imgData);
                            }

                %>
                <tr style="color:greenyellow">
                    <td><%=sno%></td>
                    <td><%=filename%></td>
                    <td><%=message%></td>
                    <td><%=seckeys%></td>
                    <td><textarea cols="50" rows="4"><%=base64Image%></textarea></td>
                    <td><a  style="text-decoration: none; color: greenyellow" href="filerequest1.jsp?message=<%=message%>&filename=<%=filename%>&seckeys=<%=seckeys%>">Send Request</a> </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table></center>
    </div>
</body>
</html>

