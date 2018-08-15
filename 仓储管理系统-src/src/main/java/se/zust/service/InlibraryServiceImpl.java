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

	public List<Inlibrary> selectByName(String name) {
		return inlibraryDao.selectByName(name);
	}

	public List<Inlibrary> selectAllInlibrary(int nowpage) {
		return inlibraryDao.selectAllInlibrary(nowpage);
	}

	public int selectAllInlibraryCount() {
		return inlibraryDao.selectAllInlibraryCount();
	}

}
