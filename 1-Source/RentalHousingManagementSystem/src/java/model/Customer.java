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
public class Customer {
    private int ID;
    private int contractID;
    private String name;
    private String phoneNumber;
    private Date DOB;
    private String CCCD;
    private String address;
    private String job;
    private String email;
    private int sex;
    private String relativeNumber;
    private Date createdAt;
    private Date updatedAt;

    public Customer() {
    }

    public Customer(int ID, int contractID, String name, String phoneNumber, Date DOB, String CCCD, String address, String job, String email, int sex, String relativeNumber, Date createdAt, Date updatedAt) {
        this.ID = ID;
        this.contractID = contractID;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.DOB = DOB;
        this.CCCD = CCCD;
        this.address = address;
        this.job = job;
        this.email = email;
        this.sex = sex;
        this.relativeNumber = relativeNumber;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
    public Customer(int contractID, String name, String phoneNumber, Date DOB, String CCCD, String address, String job, String email, int sex, String relativeNumber, Date createdAt, Date updatedAt) {
        this.contractID = contractID;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.DOB = DOB;
        this.CCCD = CCCD;
        this.address = address;
        this.job = job;
        this.email = email;
        this.sex = sex;
        this.relativeNumber = relativeNumber;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
    
    public Customer(String name, String phoneNumber, Date DOB, String CCCD, String address, String job, String email, int sex, String relativeNumber, Date createdAt, Date updatedAt) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.DOB = DOB;
        this.CCCD = CCCD;
        this.address = address;
        this.job = job;
        this.email = email;
        this.sex = sex;
        this.relativeNumber = relativeNumber;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getContractID() {
        return contractID;
    }

    public void setContractID(int contractID) {
        this.contractID = contractID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getDOB() {
        return DOB;
    }

    public void setDOB(Date DOB) {
        this.DOB = DOB;
    }

    public String getCCCD() {
        return CCCD;
    }

    public void setCCCD(String CCCD) {
        this.CCCD = CCCD;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getRelativeNumber() {
        return relativeNumber;
    }

    public void setRelativeNumber(String relativeNumber) {
        this.relativeNumber = relativeNumber;
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
