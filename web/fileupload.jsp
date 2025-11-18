<%-- 
    Document   : fileupload
    Created on : Sep 5, 2024, 3:07:23 PM
    Author     : chait
--%>

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
        <a href="fileupload.jsp" class="active">Upload File</a>
        <a href="ownerfiles.jsp" >My Files</a>
        <a href="Downloadreq.jsp">view Request</a>
        <a href="Ownerlogin.jsp">Logout</a>
    </nav>
</header>
    <div class="container1">
        <img src="images/upic.png">
      <form action="UploadPicAction" method="post" enctype="multipart/form-data"><center>
               <center><h1 style="color: black; font-size: 40px"><b>Upload image</b></h1></center><br>
              <textarea class="contact textarea"cols="30%" rows="4" name="message" placeholder="Message"></textarea>
              <input class="contact" type="file" name="image" onclick="return mySign()" accept="image/gif, image/jpeg" style="color: black"/>
                  <input class="contact" type="text" name="key" placeholder="Enter Key"  required/>
            <input class="submit" type="submit" name="contact_submitted" value="submit" />
          
          </center> </form> 
    </div>
</body>
</html>

