package se.zust.dao;

import org.apache.ibatis.annotations.Param;
import se.zust.entity.Goods;

import java.util.List;


public interface GoodsDao {
	void addGoods(@Param(value = "inLibraryID") int inLibraryID, @Param(value = "pname") String pname,
				  @Param(value = "pnum") int pnum, @Param(value = "area") String area, @Param(value = "room") String room);

	void deleteGoods(@Param(value = "pid")int pid);

	void updateGoods(@Param(value = "pid") Integer pid, @Param(value = "pnum") int pnum,
					 @Param(value = "area") String area, @Param(value = "room") String room);

	List<Goods> selectGoods(@Param(value = "pid") Integer pid, @Param(value = "pname") String pname, @Param(value = "area") String area,
							@Param(value = "room") String room, @Param(value = "startTime") String startTime,@Param(value ="endTime") String endTime,
                            @Param(value = "start") int start, @Param(value = "pageSize") int pageSize);

	int selectGoodsCount(@Param(value = "pid") Integer pid, @Param(value = "pname") String pname, @Param(value = "area") String area,
						 @Param(value = "room") String room,@Param(value = "startTime") String startTime,@Param(value ="endTime") String endTime);

	List<Goods> selectInventory(@Param(value = "search") String search, @Param(value = "start") int start, @Param(value = "pageSize") int pageSize);

	int selectInventoryCount(@Param(value = "search") String search);

	List<Goods> selectByName(@Param(value = "pname") String pname);
}