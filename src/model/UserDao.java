package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;

public class UserDao {
	static Connection getConnection() throws ClassNotFoundException, SQLException
	{
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("Driver Registerd");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/doctor","root","abc123");
	System.out.println("Connection successfully");
	return con;
	}
	
	public static int insertUser(User u) throws ClassNotFoundException, SQLException
	{
	
		Connection con=UserDao.getConnection();
	System.out.println("Conection Established Successfully");
	
	PreparedStatement ps=con.prepareStatement("insert into user( name, uname, passw) values(?,?,?)");
	ps.setString(1,u.getName());
	ps.setString(2,u.getUname());
	ps.setString(3,u.getPassw());
	
	int y=ps.executeUpdate();

	con.close();
	
	return y;
	}
	
	public static boolean loginUser(User u,String uname,String pass) throws ClassNotFoundException, SQLException
	{
		boolean status=false;
	Connection con=getConnection();  
    PreparedStatement ps=con.prepareStatement("select * from user where uname=? and passw=?");  
    ps.setString(1,u.getUname());  
    ps.setString(2,u.getPassw());  
    
    ResultSet rs=ps.executeQuery();
    status=rs.next();
	return status;  
	}
	
	public static int deleteuser(int id) throws ClassNotFoundException, SQLException
	{
	
	Connection con=UserDao.getConnection();
	System.out.println("Conection Established Successfully");
	
	PreparedStatement ps=con.prepareStatement("delete from user  where id=?");
	
	ps.setInt(1,id);
	
	
	
	int f2=ps.executeUpdate();
	
	con.close();
	return f2;
	
	}
	
}
