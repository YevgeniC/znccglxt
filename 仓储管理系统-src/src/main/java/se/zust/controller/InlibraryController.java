package se.zust.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import se.zust.entity.Inlibrary;
import se.zust.entity.Library;
import se.zust.service.InlibraryService;
import se.zust.service.LibraryService;


@Controller
@RequestMapping("/ssm")
public class InlibraryController {
	@Autowired
	private InlibraryService inlibraryservice;
	@Autowired
	private LibraryService LibraryService;
	@RequestMapping(value="/inManagement",method=RequestMethod.POST)
	public String inManagement(HttpServletRequest request,@RequestParam(value = "search",required = false) String search,
							   @RequestParam(value = "pageNo",required = false,defaultValue = "1") int pageNo){
        List<Inlibrary> inlibrary = null;
		int count = 0;
		int pageSize = 10;
		int start = (pageNo - 1) * pageSize;
		int pageCount = 0;
	    if ("" == search || null == search){
            inlibrary = inlibraryservice.selectAllInlibrary(start,pageSize);
            count = inlibraryservice.selectAllInlibraryCount();
        }else {
            inlibrary = inlibraryservice.selectBy(search,start,pageSize);
            count = inlibraryservice.selectByCount(search);
        }
		for (Inlibrary inlib: inlibrary){
			String[] time = inlib.getIntime().split("\\.");
            inlib.setIntime(time[0]);
		}
		pageCount = (int) Math.ceil(count * 1.0/pageSize);
		request.setAttribute("inlibrary",inlibrary);
		request.setAttribute("count",count);
		request.setAttribute("pageNo",pageNo);
		request.setAttribute("pageCount",pageCount);
		return "inManagement";
	}

    @RequestMapping(value = "/addInlibrary",method = RequestMethod.POST)
    public ResponseEntity<Inlibrary> add(@RequestParam(value = "goodsName",required = false) String goodsName, @RequestParam(value = "goodsNum",required = false) Integer goodsNum,
                                          @RequestParam(value = "area",required = false) String area, @RequestParam(value = "room",required = false) String room,
                                          @RequestParam(value = "inUser",required = false) String inUser) {
        Inlibrary inlibrary = new Inlibrary();
		inlibrary.setPname(goodsName);
		inlibrary.setPnum(goodsNum);
		inlibrary.setArea(area);
		inlibrary.setRoom(room);
		inlibrary.setInuser(inUser);
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
        inlibrary.setIntime(sdf.format(date));
        inlibraryservice.addInlibrary(inlibrary);
        return new ResponseEntity<Inlibrary>(HttpStatus.OK);
    }

    @RequestMapping(value="/deleteInlibrary",method=RequestMethod.POST)
    public ResponseEntity<Inlibrary> delete(@RequestParam(value = "pid",required = true) int pid){
	    inlibraryservice.deleteInlibrary(pid);
	    return new ResponseEntity<Inlibrary>(HttpStatus.OK);
    }


	@RequestMapping(value="/空白",method=RequestMethod.GET)
	 public String ininitial(){
		return "空白";
	}
	
	
	
	
	

}