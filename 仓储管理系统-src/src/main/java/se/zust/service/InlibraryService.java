package se.zust.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import se.zust.entity.Inlibrary;
import se.zust.entity.Library;

public interface InlibraryService {

	void addInlibrary(Inlibrary inlibrary);

	void deleteInlibrary(int pid);

	List<Inlibrary> select(String search,int start,int pageSize);

	int selectCount(String search);

	int selectPid();

}
