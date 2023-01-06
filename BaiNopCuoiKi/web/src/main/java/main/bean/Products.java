package main.bean;

public class Products {
<<<<<<< Updated upstream
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
<<<<<<< Updated upstream
=======
    String Status;
>>>>>>> Stashed changes
    public Products() {
=======
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
>>>>>>> Stashed changes
    }
    public Products(String ID_food, String foodName, String size, int LISTED_PRICE,String path ) {
        this.ID_food = ID_food;
        this.foodName = foodName;
        this.size = size;
        this.LISTED_PRICE = LISTED_PRICE;
        this.path = path;

    }
<<<<<<< Updated upstream
=======
    public Products(String ID_food, String foodName,String path, int LISTED_PRICE ) {
        this.ID_food = ID_food;
        this.foodName = foodName;
        this.path = path;
        this.LISTED_PRICE = LISTED_PRICE;


    }

    public Products(String id, String foodName, int price, String path, String status) {
        this.ID_food=id;
        this.foodName = foodName;
        this.path = path;
        this.LISTED_PRICE = price;
        this.Status=status;
    }
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

<<<<<<< Updated upstream
    public String getStatus() {
        return Status;
=======
    }
    public String getIsHot() {
        return isHot;
>>>>>>> Stashed changes
    }

    public int getLISTED_PRICE() {
        return LISTED_PRICE;
    }

    public void setLISTED_PRICE(int LISTED_PRICE) {
        this.LISTED_PRICE = LISTED_PRICE;
    }

    public void setStatus(String status) {
        Status = status;
    }
>>>>>>> Stashed changes

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

