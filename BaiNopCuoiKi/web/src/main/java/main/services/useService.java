package main.services;
import main.db.ConnectMysqlExample;
import main.bean.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class useService {
    public static useService instance;

    public useService() {

    }

    private List<User> alluser;

    public static useService getInstance() {
        if (instance == null) {
            instance = new useService();
        }
        return instance;
    }

    public void deletaFavourite(String idf, String id) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement("DELETE FROM favourite " +
                    "WHERE ID_FOOD = ? AND ID_ACCOUNT =?");
            ps.setString(1, idf);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (Exception e) {

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
            ps.setString(1, iduser);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String userName = rs.getNString(1);
                String provine = rs.getNString(2);
                String phoneNumber = rs.getString(3);
                String status = rs.getNString(4);
                String avatar = rs.getString(5);
                String email = rs.getString(6);
                String idacc = rs.getString(7);
                return new User(userName, provine, phoneNumber, status, avatar, email, idacc);
            }
            // close connection
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void LockUser(String uid) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement stmt = conn.prepareStatement("UPDATE account SET IS_BLOCK = 1 WHERE ID_ACCOUNT = ?");
            stmt.setString(1, uid);
            stmt.execute();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateIF(String uid, String hoten, String email, String sdt, String diachi) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement stmt = conn.prepareStatement("UPDATE account SET EMAIL = ? WHERE ID_USER = ?");
            stmt.setString(1, email);

            stmt.setString(2, uid);

            PreparedStatement stmt2 = conn.prepareStatement("UPDATE user_information us join addresss ad on us.ID_ADDRESS=ad.ID_ADDRESS SET PROVINCE = ? , PHONE_NUMBER= ? , USER_NAMES =? WHERE ID_USER = ?");
            stmt2.setString(1, diachi);
            stmt2.setString(2, sdt);
            stmt2.setString(3, hoten);
            stmt2.setString(4, uid);
            stmt2.execute();
            stmt.execute();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void upImg(String uid, String link) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement stmt = conn.prepareStatement("UPDATE account SET AVATAR = ? WHERE ID_USER = ?");
            stmt.setString(1, link);

            stmt.setString(2, uid);


            stmt.execute();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void upImgProducts(String uid, String link) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement stmt = conn.prepareStatement("UPDATE food SET L_IMG = ? WHERE ID_FOOD = ?");
            stmt.setString(1, link);

            stmt.setString(2, uid);


            stmt.execute();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void UnLockUser(String uid) {
        {
            try {
                Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
                PreparedStatement stmt = conn.prepareStatement("UPDATE account SET IS_BLOCK = 0 WHERE ID_ACCOUNT = ?");
                stmt.setString(1, uid);
                stmt.execute();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    public void showid(String name) {
        System.out.println(name);
    }


    public User checkLogin(String username, String password) {
        ArrayList<User> listuser = new ArrayList<User>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            // crate statement

            String query = "select acc.USERS, acc.PASS, acc.ID_USER, IS_BLOCK,USER_NAMES ,ROLE, ROLE_NAME, ID_ACCOUNT \n" +
                    " FROM accounts  acc  join user_information us on us.ID_USER=acc.ID_USER  \n" +
                    " join role on role.ID_USER = acc.ID_USER\n" +
                    " WHERE acc.USERS=? AND acc.PASS=?";
            PreparedStatement a = conn.prepareStatement(query);
            a.setString(1, username);
            a.setString(2, password);
            ResultSet rs = a.executeQuery();
            while (rs.next()) {
                User use = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getString(7), rs.getString(8));
                return use;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }


        return null;
    }

    public int checkIDaccount() {
        int b = 0;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            // crate statement

            String query = "select Count(ID_ACCOUNT)\n" +
                    "from account";
            PreparedStatement a = conn.prepareStatement(query);

            ResultSet rs = a.executeQuery();

            while (rs.next()) {
                b = rs.getInt(1) + 1;

            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }


        return b;
    }

    public int checkIDFOOD(String type, String size) {
        int b = 0;

        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());


            PreparedStatement ps = conn.prepareStatement("SELECT COUNT(ID_FOOD) FROM FOOD WHERE TYPE_FOOD = ? and ID_SIZE = ?"

            );
            ps.setString(1, type);
            ps.setString(2, size);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                 b=rs.getInt(1) + 1;
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
    public String getIDfromEmail(String email) {
        ArrayList<String> allusercontronl = new ArrayList<String>();
        String result=null;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            // crate statement
            Statement stmt = conn.createStatement();
            // get data from table 'student'
            PreparedStatement ps = conn.prepareStatement("select ID_ACCOUNT\n" +
                    "from account\n" +
                    "where EMAIL and ID_SIZE = ?"  );
            ps.setString(1,  email);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                result=rs.getString(1) ;
            }
            conn.close();

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
    public void deletaFood(String idf, String size) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement("DELETE FROM FOOD " +
                    "WHERE ID_FOOD = ? AND ID_SIZE =?");
            ps.setString(1,idf);
            ps.setString(2,size);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }

    public User getUserById(String Uid) {
        User user = new User();
        {
            try {
                Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
                PreparedStatement a = conn.prepareStatement(
                        "SELECT account.ID_ACCOUNT, PHONE_NUMBER , USER_NAMES ,ID_ADDRESS FROM  account JOIN user_information ON account.ID_USER = user_information.ID_USER WHERE ID_ACCOUNT = ?");
                a.setString(1,Uid);
                ResultSet rs = a.executeQuery();
                while (rs.next()) {
                    user.setIdacc(rs.getString(1));
                    user.setPhoneNumber(rs.getString(2));
                    user.setName(rs.getString(3));
                    user.setIDadress(rs.getString(4));
                }
                conn.close();

            } catch (Exception ex) {
                ex.printStackTrace();
            }


        }
        return user;
    }

    public int upReset_password( String ID_ACCOUNT, String hash) {
        int Y = 0;
        java.sql.Timestamp  intime = new java.sql.Timestamp(new
                java.util.Date().getTime());
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(intime.getTime());
        cal.add(Calendar.MINUTE, 20);
        java.sql.Timestamp  exptime = new Timestamp(cal.getTime().getTime());

        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            Statement stmt = conn.createStatement();
            String query= "insert into reset_password(ID_ACCOUNT,Hash_Code,Exptime,Datetime)Value ("+ID_ACCOUNT+","+hash+","+exptime+","+intime+")" ;
         

         Y= stmt.executeUpdate(query);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return Y;

    }
    public static void main(String[] args) {
//        useService u = new useService();
//        System.out.println(u.checkIDFOOD("CƠM GÀ","SIZE1"));
    }


}

