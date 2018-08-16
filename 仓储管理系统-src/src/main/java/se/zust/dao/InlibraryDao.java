package se.zust.dao;

import java.util.List;

import se.zust.entity.Inlibrary;

public interface InlibraryDao {

	void addInlibrary(Inlibrary inlibrary);

	List<Inlibrary> selectByName(String inuser);

	List<Inlibrary> selectAllInlibrary(int nowpage);

	int selectAllInlibraryCount();

	void deleteInlibrary(int pid);


}
