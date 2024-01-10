package main.bean;

import main.db.ConnectMysqlExample;
import main.services.AppService;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserPemission implements Serializable {
    String UID;
    int productLevel;
    int accountLevel;
    int logLevel;
    int voucherLevel;
    int tranLevel;
    int acclv;
    String roleName;

    public UserPemission(String UID) {
        this.UID = UID;
        getUserPermisson(this.UID);
    }

    public String getRoleName() {
        return roleName;
    }

    public String getUID() {
        return UID;
    }

    public void getUserPermisson(String uid){
        try {
            Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
            PreparedStatement ps = conn.prepareStatement("SELECT ProductLevel, AccountLevel,LogLevel,VoucherLevel,TranLevel,AccountLv, RoleName FROM rolerule join role on role.ROLE = rolerule.ID WHERE role.ID_USER= ?");
            ps.setString(1,uid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                this.productLevel = rs.getInt(1);
                this.accountLevel=rs.getInt(2);
                this.logLevel=rs.getInt(3);
                this.voucherLevel=rs.getInt(4);
                this.tranLevel=rs.getInt(5);
                this.acclv=rs.getInt(6);
                this.roleName = rs.getString(7);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateRole(String roleID){
        try {
        Connection conn = ConnectMysqlExample.getConnection(ConnectMysqlExample.getDbUrl(), ConnectMysqlExample.getUserName(), ConnectMysqlExample.getPASSWORD());
        PreparedStatement ps = conn.prepareStatement("UPDATE role SET ROLE = ? WHERE ID_USER = ?");
        ps.setString(1,roleID);
        ps.setString(2,this.UID);
        ps.executeUpdate();
        }
     catch (SQLException e) {
        throw new RuntimeException(e);
    }
    }
    public boolean canWatchproduct(){
        if(this.productLevel > 0)
            return true;
        else
            return false;
    }
    public boolean canAdEditproduct(){
        if(this.productLevel > 1)
            return true;
        else
            return false;
    }
    public boolean canRemoveproduct(){
        if(this.productLevel > 2)
            return true;
        else
            return false;
    }
    public boolean canWatchAcc(){
        if(this.accountLevel > 0)
            return true;
        else
            return false;
    }
    public boolean canEditRole(){
        if(this.accountLevel > 1)
            return true;
        else
            return false;
    }
    public boolean canRemoveAcc(){
        if(this.accountLevel > 2)
            return true;
        else
            return false;
    }
    public boolean canWatchVoucher(){
        if(this.voucherLevel > 0)
            return true;
        else
            return false;
    }
    public boolean canEditAddVoucher(){
        if(this.voucherLevel > 1)
            return true;
        else
            return false;
    }
    public boolean canRemoveVoucher(){
        if(this.voucherLevel > 2)
            return true;
        else
            return false;
    }
    public boolean canWatchTran(){
        if(this.tranLevel > 0)
            return true;
        else
            return false;
    }
    public boolean canEditAddTran(){
        if(this.tranLevel > 1)
            return true;
        else
            return false;
    }
    public boolean canRemoveTran(){
        if(this.tranLevel > 2)
            return true;
        else
            return false;
    }

    public boolean canWatchLog(){
        if(this.logLevel > 0)
            return true;
        else
            return false;
    }
    public boolean canRemoveLog(){
        if(this.logLevel >= 3)
            return true;
        else
            return false;
    }
    public boolean isLvLager(UserPemission target){
        if(this.acclv > target.acclv)
            return true;
        else return false;
    }
}
