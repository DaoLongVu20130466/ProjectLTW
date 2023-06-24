package main.bean;

import java.util.List;

public class APIDistrictRespone {
    private Headers headers;
    private Original original;

    public Headers getHeaders() {
        return headers;
    }

    public void setHeaders(Headers headers) {
        this.headers = headers;
    }

    public Original getOriginal() {
        return original;
    }

    public void setOriginal(Original original) {
        this.original = original;
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

        public List<APIDistrictRespone.data> getData() {
            return data;
        }
    }
    public class data{
        int ProvinceID;
        int DistrictID;
        String DistrictName;

        public int getProvinceID() {
            return ProvinceID;
        }

        public int getDistrictID() {
            return DistrictID;
        }

        public String getDistrictName() {
            return DistrictName;
        }

        @Override
        public String toString() {
            return "data{" +
                    "ProvinceID=" + ProvinceID +
                    ", DistrictID=" + DistrictID +
                    ", DistrictName='" + DistrictName + '\'' +
                    '}';
        }
    }
}
