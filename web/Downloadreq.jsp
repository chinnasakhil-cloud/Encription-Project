<%-- 
    Document   : Downloadreq
    Created on : Sep 6, 2024, 4:41:04 PM
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
        <a href="ownerhome.jsp">Home</a>
        <a href="fileupload.jsp">Upload File</a>
        <a href="ownerfiles.jsp">My Files</a>
        <a href="Downloadreq.jsp" class="active">view Request</a>
        <a href="Ownerlogin.jsp">Logout</a>
    </nav>
</header>
    <div class="container3">
        <center><h1 style="color: whitesmoke">File Request</h1>                      

            <table style="color: whitesmoke" border="1" cellspacing="1px" cellpadding="10px" width="500px">
                               <tr>
                               <th>S.NO</th>
                               <th>File Name</th>
                               <th>Request Date</th>                              
                               <th>status</th>                              
                               
                              
                               </tr>
                                                                <%
                                 Connection con = null;
                                 PreparedStatement ps = null;
                                 ResultSet rs = null;
                                 int sno = 0;
                                 String sts = null;

                                 try{
                                 con = DBConnectionn.getConnection();
                                 String query = "select * from filerequest";
                                 ps = con.prepareStatement(query);

                                 rs = ps.executeQuery();
                                 while(rs.next()){
                                     sno++;
                                 String filename = rs.getString("filename");
                                 sts = rs.getString("status");
                                 %>
                                 <tr>
                                     <td><%=rs.getInt("id")%></td>
                                     <td><%=rs.getString("filename")%></td>
                                     <td><%=rs.getDate("reqdate")%></td>
                                     <td style="color: greenyellow">
                                         <%
                                         if(sts.equalsIgnoreCase("waiting")){
                                             %><a style="color: teal; text-decoration: none" href="FileDownloadResponse.jsp?filename=<%=filename%>">Permit</a><%
                                         }else{
                                         out.println(sts);
                                 }%>
                                     </td>


                                 </tr>
                                 <%
                                                                }
                                 }catch(Exception e){
                                 System.out.println("Getting Cloud Clients "+e.getMessage());
                                 }                            
                                 %>
                           </table></center>
    </div>
</body>
</html>
