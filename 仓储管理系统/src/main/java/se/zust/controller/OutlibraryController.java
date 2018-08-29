package se.zust.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSON;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import se.zust.entity.Goods;
import se.zust.entity.Inlibrary;
import se.zust.entity.Outlibrary;
import se.zust.service.GoodsService;
import se.zust.service.OutlibraryService;

@Controller
@RequestMapping("/ssm")
public class OutlibraryController {
	@Autowired
	private OutlibraryService outlibraryservice;
	@Autowired
    private GoodsService goodsService;
	@RequestMapping(value="/outManagement",method=RequestMethod.POST)
	public String outManagement(){
   		return "outManagement";
	}

    @RequestMapping(value = "/addOutlibrary",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addOutlibrary(@RequestParam(value = "goodsID",required = false) Integer goodsID,
                                    @RequestParam(value = "pname",required = false) String pname,
                                    @RequestParam(value = "pnum",required = false) int pnum,
                                    @RequestParam(value = "max",required = false) int max,
                                    @RequestParam(value = "area",required = false) String area,
                                    @RequestParam(value = "room",required = false) String room,
                                    @RequestParam(value = "address",required = false) String address,
                                    @RequestParam(value = "outUser",required = false) String outUser){
        JSONObject jsonObject = new JSONObject();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = df.format(new Date());
        outlibraryservice.addOutlibrary(goodsID,pname,pnum,area,room,date,address,outUser);
        if (pnum == max){
            goodsService.deleteGoods(goodsID);
        }else {
            goodsService.updateGoods(goodsID,max-pnum,area,room);
        }
	    return jsonObject;
    }

   	@RequestMapping(value = "/deleteOutlibrary",method = RequestMethod.POST)
	public ResponseEntity<Outlibrary> deleteOutlibrary(@RequestParam(value = "pid",required = true) int pid){
		outlibraryservice.deleteOutibrary(pid);
		return new ResponseEntity<Outlibrary>(HttpStatus.OK);
	}

	@RequestMapping(value = "/selectOutlibrary",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject selectOutlibrary(@RequestParam(value = "search",required = false) String search,
                                       @RequestParam(value = "pageNo",required = false,defaultValue = "1") int pageNo){
	    JSONObject jsonObject = new JSONObject();
        List<Outlibrary> outlibrary = null;
        int count = 0;
        int pageSize = 10;
        int start = (pageNo - 1) * pageSize;
        int pageCount = 0;
        outlibrary = outlibraryservice.selectOutlibrary(search,start,pageSize);
        count = outlibraryservice.selectOutlibraryCount(search);
        for (Outlibrary outlib: outlibrary){
            String[] time = outlib.getOutTime().split("\\.");
            outlib.setOutTime(time[0]);
        }
        pageCount = (int) Math.ceil(count * 1.0/pageSize);
        jsonObject.put("result",outlibrary);
        jsonObject.put("count",count);
        jsonObject.put("pageCount",pageCount);
        return jsonObject;
    }

}
