/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.ContractDAO;
import DAL.CustomerDAO;
import DAL.RoomDAO;
import DAL.ServicesDAO;
import DAL.TransactionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Contract;
import model.Customer;
import model.Room;
import model.Services;
import model.Transactions;

/**
 *
 * @author coder
 */
public class HomeGuestController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeCustomerController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeCustomerController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        HttpSession session=request.getSession();  
        Account account = (Account) session.getAttribute("account");
        ContractDAO DBCon = new ContractDAO();
        Contract contract = DBCon.getContractByRooIDAndStatus(account.getRoomID(),1);
        if (contract == null){
            request.setAttribute("checkNull", true);
            request.getRequestDispatcher("/pages/viewContractGuest.jsp").forward(request, response);
            return;
        }
        request.setAttribute("contract", contract);
        CustomerDAO DBCus = new CustomerDAO();
        Customer customerRepresentative = DBCus.getCustomerByID(contract.getCustomerIDRepresentative());
        request.setAttribute("customerRepresentative", customerRepresentative);
        ArrayList<Customer> listCustomerNoneRepresentative = DBCus.getCustomerInContractNoneRepresentative(contract.getID(), contract.getCustomerIDRepresentative());
        request.setAttribute("listCustomer", listCustomerNoneRepresentative);
        TransactionDAO DBTrans = new TransactionDAO();
        ArrayList<Transactions> listTrans = DBTrans.getAllTransactionInContract(contract.getID());
        request.setAttribute("listTransactions", listTrans);
        ServicesDAO DBSer = new ServicesDAO();
        ArrayList<Services> listServices = DBSer.getServicesOfContract(contract.getID()+"");
        request.setAttribute("listServices", listServices);
        RoomDAO DBRoom = new RoomDAO();
        Room room = DBRoom.getRoomByName(contract.getRoomName());
        request.setAttribute("room", room);
        request.getRequestDispatcher("/pages/viewContractGuest.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
