package se.zust.service;


import se.zust.entity.Goods;

import java.util.List;

public interface GoodsService {

	void addGoods(int inLibraryID, String category,String pname, int pnum ,String area, String room);

	void deleteGoods(Integer pid);

	void updateGoods(Integer pid, int pnum, String area, String room);

	List<Goods> selectGoods(String pid, String category, String pname, String area, String room, String startTime, String endTime, int start, int pageSize);

	int selectGoodsCount(String pid, String category, String pname, String area, String room, String startTime, String endTime);

	List<Goods> selectInventory(String search, String category, int start, int pageSize);

	int selectInventoryCount(String search, String category);

	List<Goods> selectByName(String pname);

}
