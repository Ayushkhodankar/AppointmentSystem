package model;

public class User {

	
	private int id;
	private String name,uname,passw;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int id, String name, String uname, String passw) {
		super();
		this.id = id;
		this.name = name;
		this.uname = uname;
		this.passw = passw;
	}
	public User(String name, String uname, String passw) {
		super();
		this.name = name;
		this.uname = uname;
		this.passw = passw;
	}
	public User(String uname, String passw) {
		super();
		this.uname = uname;
		this.passw = passw;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPassw() {
		return passw;
	}
	public void setPassw(String passw) {
		this.passw = passw;
	}
	
	
}
