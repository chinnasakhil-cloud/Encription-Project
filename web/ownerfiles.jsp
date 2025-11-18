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
       <nav class="navbar" style="margin-right: -50px; margin-left: -50px">
        <a href="ownerhome.jsp">Home</a>
        <a href="fileupload.jsp">Upload File</a>
        <a href="ownerfiles.jsp"  class="active">My Files</a>
        <a href="Downloadreq.jsp">view Request</a>
        <a href="Ownerlogin.jsp">Logout</a>
    </nav>
</header>
    <div class="container2">
    <center><h3 style="color: whitesmoke; font-size: 40px;"><b>View Image Details</b></h3></center><br>

    <table border="1">
        <thead>
            <tr style="color:whitesmoke">
                <th>S.No</th>
                <th>filename</th>
                <th>Message</th>
                <th>Seckeys</th>
                <th>Encrypted Image</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                int sno = 0;
                String userId = (String) session.getAttribute("name"); // Get logged-in user's ID from session
                try {
                    con = DBConnectionn.getConnection();
                    String sqlQuery = "SELECT * FROM uploadimage WHERE name = ?"; // Assuming userId column exists in uploadimage table
                    ps = con.prepareStatement(sqlQuery);
                    ps.setString(1, userId); // Set the userId parameter in the query
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        sno++;
                        int id = rs.getInt("id");
                        String filename = rs.getString("filename");
                        String message = rs.getString("message");
                        String seckeys = rs.getString("seckeys");

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
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
