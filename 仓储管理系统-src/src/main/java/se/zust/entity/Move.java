package se.zust.entity;

public class Move {
    private int mid;
    private int goodsID;
    private String pname;
    private int pnum;
    private String beforeArea;
    private String beforeRoom;
    private String afterArea;
    private String afterRoom;
    private String moveTime;
    private String moveUser;

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public int getGoodsID() {
        return goodsID;
    }

    public void setGoodsID(int goodsID) {
        this.goodsID = goodsID;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getPnum() {
        return pnum;
    }

    public void setPnum(int pnum) {
        this.pnum = pnum;
    }

    public String getBeforeArea() {
        return beforeArea;
    }

    public void setBeforeArea(String beforeArea) {
        this.beforeArea = beforeArea;
    }

    public String getBeforeRoom() {
        return beforeRoom;
    }

    public void setBeforeRoom(String beforeRoom) {
        this.beforeRoom = beforeRoom;
    }

    public String getAfterArea() {
        return afterArea;
    }

    public void setAfterArea(String afterArea) {
        this.afterArea = afterArea;
    }

    public String getAfterRoom() {
        return afterRoom;
    }

    public void setAfterRoom(String afterRoom) {
        this.afterRoom = afterRoom;
    }

    public String getMoveTime() {
        return moveTime;
    }

    public void setMoveTime(String moveTime) {
        this.moveTime = moveTime;
    }

    public String getMoveUser() {
        return moveUser;
    }

    public void setMoveUser(String moveUser) {
        this.moveUser = moveUser;
    }
}
