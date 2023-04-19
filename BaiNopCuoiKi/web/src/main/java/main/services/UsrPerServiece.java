package main.services;

import main.bean.User;
import main.bean.UserPemission;

import java.util.List;

public class UsrPerServiece {
    public static UsrPerServiece instance;

    public static UsrPerServiece getInstance() {
        if (instance == null) {
            instance = new UsrPerServiece();
        }
        return instance;
    }
    public UserPemission getInforbyUid( String UID){
        return new UserPemission(UID);
    }
    public void upDaterole(String roleId , String targetID){
        UserPemission target = new UserPemission(targetID);
        target.updateRole(roleId);

    }
}
