package se.zust.entity;

public class Goods {
    private int pid;
    private int inLibraryID;
    private String pname;
    private int pnum;
    private String area;
    private String room;
    private String category;
    private Inlibrary inlibrary;

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

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Inlibrary getInlibrary() {
        return inlibrary;
    }

    public void setInlibrary(Inlibrary inlibrary) {
        this.inlibrary = inlibrary;
    }
}
