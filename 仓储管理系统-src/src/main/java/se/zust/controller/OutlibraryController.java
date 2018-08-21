package se.zust.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import se.zust.entity.Inlibrary;
import se.zust.entity.Outlibrary;
import se.zust.service.OutlibraryService;

@Controller
@RequestMapping("/ssm")
public class OutlibraryController {
	@Autowired
	private OutlibraryService outlibraryservice;
	@RequestMapping(value="/outManagement",method=RequestMethod.POST)
	public String outManagement(HttpServletRequest request,@RequestParam(value = "search",required = false) String search,
                                @RequestParam(value = "pageNo",required = false,defaultValue = "1") int pageNo){
        List<Outlibrary> outlibrary = null;
        int count = 0;
        int pageSize = 10;
		int start = (pageNo - 1) * pageSize;
		int pageCount = 0;
        if ("" == search || null == search) {
            outlibrary = outlibraryservice.selectAllOutlibrary(start,pageSize);
            count = outlibraryservice.selectAllOutlibraryCount();
        }else {
            outlibrary = outlibraryservice.selectBy(search,start,pageSize);
            count = outlibraryservice.selectByCount(search);
        }
        for (Outlibrary outlib: outlibrary){
            String[] time = outlib.getOutTime().split("\\.");
            outlib.setOutTime(time[0]);
        }
        pageCount = (int) Math.ceil(count * 1.0/pageSize);
		request.setAttribute("outlibrary", outlibrary);
        request.setAttribute("count",count);
        request.setAttribute("pageNo",pageNo);
        request.setAttribute("pageCount",pageCount);
   		return "outManagement";
	}

   	@RequestMapping(value = "/deleteOutlibrary",method = RequestMethod.POST)
	public ResponseEntity<Outlibrary> deleteOutlibrary(@RequestParam(value = "pid",required = true) int pid){
		outlibraryservice.deleteOutibrary(pid);
		return new ResponseEntity<Outlibrary>(HttpStatus.OK);
	}

//    @RequestMapping(value="/selectBy",method=RequestMethod.POST)
//    public ResponseEntity<List<Inlibrary>> selectByName(HttpServletRequest request,@RequestParam(value = "search",required = false) String search){
//        outlibraryservice.selectBy(search);
//        outlibraryservice.selectByCount(search);
//        return new ResponseEntity<List<Inlibrary>>(HttpStatus.OK);
//    }
}
