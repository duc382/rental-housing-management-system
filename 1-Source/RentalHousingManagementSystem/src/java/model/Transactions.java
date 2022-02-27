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
public class Transactions {
    private int ID;
    private int servicesID;
    private int contactID;
    private double amount;
    private String note;
    private Date createdAt;
    private Date updatedAt;

    public Transactions() {
    }

    public Transactions(int ID, int servicesID, int contactID, double amount, String note, Date createdAt, Date updatedAt) {
        this.ID = ID;
        this.servicesID = servicesID;
        this.contactID = contactID;
        this.amount = amount;
        this.note = note;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getServicesID() {
        return servicesID;
    }

    public void setServicesID(int servicesID) {
        this.servicesID = servicesID;
    }

    public int getContactID() {
        return contactID;
    }

    public void setContactID(int contactID) {
        this.contactID = contactID;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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
