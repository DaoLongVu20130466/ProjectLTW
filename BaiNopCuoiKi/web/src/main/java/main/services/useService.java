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

            String query= "select USERS, PASS, acc.ID_USER, IS_BLOCK,USER_NAMES\n" +
                    "FROM account  acc join user_information us on us.ID_USER=acc.ID_USER \n" +
                    "WHERE USERS=? AND PASS=?";
         PreparedStatement a= conn.prepareStatement(query);
         a.setString(1,username);
         a.setString(2,password);
           ResultSet rs=a.executeQuery();
            while (rs.next()){
                User use =new User(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5));
                return use;
            }


        } catch (Exception ex) {
            ex.printStackTrace();
        }


        return null;
    }





}

