package main.services;

import main.bean.*;
import main.db.ConnectMysqlExample;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

public class AddOderService {
    private static AddOderService instance;
    public static AddOderService getInstance() {
        if (instance == null) {
            instance = new AddOderService();
        }
        return instance;
    }

    public boolean adODer(String usid , Cart map, String voucherCode, String ads1, String ads2){
        if(isleft(map)){
        addOderByUser(usid, map, voucherCode,ads1,ads2);
        return true;
        }
        else return false;

    }
    public void deleteAmount(String foodid, int quantity){
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement statement = conn.prepareStatement(
                    "UPDATE food SET QUANTITY = ? WHERE ID_FOOD = ? ");
            statement.setInt(1,getAmount(foodid)-quantity);
            statement.setString(2,foodid);
            if(getAmount(foodid)-quantity <=0){
                PreparedStatement statement1 = conn.prepareStatement("UPDATE food SET STATUSS = 'Hết Hàng' WHERE ID_FOOD = ? ");
                statement1.setString(1,foodid);
                statement1.execute();
            }
            statement.execute();
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }

    }
    public boolean isleft(Cart map){
        boolean rs= true;

        for (Map.Entry<String, Products> entry : map.getData().entrySet()) {
            if (getAmount(entry.getKey())-entry.getValue().getQuantity()<=0)
            rs= false;
            break;
        }
        return rs;
    }


    public int getAmount(String foodID){
        int rs = 0;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement statement = conn.prepareStatement(
                    "SELECT QUANTITY FROM food WHERE ID_FOOD =? ");
            statement.setString(1, foodID);
            ResultSet rsl = statement.executeQuery();
            while (rsl.next()) {
                rs = rsl.getInt(1);
            }
        }
        catch (Exception ex){
            ex.printStackTrace();
        }
        return rs;
    }
    public void addOderByUser (String usid , Cart map ,String voucherCode, String ads1, String ads2)  {
        User us1 = useService.getInstance().getUserById(usid);
        Order neworder = new Order();
        ApiController control = new ApiController();
        neworder.setIdOder(OderService.getInstance().createNewIDOder());
            try {
                Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
                PreparedStatement statement = conn.prepareStatement(
                        "INSERT INTO orders (ID_ORDER, ORDER_DATE, PHONE_NUMBER, NAMEUSER, NOTE, ID_VOUCHER,ID_ADDRESS,STATUSS, DELIVERY_CHARGES,districtID,wardID)\n" +
                        "VALUES (?,?,?,?,?,?,?,?,?,?,?);");
                statement.setString(1,neworder.getIdOder());
                statement.setString(2,AppService.getNowDate().toString());
                statement.setString(3,us1.getPhoneNumber());
                statement.setString(4,us1.getName());
                statement.setString(5,"Đầy đủ");
                statement.setString(6,voucherCode);
                statement.setString(7,us1.getIDadress());
                statement.setString(8,"Đang chờ xử lý");
                statement.setInt(9,control.getCostdeliver("3695","90750",ads1,ads2));
                statement.setInt(10,Integer.parseInt(ads1));
                statement.setInt(11,Integer.parseInt(ads2));
                PreparedStatement statement2 = conn.prepareStatement(
                        "INSERT INTO order_account_details (ID_ACCOUNT, ID_ORDER)\n" +
                                "VALUES (?,?);");
                statement2.setString(1,us1.getIdacc());
                statement2.setString(2,neworder.getIdOder());

                for (Map.Entry<String, Products> entry : map.getData().entrySet()) {
                    PreparedStatement statement3 = conn.prepareStatement(
                            "INSERT INTO order_details(ID_ORDER, ID_FOOD, ID_SIZE , QUANTITY)\n" +
                                    "VALUES (?,?,?,?)");
                    statement3.setString(1,neworder.getIdOder());
                    statement3.setString(2,entry.getKey());
                    statement3.setString(3,"SIZE1");
                    statement3.setInt(4,entry.getValue().getQuantity());
                    statement3.execute();
                    deleteAmount(entry.getKey(),entry.getValue().getQuantity());
                }
                statement.execute();
                statement2.execute();
            } catch (Exception ex) {
                ex.printStackTrace();
            }


    }


}
