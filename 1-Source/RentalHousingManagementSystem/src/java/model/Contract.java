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
public class Contract {
    private int ID;
    private int roomID;
    private int CustomerIDRepresentative;
    private String note;
    private int status;
    private String roomName;
    private Date startAt;
    private Date endAt;
    private Date createdAt;
    private Date updatedAt;

    public Contract() {
    }

    public Contract(int ID, int roomID, int CustomerIDRepresentative, String note, int status, String roomName, Date startAt, Date endAt, Date createdAt, Date updatedAt) {
        this.ID = ID;
        this.roomID = roomID;
        this.CustomerIDRepresentative = CustomerIDRepresentative;
        this.note = note;
        this.status = status;
        this.roomName = roomName;
        this.startAt = startAt;
        this.endAt = endAt;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Contract(int roomID, int CustomerIDRepresentative, String note, int status, String roomName, Date startAt, Date endAt, Date createdAt, Date updatedAt) {
        this.roomID = roomID;
        this.CustomerIDRepresentative = CustomerIDRepresentative;
        this.note = note;
        this.status = status;
        this.roomName = roomName;
        this.startAt = startAt;
        this.endAt = endAt;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getCustomerIDRepresentative() {
        return CustomerIDRepresentative;
    }

    public void setCustomerIDRepresentative(int CustomerIDRepresentative) {
        this.CustomerIDRepresentative = CustomerIDRepresentative;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getStartAt() {
        return startAt;
    }

    public void setStartAt(Date startAt) {
        this.startAt = startAt;
    }

    public Date getEndAt() {
        return endAt;
    }

    public void setEndAt(Date endAt) {
        this.endAt = endAt;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    
}
