package se.zust.service;

import org.springframework.stereotype.Service;
import se.zust.dao.InlibraryDao;
import se.zust.entity.Inlibrary;

import javax.annotation.Resource;
import java.util.List;

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
