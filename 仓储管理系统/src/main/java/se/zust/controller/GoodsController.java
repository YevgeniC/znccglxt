package se.zust.controller;


import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import se.zust.entity.Goods;
import se.zust.service.GoodsService;

import java.util.List;

@Controller
@RequestMapping("/ssm")
public class GoodsController {
//    Logger logger = LoggerFactory.getLogger(GoodsController.class);
    @Autowired
    GoodsService goodsService;
    @RequestMapping(value="/select",method=RequestMethod.POST)
    public String select(){
        return "select";
    }
    @RequestMapping(value="/selectGoods",method=RequestMethod.POST)
    @ResponseBody
    public JSONObject selectGoods(@RequestParam(value = "pid",required = false) String pid,
                                @RequestParam(value = "pname",required = false) String pname,
                                @RequestParam(value = "area",required = false) String area,
                                @RequestParam(value = "room",required = false) String room,
                                @RequestParam(value = "startTime",required = false) String startTime,
                                @RequestParam(value = "endTime",required = false) String endTime,
                                @RequestParam(value = "pageNo",required = false,defaultValue = "1") int pageNo,
                                @RequestParam(value = "pageSize",required = false,defaultValue = "10") int pageSize,
                                @RequestParam(value = "isAccurate",required = false,defaultValue = "0") int isAccurate){
        JSONObject jsonObject = new JSONObject();
        List<Goods> goods = null;
        int count = 0;
        int start = (pageNo - 1) * pageSize;
        int pageCount = 0;
        if (1 == isAccurate){
            goods = goodsService.selectByName(pname);
        }else {
            goods = goodsService.selectGoods(pid,pname,area,room,startTime,endTime,start,pageSize);
            count = goodsService.selectGoodsCount(pid,pname,area,room,startTime,endTime);
            for (Goods good: goods){
                String[] time = good.getInlibrary().getIntime().split("\\.");
                good.getInlibrary().setIntime(time[0]);
            }
        }
        pageCount = (int) Math.ceil(count * 1.0/pageSize);
        jsonObject.put("result",goods);
        jsonObject.put("count",count);
        jsonObject.put("pageCount",pageCount);
        return jsonObject;
    }
    @RequestMapping(value="/selectDetail",method=RequestMethod.POST)
    @ResponseBody
    public JSONObject selectDetail(@RequestParam(value = "pid",required = true) String pid,
                                   @RequestParam(value = "pname",required = false) String pname,
                                   @RequestParam(value = "area",required = false) String area,
                                   @RequestParam(value = "room",required = false) String room,
                                   @RequestParam(value = "startTime",required = false) String startTime,
                                   @RequestParam(value = "endTime",required = false) String endTime,
                                   @RequestParam(value = "pageNo",required = false,defaultValue = "1") int pageNo,
                                   @RequestParam(value = "pageSize",required = false,defaultValue = "10") int pageSize){
        List<Goods> goods = null;
        int start = (pageNo - 1) * pageSize;
        goods = goodsService.selectGoods(pid,pname,area,room,startTime,endTime,start,pageSize);
        for (Goods good: goods){
            String[] time = good.getInlibrary().getIntime().split("\\.");
            good.getInlibrary().setIntime(time[0]);
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result",goods);
        return jsonObject;
    }

    @RequestMapping(value="/inventory",method=RequestMethod.POST)
    public String inventory(){
        return "inventory";
    }

    @RequestMapping(value = "/selectInventory",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject selectInventory(@RequestParam(value = "search",required = false)String search,
                                      @RequestParam(value = "pageNo",required = false,defaultValue = "1")int pageNo,
                                      @RequestParam(value = "pageSize",required = false,defaultValue = "10") int pageSize){
        JSONObject jsonObject = new JSONObject();
        List<Goods> goods = null;
        int count = 0;
        int start = (pageNo - 1) * pageSize;
        int pageCount = 0;
        goods = goodsService.selectInventory(search,start,pageSize);
        count = goodsService.selectInventoryCount(search);
        pageCount = (int) Math.ceil(count * 1.0/pageSize);
        jsonObject.put("result",goods);
        jsonObject.put("count",count);
        jsonObject.put("pageCount",pageCount);
        return jsonObject;
    }
}
