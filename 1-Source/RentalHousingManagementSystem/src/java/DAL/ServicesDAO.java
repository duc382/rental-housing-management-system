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
import model.Services;

/**
 *
 * @author coder
 */
public class ServicesDAO extends BaseDAO {
    // get all services
    public ArrayList<Services> getAllServices(){
        ArrayList<Services> listServices = new ArrayList<>();
        try {
            String sql = "Select * from services";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Services services = new  Services(rs.getInt("ID"), rs.getString("Name"), rs.getString("SupplierName"), 
                rs.getDouble("OriginCost"), rs.getDouble("price"), rs.getDate("CreatedAt"), rs.getDate("UpdatedAt"));
                listServices.add(services);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return(null);
        }
        return(listServices);
    }
    // insert services
    public boolean insertServices(Services service) {
        try {
            String sql = "Insert into Services(Name,SupplierName,OriginCost,Price,CreatedAt,UpdatedAt) values(?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, service.getName());
            st.setString(2, service.getSupplierName());
            st.setDouble(3, service.getOriginCost());
            st.setDouble(4, service.getPrice());
            st.setDate(5, new java.sql.Date(service.getCreatedAt().getTime()));
            st.setDate(6, new java.sql.Date(service.getUpdatedAt().getTime()));
            ResultSet rs = st.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    // update services
    public boolean  updateServices(Services service){
        try {
            String sql = "update services set Name=?,SupplierName=?,OriginCost=?,Price=?,CreatedAt=?,UpdatedAt=? where ID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, service.getName());
            st.setString(2, service.getSupplierName());
            st.setDouble(3, service.getOriginCost());
            st.setDouble(4, service.getPrice());
            st.setDate(5, new java.sql.Date(service.getCreatedAt().getTime()));
            st.setDate(6, new java.sql.Date(service.getUpdatedAt().getTime()));
            st.setInt(7, service.getID());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    // delete services by id
    public void deleteServices(int id) {
       try {
           String sql = "DELETE Services WHERE id=?";
           PreparedStatement statement = connection.prepareStatement(sql);
           statement.setInt(1, id);
           statement.executeUpdate();
       } catch (SQLException ex) {
           Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
       }
   }
    @Override
    public ArrayList getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}