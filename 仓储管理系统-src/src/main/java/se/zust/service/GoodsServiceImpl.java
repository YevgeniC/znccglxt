package se.zust.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import se.zust.dao.GoodsDao;
import se.zust.dao.InlibraryDao;
import se.zust.entity.Goods;
import se.zust.entity.Inlibrary;
import se.zust.mapper.GoodsMapper;

import javax.annotation.Resource;
import java.util.List;

@Service("GoodsService")
public class GoodsServiceImpl implements GoodsService{
	@Resource
	private GoodsDao goodsDao;


	public void addGoods(Goods goods) {
		goodsDao.addGoods(goods);
	}

	public void deleteGoods(int pid) {
		goodsDao.deleteGoods(pid);
	}

	public void updateGoods(int pid, int pnum, String area, String room) {
		updateGoods(pid,pnum,area,room);
	}

	public List<Goods> selectGoods(Integer pid, String pname, String area, String room, String startTime, String endTime, int start, int pageSize) {
		return goodsDao.selectGoods(pid,pname,area,room,startTime,endTime,start,pageSize);
	}

	public int selectGoodsCount(Integer pid, String pname, String area, String room, String startTime, String endTime) {
		return goodsDao.selectGoodsCount(pid,pname,area,room,startTime,endTime);
	}

	public List<Goods> selectBy(String search, int start, int pageSize) {
		return goodsDao.selectBy(search,start,pageSize);
	}

	public int selectByCount(String search) {
		return goodsDao.selectByCount(search);
	}
}
