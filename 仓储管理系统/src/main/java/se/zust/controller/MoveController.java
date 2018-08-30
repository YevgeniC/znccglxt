package se.zust.controller;

import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import se.zust.entity.Goods;
import se.zust.entity.Move;
import se.zust.service.GoodsService;
import se.zust.service.MoveService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author YevgeniC
 * @date 2018/8/24 11:33
 */
@Controller
@RequestMapping("/ssm")
public class MoveController {
    @Autowired
    MoveService moveService;
    @Autowired
    GoodsService goodsService;
    @RequestMapping(value = "/movesRecord",method = RequestMethod.POST)
    public String movesRecord(){
        return "movesRecord";
    }

    @RequestMapping(value="/addmove",method=RequestMethod.POST)
    @ResponseBody
    public JSONObject addmove(@RequestParam(value = "goodsID",required = false) Integer goodsID,
                              @RequestParam(value = "pname",required = false) String pname,
                              @RequestParam(value = "pnum",required = false) int pnum,
                              @RequestParam(value = "max",required = false) int max,
                              @RequestParam(value = "beforeArea",required = false) String beforeArea,
                              @RequestParam(value = "beforeRoom",required = false) String beforeRoom,
                              @RequestParam(value = "afterArea",required = false) String afterArea,
                              @RequestParam(value = "afterRoom",required = false) String afterRoom,
                              @RequestParam(value = "moveUser",required = false) String moveUser){
        JSONObject jsonObject = new JSONObject();

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
        if (pnum == max){
            moveService.addMove(goodsID,pname,pnum,beforeArea,beforeRoom,afterArea,afterRoom,date,moveUser);
            goodsService.updateGoods(goodsID,pnum,afterArea,afterRoom);
        }else {
            moveService.addMove(goodsID,pname,pnum,beforeArea,beforeRoom,afterArea,afterRoom,date,moveUser);
            goodsService.updateGoods(goodsID,max-pnum,afterArea,afterRoom);
            List<Goods> goods = goodsService.selectGoods(String.valueOf(goodsID),null,null,null,null,null,0,1);
            goodsService.addGoods(goods.get(0).getInLibraryID(),pname,pnum,afterArea,afterRoom);
        }
        return jsonObject;
    }

    @RequestMapping(value="/selectmove",method=RequestMethod.POST)
    @ResponseBody
    public JSONObject selectmove(@RequestParam(value = "mid" ,required = false) String mid,
                                 @RequestParam(value = "pname", required = false) String pname,
                                 @RequestParam(value = "moveUser", required = false) String moveUser,
                                 @RequestParam(value = "startTime",required = false) String startTime,
                                 @RequestParam(value = "endTime",required = false) String endTime,
                                 @RequestParam(value = "pageNo",required = false,defaultValue = "1") int pageNo,
                                 @RequestParam(value = "pageSize",required = false,defaultValue = "10") int pageSize){
        JSONObject jsonObject = new JSONObject();
        List<Move> moves = null;
        int count = 0;
        int start = (pageNo - 1) * pageSize;
        int pageCount = 0;
        moves = moveService.selectMove(mid,pname,moveUser,startTime,endTime,start,pageSize);
        count = moveService.selectMoveCount(mid, pname, moveUser, startTime, endTime);
        for (Move move: moves){
            String[] time = move.getMoveTime().split("\\.");
            move.setMoveTime(time[0]);
        }
        pageCount = (int) Math.ceil(count * 1.0/pageSize);
        jsonObject.put("result",moves);
        jsonObject.put("count",count);
        jsonObject.put("pageCount",pageCount);
        return jsonObject;
    }
}
