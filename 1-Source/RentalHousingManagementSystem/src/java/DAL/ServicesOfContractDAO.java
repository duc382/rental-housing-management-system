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
import model.ServicesOfContract;

/**
 *
 * @author coder
 */
public class ServicesOfContractDAO extends BaseDAO {

    // get all services
    public ArrayList<ServicesOfContract> getAllServicesOfContract() {
        ArrayList<ServicesOfContract> listServicesOfContract = new ArrayList<>();
        try {
            String sql = "Select * from ServicesOfContract";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ServicesOfContract servicesOfContract = new ServicesOfContract(rs.getInt("ID"), rs.getInt("ServicesID"), rs.getInt("ContractID"));
                listServicesOfContract.add(servicesOfContract);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicesOfContractDAO.class.getName()).log(Level.SEVERE, null, ex);
            return (null);
        }
        return (listServicesOfContract);
    }

    // get all services
    public ArrayList<ServicesOfContract> getAllServicesOfContractByContractID(int contractID) {
        ArrayList<ServicesOfContract> listServicesOfContract = new ArrayList<>();
        try {
            String sql = "Select * from ServicesOfContract where contractID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, contractID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                ServicesOfContract servicesOfContract = new ServicesOfContract(rs.getInt("ID"), rs.getInt("ServicesID"), rs.getInt("ContractID"));
                listServicesOfContract.add(servicesOfContract);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServicesOfContractDAO.class.getName()).log(Level.SEVERE, null, ex);
            return (null);
        }
        return (listServicesOfContract);
    }

    // insert Services Of Contract
    public boolean insertServicesOfContract(ServicesOfContract servicesOfContract) {
        try {
            String sql = "Insert into ServicesOfContract(ServicesID,ContractID) values(?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, servicesOfContract.getServicesID());
            st.setInt(2, servicesOfContract.getContractID());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
//    // update services
//    public boolean  updateServices(Services service){
//        try {
//            String sql = "update services set Name=?,SupplierName=?,OriginCost=?,Price=?,CreatedAt=?,UpdatedAt=? where ID=?";
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, service.getName());
//            st.setString(2, service.getSupplierName());
//            st.setDouble(3, service.getOriginCost());
//            st.setDouble(4, service.getPrice());
//            st.setDate(5, new java.sql.Date(service.getCreatedAt().getTime()));
//            st.setDate(6, new java.sql.Date(service.getUpdatedAt().getTime()));
//            st.setInt(7, service.getID());
//            st.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
//            return false;
//        }
//        return true;
//    
    // xóa toàn bộ sevices theo contractID

    public void deleteAllServicesByContractID(int contractID) {
        try {
            String sql = "DELETE ServicesOfContract WHERE contractID=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, contractID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
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
