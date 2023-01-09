package main.bean;

public class Products {
    String ID_food;
    String foodName;
    String size;
    String type;
    int LISTED_PRICE;
    int quantity;
    boolean isCombo;
    String idSale;
    String isHot;
    String DESCRIPTION;
    String path;
    String Status;
    int basePrice;

    public Products(String ID_food, String foodName, String size, int LISTED_PRICE, String type,  int quantity, String status, boolean isCombo, String idSale,String isHot, String DESCRIPTION, String path) {
        this.ID_food = ID_food;
        this.foodName = foodName;
        this.size = size;
        this.LISTED_PRICE = LISTED_PRICE;
        this.type = type;
        this.quantity = quantity;
        Status = status;
        this.isCombo = isCombo;
        this.idSale = idSale;
        this.isHot = isHot;
        this.DESCRIPTION = DESCRIPTION;
        this.path = path;

    }

    public Products(String ID_food, int LISTED_PRICE, int basePrice) {
        this.ID_food = ID_food;
        this.LISTED_PRICE = LISTED_PRICE;
        this.basePrice = basePrice;
    }

    public Products(String ID_food ,String path, String foodName, int LISTED_PRICE){
        this.ID_food = ID_food;
        this.path = path;
        this.foodName = foodName;
        this.LISTED_PRICE = LISTED_PRICE;

    }


    public Products(String ID_food, String foodName,int basePrice , int LISTED_PRICE, String path, String type) {
        this.ID_food = ID_food;
        this.foodName = foodName;
        this.LISTED_PRICE = LISTED_PRICE;
        this.path = path;
        this.type = type;
    }

    public String getIsHot() {
        return isHot;
    }

    public void setStatus(String status) {
        Status = status;
    }

    public void setIsHot(String isHot) {
        this.isHot = isHot;
    }

    public String getStatus() {
        return Status;
    }

    public void setType(String type) {
        this.type = type;
    }

    public boolean getIsCombo() {
        return isCombo;
    }

    public void setLISTED_PRICE(int LISTED_PRICE) {
        this.LISTED_PRICE = LISTED_PRICE;
    }

    public int getQuantity() {
        return quantity;

    }

    public int getLISTED_PRICE() {
        return LISTED_PRICE;
    }

    public String getDESCRIPTION() {
        return DESCRIPTION;
    }

    public String getFoodName() {
        return foodName;
    }

    public String getID_food() {
        return ID_food;
    }

    public String getIdSale() {
        return idSale;
    }

    public String getPath() {
        return path;
    }

    public boolean isCombo() {
        return isCombo;
    }

    public int getBasePrice() {
        return basePrice;
    }

    public String getSize() {
        return size;
    }

    public String getType() {
        return type;
    }

    public void setDESCRIPTION(String DESCRIPTION) {
        this.DESCRIPTION = DESCRIPTION;
    }

    public void setID_food(String ID_food) {
        this.ID_food = ID_food;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public void setIdSale(String idSale) {
        this.idSale = idSale;
    }

    public void setIsCombo(boolean isCombo) {
        this.isCombo = isCombo;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setSize(String size) {
        this.size = size;
    }
}