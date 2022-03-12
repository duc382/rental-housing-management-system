<%-- 
    Document   : editTransactionsManage
    Created on : Mar 12, 2022, 2:44:46 PM
    Author     : coder
--%>

<%@page import="model.Contract"%>
<%@page import="DAL.ContractDAO"%>
<%@page import="model.Services"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAL.ServicesDAO"%>
<%@page import="model.Transactions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sửa Hóa Đơn</title>
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
        <script src="js/JSEditTransactionsManage.js"></script>
    </head>
    <body>
        <%
            Transactions transactions = (Transactions) request.getAttribute("transactions");
            ServicesDAO DBSer = new ServicesDAO();
            ContractDAO DBCon = new ContractDAO();
            Contract contract = DBCon.getContractByContractID(transactions.getContactID());
            ArrayList<Services> listServices = DBSer.getServicesOfContract(transactions.getContactID() + "");
        %>
        <%@include file="sidebarAndHeader.jsp"%>
        <script>
            var listServicesJS = [];
            <%
                for (int i = 0; i < listServices.size(); i++) {%>
            var servicesJS = {id: '<%=listServices.get(i).getID()%>', name: '<%=listServices.get(i).getName()%>', price:<%=listServices.get(i).getPrice()%>};
            listServicesJS.push(servicesJS);
            <%}%>

        </script>
        <div style="width: 15%;margin-left: auto;margin-right: auto;">
            <form class="form-container"  action="EditTransactionsManage" method="POST">
                <input style="display: none" name="id" value="<%=transactions.getId()%>"/>
                <h1>Sửa Hóa Đơn</h1>
                <label><b>Chu Kỳ:</b></label>
                <br>
                <input type="month" name="paymentCycle" value="<%=transactions.getPaymentCycle()%>" />
                <br>
                <label><b>Phòng:</b></label> 
                <input type="text" name="roomName" value="<%=contract.getRoomName()%>" readonly=""/>
                <br>
                <label><b>Dịch Vụ:</b></label>
                <select required="" onchange="validateSelectBoxServices(this, listServicesJS)"  id="selectServices" class="form-control selectpicker droplist" name="servicesID" data-live-search="true" >
                    <%
                        for (int i = 0; i < listServices.size(); i++) {
                    %>
                    <option <%if (listServices.get(i).getID() == transactions.getServicesID()){%> selected="" <%}%> data-tokens="<%=listServices.get(i).getName()%>" value="<%=listServices.get(i).getID()%>"><%=listServices.get(i).getName()%></option>
                    <%}%> 
                </select>
                <label><b>Giá:</b></label>
                <br>
                <input onchange="validateInputPriceEdit(this.value)" type="text" id="price" name="price" value="<%=transactions.getPrice()%>">
                <label><b>Số Lượng:</b></label>
                <br>
                <input required="" onchange="validateInputQuantityEdit(this.value)" type="text" id="quantity" name="quantity" value="<%=transactions.getQuantity()%>">
                <label><b>Tổng:</b></label>
                <br>
                <input type="text" id="amount" name="amount" value="<%=transactions.getAmount()%>">
                <label><b>Note:</b></label>
                <br>
                <textarea  name="note" style="width: 100%; height: 100px" ><%=transactions.getNote()%></textarea>
                <input type="submit" class="btn" value="Thêm"/>
            </form>
        </div>
    </body>
</html>
