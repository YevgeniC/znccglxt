package se.zust.dao;

import org.apache.ibatis.annotations.Param;
import se.zust.entity.Goods;

import java.util.List;


public interface GoodsDao {
	void addGoods(Goods goods);

	void deleteGoods(int pid);

	void updateGoods(int pid, int pnum, String area, String room);

	List<Goods> selectGoods(@Param(value = "pid") Integer pid, @Param(value = "pname") String pname, @Param(value = "area") String area,
							@Param(value = "room") String room, @Param(value = "startTime") String startTime,@Param(value ="endTime") String endTime,
                            @Param(value = "start") int start, @Param(value = "pageSize") int pageSize);

	int selectGoodsCount(@Param(value = "pid") Integer pid, @Param(value = "pname") String pname, @Param(value = "area") String area,
						 @Param(value = "room") String room,@Param(value = "startTime") String startTime,@Param(value ="endTime") String endTime);

	List<Goods> selectBy(@Param(value = "search") String search, @Param(value = "start") int start, @Param(value = "pageSize") int pageSize);

	int selectByCount(@Param(value = "search") String search);
}