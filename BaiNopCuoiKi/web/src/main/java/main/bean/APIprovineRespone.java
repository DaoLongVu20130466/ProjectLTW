package main.bean;

import java.util.List;

public class APIprovineRespone {
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

        public List<APIprovineRespone.data> getData() {
            return data;
        }
    }
    class data{
        int ProvinceID;
        String ProvinceName;

        public int getProvinceID() {
            return ProvinceID;
        }

        public String getProvinceName() {
            return ProvinceName;
        }

        @Override
        public String toString() {
            return "data{" +
                    "ProvinceID=" + ProvinceID +
                    ", ProvinceName='" + ProvinceName + '\'' +
                    '}';
        }
    }
}
