package se.zust.entity;

public class Base {
    private String thiid;

    private String secid;

    public String getThiid() {
        return thiid;
    }

    public void setThiid(String thiid) {
        this.thiid = thiid == null ? null : thiid.trim();
    }

    public String getSecid() {
        return secid;
    }

    public void setSecid(String secid) {
        this.secid = secid == null ? null : secid.trim();
    }
}