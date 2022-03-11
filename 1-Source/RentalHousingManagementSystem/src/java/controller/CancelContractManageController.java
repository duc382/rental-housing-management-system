/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.ContractDAO;
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
import model.Contract;
import model.Room;

/**
 *
 * @author coder
 */
public class CancelContractManageController extends HttpServlet {

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
            out.println("<title>Servlet CancelContractManageController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CancelContractManageController at " + request.getContextPath() + "</h1>");
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
        String ids = request.getParameter("id");
        LocalDate updatedAt = LocalDate.now();
        ZoneId defauZoneId = ZoneId.systemDefault();
        Date updatedAtD = Date.from(updatedAt.atStartOfDay(defauZoneId).toInstant());
        ContractDAO DBCon = new ContractDAO();
        DBCon.cancelContractByID(ids, updatedAtD);
        Contract contract = DBCon.getContractByContractID(Integer.parseInt(ids));
        // chuyển trạng thái phòng thành trống
        RoomDAO DBRoom = new RoomDAO();
        Room roomCurrent = DBRoom.getRoomByID(contract.getRoomID());
//        Room roomAfter = new Room(roomCurrent.getID(), "", 0, 0, 0, 0, 0, "", updatedAtD, updatedAtD);
        DBRoom.updateStatusAndQuantityCurrent(ids);
        response.sendRedirect("ContractManage");
        
                
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
