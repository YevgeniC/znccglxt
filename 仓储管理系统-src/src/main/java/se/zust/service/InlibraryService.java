package se.zust.service;


import java.util.List;

import se.zust.entity.Inlibrary;
import se.zust.entity.Library;

public interface InlibraryService {

	void addInlibrary(Inlibrary inlibrary);

	List<Inlibrary> selectByName(String name);

	List<Inlibrary> selectAllInlibrary(int nowpage);

	int selectAllInlibraryCount();

}
