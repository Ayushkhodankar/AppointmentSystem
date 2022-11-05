package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Appointment;
import model.AppointmentDao;
import model.UserDao;


@WebServlet("/addappointment")
public class AddAppointment extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		String aname=request.getParameter("aname");
		String aemail=request.getParameter("aemail");
		String adate=request.getParameter("adate");
		String atime=request.getParameter("atime");
		String anote=request.getParameter("anote");
		String usname=request.getParameter("usname");
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("user.jsp");
Appointment a=new Appointment(aname, aemail, adate, atime, anote,usname);
try {
	
	int z=AppointmentDao.insertAppointment(a);
	
	if(z>0)
		{
		
		dispatcher.include(request, response);
	    
		}
} catch (ClassNotFoundException | SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	}

}
