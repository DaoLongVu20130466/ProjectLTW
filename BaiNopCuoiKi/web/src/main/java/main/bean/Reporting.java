package main.bean;

import main.db.ConnectMysqlExample;
import main.services.AppService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static org.apache.commons.lang3.time.DateUtils.parseDate;

public class Reporting {
    Date ReportingDate;
    ArrayList<ResultIncome> daily_Income_Report = new ArrayList<ResultIncome>();
    ArrayList<Result_Cost> daily_Cost_Report = new ArrayList<Result_Cost>();

    public Reporting(String reportingDate) throws ParseException {
        ReportingDate = new SimpleDateFormat("yyyy-MM-dd").parse(reportingDate);
        this.daily_Income_Report = getRsIncome(this.ReportingDate);
        this.daily_Cost_Report = getRsCost(this.ReportingDate);

    }

    public ArrayList<ResultIncome> getRsIncome(Date reportingDate) {
        {
            ArrayList<ResultIncome> daily_Income_Report = new ArrayList<ResultIncome>();
            try {
                Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
                PreparedStatement stmt = conn.prepareStatement("SELECT order_account_details.ID_ACCOUNT , order_account_details.ID_ORDER FROM orders join order_account_details on orders.ID_ORDER = order_account_details.ID_ORDER WHERE ORDER_DATE = ?");
                stmt.setString(1, AppService.date_to_fomat("yyyy-MM-dd",this.getReportingDate()));
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    daily_Income_Report.add(new ResultIncome(rs.getString(1), rs.getString(2)));
                }
                // close connection
                conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return daily_Income_Report;
        }
    }

    public Date getReportingDate() {
        return ReportingDate;
    }

    public ArrayList<ResultIncome> getDaily_Income_Report() {
        return daily_Income_Report;
    }

    public ArrayList<Result_Cost> getDaily_Cost_Report() {
        return daily_Cost_Report;
    }

    public ArrayList<Result_Cost> getRsCost(Date reportingDate) {
        {
            ArrayList<Result_Cost> daily_Cost_Report = new ArrayList<Result_Cost>();
            try {
                Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
                PreparedStatement stmt = conn.prepareStatement("SELECT i_transdetail.ID_Trans , i_transdetail.ID_FOOD , i_transdetail.Quantity FROM i_transdetail join import_trans on i_transdetail.ID_Trans = import_trans.ID_Trans WHERE DayImport = ? ");
                stmt.setString(1,  AppService.date_to_fomat("yyyy-MM-dd",this.getReportingDate()));
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    daily_Cost_Report.add(new Result_Cost(rs.getString(1), rs.getString(2),rs.getInt(3)));
                }
                conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            return daily_Cost_Report;
        }

    }
    public ArrayList<Result_Cost> getRsCostMouth(Date reportingDate) {
        ArrayList<Result_Cost> daily_Cost_Report = new ArrayList<Result_Cost>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement stmt = conn.prepareStatement("SELECT i_transdetail.ID_Trans , i_transdetail.ID_FOOD , i_transdetail.Quantity FROM i_transdetail join import_trans on i_transdetail.ID_Trans = import_trans.ID_Trans WHERE MONTH(DayImport) = ? and Year(DayImport) = ?");
            stmt.setString(1,  AppService.date_to_fomat("MM",this.getReportingDate()));
            stmt.setString(2,  AppService.date_to_fomat("YYYY",this.getReportingDate()));
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                daily_Cost_Report.add(new Result_Cost(rs.getString(1), rs.getString(2),rs.getInt(3)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return daily_Cost_Report;
    }

    public ArrayList<ResultIncome> getRsIncomeMouth(){
        ArrayList<ResultIncome> daily_Icome_Report = new ArrayList<ResultIncome>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement stmt = conn.prepareStatement("SELECT order_account_details.ID_ACCOUNT , order_account_details.ID_ORDER FROM orders join order_account_details on orders.ID_ORDER = order_account_details.ID_ORDER MONTH(DayImport) = ? and YEAR(DayImport) = ?");
            stmt.setString(1,  AppService.date_to_fomat("MM",this.getReportingDate()));
            stmt.setString(2,  AppService.date_to_fomat("YYYY",this.getReportingDate()));
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                daily_Icome_Report.add(new ResultIncome(rs.getString(1), rs.getString(2)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return daily_Icome_Report;
    }

    public static void main(String[] args) throws ParseException {
        Reporting rp = new Reporting("2023-05-09");
//        Date date = new SimpleDateFormat("yyyy-MM-dd").parse("2023-05-09");
        System.out.println(AppService.date_to_fomat("yyyy-MM",rp.getReportingDate()));
        System.out.println(AppService.date_to_fomat("MM",rp.getReportingDate()));

        ArrayList<Result_Cost> rs = rp.getRsCostMouth(rp.ReportingDate);
        for (Result_Cost rc: rs
             ) {
            System.out.println(rc.toString());
        }

    }
}

