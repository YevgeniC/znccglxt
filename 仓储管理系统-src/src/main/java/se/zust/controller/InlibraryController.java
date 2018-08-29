package se.zust.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;
import se.zust.entity.Inlibrary;
import se.zust.service.GoodsService;
import se.zust.service.InlibraryService;


@Controller
@RequestMapping("/ssm")
public class InlibraryController {
	@Autowired
	private InlibraryService inlibraryservice;
    @Autowired
	private GoodsService goodsService;
	@RequestMapping(value="/inManagement",method=RequestMethod.POST)
	public String inManagement(){
		return "inManagement";
	}

    @RequestMapping(value = "/addInlibrary",method = RequestMethod.POST)
	@ResponseBody
    public ResponseEntity<Inlibrary> add(@RequestParam(value = "goodsName",required = false) String goodsName,
                                         @RequestParam(value = "goodsNum",required = false) Integer goodsNum,
                                         @RequestParam(value = "area",required = false) String area,
                                         @RequestParam(value = "room",required = false) String room,
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
        int pid = inlibraryservice.selectPid();
        goodsService.addGoods(pid,goodsName,goodsNum,area,room);
        return new ResponseEntity<Inlibrary>(inlibrary,HttpStatus.OK);
    }

//    @RequestMapping(value="/deleteInlibrary",method=RequestMethod.POST)
//    public ResponseEntity<Inlibrary> delete(@RequestParam(value = "pid",required = true) int pid){
//	    inlibraryservice.deleteInlibrary(pid);
//	    return new ResponseEntity<Inlibrary>(HttpStatus.OK);
//    }

	@RequestMapping(value="/selectInlibrary",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject selectInlibrary(@RequestParam(value = "search",required = false) String search,
									  @RequestParam(value = "pageNo",required = false,defaultValue = "1") int pageNo){
		JSONObject jsonObject = new JSONObject();
		List<Inlibrary> inlibrary = null;
		int count = 0;
		int pageSize = 10;
		int start = (pageNo - 1) * pageSize;
		int pageCount = 0;
        inlibrary = inlibraryservice.select(search,start,pageSize);
        count = inlibraryservice.selectCount(search);
		for (Inlibrary inlib: inlibrary){
			String[] time = inlib.getIntime().split("\\.");
			inlib.setIntime(time[0]);
		}
		pageCount = (int) Math.ceil(count * 1.0/pageSize);
		jsonObject.put("result",inlibrary);
		jsonObject.put("count",count);
		jsonObject.put("pageCount",pageCount);
		return jsonObject;
	}

}