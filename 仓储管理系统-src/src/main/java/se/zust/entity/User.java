package se.zust.entity;

public class User {	
    private int id;
    private String username;
    private String password;
    private String realname;
    private String phonumber;
    private int type; 
//    private int director;
    private String director;
    private String userdescribe;
    
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getPhonumber() {
		return phonumber;
	}
	public void setPhonumber(String phonumber) {
		this.phonumber = phonumber;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
//	public int getDirector() {
//		return director;
//	}
//	public void setDirector(int director) {
//		this.director = director;
//	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getUserdescribe() {
		return userdescribe;
	}
	public void setUserdescribe(String userdescribe) {
		this.userdescribe = userdescribe;
	}
}
