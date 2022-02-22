/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author coder
 */
public class Profile {
    private int ID;
    private int AccountID;
    private int role;
    private String Name;
    private String PhoneNumber;
    private Date DOB;
    private String Address;
    private String Job;
    private String Email;
    private Date CreatedAt;
    private Date UpdatedAt;

    public Profile() {
    }

    public Profile(int AccountID, int role, String Name, String PhoneNumber, Date DOB, String Address, String Job, String Email, Date CreatedAt, Date UpdatedAt) {
        this.AccountID = AccountID;
        this.role = role;
        this.Name = Name;
        this.PhoneNumber = PhoneNumber;
        this.DOB = DOB;
        this.Address = Address;
        this.Job = Job;
        this.Email = Email;
        this.CreatedAt = CreatedAt;
        this.UpdatedAt = UpdatedAt;
    }

    public Profile(int ID, int AccountID, int role, String Name, String PhoneNumber, Date DOB, String Address, String Job, String Email, Date CreatedAt, Date UpdatedAt) {
        this.ID = ID;
        this.AccountID = AccountID;
        this.role = role;
        this.Name = Name;
        this.PhoneNumber = PhoneNumber;
        this.DOB = DOB;
        this.Address = Address;
        this.Job = Job;
        this.Email = Email;
        this.CreatedAt = CreatedAt;
        this.UpdatedAt = UpdatedAt;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public Date getDOB() {
        return DOB;
    }

    public void setDOB(Date DOB) {
        this.DOB = DOB;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getJob() {
        return Job;
    }

    public void setJob(String Job) {
        this.Job = Job;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public Date getCreatedAt() {
        return CreatedAt;
    }

    public void setCreatedAt(Date CreatedAt) {
        this.CreatedAt = CreatedAt;
    }

    public Date getUpdatedAt() {
        return UpdatedAt;
    }

    public void setUpdatedAt(Date UpdatedAt) {
        this.UpdatedAt = UpdatedAt;
    }
    
}
