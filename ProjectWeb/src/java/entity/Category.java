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
public class Category {

    private String cateID;
    private String cateName;
    private String image;
    private int status = 1;

    /**
     *
     */
    public Category() {
    }

    /**
     *
     * @param cateID
     * @param cateName
     * @param image
     * @param status
     */
    public Category(String cateID, String cateName, String image, int status) {
        this.cateID = cateID;
        this.cateName = cateName;
        this.image = image;
        this.status = status;
    }

    /**
     *
     * @param cateId
     * @param cateName
     * @param image
     */
    public Category(String cateId, String cateName, String image) {
        this.cateID = cateId;
        this.cateName = cateName;
        this.image = image;
    }

    /**
     *
     * @return
     */
    public String getCateID() {
        return cateID;
    }

    /**
     *
     * @param cateID
     */
    public void setCateID(String cateID) {
        this.cateID = cateID;
    }

    /**
     *
     * @return
     */
    public String getCateName() {
        return cateName;
    }

    /**
     *
     * @param cateName
     */
    public void setCateName(String cateName) {
        this.cateName = cateName;
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
