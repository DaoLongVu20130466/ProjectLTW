package main.services;
import main.bean.Image;
import main.bean.Products;
import main.db.ConnectMysqlExample;
import main.bean.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

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

            PreparedStatement ps = conn.prepareStatement("DELETE FROM favourites " +
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
            ResultSet rs = stmt.executeQuery("SELECT id,userid , phone,pro,sodon,sts from\n" +
                    "                                        (SELECT accounts.ID_USER as id, \n" +
                    "                    USER_NAMES as userid ,\n" +
                    "                    PHONE_NUMBER as phone,\n" +
                    "                    PROVINCE as pro,\n" +
                    "                    IS_BLOCK as sts\n" +
                    "                    FROM accounts\n" +
                    "                    join user_information\n" +
                    "                    join addresses\n" +
                    "                    on addresses.ID_ADDRESS = user_information.ID_ADDRESS\n" +
                    "                                        on user_information.ID_USER = accounts.ID_USER) as bangtam\n" +
                    "                                        left join\n" +
                    "                                        (SELECT ID_ACCOUNT as acc, COUNT(ID_ACCOUNT) as sodon from order_account_details \n" +
                    "                                        GROUP BY ID_ACCOUNT) as bangphu on bangtam.id = bangphu.acc");
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
        String query="SELECT user_information.USER_NAMES ,\n" +
                "                    addresses.PROVINCE , user_information.PHONE_NUMBER, accounts.STATUSS, accounts.AVATAR,accounts.EMAIL, accounts.ID_ACCOUNT \n" +
                "                    FROM  accounts join  (user_information JOIN addresses \n" +
                "                    on user_information.ID_ADDRESS = addresses.ID_ADDRESS)  on  \n" +
                "                    accounts.ID_USER = user_information.ID_USER\n" +
                "                    WHERE user_information.ID_USER = ?";

        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());


            PreparedStatement ps = conn.prepareStatement("SELECT user_information.USER_NAMES , " +
                    "addresses.PROVINCE , user_information.PHONE_NUMBER, accounts.STATUSS, accounts.AVATAR,accounts.EMAIL, accounts.ID_ACCOUNT \n" +
                    "FROM  accounts join  (user_information JOIN addresses " +
                    "on user_information.ID_ADDRESS = addresses.ID_ADDRESS)  on  " +
                    "accounts.ID_USER = user_information.ID_USER\n" +
                    "WHERE user_information.ID_USER = ?");
            ps.setString(1, iduser);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String userName = rs.getNString(1);
                String province = rs.getNString(2);
                String phoneNumber = rs.getString(3);
                String status = rs.getNString(4);
                String avatar = rs.getString(5);
                String email = rs.getString(6);
                String idAcc = rs.getString(7);
                return new User(userName, province, phoneNumber, status, avatar, email, idAcc);
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
            PreparedStatement stmt = conn.prepareStatement("UPDATE accounts SET IS_BLOCK = 1 WHERE ID_ACCOUNT = ?");
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
            PreparedStatement stmt = conn.prepareStatement("UPDATE accounts SET EMAIL = ? WHERE ID_USER = ?");
            stmt.setString(1, email);

            stmt.setString(2, uid);

            PreparedStatement stmt2 = conn.prepareStatement("UPDATE user_information us join addresses ad on us.ID_ADDRESS=ad.ID_ADDRESS SET PROVINCE = ? , PHONE_NUMBER= ? , USER_NAMES =? WHERE ID_USER = ?");
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
            PreparedStatement stmt = conn.prepareStatement("UPDATE accounts SET AVATAR = ? WHERE ID_USER = ?");
            stmt.setString(1, link);

            stmt.setString(2, uid);


            stmt.execute();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public  boolean isWithin15Minutes(long savedTimeMillis) {
        long currentTimeMillis = System.currentTimeMillis();
        long difference = currentTimeMillis - savedTimeMillis;
        long fifteenMinutesMillis = 15 * 60 * 1000;
        return difference <= fifteenMinutesMillis;
    }
    public String checkRSP(String hash) {
        String result=null;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            Statement stmt = conn.createStatement();
            // get data from table 'student'
            PreparedStatement ps = conn.prepareStatement("SELECT ID_ACCOUNT,Exptime FROM reset_password WHERE Hash_Code=?"  );
            ps.setString(1,hash);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                String id = rs.getString(1);
                long exptime = rs.getLong(2);
                if(useService.getInstance().isWithin15Minutes(exptime)){
                    result=id ;
                }
            }
            conn.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return result;
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
                PreparedStatement stmt = conn.prepareStatement("UPDATE accounts SET IS_BLOCK = 0 WHERE ID_ACCOUNT = ?");
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
                    "from accounts";
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

    public int checkIDFOOD() {
        Random random = new Random();
        int rd = random.nextInt(1000000000);
        int b = 0;

        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());


            PreparedStatement ps = conn.prepareStatement("SELECT COUNT(ID_FOOD) FROM FOOD"

            );
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b=rs.getInt(1) + rd;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return b;

    }
    public int checkIDIMG() {
        int b = 0;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement ps = conn.prepareStatement("SELECT COUNT(ID_IMG) FROM image "
            );
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b=rs.getInt(1) + 1;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return b;
    }
    public int checkIDIMG2() {
        int b = 0;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement ps = conn.prepareStatement("SELECT COUNT(ID_IMG) FROM image "
            );
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b=rs.getInt(1) + 2;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return b;
    }
    public int checkIDIMG3() {
        int b = 0;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement ps = conn.prepareStatement("SELECT COUNT(ID_IMG) FROM image "
            );
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b=rs.getInt(1) + 3;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return b;
    }
    public int checkIDIMG4() {
        int b = 0;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement ps = conn.prepareStatement("SELECT COUNT(ID_IMG) FROM image "
            );
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b=rs.getInt(1) + 4;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return b;
    }


    public void registry(String username, String password, String email, String phone) {

        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            // crate statement
            String idacconut="ACC"+useService.getInstance().checkIDaccount();
            String idUSER="USER"+useService.getInstance().checkIDaccount();
            String query1= "INSERT INTO keyrsa (ID_Key,KeyRSA,status,time_active,ID_USER) VALUES(?,?,?,?,?)";
            PreparedStatement x= conn.prepareStatement(query1);
            x.setString(1,idUSER+"key");
            x.setString(2,"");
            x.setString(3,"Chưa Tạo");
            x.setString(4,"");
            x.setString(5,"idUSER");
            x.executeUpdate();
            String query2= "INSERT INTO user_information (ID_USER,USER_NAMES,PHONE_NUMBER,ID_ADDRESS) VALUES(?,?,?,?)";
            PreparedStatement b= conn.prepareStatement(query2);
            b.setString(1,idUSER);
            b.setString(2,username);
            b.setString(3,phone);
            b.setString(4,"ADD1");
            b.executeUpdate();
            String query= "INSERT INTO accounts (ID_ACCOUNT,USERS,PASS,ID_USER,STATUSS,IS_BLOCK,EMAIL,AVATAR) VALUES(?,?,?,?,'HOẠT ĐỘNG',0,?,'img/cupvangWC.jpg')";

            PreparedStatement a= conn.prepareStatement(query);
            a.setString(1,idacconut);
            a.setString(2,username);
            a.setString(3,password);
            a.setString(4,idUSER);
            a.setString(5,email);
            a.executeUpdate();

            String query4= "INSERT INTO role (ID_USER,ROLE,ROLE_NAME)  VALUES(?,?,'USER')";
            PreparedStatement d= conn.prepareStatement(query4);
            d.setString(1,idUSER);
            d.setInt(2,0);
            d.executeUpdate();
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
                    "from accounts");
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
                    "from accounts");
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
                    "from accounts \n" +
                    "where EMAIL = ?"  );
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

    public void doimk2(String userId, String newpassword) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            // crate statement
            String idacconut="ACC"+useService.getInstance().checkIDaccount();
            String idUSER="USER"+useService.getInstance().checkIDaccount();
            String idadres="ADD"+useService.getInstance().checkIDaccount();
            String query= "UPDATE accounts\n" +
                    "SET PASS = ? \n" +
                    "WHERE ID_ACCOUNT = ?";
            PreparedStatement a= conn.prepareStatement(query);
            a.setString(1,newpassword);
            a.setString(2,userId);

            a.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }


    }

    public void doimk(String userId, String newpassword) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            // crate statement
            String idacconut="ACC"+useService.getInstance().checkIDaccount();
            String idUSER="USER"+useService.getInstance().checkIDaccount();
            String idadres="ADD"+useService.getInstance().checkIDaccount();
            String query= "UPDATE accounts\n" +
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
    public void deletaFood(String idf) {
        ArrayList<Image> list = ProductsService.getInstance().getImgEdit(idf);
        ArrayList<Image> list2 = ProductsService.getInstance().getImgCmt(idf);
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement("DELETE FROM food " +
                    "WHERE food.ID_FOOD = ? ");
            ps.setString(1,idf);
            ps.executeUpdate();
            PreparedStatement ps1 = conn.prepareStatement("DELETE FROM price " +
                    "WHERE price.ID_FOOD = ? ");
            ps1.setString(1,idf);
            ps1.executeUpdate();

            PreparedStatement ps2 = conn.prepareStatement("DELETE FROM image_detail " +
                    "WHERE image_detail.ID_FOOD = ? ");
            ps2.setString(1,idf);
            ps2.executeUpdate();
            PreparedStatement ps3 = conn.prepareStatement("DELETE FROM size_details " +
                    "WHERE size_details.ID_FOOD = ? ");
            ps3.setString(1,idf);
            ps3.executeUpdate();

            PreparedStatement ps66 = conn.prepareStatement("DELETE FROM comment " +
                    "WHERE comment.ID_FOOD = ? ");
            ps66.setString(1,idf);
            ps66.executeUpdate();

            for (Image image:list) {
                String idimg= image.getId();
                PreparedStatement ps4 = conn.prepareStatement("DELETE FROM image " +
                        "WHERE image.ID_IMG = ? ");
                ps4.setString(1,idimg);
                ps4.executeUpdate();
            }
            for (Image image:list2) {
                String idimg2= image.getId();
                PreparedStatement ps5 = conn.prepareStatement("DELETE FROM image " +
                        "WHERE image.ID_IMG = ? ");
                ps5.setString(1,idimg2);
                ps5.executeUpdate();
            }
        }catch (Exception e){

        }
    }

    public void deleteCmt(String idf) {
        ArrayList<Image> list2 = ProductsService.getInstance().getImgCmt2(idf);


        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps66 = conn.prepareStatement("DELETE FROM comment " +
                    "WHERE comment.ID = ? ");
            ps66.setString(1,idf);
            ps66.executeUpdate();

            for (Image image:list2) {
                String idimg2= image.getId();
                PreparedStatement ps5 = conn.prepareStatement("DELETE FROM image " +
                        "WHERE image.ID_IMG = ? ");
                ps5.setString(1,idimg2);
                ps5.executeUpdate();
            }

        }catch (Exception e){

        }
    }


    public User getUserById(String Uid) {
        User user = new User();
        {
            try {
                Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
                PreparedStatement a = conn.prepareStatement(
                        "SELECT accounts.ID_ACCOUNT, PHONE_NUMBER , USER_NAMES ,ID_ADDRESS FROM  accounts JOIN user_information ON accounts.ID_USER = user_information.ID_USER WHERE ID_ACCOUNT = ?");
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
    public ArrayList<User> getComment(String idf ) {
        ArrayList<User> cmt = new ArrayList<User>();

        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            // crate statement
            Statement stmt = conn.createStatement();
            // get data from table 'student'
            PreparedStatement ps = conn.prepareStatement("SELECT accounts.AVATAR, user_information.USER_NAMES, `comment`.CMT,image.SRC,`comment`.ID, user_information.ID_USER \n" +
                    "FROM (`comment` JOIN ( accounts JOIN user_information on accounts.ID_USER = user_information.ID_USER)\n" +
                    " ON `comment`.ID_ACCOUNT = accounts.ID_ACCOUNT ) LEFT JOIN image ON `comment`.ID_IMG = image.ID_IMG\n" +
                    "WHERE `comment`.ID_FOOD =?" +
                    "LIMIT 5 OFFSET 0"  );
            ps.setString(1,  idf);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cmt.add(new User(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getNString(3),
                        rs.getNString(4),
                        rs.getInt(5),
                        rs.getNString(6))
                );
            }
            conn.close();

            // close connection

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return cmt;
    }

    public int upReset_password( String ID_ACCOUNT, String hash) {
        int Y = 0;
        long expiryTime = System.currentTimeMillis() + 15 * 60 * 1000;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            Statement stmt = conn.createStatement();
            String query= "INSERT INTO reset_password(ID_ACCOUNT,Hash_Code,Exptime)Values (?,?,?)" ;

            PreparedStatement a= conn.prepareStatement(query);
            a.setString(1,ID_ACCOUNT);
            a.setString(2,hash);
            a.setLong(3,expiryTime);
             a.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return Y;

    }
    public static void main(String[] args) {
        System.out.println( useService.getInstance().upReset_password("dfdf","dfdf"));

    }


}

