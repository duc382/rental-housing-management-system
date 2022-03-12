/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author coder
 */
public class AccountDAO extends BaseDAO {
    //get all account
    public ArrayList<Account> getAllAccount(){
        ArrayList<Account> listAccount = new ArrayList<>();
        try {
            String sql = "Select * from account";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt("ID"), rs.getInt("RoomID"), rs.getString("username"),
                        rs.getString("password"), rs.getInt("role"), rs.getDate("createdAt"), rs.getDate("updatedAt"));
                listAccount.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return listAccount;
    }
    // get account by user and pass
    public Account getAccount(String userName, String password) {
        try {
            String sql = "Select * from account where userName=? and password=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt("ID"), rs.getInt("RoomID"), rs.getString("username"),
                        rs.getString("password"), rs.getInt("role"), rs.getDate("createdAt"), rs.getDate("updatedAt"));
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    // get account by RoomID
    public Account getAccountByRoomID(int roomID) {
        try {
            String sql = "Select * from account where RoomID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roomID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt("ID"), rs.getInt("RoomID"), rs.getString("username"),
                        rs.getString("password"), rs.getInt("role"), rs.getDate("createdAt"), rs.getDate("updatedAt"));
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    // insert account
    public boolean insertAccount(Account account) {
        try {
            String sql = "insert into Account(RoomID,Username,Password,role,CreatedAt,UpdatedAt) values(?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account.getRoomID());
            st.setString(2, account.getUsername());
            st.setString(3, account.getPassword());
            st.setInt(4, account.getRole());
            st.setDate(5, new java.sql.Date(account.getCreatedAt().getTime()));
            st.setDate(6, new java.sql.Date(account.getUpdatedAt().getTime()));
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    // insert account
    public boolean insertAccountAdmin(Account account) {
        try {
            String sql = "insert into Account(Username,Password,role,CreatedAt,UpdatedAt) values(?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getUsername());
            st.setString(2, account.getPassword());
            st.setInt(3, account.getRole());
            st.setDate(4, new java.sql.Date(account.getCreatedAt().getTime()));
            st.setDate(5, new java.sql.Date(account.getUpdatedAt().getTime()));
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    // update account
    public boolean  updateAccount(Account account){
        try {
            String sql = "update account set Username=?,Password=?,UpdatedAt=? where ID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getUsername());
            st.setString(2, account.getPassword());
            st.setDate(3, new java.sql.Date(account.getUpdatedAt().getTime()));
            st.setInt(4, account.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    // delete Account by roomID
    public void deleteAccount(int roomId) {
       try {
           String sql = "DELETE account WHERE Roomid=?";
           PreparedStatement statement = connection.prepareStatement(sql);
           statement.setInt(1, roomId);
           statement.executeUpdate();
       } catch (SQLException ex) {
           Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
   }
    @Override
    public ArrayList getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public static void main(String[] args) {
        AccountDAO DBAcc = new AccountDAO();
        ArrayList<Account> listAccount = DBAcc.getAllAccount();
        System.out.println(listAccount);
    }
}
