<%-- 
    Document   : userdetails
    Created on : Sep 5, 2024, 1:49:57 PM
    Author     : chait
--%>

<%@page import="com.app.utility.DBConnectionn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Double Encryption</title>
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
   <header class="header"><a href="#" class="logo">Double Encryption Technique for Sharing and Storing the Images in the Cloud</a>
        <nav class="navbar" style="margin-right: -50px; margin-left: -50px">
        <a href="AdminHome.jsp">Home</a>
        <a href="ownerdetails.jsp">Owner Details</a>
        <a href="userdetails.jsp" class="active">User Details</a>
        <a href="Admin.jsp">Logout</a>
    </nav>
</header>
    <div class="container5">
   <center>
       <h1 style="color: black">Users Details</h1><br>
       <table border="1">
           <thead style="color: black">
                                    <tr>
                                        
                                        <th>S.No</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Mobile</th>
                                        <th>Gender</th>
                                        <th>Address</th>
                                        <th>city</th>
                                        <th>status</th>
                                        <th>AccessKey</th>
                                        <th>Activate</th>
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
                                                String sqlQuery = "select * from datauserregister";
                                                ps = con.prepareStatement(sqlQuery);
                                                rs = ps.executeQuery();
                                                while (rs.next()) {
                                                    sno++;
                                                    int id = rs.getInt("id");
                                                    String name = rs.getString("name");
                                                    String sts = rs.getString("status");
                                        %>
                                        <tr style="color: whitesmoke">
                                            <td><%=sno%></td>
                                            <td><%=name%></td>
                                            <td><%=rs.getString("email")%></td>
                                            <td><%=rs.getString("mobile")%></td>
                                            <td><%=rs.getString("gender")%></td>
                                            <td><%=rs.getString("address")%></td>
                                            <td><%=rs.getString("city")%></td>
                                            <td><%=sts%></td>
                                            <td><%=rs.getString("accesskey")%></td>
                                            <td>
                                                <%
                                                    if (sts.equalsIgnoreCase("activated")) {
                                                        out.println("Activated");
                                                    } else {
                                                %>
                                                <a class="primary-btn" href="useractivate1.jsp?id=<%=id%>">Activate</a>
                                                <%
                                                    }
                                                %>
                                            </td>
                                        </tr>
                                        <%
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            } finally {
                                                if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
                                                if (ps != null) try { ps.close(); } catch (Exception e) { e.printStackTrace(); }
                                                if (con != null) try { con.close(); } catch (Exception e) { e.printStackTrace(); }
                                            }
                                        %>
                                </tbody>
            </table></center>
    </div>

</body>
</html>
