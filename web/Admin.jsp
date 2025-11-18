<!DOCTYPE html>
<html lang="en">
<head>
    <title>Double Encryption</title>
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
  <header class="header"><a href="#" class="logo">Double Encryption Technique for Sharing and Storing the Images in the Cloud Environment </a>
    <nav class="navbar">
        <a href="index.jsp">Home</a>
        <a href="Ownerlogin.jsp">Owner</a>
        <a href="Userlogin.jsp">User</a>
        <a href="Admin.jsp" class="active"s>Admin</a>
    </nav>
</header>
    <div class="main1">
        <form action="Adminlogincheck.jsp" method="post">
            <label for="chk" aria-hidden="true">Admin Login</label>
            <input type="text" placeholder="User Name" required name="aname">
            <input type="password" placeholder="Password" required name="apass">
            <button type="submit">Login</button>
        </form>
         <%
                                    String msg = request.getParameter("msg");
                                    if (msg != null && msg.equalsIgnoreCase("failed")) {
                                        out.println("<h5><font color='Red'><b>Invalid Login Credentials</b></font></h5>");
                                    }
                                %>
    </div>
</body>
</html>