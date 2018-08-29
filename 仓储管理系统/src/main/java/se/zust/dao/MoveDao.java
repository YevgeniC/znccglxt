package se.zust.dao;

import org.apache.ibatis.annotations.Param;
import se.zust.entity.Move;

import java.util.List;

/**
 * @author YevgeniC
 * @date 2018/8/24 11:51
 */
public interface MoveDao {

    void addMove(@Param(value = "goodsID") int goodsID, @Param(value = "pname") String pname, @Param(value = "pnum") int pnum,
                 @Param(value = "beforeArea") String beforeArea, @Param(value = "beforeRoom") String beforeRoom,
                 @Param(value = "afterArea") String afterArea, @Param(value = "afterRoom") String afterRoom,
                 @Param(value = "moveTime") String moveTime, @Param(value = "moveUser") String moveUser);

    List<Move> selectMove(@Param(value = "mid") Integer mid, @Param(value = "pname") String pname, @Param(value = "moveUser") String moveUser,
                          @Param(value = "startTime") String startTime,@Param(value ="endTime") String endTime,
                          @Param(value = "start") int start, @Param(value = "pageSize") int pageSize);

    int selectMoveCount(@Param(value = "mid") Integer mid, @Param(value = "pname") String pname, @Param(value = "moveUser") String moveUser,
                        @Param(value = "startTime") String startTime,@Param(value ="endTime") String endTime);
}
