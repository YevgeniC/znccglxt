package se.zust.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import se.zust.dao.LibraryDao;
import se.zust.entity.Library;

@Service("LibraryService")
public class LibraryServiceImpl implements LibraryService{
	@Autowired
	private LibraryDao LibraryDao;
	public void addlibrary(Library library) {
		// TODO Auto-generated method stub
		LibraryDao.addlibrary(library);
	}
	public List<Library> selectAlllibrary(int nowpage) {
		// TODO Auto-generated method stub
		return LibraryDao.selectAlllibrary(nowpage);
	}
	public List<Library> sumlibrary(int nowpage) {
		// TODO Auto-generated method stub
		return LibraryDao.sumlibrary(nowpage);
	}
	public List<Library> selectByPname(String pname,int nowpage) {
		// TODO Auto-generated method stub
		return LibraryDao.selectByPname(pname,nowpage);
	}
	public List<Library> selectByThidSecid(String thiid,String secid,int nowpage){
		// TODO Auto-generated method stub
		return LibraryDao.selectByThidSecid(thiid,secid,nowpage);
	}
	
	public int selectAlllibraryCount(){
		// TODO Auto-generated method stub
		return LibraryDao.selectAlllibraryCount();
	}
	public int selectByPnameCount(String pname){
		// TODO Auto-generated method stub
		return LibraryDao.selectByPnameCount(pname);
	}
	public int selectByThidSecidCount(String Thiid,String Secid){
		// TODO Auto-generated method stub
		return LibraryDao.selectByThidSecidCount(Thiid,Secid);
	}
	public int sumlibraryCount() {
		// TODO Auto-generated method stub
		return LibraryDao.sumlibraryCount();
	}
	public void delLibrary(int pid) {
		LibraryDao.delLibrary(pid);
		// TODO Auto-generated method stub
		
	}
	public List<Library> selectByID(int pid){
		// TODO Auto-generated method stub
		return LibraryDao.selectByID(pid);
	}
	public List<Library> selectByLocation(String thiid,String secid,String fisid){
		// TODO Auto-generated method stub
		return LibraryDao.selectByLocation(thiid,secid,fisid);
	}
	public void updateLibrary(String thiid,String secid,String fisid,int pid){
		// TODO Auto-generated method stub
		LibraryDao.updateLibrary(thiid,secid,fisid,pid);
	}
	
}
