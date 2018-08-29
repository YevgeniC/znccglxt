package se.zust.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import se.zust.dao.MoveDao;
import se.zust.entity.Move;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author YevgeniC
 * @date 2018/8/24 11:40
 */
@Service("MoveService")
public class MoveServiceImpl implements MoveService{
    @Resource
    private MoveDao moveDao;

    public void addMove(int goodsID, String pname, int pnum, String beforeArea, String beforeRoom, String afterArea, String afterRoom, String moveTime, String moveUser) {
        moveDao.addMove(goodsID, pname, pnum, beforeArea, beforeRoom, afterArea, afterRoom, moveTime, moveUser);
    }

    public List<Move> selectMove(Integer mid, String pname, String moveUser, String startTime, String endTime, int start, int pageSize) {
        return moveDao.selectMove(mid, pname, moveUser, startTime, endTime, start, pageSize);
    }

    public int selectMoveCount(Integer mid, String pname, String moveUser, String startTime, String endTime) {
        return moveDao.selectMoveCount(mid, pname, moveUser, startTime, endTime);
    }


}
