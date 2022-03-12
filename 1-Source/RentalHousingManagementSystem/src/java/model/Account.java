/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author coder
 */
public class Account {
    private int id;
    private int roomID;
    private String username;
    private String password;
    private int role;
    private Date createdAt;
    private Date updatedAt;

    public Account() {
    }
    // khoi tao thieu ID

    public Account(int roomID, String username, String password, int role, Date createdAt, Date updatedAt) {
        this.roomID = roomID;
        this.username = username;
        this.password = password;
        this.role = role;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
    
    // khoi tao tat ca
    public Account(int ID, int roomID, String username, String password, int role, Date createdAt, Date updatedAt) {
        this.id = ID;
        this.roomID = roomID;
        this.username = username;
        this.password = password;
        this.role = role;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Account{" + "ID=" + id + ", roomID=" + roomID + ", username=" + username + ", password=" + password + ", role=" + role + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + '}';
    }
    
}
