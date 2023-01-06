package main.bean;

import java.util.ArrayList;
import java.util.Date;

public class Order {

    String idOder;
    String pbuyName;
    String phoneNumber;
    String Note;
    Date dayCrate;
    String status;
    String idAccount;
    int cost;
    int ship;
    int net;
    int total;
    Address address;
    Voucher voucher;
    ArrayList<OderCart> allOderCart;

    public Order() {
    }

    public Order(String idOder, String pbuyName, String phoneNumber, String note, Date dayCrate, String status, String idAccount, Address address, Voucher voucher, ArrayList<OderCart> allproduct) {
        this.idOder = idOder;
        this.pbuyName = pbuyName;
        this.phoneNumber = phoneNumber;
        Note = note;
        this.dayCrate = dayCrate;
        this.status = status;
        this.idAccount = idAccount;
        this.address = address;
        this.voucher = voucher;
        this.allOderCart = allproduct;
    }

    public Order(String idOder , String idAccount, Address address , ArrayList<OderCart> products, String status , Voucher voucher )  {
        this.idOder = idOder;
        this.status = status;
        this.allOderCart = products;
        this.idAccount = idAccount;
        this.address = address;
        this.voucher = voucher;
    }

    public Order(String idOder) {
        this.idOder = idOder;
    }

    public String getIdAccount() {
        return idAccount;
    }

    public String getIdOder() {
        return idOder;
    }

    public String getPbuyName() {
        return pbuyName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getNote() {
        return Note;
    }

    public Date getDayCrate() {
        return dayCrate;
    }

    public String getStatus() {
        return status;
    }

    public int getCost() {
        return cost;
    }

    public int getShip() {
        return ship;
    }

    public int getNet() {
        return net;
    }

    public int getTotal() {
        return total;
    }

    public Voucher getVoucher() {
        return voucher;
    }

    public Address getAddress() {
        return address;
    }

    public int getTotalValue() {
        int value = 0;
        for (OderCart item: getAllOderCart()) {
            value += item.getItem().LISTED_PRICE * item.getValue();
        }
        return  value;
    }

    public ArrayList<OderCart> getAllOderCart() {
        return allOderCart;
    }
}
