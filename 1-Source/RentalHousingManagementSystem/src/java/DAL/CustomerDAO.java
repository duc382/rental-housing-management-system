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
import model.Customer;

/**
 *
 * @author coder
 */
public class CustomerDAO extends BaseDAO {

    // get all Customer
    public ArrayList<Customer> getAllCustomer() {
        ArrayList<Customer> listCustomer = new ArrayList<>();
        try {
            String sql = "Select * from Customer";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer customer = new Customer(rs.getInt("ID"), rs.getInt("ContractID"), rs.getString("Name"),
                        rs.getString("PhoneNumber"), rs.getDate("DOB"), rs.getString("CCCD"), rs.getString("Address"),
                        rs.getString("job"), rs.getString("Email"), rs.getInt("sex"), rs.getString("RelativePhoneNumber"),
                        rs.getDate("createdAt"), rs.getDate("updatedAt"));
                listCustomer.add(customer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
            return (null);
        }
        return (listCustomer);
    }

    // insert Customer
    public boolean insertCustomer(Customer customer) {
        try {
            String sql = "Insert into Customer(ContractID,Name,PhoneNumber,DOB,CCCD,Address,job,Email,sex,RelativePhoneNumber,createdAt,updatedAt) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, customer.getContractID());
            st.setString(2, customer.getName());
            st.setString(3, customer.getPhoneNumber());
            st.setDate(4, new java.sql.Date(customer.getDOB().getTime()));
            st.setString(5, customer.getCCCD());
            st.setString(6, customer.getAddress());
            st.setString(7, customer.getJob());
            st.setString(8, customer.getEmail());
            st.setInt(9, customer.getSex());
            st.setString(10, customer.getRelativeNumber());
            st.setDate(11, new java.sql.Date(customer.getCreatedAt().getTime()));
            st.setDate(12, new java.sql.Date(customer.getUpdatedAt().getTime()));
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    // lay nguoi chua co hop dong
    public ArrayList<Customer> getCustomerNoneContract(){
        ArrayList<Customer> listCustomer = new ArrayList<>();
        try {
            String sql = "Select * from Customer where ContractID is null or contractID = 0";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
//                String sql = "Insert into Customer(ContractID,Name,PhoneNumber,DOB,CCCD,Address,job,Email,sex,RelativePhoneNumber,createdAt,updatedAt)";
                Customer customer = new  Customer(rs.getInt("ID"),rs.getInt("ContractID"), rs.getString("Name"),rs.getString("PhoneNumber"),
                rs.getDate("DOB"),rs.getString("CCCD"), rs.getString("Address"),rs.getString("job"),rs.getString("Email"),rs.getInt("sex"),
                rs.getString("RelativePhoneNumber"),rs.getDate("CreatedAt"), rs.getDate("UpdatedAt"));
                listCustomer.add(customer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return(listCustomer);
    }
    // lay nguoi theo id
    public Customer getCustomerByID(int ID){
        try {
            String sql = "Select * from Customer where ID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
//                String sql = "Insert into Customer(ContractID,Name,PhoneNumber,DOB,CCCD,Address,job,Email,sex,RelativePhoneNumber,createdAt,updatedAt)";
                Customer customer = new  Customer(rs.getInt("ID"),rs.getInt("ContractID"), rs.getString("Name"),rs.getString("PhoneNumber"),
                rs.getDate("DOB"),rs.getString("CCCD"), rs.getString("Address"),rs.getString("job"),rs.getString("Email"),rs.getInt("sex"),
                rs.getString("RelativePhoneNumber"),rs.getDate("CreatedAt"), rs.getDate("UpdatedAt"));
                return(customer);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return(null);
    }
    // update room for customer by relative and romid
    public boolean updateContractForCustomer(int ID, int ContractID){
        try {
            String sql = "update customer set ContractID = ? where ID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ContractID);
            st.setInt(2, ID);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
            return(false);
        }
        return(true);
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
//            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
//            return false;
//        }
//        return true;
//    }
//    // delete services by id
//    public void deleteServices(int id) {
//       try {
//           String sql = "DELETE Services WHERE id=?";
//           PreparedStatement statement = connection.prepareStatement(sql);
//           statement.setInt(1, id);
//           statement.executeUpdate();
//       } catch (SQLException ex) {
//           Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
//       }
//   }

    @Override
    public ArrayList getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
