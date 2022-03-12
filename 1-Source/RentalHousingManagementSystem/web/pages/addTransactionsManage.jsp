<%-- 
    Document   : addTransactions
    Created on : Mar 11, 2022, 10:04:11 PM
    Author     : coder
--%>

<%@page import="model.ServicesOfContract"%>
<%@page import="DAL.ServicesOfContractDAO"%>
<%@page import="model.Contract"%>
<%@page import="DAL.ContractDAO"%>
<%@page import="model.Room"%>
<%@page import="DAL.RoomDAO"%>
<%@page import="model.Services"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAL.ServicesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm Hóa Đơn</title>
        <!--bs-->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
        <!--hết bs-->
        <link rel="stylesheet" href="css/StyleAddTransactionsManage.css">
        <script src="js/JSAddTransactionsManage.js"></script>
    </head>
    <body>
        <%
            RoomDAO DBRoom = new RoomDAO();
            ContractDAO DBCon = new ContractDAO();
            ServicesDAO DBSer = new ServicesDAO();
            ServicesOfContractDAO DBSOC = new ServicesOfContractDAO();
            ArrayList<ServicesOfContract> listSerOfCon = DBSOC.getAllServicesOfContract();
            ArrayList<Services> listServices = DBSer.getAllServices();
        %>
        <script>
            var listServicesJS = [];
            <%
                for (int i = 0; i < listServices.size(); i++) {%>
            var servicesJS = {id: '<%=listServices.get(i).getID()%>', name: '<%=listServices.get(i).getName()%>', price:<%=listServices.get(i).getPrice()%>};
            listServicesJS.push(servicesJS);
            <%}%>
            var listSerOfConJS = [];
            <%
                for (int i = 0; i < listSerOfCon.size(); i++) {%>
            var serOfConJS = {id: '<%=listSerOfCon.get(i).getID()%>', contractID: '<%=listSerOfCon.get(i).getContractID()%>', servicesID: '<%=listSerOfCon.get(i).getServicesID()%>'};
            listSerOfConJS.push(serOfConJS);
            <%}%>
        </script>
        <%@include file="sidebarAndHeader.jsp"%>
        <div style="width: 15%;margin-left: auto;margin-right: auto;">
            <form class="form-container"  action="AddTransactionsManage" method="POST">
                <h1>Thêm Hóa Đơn</h1>
                <label><b>Chu Kỳ:</b></label><br>
                <input type="month" name="paymentCycle" value="" required/><br>
                <label><b>Phòng:</b></label> 
                <select required="" onchange="validateSelectBoxRoom(this, listServicesJS, listSerOfConJS)" class="form-control selectpicker droplist" name="contractID" data-live-search="true">
                    <%                    ArrayList<Contract> listContract = DBCon.getAllContractOn();
                        for (int i = 0; i < listContract.size(); i++) {%>
                    <option data-tokens="<%=listContract.get(i).getRoomName()%>" value="<%=listContract.get(i).getID()%>"><%=listContract.get(i).getRoomName()%></option>
                    <%}%> 
                </select>
                <br>
                <label><b>Dịch Vụ:</b></label>
                <select required="" onchange="validateSelectBoxServices(this, listServicesJS)"  id="selectServices" class="form-control selectpicker droplist" name="servicesID" data-live-search="true" >
                    <%
                        for (int i = 0; i < listServices.size(); i++) {%>
                    <%}%> 
                </select>
                <label><b>Giá:</b></label><br>
                <input onchange="validateInputPrice(this.value)" type="text" id="price" name="price" value="">
                <label><b>Số Lượng:</b></label><br>
                <input required="" onchange="validateInputQuantity(this.value)" type="text" id="quantity" name="quantity" value="">
                <label><b>Tổng:</b></label><br>
                <input type="text" id="amount" name="amount" value="">
                <label><b>Note:</b></label><br>
                <textarea  name="note" style="width: 100%; height: 100px"></textarea>
                <input type="submit" class="btn" value="Thêm"/>
            </form>
        </div>

    </body>
</html>
