package main.services;

import com.telerivet.Message;
import com.telerivet.Project;
import com.telerivet.TelerivetAPI;
import com.telerivet.Util;
import main.bean.Log;
import main.db.ConnectMysqlExample;

import java.io.IOException;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;

public class SendPhoneOTP {
    static private String apiKey = "dx3sa_1Lnsoog5tKR2glw00hbrKsgKZS3O7A";
    static private String projectID = "PJb0397c716cac5a51";

    private String otp = AppService.getOTP();
    private LocalDateTime time = LocalDateTime.now();

    int trying = 0;
    String ID_user;

    String phoneNumber;

    String newpass = AppService.getOTP();

    public SendPhoneOTP(String phoneNumber) {
        this.phoneNumber = phoneNumber;
        getData(phoneNumber);
    }

    public void sendNewPass() throws IOException {
        TelerivetAPI tr = new TelerivetAPI(apiKey);
        Project project = tr.initProjectById(projectID);
        Message sent_msg = project.sendMessage(Util.options(
                "content", "Mat khau moi cua ban la: " + newpass,
                "to_number", phoneNumber));
    }

    public String getNewpass() {
        return newpass;
    }

    public void sendOTP() throws IOException {
        TelerivetAPI tr = new TelerivetAPI(apiKey);
        Project project = tr.initProjectById(projectID);
        Message sent_msg = project.sendMessage(Util.options(
                "content", "Ma xac nhan cua ban la: " + otp,
                "to_number", phoneNumber));
    }

    public boolean isHaveUser(){
        if (this.ID_user==null){
            return false;
        }
        else return true;
    }
    public void getData(String phoneNumber) {
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement statement = conn.prepareStatement("select ID_USER,PHONE_NUMBER,USER_NAMES FROM user_information WHERE PHONE_NUMBER = ?");
            statement.setString(1,phoneNumber);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
               this.ID_user =  rs.getString(1);
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public boolean checkOtp(String uotp) {
        LocalDateTime checkTime = LocalDateTime.now();
        if (otp.equals(uotp) && getmin(time, checkTime) < 5) {
            return true;
        } else {
            trying++;
            return false;
        }
    }
    public boolean isOverTime(){
        if (trying>5){
            return true;

        }else return false;
    }

    public long getmin(LocalDateTime fromDateTime, LocalDateTime toDateTime) {

        LocalDateTime tempDateTime = LocalDateTime.from(fromDateTime);
        long minutes = tempDateTime.until(toDateTime, ChronoUnit.MINUTES);
        return minutes;
    }

    public void resetOTP() {
        this.otp = AppService.getOTP();
    }

    public String getTargetID() {
        String target = "";
        try {
            target = "";
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());

            PreparedStatement statement = conn.prepareStatement("SELECT ID_ACCOUNT FROM `accounts` WHERE ID_USER = ?");
            statement.setString(1, ID_user);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                target = rs.getString(1);
            }
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return target;
    }

    public static void main(String[] args) throws IOException {
        SendPhoneOTP otp = new SendPhoneOTP("+84337376582");
        System.out.println(otp.getTargetID());
//        if (otp.isHaveUser()){
//            otp.sendOTP();
//        }
//        else {
//            System.out.println("k co user");
//        }

//        LocalDateTime checkTime = LocalDateTime.now();
//        LocalDateTime toDateTime = LocalDateTime.of(2014, 9, 10, 6, 40, 45);
//        System.out.println(otp.getmin(checkTime, toDateTime));
    }

    public String getID_user() {
        return this.ID_user;
    }
}
