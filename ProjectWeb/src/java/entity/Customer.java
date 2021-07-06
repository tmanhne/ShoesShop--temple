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
public class Customer {
    
    private int cid;
    private String fullName;
    private String address;
    private String phone;
    private String userName;
    private String password;
    private int status = 1;

    /**
     *
     */
    public Customer() {
    }

    /**
     *
     * @param fullName
     * @param address
     * @param phone
     * @param userName
     * @param password
     */
    public Customer(String fullName, String address, String phone, String userName, String password) {
        this.fullName = fullName;
        this.address = address;
        this.phone = phone;
        this.userName = userName;
        this.password = password;
    }
    public Customer(String userName, String password) {
        
        this.userName = userName;
        this.password = password;
    }
    
    /**
     *
     * @param cid
     * @param fullName
     * @param address
     * @param phone
     * @param userName
     * @param password
     */
    public Customer(int cid, String fullName, String address, String phone, String userName, String password) {
        this.cid = cid;
        this.fullName = fullName;
        this.address = address;
        this.phone = phone;
        this.userName = userName;
        this.password = password;
    }

      public Customer(int cid, String fullName, String address, String phone, String userName, String password,int status) {
        this.cid = cid;
        this.fullName = fullName;
        this.address = address;
        this.phone = phone;
        this.userName = userName;
        this.password = password;
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

    /**
     *
     * @return
     */
    public String getFullName() {
        return fullName;
    }

    /**
     *
     * @param fullName
     */
    public void setFullName(String fullName) {
        this.fullName = fullName;
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
    public String getPhone() {
        return phone;
    }

    /**
     *
     * @param phone
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     *
     * @return
     */
    public String getUserName() {
        return userName;
    }

    /**
     *
     * @param userName
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     *
     * @return
     */
    public String getPassword() {
        return password;
    }

    /**
     *
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
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
    
    
}
