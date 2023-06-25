package main.services;

import main.bean.Log;
import main.controller.LogController;
import main.db.ConnectMysqlExample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class LogService {
    private static LogService instance;
    public static LogService getInstance() {
        if (instance == null) {
            instance = new LogService();
        }
        return instance;
    }
    public ArrayList<Log> getAlllog(){
        LogController logController = new LogController();
        return logController.getLog();
    }
    public void clearLog(String id){
        Log.getInstance().DeleteLog(id);
    }
    public void clearAllLog(){
        Log.getInstance().DeleteAllLog();
    }
}
