package dateShare.service.activity;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;

@WebServlet("/UploadService")

public class FileUploadActivity extends HttpServlet {

     protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          String a_path = request.getParameter("a_path");
          System.out.println(a_path);
     
          
     }
}