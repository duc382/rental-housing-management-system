/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAL.ContractDAO;
import DAL.CustomerDAO;
import DAL.RoomDAO;
import DAL.ServicesOfContractDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Contract;
import model.Room;
import model.Services;
import model.ServicesOfContract;

/**
 *
 * @author coder
 */
public class EditContractManageController extends HttpServlet {

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
            out.println("<title>Servlet EditContractManageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditContractManageController at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int contractID = Integer.parseInt(request.getParameter("contractID"));
        int CustomerID = Integer.parseInt(request.getParameter("CustomerID"));
        String note = request.getParameter("note");
        String startAtS = request.getParameter("startAt");
        String endAtS = request.getParameter("endAt");
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date startAt = null;
        Date endAt = null;
        try {
            startAt = df.parse(startAtS);
            endAt = df.parse(endAtS);
        } catch (Exception e) {
            System.out.println("date error");
        }
        LocalDate createdAt = LocalDate.now();
        LocalDate updatedAt = LocalDate.now();
        ZoneId defauZoneId = ZoneId.systemDefault();
        Date createdAtD = Date.from(createdAt.atStartOfDay(defauZoneId).toInstant());
        Date updatedAtD = Date.from(updatedAt.atStartOfDay(defauZoneId).toInstant());

        // sửa lại thông tin hợp đồng: người đại diện, ngày bắt đầu, ngày kết thúc, note, dịch vụ
        Contract contract = new Contract(contractID, 0, CustomerID, note, 1, "", startAt, endAt, createdAtD, updatedAtD);
        ContractDAO DBC = new ContractDAO();
        DBC.updateContract(contract);
        // xử lý sửa services
        String[] listServicesID = request.getParameterValues("ServicesID");
        ServicesOfContractDAO DBSOF = new ServicesOfContractDAO();
        DBSOF.deleteAllServicesByContractID(contractID);
        if (listServicesID != null) {
            for (int i = 0; i < listServicesID.length; i++) {
                ServicesOfContract servicesOfContract = new ServicesOfContract(Integer.parseInt(listServicesID[i]), contractID);
                DBSOF.insertServicesOfContract(servicesOfContract);
            }
        }
        response.sendRedirect("ContractManage");

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
