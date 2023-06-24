package main.services;

import main.bean.Address;
import main.bean.OderCart;
import main.bean.Order;
import main.bean.Voucher;
import main.db.ConnectMysqlExample;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAccessor;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DashBoardService {
    private static DashBoardService instance;
    public static DashBoardService getInstance() {
        if (instance == null) {
            instance = new DashBoardService();
        }
        return instance;
    }
    public ArrayList<Order> getOderByYear(String year){
        ArrayList<Order> order = new ArrayList<>();
        ArrayList<OderCart> orc ;

        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement stmt = conn.prepareStatement("SELECT orders.ID_ORDER , ORDER_DATE, STATUSS , DELIVERY_CHARGES \n" +
                    "from orders\n" +
                    "JOIN order_account_details\n" +
                    "on order_account_details.ID_ORDER = orders.ID_ORDER WHERE YEAR(ORDER_DATE) = ?");
            stmt.setString(1,year);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Order rsl  = new Order();
                String oderId = rs.getString(1);
                orc = ProductsService.getInstance().getProductByOderID(oderId);
                rsl.setIdOder(oderId);
                rsl.setDayCrate(rs.getDate(2));
                rsl.setStatus(rs.getString(3));
                rsl.setShip(rs.getInt(4));
                rsl.setAllOderCart(orc);
                order.add(rsl);
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return order;
    }
    public ArrayList<Order> getOderByYearMouth(String year , String m) {
        ArrayList<Order> order = new ArrayList<>();
        ArrayList<OderCart> orc ;

        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement stmt = conn.prepareStatement("SELECT orders.ID_ORDER , ORDER_DATE, STATUSS , DELIVERY_CHARGES \n" +
                    "from orders\n" +
                    "JOIN order_account_details\n" +
                    "on order_account_details.ID_ORDER = orders.ID_ORDER WHERE  YEAR(ORDER_DATE) = ? AND MONTH(ORDER_DATE)= ?");
            stmt.setString(1,year);
            stmt.setString(2,m);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Order rsl  = new Order();
                String oderId = rs.getString(1);
                orc = ProductsService.getInstance().getProductByOderID(oderId);
                rsl.setIdOder(oderId);
                rsl.setDayCrate(rs.getDate(2));
                rsl.setStatus(rs.getString(3));
                rsl.setShip(rs.getInt(4));
                rsl.setAllOderCart(orc);
                order.add(rsl);
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return order;
    }

    public static void main(String[] args) throws ParseException {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();

        Calendar cal = Calendar.getInstance();
        cal.set(2023, 07, 11);
        Date date = cal.getTime();
        System.out.println(Integer.parseInt("07") == (date.getMonth()));

        SimpleDateFormat formatter = new SimpleDateFormat("MM");

        String dateInString = "2023-01-07";
        Date date2 = formatter.parse(dateInString);
        System.out.printf(  formatter.format(date2.getMonth()).toString());


    }
}
