package main.services;

import main.db.ConnectMysqlExample;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AddProduct {
    private static AddProduct instance;
    public static AddProduct getInstance() {
        if (instance == null) {
            instance = new AddProduct();
        }
        return instance;
    }
    public void addProduct(
            String tenmonan, String optionSize, int niemyet, String optionType, int soluong, String optionStatus, String optionCombo, String optionSale, String optionHot, String Mota, String img, int giaban
         ) {


        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement("INSERT INTO FOOD(ID_FOOD, FOOD_NAME, " +
                    "ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, " +
                    "ID_SALE,IS_HOT, DESCRIPTION,L_IMG ,BASE_PRICE)  VALUES " +
                    "(\"AAA\",?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setNString(1, tenmonan);
            ps.setString(2, optionSize);
            ps.setInt(3,niemyet);
            ps.setNString(4, optionType);
            ps.setInt(5,soluong);
            ps.setNString(6,optionStatus);
            ps.setString(7,optionCombo);
            ps.setString(8,optionSale);
            ps.setString(9,optionHot);
            ps.setNString(10,Mota);
            ps.setString(11,img);
            ps.setInt(12,giaban);
            ps.executeUpdate();
        } catch (Exception e) {}
    }
    public static void main(String[] args) {
        AddProduct a = new AddProduct();
        String tenmonan ="a";
        int niemyet =12;
        int giaban=12;
        int soluong =12;
        String Mota="a";
        String optionHot="a";
        String optionType="a";
        String optionSale="a";
        String img="a";
        String optionStatus="a";
        String optionCombo="a";
        String optionSize="a";
        a.addProduct(tenmonan,optionSize,niemyet,optionType,soluong,optionStatus,optionCombo,optionSale,optionHot,Mota,img,giaban);

    }



}
