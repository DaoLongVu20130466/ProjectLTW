package main.bean;

public class Key {
    String id_key;
    String key;
    String status;
    String timeActive;

    public Key() {
    }

    public Key(String id_key, String key, String status, String timeActive) {
        this.id_key = id_key;
        this.key = key;
        this.status = status;
        this.timeActive = timeActive;
    }

    public String getId_key() {
        return id_key;
    }

    public String getKey() {
        return key;
    }

    public String getStatus() {
        return status;
    }

    public String getTimeActive() {
        return timeActive;
    }

    public void setId_key(String id_key) {
        this.id_key = id_key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setTimeActive(String timeActive) {
        this.timeActive = timeActive;
    }
}
