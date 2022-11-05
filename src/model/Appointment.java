package model;

public class Appointment {
private String aid;
private String aname,aemail,adate,atime,anote,status,usname;
public Appointment() {
	super();
	// TODO Auto-generated constructor stub
}
/*public Appointment(String aid, String aname, String aemail, String adate, String atime, String anote) {
	super();
	this.aid = aid;
	this.aname = aname;
	this.aemail = aemail;
	this.adate = adate;
	this.atime = atime;
	this.anote = anote;
}*/
public Appointment(String aname, String aemail, String adate, String atime, String anote) {
	super();
	this.aname = aname;
	this.aemail = aemail;
	this.adate = adate;
	this.atime = atime;
	this.anote = anote;
}
public String getAid() {
	return aid;
}
public void setAid(String aid) {
	this.aid = aid;
}
public String getAname() {
	return aname;
}
public void setAname(String aname) {
	this.aname = aname;
}
public String getAemail() {
	return aemail;
}
public void setAemail(String aemail) {
	this.aemail = aemail;
}
public String getAdate() {
	return adate;
}
public void setAdate(String adate) {
	this.adate = adate;
}
public String getAtime() {
	return atime;
}
public void setAtime(String atime) {
	this.atime = atime;
}
public String getAnote() {
	return anote;
}
public void setAnote(String anote) {
	this.anote = anote;
}
public Appointment(String aid, String aname, String aemail, String adate, String atime, String anote, String status) {
	super();
	this.aid = aid;
	this.aname = aname;
	this.aemail = aemail;
	this.adate = adate;
	this.atime = atime;
	this.anote = anote;
	this.status = status;
}
public Appointment(String anote, String status) {
	super();
	this.anote = anote;
	this.status = status;
}
public Appointment(String aid, String anote, String status) {
	super();
	this.aid = aid;
	this.anote = anote;
	this.status = status;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getUsname() {
	return usname;
}
public void setUsname(String usname) {
	this.usname = usname;
}
public Appointment(String aid, String aname, String aemail, String adate, String atime, String anote, String status,
		String usname) {
	super();
	this.aid = aid;
	this.aname = aname;
	this.aemail = aemail;
	this.adate = adate;
	this.atime = atime;
	this.anote = anote;
	this.status = status;
	this.usname = usname;
}
public Appointment(String aname, String aemail, String adate, String atime, String anote, String usname) {
	super();
	this.aname = aname;
	this.aemail = aemail;
	this.adate = adate;
	this.atime = atime;
	this.anote = anote;
	this.usname = usname;
}

}
