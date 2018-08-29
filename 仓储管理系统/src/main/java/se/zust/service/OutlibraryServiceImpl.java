package se.zust.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import se.zust.dao.OutlibraryDao;
import se.zust.entity.Outlibrary;

import java.util.List;

@Service("outlibraryService")
public class OutlibraryServiceImpl implements OutlibraryService {
	@Autowired
	private OutlibraryDao outlibraryDao;


	public void addOutlibrary(Integer goodsID, String pname, int pnum, String area, String room, String outTime, String address, String outUser) {
		outlibraryDao.addOutlibrary(goodsID, pname, pnum, area, room, outTime, address, outUser);
	}


	public void deleteOutibrary(int pid) {
		outlibraryDao.deleteOutibrary(pid);
	}

	public List<Outlibrary> selectOutlibrary(String search, int start, int pageSize) {
		return outlibraryDao.selectOutlibrary(search, start, pageSize);
	}

	public int selectOutlibraryCount(String search) {
		return outlibraryDao.selectOutlibraryCount(search);
	}


}
