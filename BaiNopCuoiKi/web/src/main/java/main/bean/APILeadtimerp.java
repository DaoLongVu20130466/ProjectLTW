package main.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class APILeadtimerp {
    String message;
    String status;
    List<data> data;

    public String getMessage() {
        return message;
    }



    public String getStatus() {
        return status;
    }



    public List<APILeadtimerp.data> getData() {
        return data;
    }


    class data{

        int timestamp;
        String formattedDate;

        public int getTimestamp() {
            return timestamp;
        }
        public Date getFormattedDate() throws ParseException {
            SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
            Date date1=formatter1.parse(formattedDate);
            return date1;
        }
    }
}
