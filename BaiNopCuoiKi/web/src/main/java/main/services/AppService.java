package main.services;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

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

    public static void main(String[] args) {
        System.out.println(intToVND(100000000));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd ");
        System.out.println();
    }
}
