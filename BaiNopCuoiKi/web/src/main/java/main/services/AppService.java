package main.services;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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

    public static void main(String[] args) {
        System.out.println(intToVND(100000000));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd ");
        System.out.println();
    }
}
