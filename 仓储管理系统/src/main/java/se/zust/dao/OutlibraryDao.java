package se.zust.dao;

import org.apache.ibatis.annotations.Param;
import se.zust.entity.Outlibrary;

import java.util.List;

public interface OutlibraryDao {

	void addOutlibrary(@Param(value = "goodsID")Integer goodsID,@Param(value = "pname")String pname,
					   @Param(value = "pnum")int pnum,@Param(value = "area")String area,
					   @Param(value = "room")String room,@Param(value = "outTime") String outTime,
					   @Param(value = "address")String address,@Param(value = "outUser")String outUser);

	void deleteOutibrary(int pid);

	List<Outlibrary> selectOutlibrary(@Param(value = "search")String search,@Param(value = "start")int start,@Param(value = "pageSize")int pageSize);

	int selectOutlibraryCount(@Param(value = "search")String search);
}
