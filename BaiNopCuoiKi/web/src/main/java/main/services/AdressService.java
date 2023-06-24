package main.services;

import main.bean.Address;
import main.bean.Products;
import main.db.ConnectMysqlExample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdressService {

    private static AdressService instance;
    public static AdressService getInstance() {
        if (instance == null) {
            instance = new AdressService();
        }
        return instance;
    }

    public Address getAdressByOderId(String oderId){
        {
            Address address = new Address();
            try {
                Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

                PreparedStatement ps = conn.prepareStatement("SELECT addresses.ID_ADDRESS , COMMUNE , DISTRICT , PROVINCE , ADDRESS_DETAILS from addresses JOIN orders on orders.ID_ADDRESS = addresses.ID_ADDRESS WHERE ID_ORDER = ?");

                ps.setString(1,oderId);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    address.setIdadress(rs.getString(1));
                    address.setCommune(rs.getString(2));
                    address.setDistrict(rs.getString(3));
                    address.setProvine(rs.getString(4));
                    address.setAdressDeail(rs.getString(5));
                }
                conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return address;
        }

    }
}
