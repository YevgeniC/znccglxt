package se.zust.service;


import se.zust.entity.Goods;
import se.zust.entity.Inlibrary;

import java.util.List;

public interface GoodsService {

	void addGoods(Goods goods);

	void deleteGoods(int pid);

	void updateGoods(int pid, int pnum, String area, String room);

	List<Goods> selectGoods(Integer pid, String pname, String area, String room, int start, int pageSize);

	int selectGoodsCount(int pid, String pname, String area, String room);

	List<Goods> selectBy(String search, int start,int pageSize);

	int selectByCount(String search);

}
