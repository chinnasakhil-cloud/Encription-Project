<%-- 
    Document   : login
    Created on : Sep 3, 2024, 9:27:00 AM
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
        <a href="Ownerlogin.jsp">Owner</a>
        <a href="Userlogin.jsp" class="active">User</a>
        <a href="Admin.jsp">Admin</a>
    </nav>
</header>
	<div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">

			<div class="signup">
                        <form action="datauser_reg" method="post">
                            <label for="chk" aria-hidden="true">Sign up</label>
                            <input type="text" name="name" placeholder="User name" required=""> <!-- Changed from 'txt' to 'name' -->
                            <input type="password" name="password" placeholder="Password" required=""> <!-- Changed from 'pswd' to 'password' -->
                            <input type="email" name="email" placeholder="Email" required="">
                            <input type="text" name="mobile" pattern="[6789][0-9]{9}" placeholder="Mobile" required="">
                            <select name="gender" required> <!-- Changed from 'validity' to 'gender' -->
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
                            <form action="datauser_login" method="post">
					<label for="chk" aria-hidden="true">Login</label>
					<input type="text" name="name" placeholder="User name" required="">
					<input type="password" name="password" placeholder="Password" required="">
					<button>Login</button>
				</form>
			</div>
	</div>
</body>
</html>
