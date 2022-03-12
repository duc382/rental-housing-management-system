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
    private int id;
    private int servicesID;
    private int contactID;
    private double price;
    private double quantity;
    private double amount;
    private String note;
    private String paymentCycle;
    private Date createdAt;
    private Date updatedAt;

    public Transactions() {
    }

    public Transactions(int servicesID, int contactID, double price, double quantity, double amount, String note, String paymentCycle, Date createdAt, Date updatedAt) {
        this.servicesID = servicesID;
        this.contactID = contactID;
        this.price = price;
        this.quantity = quantity;
        this.amount = amount;
        this.note = note;
        this.paymentCycle = paymentCycle;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Transactions(int id, int servicesID, int contactID, double price, double quantity, double amount, String note, String paymentCycle, Date createdAt, Date updatedAt) {
        this.id = id;
        this.servicesID = servicesID;
        this.contactID = contactID;
        this.price = price;
        this.quantity = quantity;
        this.amount = amount;
        this.note = note;
        this.paymentCycle = paymentCycle;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }


    
    
    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getPaymentCycle() {
        return paymentCycle;
    }

    public void setPaymentCycle(String paymentCycle) {
        this.paymentCycle = paymentCycle;
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

    @Override
    public String toString() {
        return "Transactions{" + "id=" + id + ", servicesID=" + servicesID + ", contactID=" + contactID + ", quantity=" + quantity + ", amount=" + amount + ", note=" + note + ", paymentCycle=" + paymentCycle + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + '}';
    }
    
    
}
