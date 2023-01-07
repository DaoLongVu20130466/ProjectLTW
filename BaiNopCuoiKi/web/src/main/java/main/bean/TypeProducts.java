package main.bean;

public class TypeProducts {
    String idType;
    String nameType;

    public TypeProducts(String idType, String nameType) {
        this.idType = idType;
        this.nameType = nameType;
    }

    public String getIdType() {
        return idType;
    }

    public String getNameType() {
        return nameType;
    }

    public void setIdType(String idType) {
        this.idType = idType;
    }

    public void setNameType(String nameType) {
        this.nameType = nameType;
    }
}
