package main.services;

import main.bean.*;
import main.db.ConnectMysqlExample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductsService {
    private static ProductsService instance;
    private Map<Products, String> product = new HashMap<Products, String>();
    private List<Products> allproducts = new ArrayList<>();
    public static ProductsService getInstance() {
        if (instance == null) {
            instance = new ProductsService();
        }
        return instance;
    }

    public  ArrayList<OderCart> getProductByOderID(String oderId){
        {
            ArrayList<OderCart> orc = new ArrayList<>();
            {

                try {
                    Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

                    PreparedStatement ps = conn.prepareStatement("SELECT food.ID_FOOD, FOOD_NAME,  BASE_PRICE , LISTED_PRICE , L_IMG , order_details.QUANTITY , type_food.ID_TYPE\n" +
                            "FROM order_details \n" +
                            "join TYPE_FOOD\n" +
                            "JOIN food \n" +
                            "on TYPE_FOOD.TYPE_FOOD = food.TYPE_FOOD\n" +
                            "on food.ID_FOOD = order_details.ID_FOOD  AND food.ID_SIZE = order_details.ID_SIZE \n" +
                            " WHERE ID_ORDER = ?");

                    ps.setString(1,oderId);
                    int temp=1;
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                        OderCart rsl = new OderCart();
                        rsl.setItem(new Products(rs.getString(1),rs.getString(2),rs.getInt(3), rs.getInt(4),rs.getString(5),rs.getString(7) ));
                        rsl.setValue(rs.getInt(6));
                        orc.add(rsl);
                    }
                    conn.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                return orc;
            }

        }
    }

    public List<Products> getAllproducts() {
        ArrayList<Products> allProduct = new ArrayList<Products>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT ID_FOOD,FOOD_NAME,ID_SIZE,LISTED_PRICE,TYPE_FOOD,QUANTITY,STATUSS,IS_COMBO,ID_SALE,IS_HOT,DESCRIPTION,L_IMG FROM `food`\n" +
                    "WHERE food.ID_SIZE=\"SIZE1\"\n "

            );
            while (rs.next()) {
                allProduct.add( new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getNString(5),
                        rs.getInt(6),
                        rs.getNString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getNString(11),
                        rs.getNString(12)));

            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProduct;
    }
    public List<Products> getAllproducts2(String type, int page) {
        ArrayList<Products> allProductByPage = new ArrayList<Products>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement( "SELECT FOOD.ID_FOOD,FOOD.FOOD_NAME,FOOD.ID_SIZE,FOOD.LISTED_PRICE,FOOD.TYPE_FOOD,FOOD.QUANTITY,FOOD.STATUSS,FOOD.IS_COMBO,FOOD.ID_SALE,FOOD.IS_HOT,FOOD.DESCRIPTION,FOOD.L_IMG FROM FOOD JOIN TYPE_FOOD ON FOOD.TYPE_FOOD = TYPE_FOOD.TYPE_FOOD\n" +
                    "WHERE food.ID_SIZE=\"SIZE1\"\n and TYPE_FOOD.TYPE_FOOD = ?" +
                    "LIMIT 12 OFFSET ?"


            );
            ps.setString(1,type);
            ps.setInt(2,(page-1 )* 12);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                allProductByPage.add( new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getNString(5),
                        rs.getInt(6),
                        rs.getNString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getNString(11),
                        rs.getNString(12)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProductByPage;
    }
    public ArrayList<TypeProducts> getTypeProduct() {
        ArrayList<TypeProducts> allType = new ArrayList<TypeProducts>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select ID_TYPE,TYPE_FOOD from TYPE_FOOD");

            while (rs.next()) {
                allType.add(new TypeProducts(
                        rs.getString(1),
                        rs.getNString(2)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allType;
    }
    public List<Products> getAllproductBySale() {
        ArrayList<Products> allProductBySale = new ArrayList<Products>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT ID_FOOD,FOOD_NAME,ID_SIZE,LISTED_PRICE,TYPE_FOOD,QUANTITY,STATUSS,IS_COMBO,ID_SALE,IS_HOT,DESCRIPTION,L_IMG FROM `food`\n" +
                    "WHERE food.ID_SIZE=\"SIZE1\"\n and food.ID_SALE =\"SALE1\" "
            );
            conn.close();
            while (rs.next()) {
                allProductBySale.add(new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getNString(5),
                        rs.getInt(6),
                        rs.getNString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getNString(11),
                        rs.getNString(12)));

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProductBySale;
    }

    public List<Products> getAllproductByHot() {
        ArrayList<Products> allProductByHot = new ArrayList<Products>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT ID_FOOD,FOOD_NAME,ID_SIZE,LISTED_PRICE,TYPE_FOOD,QUANTITY,STATUSS,IS_COMBO,ID_SALE,IS_HOT,DESCRIPTION,L_IMG FROM `food`\n" +
                    "WHERE food.ID_SIZE=\"SIZE1\"\n and food.IS_HOT =\"HOT\" "

            );
            while (rs.next()) {
                allProductByHot.add(new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getNString(5),
                        rs.getInt(6),
                        rs.getNString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getNString(11),
                        rs.getNString(12)));

            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProductByHot;
    }
    public List<Products> getAllproductByCombo() {
        ArrayList<Products> allProductByCombo = new ArrayList<Products>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT ID_FOOD,FOOD_NAME,ID_SIZE,LISTED_PRICE,TYPE_FOOD,QUANTITY,STATUSS,IS_COMBO,ID_SALE,IS_HOT,DESCRIPTION,L_IMG FROM `food`\n" +
                    "WHERE food.ID_SIZE=\"SIZE1\"\n and food.IS_COMBO = 1 "

            );
            while (rs.next()) {
                allProductByCombo.add(new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getNString(5),
                        rs.getInt(6),
                        rs.getNString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getNString(11),
                        rs.getNString(12)));

            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProductByCombo;
    }
    public List<Products> getAllproductsByType(String type ) {
        ArrayList<Products> allProductByType = new ArrayList<Products>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement("select FOOD.ID_FOOD,FOOD.FOOD_NAME,FOOD.ID_SIZE,FOOD.LISTED_PRICE,FOOD.TYPE_FOOD,FOOD.QUANTITY,FOOD.STATUSS,FOOD.IS_COMBO,FOOD.ID_SALE,FOOD.IS_HOT,FOOD.DESCRIPTION,FOOD.L_IMG from FOOD JOIN TYPE_FOOD ON " +
                    "FOOD.TYPE_FOOD = TYPE_FOOD.TYPE_FOOD where FOOD.ID_SIZE=\"SIZE1\" AND TYPE_FOOD.ID_TYPE = ?"
            );
            ps.setString(1,type);
            ResultSet rs = ps.executeQuery();


            while (rs.next()) {
                allProductByType.add( new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getNString(5),
                        rs.getInt(6),
                        rs.getNString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getNString(11),
                        rs.getNString(12)));

            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProductByType;
    }
    public Products getProductByID(String fid) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement( "SELECT ID_FOOD,FOOD_NAME,ID_SIZE,LISTED_PRICE,TYPE_FOOD,QUANTITY,STATUSS,IS_COMBO,ID_SALE,IS_HOT,DESCRIPTION,L_IMG FROM `FOOD`\n" +
                    "WHERE FOOD.ID_SIZE=\"SIZE1\" and FOOD.ID_FOOD = ?"
            );
            ps.setString(1,fid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getNString(5),
                        rs.getInt(6),
                        rs.getNString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getNString(11),
                        rs.getNString(12));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    public List<Products> getAllProductByID(String type) {
        ArrayList<Products> allProductByID = new ArrayList<Products>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement( "SELECT ID_FOOD,FOOD_NAME,ID_SIZE,LISTED_PRICE,TYPE_FOOD,QUANTITY,STATUSS,IS_COMBO,ID_SALE,IS_HOT,DESCRIPTION,L_IMG FROM `FOOD`\n" +
                    "WHERE FOOD.ID_SIZE=\"SIZE1\" and FOOD.TYPE_FOOD = ?"
            );
            ps.setString(1,type);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                allProductByID.add( new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getNString(5),
                        rs.getInt(6),
                        rs.getNString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getNString(11),
                        rs.getNString(12)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProductByID;
    }
    public List<Products> getAllProductByPage(int page) {
        ArrayList<Products> allProductByPage = new ArrayList<Products>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement( "SELECT ID_FOOD,FOOD_NAME,ID_SIZE,LISTED_PRICE,TYPE_FOOD,QUANTITY,STATUSS,IS_COMBO,ID_SALE,IS_HOT,DESCRIPTION,L_IMG FROM `food`\n" +
                    "WHERE food.ID_SIZE=\"SIZE1\"\n " +
                    "LIMIT 12 OFFSET ?"


            );
            ps.setInt(1,(page-1 )* 12);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                allProductByPage.add( new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getNString(5),
                        rs.getInt(6),
                        rs.getNString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getNString(11),
                        rs.getNString(12)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProductByPage;
    }

    public List<Products> getAllproductFavouriteByUser(String iduser) {
        ArrayList<Products> allProductByFavourite = new ArrayList<Products>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());


            PreparedStatement ps = conn.prepareStatement("\n" +
                    "SELECT food.ID_FOOD ,food.L_IMG , food.FOOD_NAME , food.LISTED_PRICE\n" +
                    "FROM user_information JOIN (account JOIN (favourite JOIN food ON favourite.ID_FOOD = food.ID_FOOD) ON account.ID_ACCOUNT = favourite.ID_ACCOUNT)\n" +
                    "ON user_information.ID_USER = account.ID_USER\n" +
                    "WHERE food.ID_SIZE=\"SIZE1\" AND user_information.ID_USER = ?"

            );
            ps.setString(1,iduser);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String img = rs.getString(2);
                String name = rs.getNString(3);
                int price = rs.getInt(4);
                allProductByFavourite.add(new Products(id, img, name, price));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProductByFavourite;
    }
    public void addProduct(
            String tenmonan, String optionSize, int niemyet,
            String optionType, int soluong, String optionStatus,
            int optionCombo, String optionSale,
            String optionHot, String Mota, String img, int giaban
    ) {
        String a = optionType + useService.getInstance().checkIDFOOD(optionType,optionSize);

        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement("INSERT INTO FOOD(ID_FOOD, FOOD_NAME, ID_SIZE, LISTED_PRICE, TYPE_FOOD, QUANTITY,STATUSS,IS_COMBO, ID_SALE,IS_HOT, DESCRIPTION,L_IMG,BASE_PRICE) \n" +
                    "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setNString(1,a);
            ps.setNString(2, tenmonan);
            ps.setString(3, optionSize);
            ps.setInt(4,giaban);
            ps.setNString(5, optionType);
            ps.setInt(6,soluong);
            ps.setNString(7,optionStatus);
            ps.setInt(8,optionCombo);
            ps.setString(9,optionSale);
            ps.setString(10,optionHot);
            ps.setNString(11,Mota);
            ps.setString(12,img);
            ps.setInt(13,niemyet);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<Products> getAllproductSearch(String txt) {
        ArrayList<Products> allProductSearch = new ArrayList<Products>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());


            PreparedStatement ps = conn.prepareStatement("SELECT ID_FOOD,FOOD_NAME,ID_SIZE,LISTED_PRICE,TYPE_FOOD," +
                    "QUANTITY,STATUSS,IS_COMBO,ID_SALE,IS_HOT,DESCRIPTION,L_IMG " +
                    "FROM FOOD WHERE food.ID_SIZE=\"SIZE1\" AND FOOD_NAME like ?"


            );
            ps.setString(1,"%"+txt+"%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                allProductSearch.add( new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getNString(5),
                        rs.getInt(6),
                        rs.getNString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getNString(11),
                        rs.getNString(12)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProductSearch;
    }
    public void addFavourite(String idf, String idacc) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement("INSERT INTO favourite(ID_FOOD,ID_ACCOUNT) VALUES " +
                    "(?,?)");
            ps.setString(1,idf);
            ps.setString(2,idacc);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }





//    public static void main(String[] args) {
//           ProductsService a = new ProductsService();
//            String tenmonan ="Cơm gà A Quảng";
//            int niemyet =60000;
//            int giaban=12;
//            int soluong =50;
//            String Mota="Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \n" +
//                    "Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền";
//            String optionHot="HOT";
//            String optionType="CƠM GÀ";
//            String optionSale="SALE1";
//            String img="img/Data/GiamGia/1comga_aquang-min.jpeg";
//            String optionStatus="CÒN HÀNG";
//            int optionCombo = 0 ;
//            String optionSize="SIZE1";
//            a.addProduct(tenmonan,optionSize,giaban,optionType,soluong,optionStatus,optionCombo,optionSale,optionHot,Mota,img,niemyet);
//           System.out.println(a.getAllproductSearch("Cơm gà"));
//    }


    public Products getProductByIDSize(String idf, String size) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement( "SELECT ID_FOOD,FOOD_NAME,ID_SIZE,LISTED_PRICE,TYPE_FOOD,QUANTITY,STATUSS,IS_COMBO,ID_SALE,IS_HOT,DESCRIPTION,L_IMG,BASE_PRICE FROM `FOOD`\n" +
                    "WHERE FOOD.ID_SIZE= ? and FOOD.ID_FOOD = ?"
            );
            ps.setString(1,size);
            ps.setString(2,idf);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getNString(5),
                        rs.getInt(6),
                        rs.getNString(7),
                        rs.getBoolean(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getNString(11),
                        rs.getNString(12),
                        rs.getInt(13));

            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void updateProduct(String id, String tenmonan, String optionSize, int giaban, String optionType, int soluong, String optionStatus, int optionCombo, String optionSale, String optionHot, String mota, String img, int niemyet) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());


            PreparedStatement stmt = conn.prepareStatement("UPDATE FOOD SET FOOD_NAME = ?, ID_SIZE= ?, LISTED_PRICE=?, TYPE_FOOD=?, QUANTITY=?,STATUSS = ? , IS_COMBO = ?,ID_SALE = ? , IS_HOT = ?, DESCRIPTION = ?, L_IMG=?, BASE_PRICE = ? WHERE FOOD.ID_FOOD = ? AND FOOD.ID_SIZE=? ");
            stmt.setString(1,tenmonan);
            stmt.setString(2,optionSize);
            stmt.setInt(3,giaban);
            stmt.setString(4,optionType);
            stmt.setInt(5,soluong);
            stmt.setString(6,optionStatus);
            stmt.setInt(7,optionCombo);
            stmt.setString(8,optionSale);
            stmt.setString(9,optionHot);
            stmt.setString(10,mota);
            stmt.setString(11,img);
            stmt.setInt(12,niemyet);
            stmt.setString(13,id);
            stmt.setString(14,optionSize);
            stmt.executeUpdate();
            conn.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
//        ProductsService a = new ProductsService();
//        String id ="CƠM BÒ1";
//        String tenmonan ="Cơm gà A Quảng";
//        int niemyet =60000;
//        int giaban=12;
//        int soluong =50;
//        String Mota="Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền \n" +
//                "Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền Cơm ngon số 2 không đâu số 1, Ăn là mê cắn là ghiền";
//        String optionHot="HOT";
//        String optionType="CƠM GÀ";
//        String optionSale="SALE1";
//        String img="img/Data/GiamGia/1comga_aquang-min.jpeg";
//        String optionStatus="CÒN HÀNG";
//        int optionCombo = 0 ;
//        String optionSize="SIZE1";
//
//        a.updateProduct(id,tenmonan,optionSize,giaban,optionType,soluong,optionStatus,optionCombo,optionSale,optionHot,Mota,img,niemyet);
//

    }
}