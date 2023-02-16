package main.bean;

import java.io.Serializable;

public class Address implements Serializable {
    String Idadress;
    String commune;
    String district;
    String provine;
    String adressDeail;

    public Address(String idadress, String commune, String district, String provine, String adressDeail) {
        Idadress = idadress;
        this.commune = commune;
        this.district = district;
        this.provine = provine;
        this.adressDeail = adressDeail;
    }

    public Address() {
    }

    public void setIdadress(String idadress) {
        Idadress = idadress;
    }

    public void setCommune(String commune) {
        this.commune = commune;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public void setProvine(String provine) {
        this.provine = provine;
    }

    public void setAdressDeail(String adressDeail) {
        this.adressDeail = adressDeail;
    }

    public String getIdadress() {
        return Idadress;
    }

    public String getCommune() {
        return commune;
    }

    public String getDistrict() {
        return district;
    }

    @Override
    public String toString() {
        return  commune + ',' +  district + ',' +provine + ',' + adressDeail ;
    }

    public String getProvine() {
        return provine;
    }

    public String getAdressDeail() {
        return adressDeail;
    }
}
