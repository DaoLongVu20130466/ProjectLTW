package main.services;

import main.bean.Order;
import main.bean.User;
import main.db.ConnectMysqlExample;

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

    public boolean adODer(String usid , HashMap<String, Integer> map,String note ,String voucherCode){
        if(isleft(map)){
        addOderByUser(usid, map, note, voucherCode);
        return true;
        }
        else return false;

    }
    public void deleteAmount(String foodid, int quantity){
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement statement = conn.prepareStatement(
                    "UPDATE food SET QUANTITY = ? WHERE ID_FOOD = ? and ID_SIZE = 'SIZE1'");
            statement.setInt(1,getAmount(foodid)-quantity);
            statement.setString(2,foodid);
            statement.execute();
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }

    }
    public boolean isleft(HashMap<String, Integer> map){
        boolean rs= true;
        for (Map.Entry<String, Integer> entry : map.entrySet()) {
            if (getAmount(entry.getKey())-entry.getValue()<=0)
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
                    "SELECT QUANTITY FROM food WHERE ID_FOOD =? AND ID_SIZE = 'SIZE1'");
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
    public void addOderByUser (String usid , HashMap<String, Integer> map,String note ,String voucherCode){
        User us1 = useService.getInstance().getUserById(usid);
        Order neworder = new Order();
        neworder.setIdOder(OderService.getInstance().createNewIDOder());

            try {
                Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
                PreparedStatement statement = conn.prepareStatement(
                        "INSERT INTO orders (ID_ORDER, ORDER_DATE, PHONE_NUMBER, NAMEUSER, NOTE, ID_VOUCHER,ID_ADDRESS,STATUSS, DELIVERY_CHARGES)\n" +
                        "VALUES (?,?,?,?,?,?,?,?,?);");
                statement.setString(1,neworder.getIdOder());
                statement.setString(2,AppService.getNowDate().toString());
                statement.setString(3,us1.getPhoneNumber());
                statement.setString(4,us1.getName());
                statement.setString(5,note);
                statement.setString(6,voucherCode);
                statement.setString(7,us1.getIDadress());
                statement.setString(8,"Đang Giao");
                statement.setInt(9,20000);
                PreparedStatement statement2 = conn.prepareStatement(
                        "INSERT INTO order_account_details (ID_ACCOUNT, ID_ORDER)\n" +
                                "VALUES (?,?);");
                statement2.setString(1,us1.getIdacc());
                statement2.setString(2,neworder.getIdOder());

                for (Map.Entry<String, Integer> entry : map.entrySet()) {
                    PreparedStatement statement3 = conn.prepareStatement(
                            "INSERT INTO order_details(ID_ORDER, ID_FOOD, ID_SIZE , QUANTITY)\n" +
                                    "VALUES (?,?,?,?)");
                    statement3.setString(1,neworder.getIdOder());
                    statement3.setString(2,entry.getKey());
                    statement3.setString(3,"SIZE1");
                    statement3.setInt(4,entry.getValue());
                    statement3.execute();
                    deleteAmount(entry.getKey(),entry.getValue());
                }
                statement.execute();
                statement2.execute();
            } catch (Exception ex) {
                ex.printStackTrace();
            }


    }

    public static void main(String[] args) {
        HashMap<String, Integer> map = new HashMap<>();
        map.put("COM_GA1",1);
        map.put("COM_GA4",2);
        System.out.println(AddOderService.getInstance().getAmount("COM_GA1"));
        System.out.println(AddOderService.getInstance().isleft(map));
        AddOderService.getInstance().addOderByUser("ACC1",map," ","");

    }
}
