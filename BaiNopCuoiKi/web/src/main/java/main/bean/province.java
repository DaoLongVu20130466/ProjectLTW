package main.bean;

public class province {
    int ProvinceID;
    String ProvinceName;

    public int getProvinceID() {
        return ProvinceID;
    }

    public String getProvinceName() {
        return ProvinceName;
    }

    @Override
    public String toString() {
        return "data{" +
                "ProvinceID=" + ProvinceID +
                ", ProvinceName='" + ProvinceName + '\'' +
                '}';
    }
}
