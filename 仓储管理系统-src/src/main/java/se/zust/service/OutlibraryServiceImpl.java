package se.zust.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import se.zust.dao.OutlibraryDao;
import se.zust.entity.Library;
import se.zust.entity.Outlibrary;

@Service("outlibraryService")
public class OutlibraryServiceImpl implements OutlibraryService {
	@Autowired
	private OutlibraryDao outlibraryDao;

	public void addOutlibrary(Outlibrary outlibrary) {

	}

	public void delLibrary(int pid) {

	}

	public void deleteOutibrary(int pid) {
		outlibraryDao.deleteOutibrary(pid);
	}

	public List<Outlibrary> selectAllOutlibrary(int strat,int pageSize) {
		return outlibraryDao.selectAllOutlibrary(strat,pageSize);
	}

	public int selectAllOutlibraryCount() {
		return outlibraryDao.selectAllOutlibraryCount();
	}

	public List<Outlibrary> selectBy(String search,int strat,int pageSize) {
		return outlibraryDao.selectBy(search,strat,pageSize);
	}

	public int selectByCount(String search) {
		return outlibraryDao.selectByCount(search);
	}


}
