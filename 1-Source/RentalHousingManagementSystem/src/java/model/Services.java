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
public class Services {
    private int ID;
    private String name;
    private String supplierName;
    private double originCost;
    private double price;
    private Date createdAt;
    private Date updatedAt;

    public Services() {
    }

    public Services(String name, String supplierName, double originCost, double price, Date createdAt, Date updatedAt) {
        this.name = name;
        this.supplierName = supplierName;
        this.originCost = originCost;
        this.price = price;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Services(int ID, String name, String supplierName, double originCost, double price, Date createdAt, Date updatedAt) {
        this.ID = ID;
        this.name = name;
        this.supplierName = supplierName;
        this.originCost = originCost;
        this.price = price;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public double getOriginCost() {
        return originCost;
    }

    public void setOriginCost(double originCost) {
        this.originCost = originCost;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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
        return "Services{" + "ID=" + ID + ", name=" + name + ", supplierName=" + supplierName + ", originCost=" + originCost + ", price=" + price + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + '}';
    }
    
}
