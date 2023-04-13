package main.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnectMysqlExample {
    private static String DB_URL = "jdbc:mysql://localhost:3306/shopdoan";
    private static String USER_NAME = "root";
    private static String PASSWORD = "";

    public static String getDbUrl() {
        return DB_URL;
    }

    public static String getUserName() {
        return USER_NAME;
    }

    public static String getPASSWORD() {
        return PASSWORD;
    }

    public static void main(String args[]) {
        try {
            // connnect to database 'testdb'
            Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
            // crate statement
            Statement stmt = conn.createStatement();
            // get data from table 'student'
            ResultSet rs = stmt.executeQuery("select ID_ACCOUNT , USERS from account");
            // show data
            while (rs.next()) {
                System.out.println(rs.getString(1) + "  " + rs.getString(2));
            }
            // close connection
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }



    public static Connection getConnection(String dbURL, String userName,
                                           String password) {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, userName, password);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return conn;
    }


}