package main.bean;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;

public class Cart implements Serializable {

    HashMap<String, Products> data;
    User customer;
    long total;
    int quantity;


    public Cart() {
        data = new HashMap<>();
        customer = new User();
        total = 0;
        quantity = 0;
    }

    public Cart(User customer, long total, int quantity) {
        data = new HashMap<>();
        this.customer = customer;
        this.total = total;
        this.quantity = quantity;
    }

    public HashMap<String, Products> getData() {
        return data;
    }

    public void put(Products p) {
        if (data.containsKey(p.getID_food())) {
            Products p1 = data.get(p.getID_food());
            p1.setQuantity(p1.getQuantity() + 1);
            data.put(p.getID_food(), p1);
        } else {
            data.put(p.getID_food(), p);

        }
        updateTotalMoneyAndQuantity();
    }

    public void put(String key, int quantity) {
        if (data.containsKey(key)) {
            Products p1 = data.get(key);
            p1.setQuantity(quantity);
            data.put(key, p1);
        }
        updateTotalMoneyAndQuantity();
    }

    public void update(Products p) {
        if (data.containsKey(p.getID_food())) {
            data.put(p.getID_food(), p);
        }
        updateTotalMoneyAndQuantity();
    }

    public Collection<Products> getListProduct(){
        return data.values();
    }

    public void remove(String key) {
        data.remove(key);
        updateTotalMoneyAndQuantity();
    }

    public int getQuantity() {
        return quantity;
    }

    public long getTotal() {
        return total;
    }

    private void updateTotalMoneyAndQuantity() {
        total = 0;
        quantity = 0;
        for (Products p : data.values()) {
            total += p.getQuantity() * p.getPrice();
            quantity += p.getQuantity();
        }
    }
}
