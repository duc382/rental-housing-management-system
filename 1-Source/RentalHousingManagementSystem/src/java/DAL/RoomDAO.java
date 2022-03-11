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
import model.Room;

/**
 *
 * @author coder
 */
public class RoomDAO extends BaseDAO {
    // get all room
    public ArrayList<Room> getAllRoom(){
        ArrayList<Room> listRoom = new ArrayList<>();
        try {
            String sql = "Select * from room";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                
                int oke = rs.getInt("Status");
                Room room = new  Room(rs.getInt("ID"), rs.getString("Name"), rs.getInt("price"),
                rs.getDouble("area"), rs.getInt("quantityMax"), rs.getInt("QuantityCurrent"),rs.getInt("Status"), rs.getString("Utensil"),
                rs.getDate("CreatedAt"), rs.getDate("UpdatedAt"));
                listRoom.add(room);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return(null);
        }
        return(listRoom);
    }
    
    // get room by name
    public Room getRoomByName(String name){
        ArrayList<Room> listRoom = new ArrayList<>();
        try {
            String sql = "Select * from room where name = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Room room = new  Room(rs.getInt("ID"), rs.getString("Name"), rs.getInt("price"),
                rs.getDouble("area"), rs.getInt("quantityMax"), rs.getInt("QuantityCurrent"), rs.getString("Utensil"),
                rs.getDate("CreatedAt"), rs.getDate("UpdatedAt"));
                return(room);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return(null);
    }
    // get room by id
    public Room getRoomByID(int ID){
        ArrayList<Room> listRoom = new ArrayList<>();
        try {
            String sql = "Select * from room where ID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Room room = new  Room(rs.getInt("ID"), rs.getString("Name"), rs.getInt("price"),
                rs.getDouble("area"), rs.getInt("quantityMax"), rs.getInt("QuantityCurrent"), rs.getString("Utensil"),
                rs.getDate("CreatedAt"), rs.getDate("UpdatedAt"));
                return(room);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return(null);
    }
    // get room trống
    public ArrayList<Room> getRoomEmpty(){
        ArrayList<Room> listRoom = new ArrayList<>();
        try {
            String sql = "Select * from room where status = 0 or status is null";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Room room = new  Room(rs.getInt("ID"), rs.getString("Name"), rs.getInt("price"),
                rs.getDouble("area"), rs.getInt("quantityMax"), rs.getInt("QuantityCurrent"), rs.getString("Utensil"),
                rs.getDate("CreatedAt"), rs.getDate("UpdatedAt"));
                listRoom.add(room);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return(listRoom);
    }
    // get room còn dư slot
    public ArrayList<Room> getRoomRedundantSlot(){
        ArrayList<Room> listRoom = new ArrayList<>();
        try {
            String sql = "Select * from room where status = 1 and (quantitycurrent < QuantityMax)";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Room room = new  Room(rs.getInt("ID"), rs.getString("Name"), rs.getInt("price"),
                rs.getDouble("area"), rs.getInt("quantityMax"), rs.getInt("QuantityCurrent"), rs.getString("Utensil"),
                rs.getDate("CreatedAt"), rs.getDate("UpdatedAt"));
                listRoom.add(room);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return(listRoom);
    }
    // insert room
    public boolean insertRoom(Room room) {
        try {
            String sql = "Insert into room(Name,Price,Area,QuantityMax,QuantityCurrent,Utensil, CreatedAt,UpdatedAt) values(?,?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, room.getName());
            st.setInt(2, room.getPrice());
            st.setDouble(3, room.getArea());
            st.setInt(4, room.getQuantityMax());
            st.setInt(5, room.getQuantityCurrent());
            st.setString(6, room.getUtensil());
            st.setDate(7, new java.sql.Date(room.getCreatedAt().getTime()));
            st.setDate(8, new java.sql.Date(room.getUpdatedAt().getTime()));
            ResultSet rs = st.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    
    // update status of room
    public boolean updateStatus(int RoomID, int status){
        try {
            String sql = "update room set status = ? where ID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, RoomID);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
            return(false);
        }
        return(true);
    }
    // update status and quantityCurrent
    public boolean updateStatusAndQuantityCurrent(String RoomID){
        try {
            String sql = "update room set status = 0, quantitycurrent = 0 where ID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, RoomID);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
            return(false);
        }
        return(true);
    }
    // update room
    public boolean  updateRoom(Room room){
        try {
            String sql = "update room set Name=?,Price=?,Area=?,QuantityMax=?,Utensil=?,UpdatedAt=? where ID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, room.getName());
            st.setInt(2, room.getPrice());
            st.setDouble(3, room.getArea());
            st.setInt(4, room.getQuantityMax());
            st.setString(5, room.getUtensil());
            st.setDate(6, new java.sql.Date(room.getUpdatedAt().getTime()));
            st.setInt(7, room.getID());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }
    // update slot in room quantitycurrent-k
    public boolean updateSlotCurrent(int RoomID, int k){
        try {
            String sql = "update room set quantitycurrent = quantitycurrent-? where ID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, k);
            st.setInt(2, RoomID);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
            return(false);
        }
        return(true);
    }
    
    // delete room by id
    public void deleteRoom(int id) {
       try {
           String sql = "DELETE Room WHERE id=?";
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

