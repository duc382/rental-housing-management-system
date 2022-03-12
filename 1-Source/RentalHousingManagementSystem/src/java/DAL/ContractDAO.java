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
import model.Contract;

/**
 *
 * @author coder
 */
public class ContractDAO extends BaseDAO {
    // get all services

    public ArrayList<Contract> getAllContract() {
        ArrayList<Contract> listContract = new ArrayList<>();
        try {
            String sql = "Select * from Contract";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contract contract = new Contract(rs.getInt("ID"), rs.getInt("RoomID"), rs.getInt("CustomerIDRepresentative"),
                        rs.getString("Note"), rs.getInt("status"), rs.getString("RoomName"),
                        rs.getDate("StartAt"), rs.getDate("EndAt"), rs.getDate("CreatedAt"), rs.getDate("UpdatedAt"));
                listContract.add(contract);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return (null);
        }
        return (listContract);
    }
    // get all contract status = 1
    public ArrayList<Contract> getAllContractOn() {
        ArrayList<Contract> listContract = new ArrayList<>();
        try {
            String sql = "Select * from Contract where status = 1";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contract contract = new Contract(rs.getInt("ID"), rs.getInt("RoomID"), rs.getInt("CustomerIDRepresentative"),
                        rs.getString("Note"), rs.getInt("status"), rs.getString("RoomName"),
                        rs.getDate("StartAt"), rs.getDate("EndAt"), rs.getDate("CreatedAt"), rs.getDate("UpdatedAt"));
                listContract.add(contract);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return (null);
        }
        return (listContract);
    }
        // get ContractID
    public Contract getContractByContractID(int ID) {
        try {
            String sql = "Select * from Contract where ID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contract contract = new Contract(rs.getInt("ID"), rs.getInt("RoomID"), rs.getInt("CustomerIDRepresentative"),
                        rs.getString("Note"), rs.getInt("status"), rs.getString("RoomName"),
                        rs.getDate("StartAt"), rs.getDate("EndAt"), rs.getDate("CreatedAt"), rs.getDate("UpdatedAt"));
                return (contract);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContractDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (null);
    }
    // get Contract by RoomID and status = 1
    public Contract getContractByRooIDAndStatus(int roomID, int status) {
        try {
            String sql = "Select * from Contract where roomID = ? and status = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roomID);
            st.setInt(2, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contract contract = new Contract(rs.getInt("ID"), rs.getInt("RoomID"), rs.getInt("CustomerIDRepresentative"),
                        rs.getString("Note"), rs.getInt("status"), rs.getString("RoomName"),
                        rs.getDate("StartAt"), rs.getDate("EndAt"), rs.getDate("CreatedAt"), rs.getDate("UpdatedAt"));
                return (contract);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContractDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (null);
    }
    // get contract by relativeID
    public Contract getContractByRepresentative(int RepresentativeID) {
        try {
            String sql = "Select * from Contract where CustomerIDRepresentative = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, RepresentativeID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contract contract = new Contract(rs.getInt("ID"), rs.getInt("RoomID"), rs.getInt("CustomerIDRepresentative"),
                        rs.getString("Note"), rs.getInt("status"), rs.getString("RoomName"),
                        rs.getDate("StartAt"), rs.getDate("EndAt"), rs.getDate("CreatedAt"), rs.getDate("UpdatedAt"));
                return (contract);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContractDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (null);
    }
    // insert contract
    public boolean insertContract(Contract contract) {
        try {
            String sql = "Insert into Contract(RoomID,CustomerIDRepresentative,Note,status,RoomName,startAt,endAt,CreatedAt,UpdatedAt) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, contract.getRoomID());
            st.setInt(2, contract.getCustomerIDRepresentative());
            st.setString(3, contract.getNote());
            st.setInt(4, contract.getStatus());
            st.setString(5, contract.getRoomName());
            st.setDate(6, new java.sql.Date(contract.getStartAt().getTime()));
            st.setDate(7, new java.sql.Date(contract.getEndAt().getTime()));
            st.setDate(8, new java.sql.Date(contract.getCreatedAt().getTime()));
            st.setDate(9, new java.sql.Date(contract.getUpdatedAt().getTime()));
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    // update services
    public boolean  updateContract(Contract contract){
        try {
            String sql = "update Contract set CustomerIDRepresentative=?,Note=?,startAt=?,endAt=?,UpdatedAt=? where id=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, contract.getCustomerIDRepresentative());
            st.setString(2, contract.getNote());
            st.setDate(3, new java.sql.Date(contract.getStartAt().getTime()));
            st.setDate(4, new java.sql.Date(contract.getEndAt().getTime()));
            st.setDate(5, new java.sql.Date(contract.getUpdatedAt().getTime()));
            st.setInt(6, contract.getID());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    public boolean  updateRoomNameContract(String roomName, Date updatedAt, int ID){
        try {
            String sql = "update Contract set RoomName=?, updatedAt = ? where id=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1,roomName);
            st.setDate(2, new java.sql.Date(updatedAt.getTime()));
            st.setInt(3, ID);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ContractDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    // cancel contract by id
    public void cancelContractByID(String id, Date updatedAt) {
       try {
           String sql = "update Contract set roomID = null, status = 0, UpdatedAt = ? where ID = ?";
           PreparedStatement st = connection.prepareStatement(sql);
           st.setDate(1, new java.sql.Date(updatedAt.getTime()));
           st.setString(2, id);
           st.executeUpdate();
       } catch (SQLException ex) {
           Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
   }

    @Override
    public ArrayList getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
//    public static void main(String[] args) {
//        ContractDAO
//    }
}
