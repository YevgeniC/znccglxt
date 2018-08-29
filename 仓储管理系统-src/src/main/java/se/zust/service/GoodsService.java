package se.zust.service;


import org.apache.ibatis.annotations.Param;
import se.zust.entity.Goods;
import se.zust.entity.Inlibrary;

import java.util.List;

public interface GoodsService {

	void addGoods(int inLibraryID, String pname, int pnum ,String area, String room);

	void deleteGoods(int pid);

	void updateGoods(Integer pid, int pnum, String area, String room);

	List<Goods> selectGoods(Integer pid, String pname, String area, String room, String startTime, String endTime, int start, int pageSize);

	int selectGoodsCount(Integer pid, String pname, String area, String room, String startTime, String endTime);

	List<Goods> selectInventory(String search, int start, int pageSize);

	int selectInventoryCount(String search);

	List<Goods> selectByName(String pname);

}
