/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.AccountDAO;
import DAL.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import model.Room;

/**
 *
 * @author coder
 */
public class EditRoomManageController extends HttpServlet {

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
            out.println("<title>Servlet EditRoomManageController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditRoomManageController at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String name = "";
        int ID = 0;
        int price = -1;
        double area = -1;
        int quantityMax = -1;
        String utensil = "";
        if (request.getParameter("ID") != null) {
            ID = Integer.parseInt(request.getParameter("ID"));
        }
        if (request.getParameter("name") != null) {
            name = request.getParameter("name");
        }
        if (request.getParameter("price") != null) {
            price = Integer.parseInt(request.getParameter("price"));
        }
        if (request.getParameter("area") != null) {
            area = Double.parseDouble(request.getParameter("area"));
        }
        if (request.getParameter("quantityMax") != null) {
            quantityMax = Integer.parseInt(request.getParameter("quantityMax"));
        }
        if (request.getParameter("utensil") != null) {
            utensil = request.getParameter("utensil");
        }
        LocalDate createdAt = LocalDate.now();
        LocalDate updatedAt = LocalDate.now();
        ZoneId defauZoneId = ZoneId.systemDefault();
        Date createdAtD = Date.from(createdAt.atStartOfDay(defauZoneId).toInstant());
        Date updatedAtD = Date.from(updatedAt.atStartOfDay(defauZoneId).toInstant());
        Room roomAfter = new Room(ID, name, price, area, quantityMax, utensil, createdAtD, updatedAtD);
        RoomDAO DBR = new RoomDAO();
        Room roomBefore = DBR.getRoomByID(ID);
        DBR.updateRoom(roomAfter);
        if (!roomBefore.getName().equalsIgnoreCase(roomAfter.getName())){
            AccountDAO DBA= new AccountDAO();
            Account accountBefore = DBA.getAccount(ID);
            Account accountAfter = new Account(accountBefore.getID(),accountBefore.getRoomID(), name, name, 0, createdAtD, updatedAtD);
            DBA.updateAccount(accountAfter);
        }
        
        response.sendRedirect("RoomManage");
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
