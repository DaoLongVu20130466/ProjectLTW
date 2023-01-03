package main.services;
import main.db.ConnectMysqlExample;
import main.bean.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class useService {
    private static useService instance;
    private useService() {

    }
    private List<User> alluser ;
    public static useService getInstance() {
        if (instance == null) {
            instance = new useService();
        }
        return instance;
    }
    public List<User> getAllUser() {
        try {
        Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
        // crate statement
        Statement stmt = conn.createStatement();
        // get data from table 'student'
        ResultSet rs = stmt.executeQuery("select ID_ACCOUNT , USERS from account");
        // show data
        while (rs.next()) {
            System.out.println(rs.getString(1) + "  " + rs.getString(2));
        }
        // close connection
        conn.close();
    } catch (Exception ex) {
        ex.printStackTrace();
    }
//        return JDBIConnector.get().withHandle(h ->
//                h.createQuery("select * from a")
//                        .mapToBean(User.class)
//                        .stream()
//                        .collect(Collectors.toList())
//        );
        return null;
    }


}

