package main.services;

import main.bean.*;
import main.db.ConnectMysqlExample;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OderService {
    private static OderService instance;

    private OderService() {

    }

    private List<User> alluser;

    public static OderService getInstance() {
        if (instance == null) {
            instance = new OderService();
        }
        return instance;
    }

    public ArrayList<Order> getAllInforOder(String oderId) {
        ArrayList<Order> allOder = new ArrayList<Order>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(("SELECT orders.ID_ORDER, NAMES, PHONE_NUMBER , NOTE , ORDER_DATE, STATUSS , ID_ACCOUNT \n" +
                    "from orders \n" +
                    "JOIN order_account_details \n" +
                    "on order_account_details.ID_ORDER = orders.ID_ORDER"));

            while (rs.next()) {

                Address ad = null;
                Voucher vc = null;
                ArrayList<OderCart> pr = null;
                allOder.add(new Order(
                                rs.getString(1),
                                rs.getString(2),
                                rs.getString(3),
                                rs.getString(4),
                                rs.getDate(5),
                                rs.getString(6),
                                rs.getString(7),
                                ad,
                                vc,
                                pr)
                );
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allOder;
    }
    public ArrayList<Order> getAllOder(){
        ArrayList<Order> allOder = new ArrayList<Order>();
        ArrayList<OderCart> orc;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(("SELECT orders.ID_ORDER, ID_ACCOUNT , STATUSS ,districtID,wardID  \n" +
                    "from orders \n" +
                    "JOIN order_account_details \n" +
                    "on order_account_details.ID_ORDER = orders.ID_ORDER"));

            while (rs.next()) {
                String idOder = rs.getString(1);
                Voucher voucher = VoucherService.getInstance().getVcByOderId(idOder);
                Address ad = AdressService.getInstance().getAdressByOderId(idOder);
                orc = (ProductsService.getInstance().getProductByOderID(idOder));
                allOder.add(new Order(idOder,rs.getString(2),ad,orc,rs.getString(3),voucher,rs.getString(4),rs.getString(5)));
//                idOder,rs.getString(2),ad,orc,rs.getString(3),voucher),rs.getString(4),rs.getString(5)
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allOder;
    }
    public Order getInforOder(String idOder){
        ArrayList<OderCart> orc ;
        Order rsl  = new Order();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement stmt = conn.prepareStatement("\n" +
                    "SELECT orders.ID_ORDER, NAMEUSER, PHONE_NUMBER , NOTE , ORDER_DATE, STATUSS , DELIVERY_CHARGES,districtID,wardID \n" +
                    "from orders \n" +
                    "JOIN order_account_details \n" +
                    "on order_account_details.ID_ORDER = orders.ID_ORDER WHERE orders.ID_ORDER =?");
            stmt.setString(1,idOder);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Voucher voucher = VoucherService.getInstance().getVcByOderId(idOder);
                Address ad = AdressService.getInstance().getAdressByOderId(idOder);
                orc = (ProductsService.getInstance().getProductByOderID(idOder));
                rsl.setIdOder(rs.getString(1));
                rsl.setPbuyName(rs.getString(2));
                rsl.setPhoneNumber(rs.getString(3));
                rsl.setNote(rs.getString(4));
                rsl.setStatus(rs.getString(6));
                rsl.setShip(rs.getInt(7));
                rsl.setDistrictID(Integer.toString(rs.getInt(8)));
                rsl.setWardID(Integer.toString(rs.getInt(9)));
                rsl.setVoucher(voucher);
                rsl.setAddress(ad);
                rsl.setAllOderCart(orc);
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return rsl;
    }
    public ArrayList<Order> getAllUserOder(String idUSer){
        ArrayList<Order> allOder = new ArrayList<>();

        ArrayList<OderCart> orc;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement statement = conn.prepareStatement("SELECT orders.ID_ORDER, ID_ACCOUNT , STATUSS ,DELIVERY_CHARGES,districtID,wardID \n" +
                    "from orders \n" +
                    "JOIN order_account_details \n" +
                    "on order_account_details.ID_ORDER = orders.ID_ORDER WHERE ID_ACCOUNT = ?");
            statement.setString(1,idUSer);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Order rsl  ;
                String idOder = rs.getString(1);
                Voucher voucher = VoucherService.getInstance().getVcByOderId(idOder);
                Address ad = AdressService.getInstance().getAdressByOderId(idOder);
                orc = (ProductsService.getInstance().getProductByOderID(idOder));
                allOder.add(rsl = new Order(idOder,rs.getString(2),ad,orc,rs.getString(3),voucher));
                rsl.setShip(rs.getInt(4));
                rsl.setDistrictID(Integer.toString(rs.getInt(5)));
                rsl.setWardID(Integer.toString(rs.getInt(6)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allOder;
    }
    public Order getInforOderByUser(String idOder, String user){
        ArrayList<OderCart> orc ;
        Order rsl  = new Order();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement stmt = conn.prepareStatement("SELECT orders.ID_ORDER, NAMEUSER, PHONE_NUMBER , NOTE , STATUSS , DELIVERY_CHARGES,districtID,wardID\n" +
                    "from orders\n" +
                    "JOIN order_account_details\n" +
                    "on order_account_details.ID_ORDER = orders.ID_ORDER WHERE orders.ID_ORDER =? AND ID_ACCOUNT = ?");
            stmt.setString(1,idOder);
            stmt.setString(2,user);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Voucher voucher = VoucherService.getInstance().getVcByOderId(idOder);
                Address ad = AdressService.getInstance().getAdressByOderId(idOder);
                orc = (ProductsService.getInstance().getProductByOderID(idOder));
                rsl.setIdOder(rs.getString(1));
                rsl.setPbuyName(rs.getString(2));
                rsl.setPhoneNumber(rs.getString(3));
                rsl.setNote(rs.getString(4));
                rsl.setStatus(rs.getString(5));
                rsl.setShip(rs.getInt(6));
                rsl.setDistrictID(rs.getString(7));
                rsl.setWardID(rs.getString(8));
                rsl.setVoucher(voucher);
                rsl.setAddress(ad);
                rsl.setAllOderCart(orc);
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return rsl;
    }
    public void cancelOder(String idoder)  {
        try {
        Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
        PreparedStatement statement = conn.prepareStatement("UPDATE orders SET STATUSS = 'Đã hủy' WHERE ID_ORDER = ?");
        statement.setString(1,idoder);
        statement.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public void AcceptlOder(String idoder)  {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement statement = conn.prepareStatement("UPDATE orders SET STATUSS = 'Đang Giao' WHERE ID_ORDER = ?");
            statement.setString(1,idoder);
            statement.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public String createNewIDOder(){
        return "OD" + Integer.toString(getintNewIdOder());
    }

    public int getintNewIdOder(){
        int rsl = 1;
        try{
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(("SELECT COUNT(*) FROM orders"));

            while (rs.next()) {
                rsl+=rs.getInt(1);
            }
            conn.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }

        return rsl;
    }

    public static void main(String[] args) {
        System.out.println(OderService.getInstance().createNewIDOder());
    }
}
