<%@page import="com.app.utility.DBConnectionn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
String filename = request.getParameter("id");
Connection con = null;
PreparedStatement ps = null;
String sts = "Permitted";
try{
con = DBConnectionn.getConnection();
String query = "update filerequest set status = ?";
ps = con.prepareStatement(query);
ps.setString(1, sts);
ps.executeUpdate();
response.sendRedirect("Downloadreq.jsp?msg=Permitted");
}catch(Exception e){
System.out.println("Errora at User Activation");
}
 %>