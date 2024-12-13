package main.services;

import main.bean.Key;
import main.db.ConnectMysqlExample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class keyService {
    public static keyService instance;

    public static keyService getInstance() {
        if (instance == null) {
            instance = new keyService();
        }
        return instance;
    }
    public Key getKey(String iduser) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());


            PreparedStatement ps = conn.prepareStatement("SELECT keyrsa.ID_key,keyrsa.KeyRSA,keyrsa.status,keyrsa.time_active"+

                    "FROM keyrsa " +
                    "WHERE ID_USER = ?");
            ps.setString(1, iduser);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String idKey = rs.getNString(1);
                String Key = rs.getNString(2);
                String status = rs.getString(3);
                String timeactive = rs.getNString(4);

                return new Key(idKey,Key,status,timeactive);
            }
            // close connection
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

}
