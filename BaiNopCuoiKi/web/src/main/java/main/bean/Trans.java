package main.bean;

import main.db.ConnectMysqlExample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Trans {
    String id;
    String note;
    String place;
    int tax;
    Date dayImport;
    int status;

    Map<String, Integer> map = new HashMap<String, Integer>();

    public Trans( String id) {
        getTranById(id);
        this.map = getProducTran(id);
    }

    public Trans() {
    }

    public void getTranById(String id){
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement stmt = conn.prepareStatement("SELECT ID_TranS,Note, Place_Prod, Tax_ID ,DayImport, Status FROM import_trans WHERE ID_TranS = ?");
            stmt.setString(1,id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
               this.id = rs.getString(1);
               this.note = rs.getString(2);
               this.place = rs.getString(3);
               this.tax = rs.getInt(4);
               this.dayImport = rs.getDate(5);
               this.status = rs.getInt(6);
            }
            // close connection
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
    public HashMap<String,Integer> getProducTran(String id){
        HashMap<String,Integer> rsl = new HashMap<String,Integer>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement stmt = conn.prepareStatement("SELECT ID_TranS,ID_FOOD, QUANTITY FROM i_transdetail WHERE ID_TranS = ? ");
            stmt.setString(1,id);
            ResultSet rs = stmt.executeQuery();;
            while (rs.next()) {
                rsl.put(rs.getString(2),rs.getInt(3));
            }
            // close connection
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return rsl;
    }
    // 	;
    public void deleteTran(String id){
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement stmt = conn.prepareStatement("DELETE t1, t2 FROM i_transdetail as t2 JOIN import_trans as t1 on t1.ID_Trans = t1.ID_TranS  WHERE t1.ID_Trans = ? ");
            stmt.setString(1,id);
            stmt.executeQuery();
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Trans> getAll() {
        ArrayList<Trans> rsl = new ArrayList<Trans>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("SELECT ID_TranS FROM import_trans");;
            while (rs.next()) {
                rsl.add(new Trans(rs.getString(1)));
            }

            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return rsl;
    }
    public int getTotalProduct(){
        int count= 0;
        for (Map.Entry<String, Integer> entry : map.entrySet()) {
            count+= entry.getValue();
        }
        return count ;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public int getTax() {
        return tax;
    }

    public void setTax(int tax) {
        this.tax = tax;
    }

    public Date getDayImport() {
        return dayImport;
    }

    public void setDayImport(Date dayImport) {
        this.dayImport = dayImport;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Map<String, Integer> getMap() {
        return map;
    }

    public void setMap(Map<String, Integer> map) {
        this.map = map;
    }
}
