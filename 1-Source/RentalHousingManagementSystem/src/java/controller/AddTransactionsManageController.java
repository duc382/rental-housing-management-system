/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.TransactionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transaction;
import model.Transactions;

/**
 *
 * @author coder
 */
public class AddTransactionsManageController extends HttpServlet {

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
            out.println("<title>Servlet AddTransactionsManageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddTransactionsManageController at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("/pages/addTransactionsManage.jsp").forward(request, response);
//        response.sendRedirect("/pages/addTransactionsManage.jsp");
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
//        processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String paymentCycle = request.getParameter("paymentCycle");
        int contractID = Integer.parseInt(request.getParameter("contractID"));
        int servicesID = Integer.parseInt(request.getParameter("servicesID"));
        double price = Double.parseDouble(request.getParameter("price"));
        double quantity = Double.parseDouble(request.getParameter("quantity"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String note = request.getParameter("note");
        LocalDate createdAt = LocalDate.now();
        LocalDate updatedAt = LocalDate.now();
        ZoneId defauZoneId = ZoneId.systemDefault();
        Date createdAtD = Date.from(createdAt.atStartOfDay(defauZoneId).toInstant());
        Date updatedAtD = Date.from(updatedAt.atStartOfDay(defauZoneId).toInstant());
        Transactions transactions = new Transactions(servicesID, contractID,price, quantity, amount, note, paymentCycle, createdAtD, updatedAtD);
        TransactionDAO DBTran = new TransactionDAO();
        DBTran.inserTransactions(transactions);
        response.sendRedirect("AnalysticManage");

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
