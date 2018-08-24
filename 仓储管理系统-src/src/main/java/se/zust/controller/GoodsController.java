package se.zust.controller;


import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Param;
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

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/ssm")
public class GoodsController {
    Logger logger = LoggerFactory.getLogger(GoodsController.class);
    @Autowired
    GoodsService goodsService;
    @RequestMapping(value="/select",method=RequestMethod.POST)
    public String select(HttpServletRequest request, @RequestParam(value = "pid",required = false) Integer pid,
                         @RequestParam(value = "pname",required = false) String pname,
                         @RequestParam(value = "area",required = false) String area,
                         @RequestParam(value = "room",required = false) String room,
                         @RequestParam(value = "startTime",required = false) String startTime,
                         @RequestParam(value = "endTime",required = false) String endTime,
                         @RequestParam(value = "pageNo",required = false,defaultValue = "1") int pageNo){
        List<Goods> goods = null;
        int count = 0;
        int pageSize = 10;
        int start = (pageNo - 1) * pageSize;
        int pageCount = 0;
        goods = goodsService.selectGoods(pid,pname,area,room,startTime,endTime,start,pageSize);
        count = goodsService.selectGoodsCount(pid,pname,area,room,startTime,endTime);
        for (Goods good: goods){
            String[] time = good.getInlibrary().getIntime().split("\\.");
            good.getInlibrary().setIntime(time[0]);
        }
        logger.debug(String.valueOf(goods));
        pageCount = (int) Math.ceil(count * 1.0/pageSize);
        request.setAttribute("goods",goods);
        request.setAttribute("count",count);
        request.setAttribute("pageNo",pageNo);
        request.setAttribute("pageCount",pageCount);
        return "select";
    }
    @RequestMapping(value="/selectDetail",method=RequestMethod.POST)
    @ResponseBody
    public JSONObject selectDetail(@RequestParam(value = "pid",required = true) Integer pid,
                                   @RequestParam(value = "pname",required = false) String pname,
                                   @RequestParam(value = "area",required = false) String area,
                                   @RequestParam(value = "room",required = false) String room,
                                   @RequestParam(value = "startTime",required = false) String startTime,
                                   @RequestParam(value = "endTime",required = false) String endTime,
                                   @RequestParam(value = "pageNo",required = false,defaultValue = "1") int pageNo){
        List<Goods> goods = null;
        int pageSize = 10;
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
}
