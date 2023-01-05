package main.bean;

public class User {
     int isblock;
    String userId;
    String userName;
    String Name;
    String password;
    String provine;
    int numberBuy;
    String status;
    String email;
    String phoneNumber;
    String avatar;

    public User(){

    }

    public User( String id,String userName, String phonenunm, String provine ,int numberBuy, String status) {
        this.userId = id;
        this.userName = userName;
        this.provine = provine;
        this.numberBuy = numberBuy;
        this.status = status;
       this.phoneNumber =phonenunm ;
    }

    public User(String userId, String userName, String password, String status, String email, String phoneNumber, String avatar) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.status = status;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.avatar = avatar;

    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public String getProvine() {
        return provine;
    }

    public int getNumberBuy() {
        return numberBuy;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }



    public void setStatus(String status) {
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }


    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", status='" + status + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", avatar='" + avatar + '\'' +
                '}';
    }
    public User(String string, String string1,String userId, int anInt, String string2) {
        this.userName= string ;
        this.password=string1;
        this.userId= userId;
        this.isblock=anInt;
        this.Name=string2;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }
}
