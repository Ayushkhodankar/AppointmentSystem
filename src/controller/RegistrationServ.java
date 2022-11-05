package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import model.UserDao;


@WebServlet("/registrationserv")
public class RegistrationServ extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		String name=request.getParameter("name");
		String uname=request.getParameter("uname");
		String passw=request.getParameter("passw");
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("register.jsp");
		User u=new User(name,uname,passw);
		
		if(name.length()>1)
		{
		try {
			
			int y=UserDao.insertUser(u);
			
			if(y>0)
				{
				
				response.sendRedirect("index.jsp");
			    
				}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		else{
			
			dispatcher.include(request,response);
			out.print("<br/><br/><br/><p style='color:'red''>Sorry Re-Enter Your Details</p>");
			
		}
		
	}

}
