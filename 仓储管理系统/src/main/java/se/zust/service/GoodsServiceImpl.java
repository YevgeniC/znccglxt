package se.zust.service;

import org.springframework.stereotype.Service;
import se.zust.dao.GoodsDao;
import se.zust.entity.Goods;

import javax.annotation.Resource;
import java.util.List;

@Service("GoodsService")
public class GoodsServiceImpl implements GoodsService{
	@Resource
	private GoodsDao goodsDao;


	public void addGoods(int inLibraryID, String pname, int pnum, String area, String room) {
		goodsDao.addGoods(inLibraryID,pname,pnum,area,room);
	}

	public void deleteGoods(Integer pid) {
		goodsDao.deleteGoods(pid);
	}

	public void updateGoods(Integer pid, int pnum, String area, String room) {
		goodsDao.updateGoods(pid,pnum,area,room);
	}

	public List<Goods> selectGoods(String pid, String pname, String area, String room, String startTime, String endTime, int start, int pageSize) {
		return goodsDao.selectGoods(pid,pname,area,room,startTime,endTime,start,pageSize);
	}

	public int selectGoodsCount(String pid, String pname, String area, String room, String startTime, String endTime) {
		return goodsDao.selectGoodsCount(pid,pname,area,room,startTime,endTime);
	}

	public List<Goods> selectInventory(String search, int start, int pageSize) {
		return goodsDao.selectInventory(search, start, pageSize);
	}

	public int selectInventoryCount(String search) {
		return goodsDao.selectInventoryCount(search);
	}

	public List<Goods> selectByName(String pname) {
		return goodsDao.selectByName(pname);
	}
}
