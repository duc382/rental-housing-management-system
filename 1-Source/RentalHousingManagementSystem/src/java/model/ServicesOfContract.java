/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author coder
 */
public class ServicesOfContract {
    private int ID;
    private int servicesID;
    private int contractID;

    public ServicesOfContract() {
    }

    public ServicesOfContract(int ID, int servicesID, int contractID) {
        this.ID = ID;
        this.servicesID = servicesID;
        this.contractID = contractID;
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

    public int getContractID() {
        return contractID;
    }

    public void setContractID(int contractID) {
        this.contractID = contractID;
    }
    
}
