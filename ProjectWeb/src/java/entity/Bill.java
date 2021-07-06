/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author DELL
 */
public class Bill {
    
    private int bid;
    private String dateCreate;
    private double total;
    private String recName;
    private String address;
    private String recPhone;
    private int status = 1;
    private int cid;

    /**
     *
     */
    public Bill() {
    }

    /**
     *
     * @param dateCreate
     * @param total
     * @param recName
     * @param address
     * @param recPhone
     * @param cid
     */
    public Bill(String dateCreate, double total, String recName, String address, String recPhone, int cid) {
        this.dateCreate = dateCreate;
        this.total = total;
        this.recName = recName;
        this.address = address;
        this.recPhone = recPhone;
        this.cid = cid;
    }
    
    /**
     *
     * @param bid
     * @param dateCreate
     * @param total
     * @param recName
     * @param address
     * @param recPhone
     * @param status
     * @param cid
     */
    public Bill(int bid, String dateCreate, double total, String recName, String address, String recPhone, int status, int cid) {
        this.bid = bid;
        this.dateCreate = dateCreate;
        this.total = total;
        this.recName = recName;
        this.address = address;
        this.recPhone = recPhone;
        this.status = status;
        this.cid = cid;
    }

    /**
     *
     * @return
     */
    public int getBid() {
        return bid;
    }

    /**
     *
     * @param bid
     */
    public void setBid(int bid) {
        this.bid = bid;
    }

    /**
     *
     * @return
     */
    public String getDateCreate() {
        return dateCreate;
    }

    /**
     *
     * @param dateCreate
     */
    public void setDateCreate(String dateCreate) {
        this.dateCreate = dateCreate;
    }

    /**
     *
     * @return
     */
    public double getTotal() {
        return total;
    }

    /**
     *
     * @param total
     */
    public void setTotal(double total) {
        this.total = total;
    }

    /**
     *
     * @return
     */
    public String getRecName() {
        return recName;
    }

    /**
     *
     * @param recName
     */
    public void setRecName(String recName) {
        this.recName = recName;
    }

    /**
     *
     * @return
     */
    public String getAddress() {
        return address;
    }

    /**
     *
     * @param address
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     *
     * @return
     */
    public String getRecPhone() {
        return recPhone;
    }

    /**
     *
     * @param recPhone
     */
    public void setRecPhone(String recPhone) {
        this.recPhone = recPhone;
    }

    /**
     *
     * @return
     */
    public int getStatus() {
        return status;
    }
     

    /**
     *
     * @param status
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     *
     * @return
     */
    public int getCid() {
        return cid;
    }

    /**
     *
     * @param cid
     */
    public void setCid(int cid) {
        this.cid = cid;
    }
    
    
}
