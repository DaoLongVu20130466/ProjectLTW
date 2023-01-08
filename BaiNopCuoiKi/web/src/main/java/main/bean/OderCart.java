package main.bean;

import java.util.ArrayList;
import java.util.Map;

public class OderCart {
   Products Item;
   int value;

    public OderCart(Products item, int value) {
        Item = item;
        this.value = value;
    }

    public Products getItem() {
        return Item;
    }

    public int getValue() {
        return value;
    }

    public int getThisodercartvl(){
        return Item.LISTED_PRICE * value;
    }
    public OderCart() {
    }

    public void setItem(Products item) {
        Item = item;
    }

    public void setValue(int value) {
        this.value = value;
    }


}
