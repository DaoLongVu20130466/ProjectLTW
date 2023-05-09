package main.bean;

import com.google.gson.*;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.net.HttpURLConnection;

import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

public class ApiController {
    String username = "thanh@1234";
    String password = "123456";

    public String getAuthorization() throws IOException {
        URL url = new URL("http://140.238.54.136/api/auth/login?email=" + username + "&password=" + password);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestMethod("POST");
        String string = IOUtils.toString(conn.getInputStream(), StandardCharsets.UTF_8);
        System.out.println( IOUtils.toString(conn.getInputStream(), StandardCharsets.UTF_8));
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(string, JsonObject.class);
        return jsonObject.get("access_token").getAsString();
    }

    public ArrayList<APIprovineRespone.data> getProvince() throws IOException {
        URL url = new URL("http://140.238.54.136/api/province");
        Gson gson = new Gson();
        APIprovineRespone response = gson.fromJson(StringAPTtoString(url), APIprovineRespone.class);
        ArrayList<APIprovineRespone.data> rs = (ArrayList<APIprovineRespone.data>) response.getOriginal().getData();
       return rs;
    }

    public ArrayList<APIDistrictRespone.data> getDistrictbyPvID(String id) throws IOException{
//        http://140.238.54.136/api/district?provinceID=202
        URL url = new URL("http://140.238.54.136/api/district?provinceID="+id);
        Gson gson = new Gson();
        APIDistrictRespone response = gson.fromJson(StringAPTtoString(url), APIDistrictRespone.class);
        ArrayList<APIDistrictRespone.data> rs = (ArrayList<APIDistrictRespone.data>) response.getOriginal().getData();
     return rs;
    }
    public ArrayList<APIwardRespone.data> getWardbyDTid(String id)throws IOException{
        URL url = new URL("http://140.238.54.136/api/ward?districtID="+id);
        Gson gson = new Gson();
        APIwardRespone response = gson.fromJson(StringAPTtoString(url), APIwardRespone.class);
        ArrayList<APIwardRespone.data> rs = (ArrayList<APIwardRespone.data>) response.getOriginal().getData();
        return rs;
    }
    public Date getTimedeliver(String fdistrictID , String fwardID ,String tdistrictID , String twardID) throws IOException, ParseException {
        URL url = new URL("http://140.238.54.136/api/leadTime?from_district_id=" +fdistrictID+"&from_ward_id="+fwardID +
                "&to_district_id="+tdistrictID+"&to_ward_id="+twardID+"&height=100&length=100&width=100&weight=100");
        Gson gson = new Gson();
        APILeadtimerp response = gson.fromJson(StringAPTtoStringPOST(url), APILeadtimerp.class);
        ArrayList<APILeadtimerp.data> rs = (ArrayList<APILeadtimerp.data>) response.getData();
        Date ex = new Date();
        for ( APILeadtimerp.data e: rs
             ) {
            ex = e.getFormattedDate();
        }
        return ex;
    }
    public int getCostdeliver(String fdistrictID , String fwardID ,String tdistrictID , String twardID) throws IOException, ParseException {
        URL url = new URL("http://140.238.54.136/api/calculateFee?from_district_id=" +fdistrictID+"&from_ward_id="+fwardID +
                "&to_district_id="+tdistrictID+"&to_ward_id="+twardID+"&height=100&length=100&width=100&weight=100");
        Gson gson = new Gson();
        APTcostRP response = gson.fromJson(StringAPTtoStringPOST(url), APTcostRP.class);
        ArrayList<APTcostRP.data> rs = (ArrayList<APTcostRP.data>) response.getData();
        int ex = 0;
        for ( APTcostRP.data e: rs
        ) {
            ex += e.getService_fee();
        }
        return ex;
    }
    public String StringAPTtoString(URL url)  throws IOException{
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestProperty("Authorization"," bearer "+ getAuthorization());
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestMethod("GET");
        String json = IOUtils.toString(conn.getInputStream(), StandardCharsets.UTF_8);
        return json;
    }
    public String StringAPTtoStringPOST(URL url)  throws IOException{
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestProperty("Authorization"," bearer "+ getAuthorization());
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestMethod("POST");
        String json = IOUtils.toString(conn.getInputStream(), StandardCharsets.UTF_8);
        return json;
    }

    public static void main(String[] args) throws Exception {
        ApiController controller = new ApiController();
//        controller.getProvince();
//        controller.getWardbyDTid("3695");
//        String a= "2023-05-10T23:59:59Z";
//        SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
//        Date date1=formatter1.parse(a);
//        System.out.println(date1.toString());
        System.out.println(controller.getCostdeliver("2264","90816","2270","231013"));
    }
}
