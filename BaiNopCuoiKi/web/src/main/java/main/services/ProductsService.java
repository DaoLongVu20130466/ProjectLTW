package main.services;

import main.bean.*;
import main.db.ConnectMysqlExample;

import java.sql.*;
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

    public ArrayList<OderCart> getProductByOderID(String oderId) {
        {
            ArrayList<OderCart> orc = new ArrayList<>();
            {

                try {
                    Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

                    PreparedStatement ps = conn.prepareStatement("SELECT food.ID_FOOD, FOOD_NAME,  BASE_PRICE , LISTED_PRICE , L_IMG , order_details.QUANTITY , type_food.ID_TYPE\n" +
                            "FROM order_details \n" +
                            "join type_food\n" +
                            "JOIN food \n" +
                            "on type_food.ID_TYPE = food.ID_TYPE\n" +
                            "on food.ID_FOOD = order_details.ID_FOOD  \n" +
                            "WHERE ID_ORDER = ?");

                    ps.setString(1, oderId);
                    int temp = 1;
                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                        OderCart rsl = new OderCart();
                        rsl.setItem(new Products(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5), rs.getString(7)));
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
            ResultSet rs = stmt.executeQuery("SELECT food.ID_FOOD , food.FOOD_NAME , ID_TYPE, price.PRICE  , image.SRC\n" +
                    "FROM ((food LEFT JOIN image_detail on food.ID_FOOD = image_detail.ID_FOOD) \n" +
                    " LEFT JOIN image on image_detail.ID_IMG = image.ID_IMG )\n" +
                    " LEFT JOIN price on   food.ID_FOOD = price.ID_FOOD"
            );
            //XONG
            while (rs.next()) {
                allProduct.add(new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5)));

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


            PreparedStatement ps = conn.prepareStatement("SELECT food.ID_FOOD , food.FOOD_NAME , ID_TYPE, price.PRICE  , image.SRC\n" +

                    "FROM ((food LEFT JOIN image_detail on food.ID_FOOD = image_detail.ID_FOOD) \n" +
                    " LEFT JOIN image on image_detail.ID_IMG = image.ID_IMG )\n" +
                    " LEFT JOIN price on   food.ID_FOOD = price.ID_FOOD\n" +
                    "WHERE food.ID_TYPE = ? " +
                    "LIMIT 7 OFFSET ?"
            );
            //XONG

            ps.setString(1, type);
            ps.setInt(2, (page - 1) * 12);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                allProductByPage.add(new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProductByPage;
    }

    // getTypeProduct Ä‘Ã£ fix
    public ArrayList<TypeProducts> getTypeProduct() {
        ArrayList<TypeProducts> allType = new ArrayList<TypeProducts>();
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT ID_TYPE , TYPE_FOOD\n" +
                    "FROM type_food");

            while (rs.next()) {
                allType.add(new TypeProducts(
                        rs.getString(1),
                        rs.getNString(2)));
            }
            //XONG
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allType;
    }

    //getAllproductBySale Ä‘Ã£ fix
    public List<Products> getAllproductBySale() {
        ArrayList<Products> allProductBySale = new ArrayList<Products>();

        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT food.ID_FOOD , food.FOOD_NAME , ID_TYPE, food.LISTED_PRICE  , food.L_IMG FROM food WHERE food.IS_SALE = 1");
            while (rs.next()) {
                allProductBySale.add(new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5)));

            }
            //XONG
            conn.close();
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
            ResultSet rs = stmt.executeQuery("SELECT food.ID_FOOD , food.FOOD_NAME , ID_TYPE, food.LISTED_PRICE  , food.L_IMG FROM food WHERE food.IS_HOT = 1");
            while (rs.next()) {
                allProductByHot.add(new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5)));
                //XONG
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
            ResultSet rs = stmt.executeQuery("SELECT food.ID_FOOD , food.FOOD_NAME , ID_TYPE, food.LISTED_PRICE  , food.L_IMG FROM food WHERE food.IS_COMBO = 1");
            while (rs.next()) {
                allProductByCombo.add(new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProductByCombo;
    }

    public List<Products> getAllproductsByType(String type,int page){
        ArrayList<Products> allProductByType = new ArrayList<Products>();
        String query4 = "SELECT food.ID_FOOD , food.FOOD_NAME,food.IS_COMBO,food.IS_HOT," +
                "food.IS_SALE,food.DESCRIPTION,food.ID_TYPE,food.LISTED_PRICE,food.BASE_PRICE,food.L_IMG FROM food " +
                "WHERE food.id_TYPE=?" +
                "LIMIT 12 OFFSET ?";
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement( query4);
            ps.setString(1, type);
            ps.setInt(2, page);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                allProductByType.add(new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getBoolean(3),
                        rs.getBoolean(4),
                        rs.getBoolean(5),
                        rs.getNString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getNString(10)

                ));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();

        }
        return allProductByType;
    }
    public int getPageAllProType(String type) {
        int b = 0;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement ps = conn.prepareStatement("SELECT COUNT(ID_FOOD) FROM food WHERE food.ID_TYPE = ? "
            );
            ps.setString(1, type);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b=rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return b;
    }

    public Products getProductByID(String fid){
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement("SELECT food.ID_FOOD , food.FOOD_NAME , food.ID_TYPE,food.DESCRIPTION, food.IVENTORY, price.PRICE  , image.SRC \n" +
                    "FROM ((food LEFT JOIN image_detail on food.ID_FOOD = image_detail.ID_FOOD) \n" +
                    " LEFT JOIN image on image_detail.ID_IMG = image.ID_IMG )\n" +
                    " LEFT JOIN price on   food.ID_FOOD = price.ID_FOOD \n" +
                    "WHERE food.ID_FOOD = ?"
            );
            ps.setString(1, fid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getNString(4),
                        rs.getInt(5),
                        rs.getInt(6),
                        rs.getString(7));
                //Xong
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

            PreparedStatement ps = conn.prepareStatement("SELECT food.ID_FOOD , food.FOOD_NAME , ID_TYPE, price.PRICE  , food.L_IMG\n" +
                    "FROM food \n" +
                    " LEFT JOIN price on   food.ID_FOOD = price.ID_FOOD\n" +
                    "WHERE food.ID_TYPE = ? "

            );
            //XONG
            ps.setString(1, type);

            ResultSet rs = ps.executeQuery();


            while (rs.next()) {
                allProductByID.add( new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProductByID;
    }


    // getAllProductByPage đã fix
    public List<Products> getAllProductByPage ( int page){
        ArrayList<Products> allProductByPage = new ArrayList<Products>();
        String query4 = "SELECT food.ID_FOOD , food.FOOD_NAME,food.IS_COMBO,food.IS_HOT," +
                "food.IS_SALE,food.DESCRIPTION,food.ID_TYPE,food.LISTED_PRICE,food.BASE_PRICE,food.L_IMG FROM food " +
                "LIMIT 12 OFFSET ?";
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement( query4);
            ps.setInt(1, (page));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                allProductByPage.add(new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getBoolean(3),
                        rs.getBoolean(4),
                        rs.getBoolean(5),
                        rs.getNString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getNString(10)

                ));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();

        }
        return allProductByPage;
    }



    public List<Products> getAllproductFavouriteByUser (String iduser){
        ArrayList<Products> allProductByFavourite = new ArrayList<Products>();
        String query="SELECT  user_information.ID_USER ,food.ID_FOOD , food.FOOD_NAME, price.PRICE , food.L_IMG \n" +
                "FROM user_information  JOIN accounts ON user_information.ID_USER = accounts.ID_USER\n" +
                "JOIN favourites ON accounts.ID_ACCOUNT = favourites.ID_ACCOUNT\n" +
                "JOIN food ON  favourites.ID_FOOD  = food.ID_FOOD\n" +
                "JOIN price on   food.ID_FOOD = price.ID_FOOD\n" +
                " WHERE user_information.ID_USER = ?";
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());


            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, iduser);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                allProductByFavourite.add(new Products(
                        rs.getNString(2),
                        rs.getNString(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allProductByFavourite;
    }


    public void addProduct
            (String Idfood ,String tenmonan,
             String optionSize,
             int niemyet,
             String optionType,
             int optionCombo,
             int optionSale,
             int optionHot,
             String Mota,
             String img,
             int giaban,
             String img2,
             String img3,
             String img4

            ){

        String id = "IMG"+useService.getInstance().checkIDIMG();
        String id2 = "IMG"+useService.getInstance().checkIDIMG2();
        String id3 = "IMG"+useService.getInstance().checkIDIMG3();
        String id4 = "IMG"+useService.getInstance().checkIDIMG4();
        String query1 ="INSERT INTO food (ID_FOOD,FOOD_NAME,IS_COMBO,IS_HOT,IS_SALE,DESCRIPTION,ID_TYPE,L_IMG,LISTED_PRICE,BASE_PRICE,QUANTITY ) VALUES (?,?,?,?,?,?,?,?,?,?,100)";
        String query2="INSERT INTO price (ID_FOOD,LISTED_PRICE,PRICE) VALUES (?,?,?)";
        String query3="INSERT INTO image_detail(ID_IMG,ID_FOOD) VALUES (?,?)";
        String query4 = "INSERT INTO image(ID_IMG ,SRC) VALUES(?,?)";
        String query5="INSERT INTO size_details(ID_FOOD,ID_SIZE) VALUES (?,?)";

        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps1 = conn.prepareStatement(query1);
            ps1.setString(1,Idfood);
            ps1.setNString(2,tenmonan);
            ps1.setInt(3,optionCombo);
            ps1.setInt(4,optionHot);
            ps1.setInt(5,optionSale);
            ps1.setNString(6,Mota);
            ps1.setString(7,optionType);
            ps1.setString(8,img);
            ps1.setInt(9,niemyet);
            ps1.setInt(10,giaban);
            ps1.executeUpdate();
            PreparedStatement ps2 = conn.prepareStatement(query2);
            ps2.setString(1,Idfood);
            ps2.setInt(2,niemyet);
            ps2.setInt(3,giaban);
            ps2.executeUpdate();
            PreparedStatement ps3 = conn.prepareStatement(query3);
            ps3.setString(1,id);
            ps3.setString(2,Idfood);
            ps3.executeUpdate();
            PreparedStatement ps4 = conn.prepareStatement(query4);
            ps4.setString(1,id);
            ps4.setString(2,img);
            ps4.executeUpdate();
            PreparedStatement ps5 = conn.prepareStatement(query5);
            ps5.setString(1,Idfood);
            ps5.setString(2,optionSize);
            ps5.executeUpdate();
            PreparedStatement ps6 = conn.prepareStatement(query3);
            ps6.setString(1,id2);
            ps6.setString(2,Idfood);
            ps6.executeUpdate();

            PreparedStatement ps7;
            ps7 = conn.prepareStatement(query4);
            ps7.setString(1,id2);
            ps7.setString(2,img2);
            ps7.executeUpdate();

            PreparedStatement ps8 = conn.prepareStatement(query3);
            ps8.setString(1,id3);
            ps8.setString(2,Idfood);
            ps8.executeUpdate();
            PreparedStatement ps9 = conn.prepareStatement(query4);
            ps9.setString(1,id3);
            ps9.setString(2,img3);
            ps9.executeUpdate();

            PreparedStatement ps10 = conn.prepareStatement(query3);
            ps10.setString(1,id4);
            ps10.setString(2,Idfood);
            ps10.executeUpdate();
            PreparedStatement ps11 = conn.prepareStatement(query4);
            ps11.setString(1,id4);
            ps11.setString(2,img4);
            ps11.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    public List<Products> getAllproductSearch(String txt, int page){
        ArrayList<Products> allProductSearch = new ArrayList<Products>();
        String query4 = "SELECT food.ID_FOOD , food.FOOD_NAME,food.IS_COMBO,food.IS_HOT," +
                "food.IS_SALE,food.DESCRIPTION,food.ID_TYPE,food.LISTED_PRICE,food.BASE_PRICE,food.L_IMG FROM food " +
                "WHERE food.FOOD_NAME  LIKE ?" +
                "LIMIT 12 OFFSET ?";
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement( query4);
            ps.setString(1, "%"+txt+"%");
            ps.setInt(2, page);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                allProductSearch.add(new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getBoolean(3),
                        rs.getBoolean(4),
                        rs.getBoolean(5),
                        rs.getNString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getNString(10)

                ));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();

        }
        return allProductSearch;
    }

    public void addFavourite(String idf, String idacc){
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement("INSERT INTO favourites(ID_FOOD,ID_ACCOUNT)\n" +
                    "VALUES(?,?)");
            ps.setString(1, idf);
            ps.setString(2, idacc);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }


    public void updateProduct
            (String id  ,String tenmonan,
             String optionSize,
             int niemyet,
             String optionType,
             int optionCombo,
             int optionSale,
             int optionHot,
             String Mota,
             String img,
             int giaban,
             String img2,
             String img3,
             String img4,
             String idimg1,
             String idimg2,
             String idimg3,
             String idimg4
            ){
        String query1 ="UPDATE food SET FOOD_NAME = ?,IS_COMBO = ?," +
                "IS_HOT=?,IS_SALE=?,DESCRIPTION=?,ID_TYPE = ? ,L_IMG =? ,LISTED_PRICE = ?,BASE_PRICE =? WHERE food.ID_FOOD = ?";
        String query2="UPDATE  price SET LISTED_PRICE = ?,PRICE=? WHERE price.ID_FOOD = ?";
        String query4 = "UPDATE  image SET SRC=? WHERE image.ID_IMG = ? ";
        String query5="UPDATE  size_details SET ID_SIZE = ? WHERE size_details.ID_FOOD = ?";
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps1 = conn.prepareStatement(query1);
            ps1.setString(1,tenmonan);
            ps1.setInt(2,optionCombo);
            ps1.setInt(3,optionHot);
            ps1.setInt(4,optionSale);
            ps1.setNString(5,Mota);
            ps1.setNString(6,optionType);
            ps1.setString(7,img);
            ps1.setInt(8,niemyet);
            ps1.setInt(9,giaban);
            ps1.setNString(10,id);
            ps1.executeUpdate();

            PreparedStatement ps2 = conn.prepareStatement(query2);
            ps2.setInt(1,niemyet);
            ps2.setInt(2,giaban);
            ps2.setString(3,id);
            ps2.executeUpdate();

            PreparedStatement ps4 = conn.prepareStatement(query4);
            ps4.setString(2,id);
            ps4.setString(1,img);
            ps4.executeUpdate();

            PreparedStatement ps5 = conn.prepareStatement(query5);
            ps5.setString(1,optionSize);
            ps5.setString(2,id);
            ps5.executeUpdate();
            PreparedStatement ps6 = conn.prepareStatement(query4);
            ps6.setString(2,idimg1);
            ps6.setString(1,img);
            ps6.executeUpdate();
            PreparedStatement ps7 = conn.prepareStatement(query4);
            ps7.setString(2,idimg2);
            ps7.setString(1,img2);
            ps7.executeUpdate();
            PreparedStatement ps8 = conn.prepareStatement(query4);
            ps8.setString(2,idimg3);
            ps8.setString(1,img3);
            ps8.executeUpdate();
            PreparedStatement ps9 = conn.prepareStatement(query4);
            ps9.setString(2,idimg4);
            ps9.setString(1,img4);
            ps9.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void addComment(String idf,String idu, String cmt , String src) {
        String id = "IMG"+useService.getInstance().checkIDIMG();

        String query2 = "INSERT INTO image(ID_IMG ,SRC) VALUES(?,?)";


        String query = "INSERT INTO `comment`(ID_FOOD,ID_ACCOUNT,CMT,ID_IMG) VALUES(?,?,?,?)";
        String query3 = "INSERT INTO `comment`(ID_FOOD,ID_ACCOUNT,CMT) VALUES(?,?,?)";
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            if (src.equals("img/Data/")|| src ==null){
                PreparedStatement ps = conn.prepareStatement(query3);
                ps.setString(1, idf);
                ps.setString(2, idu);
                ps.setString(3, cmt);
                ps.executeUpdate();

            }else {
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, idf);
                ps.setString(2, idu);
                ps.setString(3, cmt);
                ps.setString(4, id);
                ps.executeUpdate();
                PreparedStatement ps2 = conn.prepareStatement(query2);
                ps2.setString(1, id);
                ps2.setString(2, src);
                ps2.executeUpdate();
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void addImg(String src) {
        String id = "IMG"+useService.getInstance().checkIDIMG();
        String query = "\n" +
                "INSERT INTO image(ID_IMG ,SRC)\n" +
                "VALUES(?,?)";
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, src);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


//            PreparedStatement stmt = conn.prepareStatement("UPDATE FOOD SET FOOD_NAME = ?, ID_SIZE= ?, LISTED_PRICE=?, TYPE_FOOD=?, QUANTITY=?,STATUSS = ? , IS_COMBO = ?,ID_SALE = ? , IS_HOT = ?, DESCRIPTION = ?, L_IMG=?, BASE_PRICE = ? WHERE FOOD.ID_FOOD = ? AND FOOD.ID_SIZE=? ");
//            stmt.setString(1, tenmonan);
//            stmt.setString(2, optionSize);
//            stmt.setInt(3, giaban);
//            stmt.setString(4, optionType);
//            stmt.setInt(5, soluong);
//            stmt.setString(6, optionStatus);
//            stmt.setInt(7, optionCombo);
//            stmt.setString(8, optionSale);
//            stmt.setString(9, optionHot);
//            stmt.setString(10, mota);
//            stmt.setString(11, img);
//            stmt.setInt(12, niemyet);
//            stmt.setString(13, id);
//            stmt.setString(14, optionSize);
//            stmt.executeUpdate();
//            conn.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    public static void main(String[] args) {
        ArrayList<Products> listT = (ArrayList<Products>) getInstance().getAllproductBySale();
        for (Products item: listT) {
            System.out.println(item.getFoodName());
        }

        ArrayList<Image> list = (ArrayList<Image>) getInstance().getImgEdit("CG16");
        for (Image item: list) {
            System.out.println(item.getSrc());
        }


    }


    public Products getProductEdit(String idf) {
        String query4 = "SELECT food.ID_FOOD , food.FOOD_NAME,food.IS_COMBO,food.IS_HOT," +
                "food.IS_SALE,food.DESCRIPTION,food.ID_TYPE,food.LISTED_PRICE,food.BASE_PRICE FROM food WHERE food.ID_FOOD = ?";
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement ps = conn.prepareStatement(query4);
            ps.setString(1, idf);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return new Products(
                        rs.getString(1),
                        rs.getNString(2),
                        rs.getBoolean(3),
                        rs.getBoolean(4),
                        rs.getBoolean(5),
                        rs.getNString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getInt(9)
                );
                //Xong
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;

    }
    public ArrayList<Image> getImgEdit(String idf){
        ArrayList<Image> allImageSearch = new ArrayList<Image>();
        String query  ="SELECT image.ID_IMG, image.SRC\n" +
                "FROM food JOIN image_detail JOIN image on image_detail.ID_IMG = image.ID_IMG ON food.ID_FOOD = image_detail.ID_FOOD\n" +
                "WHERE food.ID_FOOD=?";
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());


            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idf);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                allImageSearch.add(new Image(
                        rs.getString(1),
                        rs.getNString(2)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allImageSearch;
    }

    public ArrayList<Image> getImgCmt(String idf){
        ArrayList<Image> allImageSearch = new ArrayList<Image>();
        String query  ="SELECT comment.ID_IMG, comment.ID_FOOD\n" +
                "FROM  comment JOIN image on comment.ID_IMG = image.ID_IMG \n" +
                "WHERE comment.ID_FOOD=?";
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());


            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idf);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                allImageSearch.add(new Image(
                        rs.getString(1),
                        rs.getNString(2)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allImageSearch;
    }
    public ArrayList<Image> getImgCmt2(String idcmt){
        ArrayList<Image> allImageSearch = new ArrayList<Image>();
        String query  ="SELECT comment.ID_IMG, comment.ID_FOOD\n" +
                "FROM  comment JOIN image on comment.ID_IMG = image.ID_IMG \n" +
                "WHERE comment.ID=?";
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());


            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idcmt);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                allImageSearch.add(new Image(
                        rs.getString(1),
                        rs.getNString(2)));
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allImageSearch;
    }


    public int getPageAllPro() {
        int b = 0;
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement ps = conn.prepareStatement("SELECT COUNT(ID_FOOD) FROM food "
            );
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b=rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return b;
    }
}