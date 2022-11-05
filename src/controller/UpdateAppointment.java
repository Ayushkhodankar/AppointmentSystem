package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Appointment;
import model.AppointmentDao;


@WebServlet("/updateappointment")
public class UpdateAppointment extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher=request.getRequestDispatcher("update.jsp");
		
		String aid=request.getParameter("id");
		String anote=request.getParameter("note");
		String status=request.getParameter("status");
		
		Appointment  a=new Appointment(aid, anote, status);
		try {
			int u5= AppointmentDao.updateApp(a);
	
			
			if(u5>0)
				{
				
				response.sendRedirect("admin.jsp");
			    
				}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
