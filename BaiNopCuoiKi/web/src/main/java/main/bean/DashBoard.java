package main.bean;

import main.services.AppService;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

public class DashBoard implements Serializable {
    ArrayList<Order> totalvalue;

    HashMap<String, Integer> type = AppService.getTypeMap();

    public DashBoard(ArrayList<Order> totalvalue) {
        this.totalvalue = totalvalue;
    }

    public int getTotal() {
        int rs = 0;
        for (Order e : totalvalue) {
            rs += e.getProfit();
        }
        return rs;
    }

    public int getTotalODer() {
        int rs = 0;
        for (Order e : totalvalue) {
                rs+=1;
        }
        return rs;
    }


    public int getTotalOderComplete() {
        int rs = 0;
        for (Order e : totalvalue) {
                if ("Đã Giao".equals(e.status))
                    rs += 1;
        }
        return rs;
    }

    public HashMap<String, Integer> getotalType (){
        for (Order e : totalvalue) {
            type = increaseType(e);
        }
        return type;
    }
    //
    public int getTotalByMouth(String m) {
        int rs = 0;
        for (Order e : totalvalue) {
            if ((m.equals(AppService.getMouth(e.getDayCrate())))) {
                rs += e.getProfit();
            }
        }
        return rs;
    }

    public int getTotalODerBuyMouth(String m) {
        int rs = 0;
        for (Order e : totalvalue) {
            if (m.equals(AppService.getMouth(e.getDayCrate()))) {
                rs += 1;
            }

        }
        return rs;
    }


    public int getTotalOderCompleteByMouth(String m) {
        int rs = 0;
        for (Order e : totalvalue) {
            if ((m.equals(AppService.getMouth(e.getDayCrate())))) {
                if ("Đã Giao".equals(e.status))
                    rs += 1;
            }
        }
        return rs;
    }

        public HashMap<String, Integer> getotalTypeBym (String m){
            for (Order e : totalvalue) {
                if ((m.equals(AppService.getMouth(e.getDayCrate()))))
                    type = increaseType(e);
            }
            return type;
        }

    public HashMap<String, Integer> getttype(){
        for (Order e : totalvalue) {
                type = increaseType(e);
        }
        return type;
    }


    public HashMap<String, Integer> increaseType(Order e) {
        for (OderCart pr : e.getAllOderCart()) {
            switch (pr.getItem().getType()) {
                case "TYPE1":
                    type.replace("Cơm gà", type.get("Cơm gà") + pr.getValue());
                    break;
                case "TYPE2":
                    type.replace("Cơm bò", type.get("Cơm bò") + +pr.getValue());
                    break;
                case "TYPE3":
                    type.replace("Cơm Món", type.get("Cơm Món") + +pr.getValue());
                    break;
                case "TYPE4":
                    type.replace("Cơm chiên", type.get("Cơm chiên") + +pr.getValue());
                    break;
                case "TYPE5":
                    type.replace("Hải sản", type.get("Hải sản") + pr.getValue());
                    break;
                case "TYPE7":
                    type.replace("Bún phở", type.get("Bún phở") + pr.getValue());
                    break;
                case "TYPE9":
                    type.replace("Cơm Sườn", type.get("Cơm Sườn") + pr.getValue());
                    break;
                default:
            }
        }
        return type;
    }

    public static void main(String[] args) {
        System.out.printf(AppService.getTypeMap().toString());
        System.out.printf(String.valueOf(AppService.getTypeMap().get("CƠM SƯỜN")));
    }

}
