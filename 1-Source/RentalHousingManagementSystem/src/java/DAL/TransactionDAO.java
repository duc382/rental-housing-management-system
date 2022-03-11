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
                Transactions transactions = new Transactions(rs.getInt("ID"), rs.getInt("ServicesID"), rs.getInt("ContractID"), 
                        rs.getDouble("Quantity"),rs.getDouble("Amount"), rs.getString("note"),rs.getDate("PaymentCycle"),rs.getDate("createdAt"), rs.getDate("updatedAt"));
                listTrans.add(transactions);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TransactionDAO.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return listTrans;
    }

    @Override
    public ArrayList getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public static void main(String[] args) {
        TransactionDAO DBTran = new TransactionDAO();
        ArrayList<Transactions> listTrans = DBTran.getAllTransaction();
        System.out.println(listTrans);
    }
}
