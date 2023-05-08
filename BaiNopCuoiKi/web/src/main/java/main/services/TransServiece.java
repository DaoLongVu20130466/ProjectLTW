package main.services;

import main.bean.Products;
import main.bean.Trans;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TransServiece {
    private static TransServiece instance;

    public static TransServiece getInstance() {
        if (instance == null) {
            instance = new TransServiece();
        }
        return instance;
    }
    public Trans getTranById(String id){
        return new Trans(id);
    }
    public void removeTran(String id){
        new Trans(id).deleteTran(id);
    }
    public ArrayList<Trans> getallTrans(){
        return new Trans().getAll();
    }
}
