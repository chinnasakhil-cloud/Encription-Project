<%@page import="com.app.utility.DBConnectionn"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
String filename = request.getParameter("filename");
String message = request.getParameter("message");
String seckeys = request.getParameter("seckeys");

java.sql.Date reqdate = new java.sql.Date(new java.util.Date().getTime());
//FileUtilities fu = new FileUtilities();
//fu.allTranscationTypes(userName, file_name, "Query Search");
Connection con = null;
PreparedStatement ps = null;

try{
 con = DBConnectionn.getConnection();
String query = "insert into filerequest(filename,message,reqdate,seckeys,status) values(?,?,?,?,?)";
ps = con.prepareStatement(query);
ps.setString(1, filename);
ps.setString(2, message);
ps.setDate(3, reqdate);
ps.setString(4, seckeys);
ps.setString(5, "waiting");
int no = ps.executeUpdate();
if(no > 0){
    out.println("<script>alert('Request Send Success')</script>");
response.sendRedirect("viewfiles.jsp?msg=requset sent success");
}else{
response.sendRedirect("viewfiles.jsp?msg=requset sent Faild");
}
}catch(Exception e){
System.out.println("Error at User File Request "+e.getMessage());
e.printStackTrace();
}finally{
try{
ps.close();
con.close();
}catch(Exception e){}
}

%>