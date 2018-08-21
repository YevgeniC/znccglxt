package se.zust.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import se.zust.entity.Goods;
import se.zust.service.GoodsService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/ssm")
public class GoodsController {
    @Autowired
    GoodsService goodsService;
    @RequestMapping(value="/select",method=RequestMethod.POST)
    public String select(HttpServletRequest request, @RequestParam(value = "pid",required = false) Integer pid,
                         @Param(value = "pname") String pname,
                         @Param(value = "area") String area,
                         @Param(value = "room") String room,
                         @Param(value = "startTime") String startTime,
//                         @RequestParam(value = "pname",required = false) String pname,
//                         @RequestParam(value = "area",required = false) String area,
//                         @RequestParam(value = "room",required = false) String room,
//                         @RequestParam(value = "startTime",required = false) String startTime,
                         @RequestParam(value = "endTime",required = false) String endTime,
                         @RequestParam(value = "pageNo",required = false,defaultValue = "1") int pageNo){
        List<Goods> goods = null;
        List<Goods> goods2 = null;
        int pageSize = 10;
        int start = (pageNo - 1) * pageSize;
        goods = goodsService.selectGoods(pid,pname,area,room,start,pageSize);
        goods2 = goodsService.selectBy(pname,start,pageSize);
//        request.setAttribute("goods",goods);
        request.setAttribute("goods",goods2);
        return "select";
    }
}
