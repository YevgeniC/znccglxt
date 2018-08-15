package se.zust.service;

import java.util.List;

import se.zust.entity.Library;
import se.zust.entity.Outlibrary;

public interface OutlibraryService {
	public void addOutlibrary(Outlibrary outlibrary);
	public void delLibrary(int pid);
	 public List<Outlibrary> selectAllOutlibrary(int nowpage);
	public int selectAllOutlibraryCount();
}
