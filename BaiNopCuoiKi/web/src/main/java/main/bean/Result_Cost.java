package main.bean;

public class Result_Cost {
    String id_Trans;
    String id_Food;
    int quantity;

    public Result_Cost(String id_Trans, String id_Food, int quantity) {
        this.id_Trans = id_Trans;
        this.id_Food = id_Food;
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Result_Cost{" +
                "id_Trans='" + id_Trans + '\'' +
                ", id_Food='" + id_Food + '\'' +
                ", quantity=" + quantity +
                '}';
    }
}
