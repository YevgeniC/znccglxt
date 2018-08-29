package se.zust.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import se.zust.entity.Library;
import se.zust.entity.Outlibrary;

public interface OutlibraryService {

	void addOutlibrary(Integer goodsID, String pname, int pnum,String area, String room,String outTime, String address,String outUser);

	void deleteOutibrary(int pid);

	List<Outlibrary> selectOutlibrary(String search,int start,int pageSize);

	int selectOutlibraryCount(String search);
}
