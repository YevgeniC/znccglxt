package se.zust.service;


import se.zust.entity.Inlibrary;

import java.util.List;


public interface InlibraryService {

	void addInlibrary(Inlibrary inlibrary);

	void deleteInlibrary(int pid);

	List<Inlibrary> select(String search,int start,int pageSize);

	int selectCount(String search);

	int selectPid();

}
