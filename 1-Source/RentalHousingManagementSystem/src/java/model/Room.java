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
    private double price;
    private double area;
    private int quantityMax;
    private String utensil;
    private Date createdAt;
    private Date updatedAt;

    public Room() {
    }

    public Room(String name, double price, double area, int quantityMax, String utensil, Date createdAt, Date updatedAt) {
        this.name = name;
        this.price = price;
        this.area = area;
        this.quantityMax = quantityMax;
        this.utensil = utensil;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Room(int ID, String name, double price, double area, int quantityMax, String utensil, Date createdAt, Date updatedAt) {
        this.ID = ID;
        this.name = name;
        this.price = price;
        this.area = area;
        this.quantityMax = quantityMax;
        this.utensil = utensil;
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
    
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
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
