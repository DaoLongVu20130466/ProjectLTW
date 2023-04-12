package main.services;

import org.apache.commons.lang3.RandomStringUtils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

public  class AppService {
    public static String intToVND(int iput){
        String inPut =Integer.toString(iput);
        String rsl = "VND";
        char[] charrr = inPut.toCharArray() ;
        int count = 0;
        for(int i=charrr.length-1;i>=0 ; i--){
            count++;
            rsl =  charrr[i] +rsl ;
            if(count%3 ==0  && count < charrr.length) {
                rsl =  '.' +rsl ;
            }
        }
        return rsl;
    }
    public static HashMap<String,Integer> getTypeMap(){
        HashMap<String,Integer> rs = new HashMap<>();
        rs.put("Cơm gà",0);
        rs.put("Cơm bò",0);
        rs.put("Cơm Món",0);
        rs.put("Cơm chiên",0);
        rs.put("Hải sản",0);
        rs.put("Bún phở",0);
        rs.put("Cơm Sườn",0);
        return rs;
    }
    public static String getMouth(Date date){
        String dateInString = "2023-01-07";
        SimpleDateFormat formatter = new SimpleDateFormat("MM");
        return formatter.format(date.getMonth());
    }
    public static boolean checkAdmin(int Role){
        if (Role >=1){
            return true;
        }else
            return false;

    }
    public static boolean checkLog(int Role){
        if (Role <1){
            return true;
        }else
            return false;

    }
    public static LocalDate getNowDate() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date now = new Date();
        dateFormat.format(now);
        LocalDate nowDate = LocalDate.parse(dateFormat.format(now));
        return nowDate;

    }
    public static java.sql.Date getNowdate(){
        long millis=System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        return date;
    }
    public static String getOTP(){
        RandomStringUtils randomOTP = new RandomStringUtils();
        return randomOTP.randomAlphanumeric(8);
    }
    public static String getindex(int i){
        String rs="VALUES (";
        for (int z =1 ; z==i ; z++){
            if (z==i){
                rs+="?)";
            }
            rs+="?,";
        }
        return rs;
    }
    public static void main(String[] args) {

        System.out.println(getindex(4));
    }

}
