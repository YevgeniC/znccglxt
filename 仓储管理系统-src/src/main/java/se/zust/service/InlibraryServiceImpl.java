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

	public List<Inlibrary> select(String search, int start, int pageSize) {
		return inlibraryDao.select(search, start, pageSize);
	}

	public int selectCount(String search) {
		return inlibraryDao.selectCount(search);
	}

	public int selectPid() {
		return inlibraryDao.selectPid();
	}


}
