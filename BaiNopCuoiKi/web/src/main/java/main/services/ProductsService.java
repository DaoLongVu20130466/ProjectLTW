package main.services;

import main.bean.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ProductsService {
    private static ProductsService instance;
    private Map<Products, String> product = new HashMap<Products, String>();
    private List<Products> allproducts = new ArrayList<>();

    private ProductsService() {
        getAllProducts();
    }

    public static ProductsService getInstance() {
        if (instance == null) {
            instance = new ProductsService();
        }
        return instance;
    }

    public void getAllProducts() {
//        allproducts = JDBIConnector.get().withHandle(h ->
//                h.createQuery("select id,productsname , logo, value, type from producst")
//                        .mapToBean(Products.class)
//                        .stream()
//                        .collect(Collectors.toList())
//        );
    }

    public List<Products> getAllproducts() {
        return allproducts;
    }

    public List<Products> getProductByAttb(String Atb) {
//        List<Products> rs = JDBIConnector.get().withHandle(handle ->
//                handle.createQuery("select id,productsname , logo, value, type from producst where type = ?")
//                        .bind(0, Atb)
//                        .mapToBean(Products.class)
//                        .collect(Collectors.toList())
//        );
        return null;
    }
}
