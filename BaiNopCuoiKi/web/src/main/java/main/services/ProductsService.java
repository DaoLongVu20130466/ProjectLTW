package main.services;

import com.sun.org.apache.bcel.internal.generic.Select;
import main.bean.*;
<<<<<<< Updated upstream
import main.db.JDBIConnector;
=======
import main.bean.products;
>>>>>>> Stashed changes

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ProductsService {
    private static ProductsService instance;
    private Map<Products, String> product = new HashMap<Products, String>();
    private List<Products> allproducts = new ArrayList<>();


    public static ProductsService getInstance() {
        if (instance == null) {
            instance = new ProductsService();
        }
        return instance;
    }

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
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            Statement stmt = conn.createStatement();

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
            }

            // close connection
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProduct;
    }

<<<<<<< Updated upstream
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
