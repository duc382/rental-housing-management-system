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
public class Room {
    private int ID;
    private String name;
    private int price;
    private double area;
    private int quantityMax;
    private int quantityCurrent;
    private String utensil;
    private Date createdAt;
    private Date updatedAt;

    public Room() {
    }
    // khoi tao cho room moi
    public Room(String name, int price, double area, int quantityMax, int quantityCurrent, String utensil, Date createdAt, Date updatedAt) {
        this.name = name;
        this.price = price;
        this.area = area;
        this.quantityMax = quantityMax;
        this.utensil = utensil;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
    // khoi tao cho room update
    public Room(int ID, String name, int price, double area, int quantityMax, String utensil, Date createdAt, Date updatedAt) {
        this.ID = ID;
        this.name = name;
        this.price = price;
        this.area = area;
        this.quantityMax = quantityMax;
        this.utensil = utensil;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
    // khoi tao cho room day du
    public Room(int ID, String name, int price, double area, int quantityMax, int quantityCurrent, String utensil, Date createdAt, Date updatedAt) {
        this.ID = ID;
        this.name = name;
        this.price = price;
        this.area = area;
        this.quantityMax = quantityMax;
        this.utensil = utensil;
        this.quantityCurrent = quantityCurrent;
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
    
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public int getQuantityMax() {
        return quantityMax;
    }

    public void setQuantityMax(int quantityMax) {
        this.quantityMax = quantityMax;
    }

    public String getUtensil() {
        return utensil;
    }

    public int getQuantityCurrent() {
        return quantityCurrent;
    }

    public void setQuantityCurrent(int quantityCurrent) {
        this.quantityCurrent = quantityCurrent;
    }
    
    public void setUtensil(String utensil) {
        this.utensil = utensil;
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
