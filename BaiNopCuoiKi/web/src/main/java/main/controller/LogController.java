package main.controller;


import main.bean.Log;
import main.bean.Products;
import main.db.ConnectMysqlExample;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class LogController {
    ArrayList<Log> log =getAllLog();
    public static ArrayList<Log> getAllLog(){
        ArrayList<Log> rsl = new ArrayList<>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT ID_LOG, LEVEL_LOG, ID_USER, SRC_LOG, CONTENT,CREATE_AT,STATUS_LOG FROM log ");
            while (rs.next()) {
                rsl.add(new Log(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getTimestamp(6),
                        rs.getString(7)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return rsl;
    }

    public LogController() {
    }

    public ArrayList<Log> getLog() {
        return log;
    }
}
