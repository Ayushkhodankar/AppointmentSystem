package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logoutadmin")
public class LogoutAdmin extends HttpServlet {
	
    public LogoutAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

   


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
		response.sendRedirect("index.jsp");
         //request.getRequestDispatcher().include(request, response);  
           
         HttpSession session1=request.getSession();  
         session1.invalidate();  
           
         System.out.print("You are successfully logged out!admin");  
           
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	}

}
