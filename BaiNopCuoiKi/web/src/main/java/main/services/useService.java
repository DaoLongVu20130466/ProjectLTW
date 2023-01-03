package main.services;
import main.db.ConnectMysqlExample;
import main.bean.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class useService {
    private static useService instance;
    private useService() {

    }
    private List<User> alluser ;
    public static useService getInstance() {
        if (instance == null) {
            instance = new useService();
        }
        return instance;
    }
    public ArrayList<User> getAllUser() {
        ArrayList<User> allusercontronl = new ArrayList<User>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            // crate statement
            Statement stmt = conn.createStatement();
            // get data from table 'student'
            ResultSet rs = stmt.executeQuery("SELECT id,userid , phone,pro,sodon,sts\n" +
                    "from (\n" +
                    "(SELECT account.ID_ACCOUNT as id, \n" +
                    "USER_NAMES as userid , \n" +
                    "PHONE_NUMBER as phone,\n" +
                    "PROVINCE as pro,\n" +
                    "STATUSS as sts\n" +
                    "FROM account\n" +
                    "join user_information \n" +
                    "join addresss \n" +
                    "on addresss.ID_ADDRESS = user_information.ID_ADDRESS\n" +
                    "on user_information.ID_USER = account.ID_USER\n" +
                    ") as bangtam) join\n" +
                    "((SELECT ID_ACCOUNT as acc, COUNT(ID_ACCOUNT) as sodon from order_account_details)\n" +
                    "as bangphu)\n" +
                    "on bangtam.id = bangphu.acc");
            // show data
            while (rs.next()) {
                String id = rs.getString(1);
                String username = rs.getString(2);
                String phonenum = rs.getString(3);
                String province = rs.getString(4);
                int numberBuy = rs.getInt(5);
                String status = rs.getString(6);
                allusercontronl.add(new User(id, username, phonenum, province, numberBuy, status));
            }
            // close connection
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allusercontronl;
    }

    public void showid(String name){
        System.out.println( name);
    }

    public static void main(String[] args) {

    }
}

