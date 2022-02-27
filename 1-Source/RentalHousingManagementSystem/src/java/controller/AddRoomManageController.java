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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
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
public class AddRoomManageController extends HttpServlet {

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
            out.println("<title>Servlet AddRoomManageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddRoomManageController at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);

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
        //processRequest(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String name = "";
        int price = -1;
        double area = -1;
        int quantityMax = -1;
        String utensil = "";
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
        Room room = new Room(name, price, area, quantityMax, 0, utensil, createdAtD, updatedAtD);
        RoomDAO DBR = new RoomDAO();
        boolean checkInsertRoom = DBR.insertRoom(room);
        Room room2 = DBR.getRoomByName(name);
        if (room2 != null){
            AccountDAO DBA = new AccountDAO();
            DBA.insertAccount(new Account(room2.getID(), name, name, 0, createdAtD, updatedAtD));
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
