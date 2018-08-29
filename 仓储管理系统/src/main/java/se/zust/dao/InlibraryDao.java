package se.zust.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import se.zust.entity.Inlibrary;

public interface InlibraryDao {

	void addInlibrary(Inlibrary inlibrary);

	void deleteInlibrary(int pid);

	List<Inlibrary> select(@Param(value = "search")String search,
						   @Param(value = "start")int start,
						   @Param(value = "pageSize")int pageSize);

	int selectCount(@Param(value = "search")String search);

	int selectPid();
}
