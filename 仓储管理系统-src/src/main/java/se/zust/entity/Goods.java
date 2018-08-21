package se.zust.entity;

public class Goods {
    int pid;
    int inLibraryID;
    String pname;
    int pnum;
    String area;
    String room;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getInLibraryID() {
        return inLibraryID;
    }

    public void setInLibraryID(int inLibraryID) {
        this.inLibraryID = inLibraryID;
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

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }
}
