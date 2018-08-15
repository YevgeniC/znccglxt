package se.zust.entity;

import java.util.Date;

public class Outlibrary {
	private int pid;
	private int pnum;
	private String pname;
	private	String fisid;
	private String secid;
	private String thiid;
	private Date outdate;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getFisid() {
		return fisid;
	}
	public void setFisid(String fisid) {
		this.fisid = fisid;
	}
	public String getSecid() {
		return secid;
	}
	public void setSecid(String secid) {
		this.secid = secid;
	}
	public String getThiid() {
		return thiid;
	}
	public void setThiid(String thiid) {
		this.thiid = thiid;
	}
	public Date getOutdate() {
		return outdate;
	}
	public void setOutdate(Date outdate) {
		this.outdate = outdate;
	}
	
	
}
