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
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Request;

/**
 *
 * @author coder
 */
public class RequestDAO extends BaseDAO {

    public ArrayList<Request> getAllRequest() {
        ArrayList<Request> listRequest = new ArrayList<>();
        try {
            String sql = "Select * from Customer";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Request request = new Request(rs.getInt("ID"), rs.getInt("AccountID"), rs.getString("Content"),
                        rs.getInt("Status"), rs.getString("note"), rs.getDate("createdAt"), rs.getDate("updatedAt"));
                listRequest.add(request);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
            return (null);
        }
        return (listRequest);
    }

    public ArrayList<Request> getAllRequestByAccoutnID(int accountID) {
        ArrayList<Request> listRequest = new ArrayList<>();
        try {
            String sql = "Select * from Request where AccountID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Request request = new Request(rs.getInt("ID"), rs.getInt("AccountID"), rs.getString("Content"),
                        rs.getInt("Status"), rs.getString("note"), rs.getDate("createdAt"), rs.getDate("updatedAt"));
                listRequest.add(request);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
            return (null);
        }
        return (listRequest);
    }

    public void insertRequest(Request request) {
        try {
            String sql = "insert into Request(AccountID,Content,Status,Note,CreatedAt,UpdatedAt) values(?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, request.getAccountID());
            st.setString(2, request.getContent());
            st.setInt(3, 0);
            st.setString(4, request.getNote());
            st.setDate(5, new java.sql.Date(request.getCreatedAt().getTime()));
            st.setDate(6, new java.sql.Date(request.getUpdatedAt().getTime()));
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void updateRequestOfGuest(int id, String content, Date updated) {
        try {
            String sql = "update Request set Content=?, updatedAt=? where id=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, content);
            st.setDate(2, new java.sql.Date(updated.getTime()));
            st.setInt(3, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void deleteRequest(int id) {
        try {
            String sql = "delete request where id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RequestDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public ArrayList getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

//    public static void main(String[] args) {
//        Request request = new Request(12, "Sửa vòi nước", 0, "", createdAt, updatedAt)
//    }
}
