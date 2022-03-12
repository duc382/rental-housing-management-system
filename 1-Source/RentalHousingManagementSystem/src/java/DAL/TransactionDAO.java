/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.transaction.Transaction;
import model.Transactions;

/**
 *
 * @author coder
 */
public class TransactionDAO extends BaseDAO{
    // get all transaction
    public ArrayList<Transactions> getAllTransaction() {
        ArrayList<Transactions> listTrans = new ArrayList<>();
        try {
            String sql = "select * from Transactions";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Transactions transactions = new Transactions(rs.getInt("ID"), rs.getInt("ServicesID"), rs.getInt("ContractID"), rs.getDouble("Price"),
                        rs.getDouble("Quantity"),rs.getDouble("Amount"), rs.getString("note"),rs.getString("PaymentCycle"),rs.getDate("createdAt"), rs.getDate("updatedAt"));
                listTrans.add(transactions);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return listTrans;
    }
    public Transactions getTransactionByID(int ID) {
        try {
            String sql = "select * from Transactions where id =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Transactions transactions = new Transactions(rs.getInt("ID"), rs.getInt("ServicesID"), rs.getInt("ContractID"),  rs.getDouble("Price"),
                        rs.getDouble("Quantity"),rs.getDouble("Amount"), rs.getString("note"),rs.getString("PaymentCycle"),rs.getDate("createdAt"), rs.getDate("updatedAt"));
                return (transactions);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return null;
    }
    public ArrayList<Transactions> getAllTransactionInContract(int contractID) {
        ArrayList<Transactions> listTrans = new ArrayList<>();
        try {
            String sql = "select * from Transactions where contractID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, contractID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Transactions transactions = new Transactions(rs.getInt("ID"), rs.getInt("ServicesID"), rs.getInt("ContractID"), rs.getDouble("Price"),
                        rs.getDouble("Quantity"),rs.getDouble("Amount"), rs.getString("note"),rs.getString("PaymentCycle"),rs.getDate("createdAt"), rs.getDate("updatedAt"));
                listTrans.add(transactions);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return listTrans;
    }
    public void inserTransactions(Transactions trans){
        try {
            String sql = "insert into Transactions(ServicesID,ContractID,Price,quantity,Amount,Note,PaymentCycle,CreatedAt,UpdatedAt) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, trans.getServicesID());
            st.setInt(2, trans.getContactID());
            st.setDouble(3, trans.getPrice());
            st.setDouble(4, trans.getQuantity());
            st.setDouble(5, trans.getAmount());
            st.setString(6, trans.getNote());
            st.setString(7, trans.getPaymentCycle());
            st.setDate(8, new java.sql.Date(trans.getCreatedAt().getTime()));
            st.setDate(9, new java.sql.Date(trans.getCreatedAt().getTime()));
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void updateTransactions(Transactions trans){
        try {
            String sql = "update Transactions set ServicesID=?,Price=?, quantity=?, Amount=?, Note=?, PaymentCycle=?, UpdatedAt=? where id=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, trans.getServicesID());
            st.setDouble(2, trans.getPrice());
            st.setDouble(3, trans.getQuantity());
            st.setDouble(4, trans.getAmount());
            st.setString(5, trans.getNote());
            st.setString(6, trans.getPaymentCycle());
            st.setDate(7, new java.sql.Date(trans.getUpdatedAt().getTime()));
            st.setInt(8, trans.getId());
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void deleteTransactions(int id){
        try {
            String sql = "delete Transactions where ID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(TransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public ArrayList getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public static void main(String[] args) {
        TransactionDAO DBTran = new TransactionDAO();
        ArrayList<Transactions> listTrans = DBTran.getAllTransactionInContract(0);
        System.out.println(listTrans);
    }
}
