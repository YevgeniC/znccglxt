package se.zust.service;


import java.util.List;

import se.zust.entity.Inlibrary;
import se.zust.entity.Library;

public interface InlibraryService {

	void addInlibrary(Inlibrary inlibrary);

	void deleteInlibrary(int pid);

	List<Inlibrary> selectAllInlibrary(int start,int pageSize);

	int selectAllInlibraryCount();

	List<Inlibrary> selectBy(String search, int start, int pageSize);

	int selectByCount(String search);

}
