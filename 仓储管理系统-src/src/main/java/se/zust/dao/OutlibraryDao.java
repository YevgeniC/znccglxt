package se.zust.dao;

import java.util.List;

import se.zust.entity.Library;
import se.zust.entity.Outlibrary;

public interface OutlibraryDao {

	void addOutlibrary(Outlibrary outlibrary);

	void delLibrary(int pid);

	void deleteOutibrary(int pid);

	List<Outlibrary> selectAllOutlibrary(int strat,int pageSize);

	int selectAllOutlibraryCount();

	List<Outlibrary> selectBy(String search,int strat,int pageSize);

	int selectByCount(String search);
}
