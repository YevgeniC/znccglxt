package se.zust.dao;

import java.util.List;

import se.zust.entity.Inlibrary;

public interface InlibraryDao {

	void addInlibrary(Inlibrary inlibrary);

	List<Inlibrary> selectByName(String name);

	List<Inlibrary> selectAllInlibrary(int nowpage);

	int selectAllInlibraryCount();

}
