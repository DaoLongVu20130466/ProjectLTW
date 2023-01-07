package main.services;
import main.db.ConnectMysqlExample;
import main.bean.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
    public void deletaFavourite(String idf , String id ){
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement("DELETE FROM favourite " +
                    "WHERE ID_FOOD = ? AND ID_ACCOUNT =?");
            ps.setString(1,idf);
            ps.setString(2,id);
            ps.executeUpdate();
        }catch (Exception e){

        }

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
                    "IS_BLOCK as sts\n" +
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
                int status = rs.getInt(6);
                allusercontronl.add(new User(id, username, phonenum, province, numberBuy, status));
            }
            // close connection
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allusercontronl;
    }

    public User getAllUserByID(String iduser) {

        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement("SELECT user_information.USER_NAMES , " +
                    "addresss.PROVINCE , user_information.PHONE_NUMBER, account.STATUSS, account.AVATAR,account.EMAIL, account.ID_ACCOUNT \n" +
                    "FROM  account join  (user_information JOIN addresss " +
                    "on user_information.ID_ADDRESS = addresss.ID_ADDRESS)  on  " +
                    "account.ID_USER = user_information.ID_USER\n" +
                    "WHERE user_information.ID_USER = ?");
            ps.setString(1,iduser);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String userName = rs.getNString(1);
                String provine = rs.getNString(2);
                String phoneNumber = rs.getString(3);
                String status = rs.getNString(4);
                String avatar = rs.getString(5);
                String email = rs.getString(6);
                String idacc = rs.getString(7);
                return new User (userName,provine,phoneNumber, status,avatar,email,idacc);
            }
            // close connection
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void LockUser(String uid){
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement stmt = conn.prepareStatement("UPDATE account SET IS_BLOCK = 1 WHERE ID_ACCOUNT = ?");
            stmt.setString(1,uid);
            stmt.execute();
            conn.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    public void UnLockUser(String uid){
        {
            try {
                Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
                PreparedStatement stmt = conn.prepareStatement("UPDATE account SET IS_BLOCK = 0 WHERE ID_ACCOUNT = ?");
                stmt.setString(1,uid);
                stmt.execute();
                conn.close();
            }
            catch (Exception e){
                e.printStackTrace();
            }
        }

    }
    public void showid(String name){
        System.out.println( name);
    }

    public static void main(String[] args) {

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

