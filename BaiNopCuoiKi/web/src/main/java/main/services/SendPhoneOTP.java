package main.services;
import com.telerivet.TelerivetAPI;
import com.telerivet.Util;
import com.telerivet.Message;
import com.telerivet.Project;

import java.io.IOException;

public class SendPhoneOTP {
    static private String apiKey = "dx3sa_1Lnsoog5tKR2glw00hbrKsgKZS3O7A";
    static private String projectID = "PJb0397c716cac5a51";
    private String otp = AppService.getOTP();
public void sendOTP(String phoneNumber) throws IOException {
    TelerivetAPI tr = new TelerivetAPI(apiKey);
    Project project = tr.initProjectById(projectID);
    Message sent_msg = project.sendMessage(Util.options(
            "content", "Ma xac nhan cua ban la: " + otp,
            "to_number", phoneNumber));
}
public boolean checkOtp (String uotp){
    if (otp.equals(uotp)){
        return true;
    }else {
        return false;
    }
}
public void resetOTP(){
    this.otp = AppService.getOTP();
}

public static void main(String[] args) throws IOException {
    SendPhoneOTP otp = new SendPhoneOTP();
    otp.sendOTP("0375197880");
}
}
