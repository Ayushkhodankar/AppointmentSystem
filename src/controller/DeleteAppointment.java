package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AppointmentDao;
import model.UserDao;

/**
 * Servlet implementation class DeleteAppointment
 */
@WebServlet("/deleteappointment")
public class DeleteAppointment extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher=request.getRequestDispatcher("admin.jsp");
		int aid = Integer.parseInt(request.getParameter("aid"));
		try {
			int f3= AppointmentDao.deleteApp(aid);
			
			if(f3>0)
				{
				
				dispatcher.include(request, response);
			    
				}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
