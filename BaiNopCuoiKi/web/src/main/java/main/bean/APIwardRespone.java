package main.bean;

import java.util.List;

public class APIwardRespone {
    private Headers headers;
    private Original original;
    public Original getOriginal() {
        return original;
    }


    class Headers {
    }
    class Original {
        String message;
        int status;
        List<data> data;

        public String getMessage() {
            return message;
        }

        public int getStatus() {
            return status;
        }

        public List<data> getData() {
            return data;
        }
    }
    public class data{
        int WardCode;
        int DistrictID;
        String WardName;

        @Override
        public String toString() {
            return "data{" +
                    "WardCode=" + WardCode +
                    ", DistrictID=" + DistrictID +
                    ", WardName='" + WardName + '\'' +
                    '}';
        }

        public int getWardCode() {
            return WardCode;
        }

        public int getDistrictID() {
            return DistrictID;
        }

        public String getWardName() {
            return WardName;
        }
    }


}
