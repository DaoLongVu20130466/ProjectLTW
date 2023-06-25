package main.bean;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

public class ApiAllOderReponse {
    private String id;
    private String email;
    private String fromDistrictId;
    private String fromWardId;
    private String toDistrictId;
    private String toWardId;
    private int height;
    private int length;
    private int width;
    private int weight;
    private int fee;
    private String leadTime;
    private int active;
    private String created_at;
    private String updated_at;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFromDistrictId() {
        return fromDistrictId;
    }

    public void setFromDistrictId(String fromDistrictId) {
        this.fromDistrictId = fromDistrictId;
    }

    public String getFromWardId() {
        return fromWardId;
    }

    public void setFromWardId(String fromWardId) {
        this.fromWardId = fromWardId;
    }

    public String getToDistrictId() {
        return toDistrictId;
    }

    public void setToDistrictId(String toDistrictId) {
        this.toDistrictId = toDistrictId;
    }

    public String getToWardId() {
        return toWardId;
    }

    public void setToWardId(String toWardId) {
        this.toWardId = toWardId;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }
    public Date getTimedeliver() throws IOException, ParseException {
        ApiController c = new ApiController();
        return c.getTimedeliver(fromDistrictId,fromWardId,toDistrictId,toWardId);
    }

    public void update() throws IOException, ParseException {
        ApiController c = new ApiController();
        voidGetTime(c);
//        getfrom();
        getTo(c);

//        setLeadTime(c.getTimedeliver(fromDistrictId,fromWardId,toDistrictId,toWardId).toString());
    }
    public int getWidth() {
        return width;
    }

    public void getfrom() throws IOException {
        ApiController c = new ApiController();
        setFromDistrictId(c.getLocation(fromDistrictId,fromWardId));
    }
    public void getTo(ApiController c) throws IOException {
        setToDistrictId(c.getLocation(toDistrictId,toWardId));
    }
    public void voidGetTime(ApiController c) throws IOException, ParseException {
        setLeadTime(c.getTimedeliver("3695","90755",toDistrictId,toWardId).toString());
    }
    public void setWidth(int width) {
        this.width = width;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public String getLeadTime() {
        return leadTime;
    }

    public void setLeadTime(String leadTime) {
        this.leadTime = leadTime;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    @Override
    public String toString() {
        return "ApiAllOderReponse{" +
                "id='" + id + '\'' +
                ", email='" + email + '\'' +
                ", fromDistrictId='" + fromDistrictId + '\'' +
                ", fromWardId='" + fromWardId + '\'' +
                ", toDistrictId='" + toDistrictId + '\'' +
                ", toWardId='" + toWardId + '\'' +
                ", height=" + height +
                ", length=" + length +
                ", width=" + width +
                ", weight=" + weight +
                ", fee=" + fee +
                ", leadTime='" + leadTime + '\'' +
                ", active=" + active +
                ", created_at='" + created_at + '\'' +
                ", updated_at='" + updated_at + '\'' +
                '}';
    }
}
