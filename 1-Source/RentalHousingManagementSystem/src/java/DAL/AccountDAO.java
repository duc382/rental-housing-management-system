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
import model.Profile;

/**
 *
 * @author coder
 */
public class AccountDAO extends BaseDAO {
    // get account by user and pass
    public Account getAccount(String userName, String password) {
        try {
            String sql = "Select * from account where userName=? and password=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new  Account(rs.getInt("ID"), rs.getString("username"), 
                        rs.getString("password"), rs.getDate("createdAt"), rs.getDate("updatedAt"));
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    // get profile by accountID
     public Profile getProfileByAccountID(int AccountID) {
        try {
            String sql = "Select * from Profile where AccountID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, AccountID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Profile profile = new  Profile(rs.getInt("ID"), rs.getInt("AccountID"), rs.getInt("Role"),
                        rs.getString("Name"), rs.getString("PhoneNumber"), rs.getDate("DOB"), rs.getString("Address"),
                        rs.getString("Job"), rs.getString("Email"),rs.getDate("createdAt"),rs.getDate("updatedAt"));
                return profile;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    @Override
    public ArrayList getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
