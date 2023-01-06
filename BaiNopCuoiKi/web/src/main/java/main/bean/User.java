package main.bean;

public class User {
    String userId;
    String userName;
    String password;
    String provine;
    int numberBuy;
    int status;
    String email;
    String phoneNumber;
    String avatar;

    public User(){

    }

    public User(String userId, String userName, String phoneNumber, String provine ,int numberBuy, int status) {
        this.userId = userId;
        this.userName = userName;
        this.provine = provine;
        this.numberBuy = numberBuy;
        this.status = status;
        this.phoneNumber = phoneNumber;
    }

    public User(String userId, String userName, String password, int status, String email, String phoneNumber, String avatar) {
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
        if(getStatusInt() == 0 )
            return "Bình Thường";
        else return "Bị Khóa";
    }

    public int getStatusInt(){
        return this.status;
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
}
