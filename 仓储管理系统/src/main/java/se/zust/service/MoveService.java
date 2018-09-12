package se.zust.service;

import org.apache.ibatis.annotations.Param;
import se.zust.entity.Move;

import java.util.List;

/**
 * @author YevgeniC
 * @date 2018/8/24 11:46
 */
public interface MoveService {

    void addMove(Integer goodsID, String pname, int pnum, String beforeArea, String beforeRoom,
                 String afterArea, String afterRoom, String moveTime,  String moveUser);

    List<Move> selectMove(String mid, String pname, String moveUser, String startTime,String endTime, int start, int pageSize);

    int selectMoveCount(String mid, String pname, String moveUser, String startTime, String endTime);
}
