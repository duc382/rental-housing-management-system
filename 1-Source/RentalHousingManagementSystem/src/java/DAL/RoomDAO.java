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
                Room room = new  Room(rs.getInt("ID"), rs.getString("Name"), rs.getDouble("price"),
                rs.getDouble("area"), rs.getInt("quantityMax"), rs.getString("Utensil"),
                rs.getDate("CreatedAt"), rs.getDate("UpdatedAt"));
                listRoom.add(room);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            return(null);
        }
        return(listRoom);
    }
    // insert room
    public boolean insertRoom(Room room) {
        try {
            String sql = "Insert into room(Name,Price,Area,QuantityMax,Utensil,CreatedAt,UpdatedAt) values(?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, room.getName());
            st.setDouble(2, room.getPrice());
            st.setDouble(3, room.getArea());
            st.setInt(4, room.getQuantityMax());
            st.setString(5, room.getUtensil());
            st.setDate(6, new java.sql.Date(room.getCreatedAt().getTime()));
            st.setDate(7, new java.sql.Date(room.getUpdatedAt().getTime()));
            ResultSet rs = st.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
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

