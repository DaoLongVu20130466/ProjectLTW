package main.bean;

public class Products {

    private String foodID;
    private String nameFood;
    private String sizeID;
    private int listedPrice;
    private String typeFood;
    private int quantity;
    private String statuss;
    private boolean isCombo;
    private String isSale;
    private String isHot;
    private String description;
    private String linkImg;


    public Products( String foodID, String nameFood, String sizeID,
                     int listedPrice, String typeFood, int quantity ,String statuss, boolean
                             isCombo, String isSale,String isHot, String description, String linkImg) {
            this.foodID = foodID;
            this.nameFood = nameFood;
            this.sizeID = sizeID;
            this.listedPrice = listedPrice;
            this.typeFood = typeFood;
            this.quantity = quantity;
            this.statuss = statuss;
            this.isCombo = isCombo;
            this.isSale = isSale;
            this.isHot = isHot;
            this.description = description;
            this.linkImg = linkImg;
    }

    public String getFoodID() {
        return foodID;
    }

    public void setFoodID(String foodID) {
        this.foodID = foodID;
    }

    public String getNameFood() {
        return nameFood;
    }

    public void setNameFood(String nameFood) {
        this.nameFood = nameFood;
    }

    public String getSizeID() {
        return sizeID;
    }

    public void setSizeID(String sizeID) {
        this.sizeID = sizeID;
    }

    public int getListedPrice() {
        return listedPrice;
    }

    public void setListedPrice(int listedPrice) {
        this.listedPrice = listedPrice;
    }

    public String getTypeFood() {
        return typeFood;
    }

    public void setTypeFood(String typeFood) {
        this.typeFood = typeFood;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isCombo() {
        return isCombo;
    }

    public void setCombo(boolean combo) {
        isCombo = combo;
    }

    public String getIsHot() {
        return isHot;
    }

    public void setIsHot(String isHot) {
        this.isHot = isHot;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLinkImg() {
        return linkImg;
    }

    public void setLinkImg(String linkImg) {
        this.linkImg = linkImg;
    }

    public String getIsSale() {
        return isSale;
    }

    public void setIsSale(String isSale) {
        this.isSale = isSale;
    }

    public String getStatuss() {
        return statuss;
    }

    public void setStatuss(String statuss) {
        this.statuss = statuss;
    }

    @Override
    public String toString() {
        return "Products{" +
                "foodID='" + foodID + '\'' +
                ", nameFood='" + nameFood + '\'' +
                ", sizeID='" + sizeID + '\'' +
                ", listedPrice=" + listedPrice +
                ", typeFood='" + typeFood + '\'' +
                ", quantity=" + quantity +
                ", statuss='" + statuss + '\'' +
                ", isCombo=" + isCombo +
                ", isSale='" + isSale + '\'' +
                ", isHot='" + isHot + '\'' +
                ", description='" + description + '\'' +
                ", linkImg='" + linkImg + '\'' +
                '}';

    }

}

