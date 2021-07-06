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
public class Product {
    
    private String pid;
    private String pName;
    private int quantity;
    private double price;
    private String image;
    private String desciption;
    private int status = 1;
    private  String cateId;
    private int amount;

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    

    /**
     *
     */
    public Product() {
    }
   
    /**
     *
     * @param pid
     * @param pName
     * @param quantity
     * @param price
     * @param image
     * @param desciption
     * @param cateId
     * @Builder 
     */
    public Product(String pid, String pName, int quantity, double price, String image, String desciption, String cateId) {
        this.pid = pid;
        this.pName = pName;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.desciption = desciption;
        this.cateId = cateId;
    }
    
    /**
     *
     * @param pid
     * @param pName
     * @param quantity
     * @param price
     * @param image
     * @param desciption
     * @param status
     * @param cateId
     */
    public Product(String pid, String pName, int quantity, double price, String image, String desciption, int status, String cateId) {
        this.pid = pid;
        this.pName = pName;
        this.quantity = quantity;
        this.price = price;
        this.image = image;
        this.desciption = desciption;
        this.status = status;
        this.cateId = cateId;
    }
    

    /**
     *
     * @return
     */
    public String getPid() {
        return pid;
    }

    /**
     *
     * @param pid
     */
    public void setPid(String pid) {
        this.pid = pid;
    }

    /**
     *
     * @return
     */
    public String getpName() {
        return pName;
    }

    /**
     *
     * @param pName
     */
    public void setpName(String pName) {
        this.pName = pName;
    }

    /**
     *
     * @return
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     *
     * @param quantity
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     *
     * @return
     */
    public double getPrice() {
        return price;
    }

    /**
     *
     * @param price
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     *
     * @return
     */
    public String getImage() {
        return image;
    }

    /**
     *
     * @param image
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     *
     * @return
     */
    public String getDesciption() {
        return desciption;
    }

    /**
     *
     * @param desciption
     */
    public void setDesciption(String desciption) {
        this.desciption = desciption;
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
    public String getCateId() {
        return cateId;
    }

    /**
     *
     * @param cateId
     */
    public void setCateId(String cateId) {
        this.cateId = cateId;
    }
    
    
    
    
}
