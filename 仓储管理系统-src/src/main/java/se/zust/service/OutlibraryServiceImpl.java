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
		// TODO Auto-generated method stub
		outlibraryDao.addOutlibrary(outlibrary);
	}


	public List<Outlibrary> selectAllOutlibrary(int nowpage) {
		// TODO Auto-generated method stub
		return outlibraryDao.selectAllOutlibrary(nowpage);
	}


	public void delLibrary(int pid) {
		// TODO Auto-generated method stub
		
	}


	public int selectAllOutlibraryCount() {
		// TODO Auto-generated method stub
		return outlibraryDao.selectAllOutlibraryCount();
	}







}
