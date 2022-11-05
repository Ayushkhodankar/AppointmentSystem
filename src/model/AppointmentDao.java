package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




public class AppointmentDao {
	static Connection getConnection() throws ClassNotFoundException, SQLException
	{
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("Driver Registerd");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/doctor","root","abc123");
	System.out.println("Connection successfully");
	return con;
	}
	
	public static int insertAppointment(Appointment a) throws ClassNotFoundException, SQLException
	{
	
		Connection con=AppointmentDao.getConnection();
	System.out.println("Conection Established Successfully");
	
	PreparedStatement ps=con.prepareStatement("insert into appointment(aname, aemail, adate, atime, anote, usname) values(?,?,?,?,?,?)");
	ps.setString(1,a.getAname());
	ps.setString(2,a.getAemail());
	ps.setString(3,a.getAdate());
	ps.setString(4,a.getAtime());
	ps.setString(5,a.getAnote());
	ps.setString(6,a.getUsname());
	
	int z=ps.executeUpdate();

	con.close();
	
	return z;
	}
	public static int deleteApp(int aid) throws ClassNotFoundException, SQLException
	{
	
	Connection con=AppointmentDao.getConnection();
	System.out.println("Conection Established Successfully");
	
	PreparedStatement ps=con.prepareStatement("delete from appointment  where aid=?");
	
	ps.setInt(1,aid);
	
	
	
	int f3=ps.executeUpdate();
	
	con.close();
	return f3;
	
	}
	
	public static int updateApp(Appointment a5) throws ClassNotFoundException, SQLException
	{
	
	Connection con=AppointmentDao.getConnection();
	System.out.println("Conection Established Successfully");
	
	PreparedStatement ps=con.prepareStatement("update appointment set anote=?, status=? where aid=?");
	ps.setString(1,a5.getAnote());
	ps.setString(2,a5.getStatus());
	ps.setString(3, a5.getAid());
	
	int u2=ps.executeUpdate();
	
	con.close();
	return u2;
	}
	
}
