
<%@page import="com.app.utility.DBConnectionn"%>
<%@ page import="java.sql.*,java.io.*,java.util.*" %> 


<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.app.utility.DBConnectionn"%>
<%@page import="java.io.ByteArrayOutputStream"%>

<%
    Blob image = null;
    byte[] imgData = null;
    String base64Image = null;

    try {
        // Retrieve image ID from the request parameter
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Establish a connection and create a statement
        Statement st = DBConnectionn.getConnection().createStatement();
        
        // SQL query to fetch the image blob from the database
        String strQuery = "SELECT image FROM uploadimage WHERE id=" + id;
        ResultSet rs = st.executeQuery(strQuery);
        
        // Check if the image is found
        if (rs.next()) {
            image = rs.getBlob(1);
            imgData = image.getBytes(1, (int) image.length());

            // Encode the image data as Base64
            base64Image = Base64.getEncoder().encodeToString(imgData);
        } else {
            out.println("Image not found for the given ID.");
            return;
        }

        // Output the image as a Base64 string
        out.println("<p>Base64 Encoded Image:</p>");
        out.println("<textarea cols='100' rows='10'>" + base64Image + "</textarea>");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>


</body>
</html>