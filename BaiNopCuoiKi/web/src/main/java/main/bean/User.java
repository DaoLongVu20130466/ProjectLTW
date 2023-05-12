package main.bean;

import java.io.Serializable;

public class User implements Serializable {
    String userId;
    String userName;
    String password;
    String provine;
    int numberBuy;
    int status;

    String IDadress;
    String statuss;
    String email;
    String phoneNumber;
    String avatar;
    int isblock;
    int role;
    String Name;
    String roleName;
    String idacc;
    String cmt;
    String img_cmt;


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


    public User(String avatar,String userName,  String cmt ,   String img_cmt) {
        this.avatar = avatar;
        this.userName = userName;
        this.cmt = cmt;
        this.img_cmt = img_cmt;
    }

    public User(String string, String string1, String userId, int anInt, String string2, int role , String roleName, String ID_acc) {
        this.userName= string ;
        this.password=string1;
        this.userId= userId;
        this.isblock=anInt;
        this.Name=string2;
        this.role=role;
        this.roleName =roleName;
        this.idacc= ID_acc;
    }

    public  User(String userName, String provine, String phoneNumber, String status, String avatar, String email,String idacc) {
        this.userName = userName;
        this.provine = provine;
        this.phoneNumber = phoneNumber;
        this.statuss = status;
        this.avatar = avatar;
        this.email = email;
        this.idacc = idacc;

    }

    public String getImg_cmt() {
        return img_cmt;
    }

    public void setImg_cmt(String img_cmt) {
        this.img_cmt = img_cmt;
    }

    public String getIDadress() {
        return IDadress;
    }

    public void setIDadress(String IDadress) {
        this.IDadress = IDadress;
    }

    public void setNumberBuy(int numberBuy) {
        this.numberBuy = numberBuy;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setIsblock(int isblock) {
        this.isblock = isblock;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public void setProvine(String provine) {
        this.provine = provine;
    }

    public String getStatuss() {
        return statuss;
    }

    public void setStatuss(String statuss) {
        this.statuss = statuss;
    }

    public String getIdacc() {
        return idacc;
    }

    public void setIdacc(String idacc) {
        this.idacc = idacc;
    }

    public int getRole() {
        return role;
    }

    public String getCmt() {
        return cmt;
    }

    public void setCmt(String cmt) {
        this.cmt = cmt;
    }

    public int getIsblock() {
        return isblock;
    }

    public String getRoleName() {
        return roleName;
    }
    public boolean checkRole(int i) {
        return this.role >= i;
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
