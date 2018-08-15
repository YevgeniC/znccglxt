package se.zust.dao;

import java.util.List;


import se.zust.entity.Library;

public interface LibraryDao {
	public void addlibrary(Library library);
	public List<Library> selectAlllibrary(int nowpage);
	public int selectAlllibraryCount();
	public List<Library> sumlibrary(int nowpage);
	public int sumlibraryCount();
	public List<Library> selectByPname(String pname,int nowpage);
	public List<Library> selectByThidSecid(String thiid,String secid,int nowpage);
	public int selectByPnameCount(String pname);
	public int selectByThidSecidCount(String Thiid,String Secid);
	public void delLibrary(int pid);
	public List<Library> selectByID(int pid);
	public List<Library> selectByLocation(String thiid,String secid,String fisid);
	public void updateLibrary(String thiid,String secid,String fisid,int pid);
}
