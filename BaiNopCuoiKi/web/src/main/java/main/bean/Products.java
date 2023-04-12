package main.bean;

import java.io.Serializable;
import java.util.ArrayList;

public class Products implements Serializable {
    String ID_food;
    String foodName;
    String idSize;

    int quantity;
    String idType;
    String Status;
    boolean isCombo;
    String idSale;
    String isHot;
    String idDes;
    String idImg;
    ArrayList<String> listImg;
    int price;
    int basePrice;

    public Products(String id_food, String foodName, int price, int basePrice, String idImg, String idType) {
    }

    public String getID_food() {
        return ID_food;
    }

    public void setID_food(String ID_food) {
        this.ID_food = ID_food;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getIdSize() {
        return idSize;
    }

    public void setIdSize(String idSize) {
        this.idSize = idSize;
    }

    public int getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(int basePrice) {
        this.basePrice = basePrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }



    public String getIdType() {
        return idType;
    }

    public void setIdType(String idType) {
        this.idType = idType;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    public boolean isCombo() {
        return isCombo;
    }

    public void setCombo(boolean combo) {
        isCombo = combo;
    }

    public String getIdSale() {
        return idSale;
    }

    public void setIdSale(String idSale) {
        this.idSale = idSale;
    }

    public String getIsHot() {
        return isHot;
    }

    public void setIsHot(String isHot) {
        this.isHot = isHot;
    }

    public String getIdDes() {
        return idDes;
    }

    public void setIdDes(String idDes) {
        this.idDes = idDes;
    }

    public String getIdImg() {
        return idImg;
    }

    public void setIdImg(String idImg) {
        this.idImg = idImg;
    }


    public ArrayList<String> getListImg() {
        return listImg;
    }

    public void setListImg(ArrayList<String> listImg) {
        this.listImg = listImg;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Products(String ID_food, String foodName, String idType, int price, String idImg )
    {
        this.ID_food = ID_food;
        this.foodName = foodName;
        this.idType = idType;
        this.price = price;
        this.idImg = idImg;
    }

    //    String path;
////    String DESCRIPTION;
//    String status;
//    int LISTED_PRICE;

//    int basePrice;

//    public Products(String ID_food, String foodName, String size, int LISTED_PRICE, String type,  int quantity, String status, boolean isCombo, String idSale,String isHot, String DESCRIPTION, String path) {
//        this.ID_food = ID_food;
//        this.foodName = foodName;
//        this.size = size;
//        this.LISTED_PRICE = LISTED_PRICE;
//        this.type = type;
//        this.quantity = quantity;
//        Status = status;
//        this.isCombo = isCombo;
//        this.idSale = idSale;
//        this.isHot = isHot;
//        this.DESCRIPTION = DESCRIPTION;
//        this.path = path;
//
//    }

//    public Products(String ID_food, String foodName, String size, int LISTED_PRICE, String type, int quantity, String status, boolean isCombo, String idSale, String isHot, String DESCRIPTION, String path, int basePrice) {
//        this.ID_food = ID_food;
//        this.foodName = foodName;
//        this.size = size;
//        this.LISTED_PRICE = LISTED_PRICE;
//        this.type = type;
//        this.quantity = quantity;
//        this.Status = status;
//        this.isCombo = isCombo;
//        this.idSale = idSale;
//        this.isHot = isHot;
//        this.DESCRIPTION = DESCRIPTION;
//        this.path = path;
//        this.basePrice = basePrice;
//    }

//    public Products(String ID_food, int LISTED_PRICE, int basePrice) {
//        this.ID_food = ID_food;
//        this.LISTED_PRICE = LISTED_PRICE;
//        this.basePrice = basePrice;
//    }
//    public Products(String ID_food ,String path, String foodName, int LISTED_PRICE){
//        this.ID_food = ID_food;
//        this.path = path;
//        this.foodName = foodName;
//        this.LISTED_PRICE = LISTED_PRICE;
//
//    }
//



//    public Products(String ID_food, String foodName,int basePrice , int LISTED_PRICE, String path, String type) {
//        this.ID_food = ID_food;
//        this.foodName = foodName;
//        this.LISTED_PRICE = LISTED_PRICE;
//        this.path = path;
//        this.type = type;
//    }
//    public void setBasePrice(int basePrice) {
//        this.basePrice = basePrice;
//    }
//
//    public String getIsHot() {
//        return isHot;
//    }
//
//    public void setStatus(String status) {
//        Status = status;
//    }
//
//    public void setIsHot(String isHot) {
//        this.isHot = isHot;
//    }
//
//    public String getStatus() {
//        return Status;
//    }
//
//    public void setType(String type) {
//        this.type = type;
//    }
//
//    public boolean getIsCombo() {
//        return isCombo;
//    }
//
//    public void setLISTED_PRICE(int LISTED_PRICE) {
//        this.LISTED_PRICE = LISTED_PRICE;
//    }
//
//    public int getQuantity() {
//        return quantity;
//
//    }
//
//    public int getLISTED_PRICE() {
//        return LISTED_PRICE;
//    }
//
//    public String getDESCRIPTION() {
//        return DESCRIPTION;
//    }
//
//    public String getFoodName() {
//        return foodName;
//    }
//
//    public String getID_food() {
//        return ID_food;
//    }
//
//    public String getIdSale() {
//        return idSale;
//    }
//
//    public String getPath() {
//        return path;
//    }
//
//    public boolean isCombo() {
//        return isCombo;
//    }
//
//    public int getBasePrice() {
//        return basePrice;
//    }
//
//    public String getSize() {
//        return size;
//    }
//
//    public String getType() {
//        return type;
//    }
//
//    public void setDESCRIPTION(String DESCRIPTION) {
//        this.DESCRIPTION = DESCRIPTION;
//    }
//
//    public void setID_food(String ID_food) {
//        this.ID_food = ID_food;
//    }
//
//    public void setFoodName(String foodName) {
//        this.foodName = foodName;
//    }
//
//    public void setIdSale(String idSale) {
//        this.idSale = idSale;
//    }
//
//    public void setIsCombo(boolean isCombo) {
//        this.isCombo = isCombo;
//    }
//
//    public void setPath(String path) {
//        this.path = path;
//    }
//
//    public void setQuantity(int quantity) {
//        this.quantity = quantity;
//    }
//
//    public void setSize(String size) {
//        this.size = size;
//    }
}