package main.bean;

public class Products {
    String ID_food;
    String foodName;
    String size;
    String type;
    int LISTED_PRICE;
    int quantity;
    int isCombo;
    String idSale;
    String DESCRIPTION;
    String path;
    public Products() {
    }
    public Products(String ID_food, String foodName, String size, int LISTED_PRICE,String path ) {
        this.ID_food = ID_food;
        this.foodName = foodName;
        this.size = size;
        this.LISTED_PRICE = LISTED_PRICE;
        this.path = path;

    }

    public void setType(String type) {
        this.type = type;
    }

    public int getIsCombo() {
        return isCombo;
    }

    public int getQuantity() {
        return quantity;

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

    public void setIsCombo(int isCombo) {
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

