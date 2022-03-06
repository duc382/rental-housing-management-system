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
//    // delete services by id
//    public void deleteServices(int id) {
//       try {
//           String sql = "DELETE Services WHERE id=?";
//           PreparedStatement statement = connection.prepareStatement(sql);
//           statement.setInt(1, id);
//           statement.executeUpdate();
//       } catch (SQLException ex) {
//           Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
//       }
//   }

    @Override
    public ArrayList getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
