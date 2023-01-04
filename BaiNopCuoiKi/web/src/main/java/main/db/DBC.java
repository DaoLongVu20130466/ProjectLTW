package main.db;

import main.bean.Products;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static main.db.ConnectMysqlExample.getConnection;

public class DBC {
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
    public List<Products> getAllProducts(){
        List<Products> list = new ArrayList<>();
        try {
            // connnect to database 'testdb'
            Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
            // crate statement
            Statement stmt = conn.createStatement();
            // get data from table 'student'
            ResultSet rs = stmt.executeQuery("select *  from FOOD");
            // show data
            while (rs.next()){
                list.add(new Products(
                        rs.getString(1), rs.getString(2),rs.getString(3),
                        rs.getInt(4), rs.getString(5), rs.getInt(6),
                        rs.getString(7),rs.getBoolean(8), rs.getString(9),
                        rs.getString(10), rs.getString(11),rs.getString(12)
                ));

            }
            conn.close();

        }
        catch (Exception e){

        }
        return list;

    }

    public static void main(String[] args) {
        DBC dbc = new DBC();
        List<Products> list = dbc.getAllProducts();
        for (Products o : list) {
            System.out.println(o);
            
        }
    }
}
