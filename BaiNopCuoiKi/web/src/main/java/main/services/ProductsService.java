package main.services;

<<<<<<< Updated upstream
import com.sun.org.apache.bcel.internal.generic.Select;
import main.bean.*;
<<<<<<< Updated upstream
import main.db.JDBIConnector;
=======
import main.bean.products;
>>>>>>> Stashed changes
=======
import main.bean.Products;
import main.db.ConnectMysqlExample;
>>>>>>> Stashed changes

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class ProductsService {
    private static ProductsService instance;
<<<<<<< Updated upstream
    private Map<Products, String> product = new HashMap<Products, String>();
    private List<Products> allproducts = new ArrayList<>();

=======
    private ProductsService() {

    }
>>>>>>> Stashed changes

    public static ProductsService getInstance() {
        if (instance == null) {
            instance = new ProductsService();
        }
        return instance;
    }

<<<<<<< Updated upstream
<<<<<<< Updated upstream
    public void getAllProducts() {
        allproducts = JDBIConnector.get().withHandle(h ->
                h.createQuery("select id,productsname , logo, value, type from producst")
                        .mapToBean(Products.class)
                        .stream()
                        .collect(Collectors.toList())
        );
    }

=======
>>>>>>> Stashed changes
    public List<Products> getAllproducts() {
        ArrayList<Products> allProduct = new ArrayList<Products>();
        try {
=======
    public List<Products> getAllproducts() {

        ArrayList<Products> allProduct = new ArrayList<Products>();
        try {

>>>>>>> Stashed changes
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            Statement stmt = conn.createStatement();

<<<<<<< Updated upstream
            ResultSet rs = stmt.executeQuery("SELECT ID_FOOD, FOOD_NAME ,LISTED_PRICE, L_IMG FROM `food`\n" +
                    "WHERE food.ID_SIZE=\"SIZE1\""

            )
            while (rs.next()) {
                String id = rs.getString(1);
                String foodName = rs.getString(2);
                int price = rs.getInt;
                String Path = rs.getString(4);
                Strign status = rs.getString(5);
                allProduct.add(new Products(id, foodName, price, Path, status));
=======
            ResultSet rs = stmt.executeQuery("SELECT ID_FOOD, FOOD_NAME ,LISTED_PRICE, L_IMG, STATUSS FROM `food`\n" +
                    "WHERE food.ID_SIZE=\"SIZE1\"\n"

            );
            while (rs.next()) {
                String id = rs.getString(1);
                String foodName = rs.getString(2);
                int price = rs.getInt(3);
                String Path = rs.getString(4);
                String status = rs.getString(5);
                allProduct.add(new Products(id, foodName,price,Path, status));
>>>>>>> Stashed changes
            }

            // close connection
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProduct;
    }

<<<<<<< Updated upstream
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
    public List<Products> getProductByAttb(String Atb) {
        List<Products> rs = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select id,productsname , logo, value, type from producst where type = ?")
                        .bind(0, Atb)
                        .mapToBean(Products.class)
                        .collect(Collectors.toList())
        );
        return rs;
    }
=======
}


>>>>>>> Stashed changes
}
