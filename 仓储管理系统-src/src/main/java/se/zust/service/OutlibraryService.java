package se.zust.service;

import se.zust.entity.Outlibrary;

import java.util.List;

public interface OutlibraryService {

	void addOutlibrary(Integer goodsID, String pname, int pnum,String area, String room,String outTime, String address,String outUser);

	void deleteOutibrary(int pid);

	List<Outlibrary> selectOutlibrary(String search,int start,int pageSize);

	int selectOutlibraryCount(String search);
}
