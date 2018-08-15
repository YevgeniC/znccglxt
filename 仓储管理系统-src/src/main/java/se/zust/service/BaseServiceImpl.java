package se.zust.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import se.zust.dao.BaseDao;

@Service("BaseService")
public class BaseServiceImpl implements BaseService{
	@Autowired
	private BaseDao BaseDao;
	public List<String> selectThiid(){
		return BaseDao.selectThiid();
	}
	public List<String> selectSecid(){
		return BaseDao.selectSecid();
	}
}
