package se.zust.service;

import se.zust.entity.Inlibrary;
import se.zust.entity.Library;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


import se.zust.dao.InlibraryDao;

import javax.annotation.Resource;

@Service("inlibraryService")
public class InlibraryServiceImpl implements InlibraryService{
	@Resource
	private InlibraryDao inlibraryDao;

	public void addInlibrary(Inlibrary inlibrary) {
		inlibraryDao.addInlibrary(inlibrary);
	}

	public void deleteInlibrary(int pid){
		inlibraryDao.deleteInlibrary(pid);
	}

	public List<Inlibrary> selectAllInlibrary(int start,int pageSize) {
		return inlibraryDao.selectAllInlibrary(start,pageSize);
	}

	public int selectAllInlibraryCount() {
		return inlibraryDao.selectAllInlibraryCount();
	}

	public List<Inlibrary> selectBy(String search, int start, int pageSize) {
		return inlibraryDao.selectBy(search,start,pageSize);
	}

	public int selectByCount(String search) {
		return inlibraryDao.selectByCount(search);
	}


}
