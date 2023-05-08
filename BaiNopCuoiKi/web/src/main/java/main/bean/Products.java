package main.bean;

import java.io.Serializable;
import java.util.ArrayList;

public class Products implements Serializable {
    String idFood;
    String foodName;
    String idType;
    String idSize;
    int quantity;
    String Status;
    boolean isCombo;
    boolean idSale;
    boolean isHot;
    String idDes;
    String idImg;
    ArrayList<String> listImg;
    int price;
    int basePrice;

    public Products(String idFood, String foodName, String idType, String idDes, int quantity, int price, String idImg) {
        this.idFood = idFood;
        this.foodName = foodName;
        this.idType = idType;
        this.idDes = idDes;
        this.quantity = quantity;
        this.price = price;
        this.idImg = idImg;
    }

    public Products(String idFood, String foodName, String idType, int quantity, String idDes, String idImg, int price) {
        this.idFood = idFood;
        this.foodName = foodName;
        this.idType = idType;
        this.quantity = quantity;
        this.idDes = idDes;
        this.idImg = idImg;
        this.price = price;
    }

    public Products(String idFood, String foodName,String idType, int price, String idImg) {
        this.idFood = idFood;
        this.foodName = foodName;
        this.idType = idType;
        this.price = price;
        this.idImg = idImg;

    }

    public Products(String string, String string1, int anInt, int anInt1, String string2, String string3) {
    }


    public String getID_food() {
        return idFood;
    }

    public void setID_food(String ID_food) {
        this.idFood = ID_food;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getIdType() {
        return idType;
    }

    public void setIdType(String idType) {
        this.idType = idType;
    }

    public String getIdSize() {
        return idSize;
    }

    public void setIdSize(String idSize) {
        this.idSize = idSize;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
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

    public boolean isIdSale() {
        return idSale;
    }

    public void setIdSale(boolean idSale) {
        this.idSale = idSale;
    }

    public boolean isHot() {
        return isHot;
    }

    public void setHot(boolean hot) {
        isHot = hot;
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

    public int getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(int basePrice) {
        this.basePrice = basePrice;
    }
}