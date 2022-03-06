/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.ContractDAO;
import DAL.CustomerDAO;
import DAL.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Contract;

/**
 *
 * @author coder
 */
public class ChangeRoomForCustomerManageController extends HttpServlet {

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
            out.println("<title>Servlet ChangeRoomForCustomerManageController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangeRoomForCustomerManageController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        int customerID = Integer.parseInt(request.getParameter("CustomerID"));
        int roomIDNew = Integer.parseInt(request.getParameter("roomIDNew"));
        int roomIDCurrent = Integer.parseInt(request.getParameter("roomIDCurrent"));
        RoomDAO DBRoom = new RoomDAO();
        ContractDAO DBCon = new ContractDAO();
        CustomerDAO DBCus = new CustomerDAO();
        // tru so luong nguoi o phong hien tai
        if (roomIDCurrent != 0){
            DBRoom.updateSlot(roomIDCurrent, 1);
        }
        // tang so luong nguoi o phong moi
        DBRoom.updateSlot(roomIDNew, -1);
        // lay contract theo roomID moi va status = 1
        Contract contract = DBCon.getContractByRooIDAndStatus(roomIDNew, 1);
        // update contractID cho customer
        DBCus.updateContractForCustomer(customerID, contract.getID());
        response.sendRedirect("CustomerManage");
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
