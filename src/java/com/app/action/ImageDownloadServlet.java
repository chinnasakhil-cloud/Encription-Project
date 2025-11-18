package com.app.action;

import com.app.utility.DBConnectionn;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ImageDownloadServlet")
public class ImageDownloadServlet extends HttpServlet {

    private final int ARBITARY_SIZE = 1048;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        // Validate and get 'filename' parameter
        String filename = request.getParameter("filename");
        if (filename == null || filename.isEmpty()) {
            out.println("Filename is missing");
            return;
        }

        // Validate and get 'seckeys' parameter
        String en_key = request.getParameter("seckeys");
        if (en_key == null || en_key.isEmpty()) {
            out.println("Secret key is missing");
            return;
        }

        int key = 0;
        try {
            key = Integer.parseInt(en_key);
        } catch (NumberFormatException e) {
            out.println("Invalid secret key");
            return;
        }

        System.out.println("Filename: " + filename);
        System.out.println("Key: " + key);

        Blob image = null;
        Connection con = null;
        byte[] imgData = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        File file = new File("E:\\image1.png");
        FileOutputStream fos = new FileOutputStream(file);

        try {
            con = DBConnectionn.getConnection();

            // Query the image from the database using the filename
            String query = "SELECT image, message FROM uploadimage WHERE filename = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, filename);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                image = rs.getBlob(1);
                imgData = image.getBytes(1, (int) image.length());
                fos.write(imgData);
            } else {
                out.println("Image not found for the given filename");
                return;
            }

            fos.close();

            // Decrypting the image
            FileInputStream fis = new FileInputStream("E:\\image1.png");
            byte[] data = new byte[fis.available()];
            fis.read(data);

            // XOR decryption using the provided key
            for (int i = 0; i < data.length; i++) {
                data[i] = (byte) (data[i] ^ key);
            }

            // Write the decrypted image to a new file
            FileOutputStream fos1 = new FileOutputStream("E:\\image11.png");
            fos1.write(data);
            fos1.close();
            fis.close();

        } catch (Exception e) {
            out.println("Unable to display image");
            out.println("Image Display Error: " + e.getMessage());
            return;
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Redirect after successful processing
        response.sendRedirect("Download.jsp?status=success");
    }
}
