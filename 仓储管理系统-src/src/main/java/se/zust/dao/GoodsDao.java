package se.zust.dao;

import se.zust.entity.Goods;

import java.util.List;


public interface GoodsDao {
	void addGoods(Goods goods);

	void deleteGoods(int pid);

	void updateGoods(int pid, int pnum, String area, String room);

	List<Goods> selectGoods(Integer pid, String pname, String area, String room, int start, int pageSize);

	int selectGoodsCount(Integer pid, String pname, String area, String room);

	List<Goods> selectBy(String search, int start,int pageSize);

	int selectByCount(String search);
}