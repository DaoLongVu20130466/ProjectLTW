package main.services;
import main.db.ConnectMysqlExample;
import main.bean.User;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class useService {
    private static useService instance;

    private useService() {

    }

    private List<User> alluser;

    public static useService getInstance() {
        if (instance == null) {
            instance = new useService();
        }
        return instance;
    }

  
    public void showid(String name) {
        System.out.println(name);
    }

    public User checkLogin(String username, String password) {
        ArrayList<User> listuser = new ArrayList<User>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            // crate statement

            String query= "select USERS, PASS, acc.ID_USER, IS_BLOCK,USER_NAMES ,ROLE, ROLE_NAME\n" +
                    "FROM account  acc join user_information us on us.ID_USER=acc.ID_USER  join role on role.ID_USER=acc.ID_USER\n" +
                    "WHERE USERS=? AND PASS=?";
            PreparedStatement a= conn.prepareStatement(query);
            a.setString(1,username);
            a.setString(2,password);
            ResultSet rs=a.executeQuery();
            while (rs.next()){
                User use =new User(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getInt(6),rs.getString(7));
                return use;
            }


        } catch (Exception ex) {
            ex.printStackTrace();
        }


        return null;
    }


    public int checkIDaccount() {
        int b=0;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            // crate statement

            String query= "select Count(ID_ACCOUNT)\n" +
                    "from account";
            PreparedStatement a= conn.prepareStatement(query);

            ResultSet rs=a.executeQuery();
            while (rs.next()){
                b = rs.getInt(1)+1;

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }


        return b;
    }


    public void registry(String username, String password, String email, String phone, String xa, String huyen, String tinh, String ap) {

        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            // crate statement
            String idacconut="ACC"+useService.getInstance().checkIDaccount();
            String idUSER="USER"+useService.getInstance().checkIDaccount();
            String idadres="ADD"+useService.getInstance().checkIDaccount();
            String query= "INSERT INTO ACCOUNT(ID_ACCOUNT,USERS,PASS,ID_USER,STATUSS,IS_BLOCK,EMAIL,AVATAR) VALUES(?,?,?,?,'HOẠT ĐỘNG',0,?,'img/cupvangWC.jpg')";
            PreparedStatement a= conn.prepareStatement(query);
            a.setString(1,idacconut);
            a.setString(2,username);
            a.setString(3,password);
            a.setString(4,idUSER);
            a.setString(5,email);
            String query2= "INSERT INTO user_information (ID_USER,USER_NAMES,PHONE_NUMBER,ID_ADDRESS) VALUES(?,?,?,?)";
            PreparedStatement b= conn.prepareStatement(query2);
            b.setString(1,idUSER);
            b.setString(2,username);
            b.setString(3,phone);
            b.setString(4,idadres);
            String query3= "INSERT INTO addresss (ID_ADDRESS,COMMUNE,DISTRICT,PROVINCE,ADDRESS_DETAILS) VALUES(?,?,?,?,?)";
            PreparedStatement c= conn.prepareStatement(query3);
            c.setString(1,idadres);
            c.setString(2,xa);
            c.setString(3,huyen);
            c.setString(4,tinh);
            c.setString(5,ap);
            String query4= "INSERT INTO role(ID_USER,ROLE,ROLE_NAME)  VALUES(?,?,'USER')";
            PreparedStatement d= conn.prepareStatement(query4);
            d.setString(1,idUSER);
            d.setInt(2,0);

            d.executeUpdate();
            c.executeUpdate();
            b.executeUpdate();
            a.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public String chekUser(String username) {
        ArrayList<String> allusercontronl = new ArrayList<String>();
        String result=null;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            // crate statement
            Statement stmt = conn.createStatement();
            // get data from table 'student'
            ResultSet rs = stmt.executeQuery("select USERS\n" +
                    "from account");
            // show data
            while (rs.next()) {

                String user = rs.getString(1);

                allusercontronl.add(user);
            }
            conn.close();
            if (allusercontronl.contains(username)) {
                result = "Tên tài khoản đã tồn tại";

            }
            // close connection

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }
    public String chekemail(String email) {
        ArrayList<String> allusercontronl = new ArrayList<String>();
        String result=null;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            // crate statement
            Statement stmt = conn.createStatement();
            // get data from table 'student'
            ResultSet rs = stmt.executeQuery("select EMAIL\n" +
                    "from account");
            // show data
            while (rs.next()) {

                String user = rs.getString(1);

                allusercontronl.add(user);
            }
            conn.close();
            if (allusercontronl.contains(email)) {
                result = "Email này đã đăng kí tài khoản";

            }
            // close connection

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }
    public String chekSDT(String sdt) {
        ArrayList<String> allusercontronl = new ArrayList<String>();
        String result=null;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            // crate statement
            Statement stmt = conn.createStatement();
            // get data from table 'student'
            ResultSet rs = stmt.executeQuery("select PHONE_NUMBER\n" +
                    "from user_information");
            // show data
            while (rs.next()) {

                String user = rs.getString(1);

                allusercontronl.add(user);
            }
            conn.close();
            if (allusercontronl.contains(sdt)) {
                result = "SDT này đã đăng kí tài khoản";

            }
            // close connection

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(useService.getInstance().chekUser( "THOAIHUU"));
    }

    public void doimk(String userId, String newpassword) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            // crate statement
            String idacconut="ACC"+useService.getInstance().checkIDaccount();
            String idUSER="USER"+useService.getInstance().checkIDaccount();
            String idadres="ADD"+useService.getInstance().checkIDaccount();
            String query= "UPDATE account\n" +
                    "SET PASS = ? \n" +
                    "WHERE ID_USER = ?";
            PreparedStatement a= conn.prepareStatement(query);
            a.setString(1,newpassword);
            a.setString(2,userId);

            a.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }



    }
}






