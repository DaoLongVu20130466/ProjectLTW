package main.bean;

import main.db.ConnectMysqlExample;
import main.services.AdressService;
import main.services.AppService;
import main.services.OderService;

import java.sql.*;
import java.util.ArrayList;

public class Log {
    int id;
    int level;
    String Id_User;
    String src;
    String content;
    Timestamp date;
    String status;
    static Log instance;

    public static Log getInstance() {
        if (instance == null) {
            instance = new Log();
        }
        return instance;
    }
    public Log() {

    }


    public Log(int id, int level, String id_User, String src, String content, Timestamp date, String status) {
        this.id = id;
        this.level = level;
        Id_User = id_User;
        this.src = src;
        this.content = content;
        this.date = date;
        this.status = status;
    }

    public Log(int level, String id_User, String src, String content, String status) {
        this.level = level;
        Id_User = id_User;
        this.src = src;
        this.content = content;
        this.status = status;
    }



    public int getId() {
        return id;
    }

    public String getLevel() {
        switch (this.level){
            case 0:
                return "Infomation";
            case 1:
                return "Warning";
            case 2:
                return "Threat";
            case 3:
                return "Dangger";
            case 4:
                return "Critically ";
            default:
                return "Unknow";
        }
    }

    public String getId_User() {
        return Id_User;
    }

    public String getSrc() {
        return src;
    }

    public String getContent() {
        return content;
    }

    public Timestamp getDate() {
        return date;
    }

    public String getStatus() {
        return status;
    }

    public static void writeLog( int level,String user, String src, String content, String status) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement ps = conn.prepareStatement("INSERT INTO log (LEVEL_LOG, ID_USER, SRC_LOG, CONTENT,CREATE_AT, STATUS_LOG)" +
                    "VALUES (?, ?, ?, ?,?,?)");
            ps.setInt(1, level);
            ps.setString(2, user);
            ps.setString(3, src);
            ps.setString(4, content);
            ps.setTimestamp(5, AppService.getNow());
            ps.setString(6, status);
            ps.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void DeleteLog(String id){
        {
            try {
                Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
               PreparedStatement prmt = conn.prepareStatement("DELETE FROM log WHERE ID_LOG = ?");
                prmt.setString(1,id);
                prmt.execute();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }
    public void DeleteAllLog(){
        {
            try {
                Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
                PreparedStatement prmt = conn.prepareStatement("DELETE FROM log ");
                prmt.execute();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }

}
