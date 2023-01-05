package main.services;

import main.bean.User;
import main.bean.Voucher;
import main.db.ConnectMysqlExample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class VoucherService {
    public static VoucherService instance;

    public static VoucherService getInstance() {
        if (instance == null) {
            instance = new VoucherService();
        }
        return instance;
    }
    public ArrayList<Voucher> getControlVoucher(){
        ArrayList<Voucher> rsl = new ArrayList<Voucher>();
        try{
        Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
        Statement stmt = conn.createStatement();
        // get data from table 'student'
        ResultSet rs = stmt.executeQuery("SELECT voucher.ID_VOUCHER, NAMES, CODE_VOUCHER, LoaiVoucher, VALUESS , START_DAY , FINISH_DAY FROM \n" +
                "loaivoucher join \n" +
                "voucher join \n" +
                "voucher_list \n" +
                "on voucher_list.ID_VOUCHER = voucher.ID_VOUCHER\n" +
                "on voucher.TYPE_VOUCHER = loaivoucher.TYPE_Voucher");
        // show data
        while (rs.next()) {
            Date start = new Date();
            rsl.add(new Voucher(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5),rs.getDate(6),rs.getDate(7)));
        }
        // close connection
        conn.close();
    } catch (Exception ex) {
        ex.printStackTrace();
    }
        return rsl;
    }

    public void deleteVoucher(String vcID){
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement stmt = conn.prepareStatement("DELETE FROM \n" +
                    "voucher  \n" +
                    "WHERE voucher.ID_VOUCHER = ? ");
            stmt.setString(1,vcID);
            PreparedStatement stmt2 = conn.prepareStatement("DELETE FROM \n" +
                    "voucher_list   \n" +
                    "WHERE voucher_list.ID_VOUCHER = ?");
            stmt2.setString(1,vcID);
            stmt.execute();
            stmt2.execute();
            conn.close();
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }

    }
    public void addVoucher(String vcCode , String vcNames , int type , int values , String dayStart , String dayend ){
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO voucher(ID_VOUCHER,CODE_VOUCHER,TYPE_VOUCHER, VALUESS , NAMES)\n" +
                    "VALUES (?,?,?,?,?)");
            stmt.setString(1,vcCode);
            stmt.setString(2,vcCode);
            stmt.setInt(3,type);
            stmt.setInt(4,values);
            stmt.setString(5,vcNames);
            PreparedStatement stmt2 = conn.prepareStatement("INSERT INTO voucher_list(ID,ID_VOUCHER,START_DAY,FINISH_DAY)\n" +
                    "VALUES (?,?,?,?)");
            stmt2.setString(1,vcCode);
            stmt2.setString(2,vcCode);
            stmt2.setString(3,dayStart);
            stmt2.setString(4,dayend);
            stmt.execute();
            stmt2.execute();
        }
        catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public static void main(String[] args) {
        ArrayList<Voucher> s = VoucherService.getInstance().getControlVoucher();
        for (Voucher item: s) {
            System.out.println(item.toString());

        }
    }
}
