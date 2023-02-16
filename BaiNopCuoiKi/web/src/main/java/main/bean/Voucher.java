package main.bean;


import main.services.AppService;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

public class Voucher implements Serializable {
    String idVoucher;
    String voucherName;
    String voucherCode;
    String type;
    int typeInt;
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

    public Voucher(String idVoucher, String voucherName, int typeInt, int disCount) {
        this.idVoucher = idVoucher;
        this.voucherName = voucherName;
        this.typeInt = typeInt;
        this.disCount = disCount;
    }

    public int getTypeInt() {
        return typeInt;
    }

    public void setTypeInt(int typeInt) {
        this.typeInt = typeInt;
    }

    public Voucher() {
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

    public void setIdVoucher(String idVoucher) {
        this.idVoucher = idVoucher;
    }

    public void setVoucherName(String voucherName) {
        this.voucherName = voucherName;
    }

    public void setVoucherCode(String voucherCode) {
        this.voucherCode = voucherCode;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setDisCount(int disCount) {
        this.disCount = disCount;
    }

    public void setDayStart(Date dayStart) {
        this.dayStart = dayStart;
    }

    public void setDayEnd(Date dayEnd) {
        this.dayEnd = dayEnd;
    }

    public int getIntDiscount(){
        return  this.disCount;
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
        LocalDate date1 = LocalDate.parse(dayStart.toString());
        LocalDate date2 = LocalDate.parse(dayEnd.toString());
        LocalDate nowd = LocalDate.parse(dateFormat.format(now));
        if (nowd.isAfter(date1)&&nowd.isBefore(date2)) {
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

    public static void main(String[] args) {
        Date now = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(dateFormat.format(now));
    }
}
