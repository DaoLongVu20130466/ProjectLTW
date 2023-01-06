package main.services;

import main.bean.*;
import main.db.ConnectMysqlExample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public OderCart getProductByOderID(String oderId){
        {
            {
               OderCart rsl = new OderCart();
                try {
                    Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

                    PreparedStatement ps = conn.prepareStatement("SELECT food.ID_FOOD , LISTED_PRICE, BASE_PRICE , order_details.QUANTITY  \n" +
                            "FROM order_details \n" +
                            "JOIN food \n" +
                            "on food.ID_FOOD = order_details.ID_FOOD  AND food.ID_SIZE = order_details.ID_SIZE\n" +
                            "WHERE ID_ORDER = ?    ");

                    ps.setString(1,oderId);
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {

                        rsl.setItem(new Products(rs.getString(1),rs.getInt(2),rs.getInt(3)));
                        rsl.setValue(rs.getInt(4));
                    }
                    conn.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                return rsl;
            }

        }
    }



    public static void main(String[] args) {
            System.out.println("");
    }
}