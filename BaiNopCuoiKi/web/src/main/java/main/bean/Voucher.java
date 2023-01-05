package main.bean;

import main.services.AppService;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

public class Voucher {
    String idVoucher;
    String voucherName;
    String voucherCode;
    String type;
    int disCount;
    Date dayStart;
    Date dayEnd;

    public Voucher(String idVoucher, String voucherName, String voucherCode, String type, int disCount, Date dayStart, Date dayEnd) {
        this.idVoucher = idVoucher;
        this.voucherName = voucherName;
        this.voucherCode = voucherCode;
        this.type = type;
        this.disCount = disCount;
        this.dayStart = dayStart;
        this.dayEnd = dayEnd;
    }

    public Voucher(String idVoucher) {
        this.idVoucher = idVoucher;
    }

    public String getIdVoucher() {
        return idVoucher;
    }

    public String getVoucherCode() {
        return voucherCode;
    }

    public String getType() {
        return type;
    }

    public String getDisCount() {
        if (1 == getIntType(this.type)) {
            return disCount + "%";
        }
        else
            return AppService.intToVND(disCount);
    }

    public Date getDayStart() {
        return dayStart;
    }

    public String getVoucherName() {
        return voucherName;
    }

    public Date getDayEnd() {
        return dayEnd;
    }
    public int getIntType(String type){
        if("Giảm Phần Trăm".equals(type))
            return 1;
        if("Giảm Tiền".equals(type))
            return 0;
        if("Free Ship".equals(type))
            return 2;
        return 1;
    }

    public String getIsOutDate() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date now = new Date();
        dateFormat.format(now);
        if (now.after(dayStart)&&now.before(dayEnd)) {
            return "Khả Dụng";
        }
        else return "Không Khả Dụng";
    }

    @Override
    public String toString() {
        return "Voucher{" +
                "idVoucher='" + idVoucher + '\'' +
                ", voucherName='" + voucherName + '\'' +
                ", voucherCode='" + voucherCode + '\'' +
                ", type='" + type + '\'' +
                ", disCount=" + disCount +
                ", dayStart=" + dayStart.toString() +
                ", dayEnd=" + dayEnd.toString() +
                '}';
    }
}
