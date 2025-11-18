<%-- 
    Document   : login
    Created on : Sep 5, 2024, 9:38:00 AM
    Author     : chait
--%>
<!DOCTYPE html>
<html>
<head>
	<title>Double Encryption</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">

</head>
<body>
    <header class="header"><a href="#" class="logo">Double Encryption Technique for Sharing and Storing the Images in the Cloud Environment </a>
    <nav class="navbar">
        <a href="index.jsp" >Home</a>
        <a href="Ownerlogin.jsp" class="active">Owner</a>
        <a href="Userlogin.jsp">User</a>
        <a href="Admin.jsp">Admin</a>
    </nav>
</header>
	<div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">

			<div class="signup">
                            <form action="dataowner_reg" method="post">
                                <label for="chk" aria-hidden="true">Sign up</label>
                                <input type="text" name="name" placeholder="User name" required="">
                                <input type="password" name="password" placeholder="Password" required="">
                                <input type="email" name="email" placeholder="Email" required="">
                                <input type="text" name="mobile" pattern="[6789][0-9]{9}" placeholder="Mobile" required="">
                                <select name="gender" required> <!-- Changed 'validity' to 'gender' -->
                                    <option value="" disabled selected>Gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="NA">NA</option>
                                </select>
                                <input type="text" name="address" placeholder="Address" required>
                                <input type="text" name="city" placeholder="City" required>
                                <button>Sign up</button>
</form>

			</div>

			<div class="login">
                            <form action="dataowner_login" method="post">
					<label for="chk" aria-hidden="true">Login</label>
					<input type="text" name="name" placeholder="User name" required="">
					<input type="password" name="password" placeholder="Password" required="">
					<button>Login</button>
				</form>
                                <%
        // Display messages based on login status
        String msg = request.getParameter("msg");
        if (msg != null) {
            if (msg.equals("notexist")) {
                out.println("<p style='color:red;'>User does not exist!</p>");
            } else if (msg.equals("notactivated")) {
                out.println("<p style='color:red;'>Your account is not activated!</p>");
            } else if (msg.equals("sessionexpired")) {
                out.println("<p style='color:red;'>Session expired. Please log in again.</p>");
            } else if (msg.equals("error")) {
                out.println("<p style='color:red;'>An error occurred. Please try again.</p>");
            }
        }
    %>
			</div>
	</div>
</body>
</html>
