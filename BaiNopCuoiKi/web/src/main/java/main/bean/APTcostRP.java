package main.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class APTcostRP {
    String message;
    String status;
    List<data> data;

    public String getMessage() {
        return message;
    }

    public String getStatus() {
        return status;
    }

    public List<APTcostRP.data> getData() {
        return data;
    }

    class data{
        int service_fee;

        public int getService_fee() {
            return service_fee;
        }
    }
}
