<%-- 
    Document   : contractManage
    Created on : Feb 27, 2022, 11:20:42 PM
    Author     : coder
--%>

<%@page import="DAL.ServicesOfContractDAO"%>
<%@page import="model.ServicesOfContract"%>
<%@page import="DAL.CustomerDAO"%>
<%@page import="model.Customer"%>
<%@page import="model.Room"%>
<%@page import="DAL.RoomDAO"%>
<%@page import="model.Services"%>
<%@page import="DAL.ServicesDAO"%>
<%@page import="model.Contract"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý hợp đồng</title>
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
        <link rel="stylesheet" href="css/StyleContractManage.css">
        <script src="js/JSContractManage.js"></script>
        <script>
            // checkquantityCurrent = 0 là còn dư slot 
            $(document).ready(function () {
                $('#dtTableContract').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
            const cancelFunction = (id) => {
                if (confirm("Bấm ok để hủy hơp đồng đã chọn, cancel để hủy") == true) {
                    window.location.href = "CancelContractManage?id=" + id;
                }
            }
            listServicesOfContractJS = new Array();
        </script>
    </head>
    <body>
        <%
            ArrayList<Contract> listContract = (ArrayList<Contract>) request.getAttribute("listContract");
            ServicesDAO DAS = new ServicesDAO();
            RoomDAO DBR = new RoomDAO();
            CustomerDAO DBCus = new CustomerDAO();
            ServicesOfContractDAO DBSerOfCon = new ServicesOfContractDAO();
        %>

        <%@include file="sidebarAndHeader.jsp"%>
        <!--form thêm hợp đồng-->
        <div class="form-popup" id="myFormAddContract">
            <form class="form-container" name="myFormAddContract" action="AddContractManage" onsubmit="return validateForm()" method="post"  >
                <h1 style="text-align: center;">Thêm Hợp Đồng</h1>
                <label><b>Tên phòng</b></label>
                <div style="height: auto" >
                    <select class="form-control selectpicker droplist" name="roomID" data-live-search="true">
                        <%
                            ArrayList<Room> listRoom = DBR.getRoomEmpty();
                            for (int i = 0; i < listRoom.size(); i++) {%>
                        <option data-tokens="<%=listRoom.get(i).getName()%>" value="<%=listRoom.get(i).getID()%>"><%=listRoom.get(i).getName()%></option>
                        <%}%> 
                    </select>
                </div>
                <label><b>Người đại diện</b></label>
                <div style="height: auto" >
                    <select class="form-control selectpicker droplist" name="CustomerID" data-live-search="true">
                        <%
                            ArrayList<Customer> listCustomer = DBCus.getCustomerNoneContract();
                            for (int i = 0; i < listCustomer.size(); i++) {%>
                        <option data-tokens="<%=listCustomer.get(i).getName() + "(" + listCustomer.get(i).getPhoneNumber() + ")"%>" value="<%=listCustomer.get(i).getID()%>"><%=listCustomer.get(i).getName() + "(" + listCustomer.get(i).getPhoneNumber() + ")"%></option>
                        <%}%> 
                    </select>
                </div>
                <label><b>Ngày bắt đầu</b></label>
                <br>
                <input id="startAt" type="date" name="startAt" required>
                <br>
                <label><b>Ngày kết thúc</b></label>
                <br>
                <input id="endAt" type="date" name="endAt" required>
                <br>
                <label><b>Các dịch vụ</b></label>
                <%
                    ArrayList<Services> listServices = new ArrayList<Services>();
                    listServices = DAS.getAllServices();
                    for (int i = 0; i < listServices.size(); i++) {
                %>
                <input type="checkbox" value="<%=listServices.get(i).getID()%>" name="ServicesID" style="display: block"/><%=listServices.get(i).getName()%> (<%=listServices.get(i).getPrice()%>/1 đơn vị)

                <%}%>
                <br>
                <label><b>Ghi chú</b></label>
                <textarea name="note" style="width: 100%; height: 100px"></textarea>
                <input type="submit" class="btn" value="Thêm"/>
                <button type="button" class="btn cancel" onclick="closeFormAdd()">Hủy</button>
            </form>
        </div>
        <!--form sửa hợp đồng-->
        <div class="form-popup" id="myFormEditContract">
            <form class="form-container" name="myFormEditContract" action="EditContractManage" onsubmit="return validateForm()" method="post"  >
                <h1 style="text-align: center;">Sửa Hợp Đồng</h1>
                <input id="contractID" name="contractID" style="display: none">
                <label><b id="roomName">Tên phòng: </b></label>
                <script>
                    listAllCustomerJS = new Array();
                    <%
                        ArrayList<Customer> listCustomerAll = DBCus.getAllCustomer();
                        for (int i = 0; i < listCustomerAll.size(); i++) {%>
                    listAllCustomerJS[<%=i%>] = new Array();
                    listAllCustomerJS[<%=i%>].push("<%=listCustomerAll.get(i).getID()%>");
                    listAllCustomerJS[<%=i%>].push("<%=listCustomerAll.get(i).getName()%>");
                    listAllCustomerJS[<%=i%>].push("<%=listCustomerAll.get(i).getPhoneNumber()%>");
                    listAllCustomerJS[<%=i%>].push("<%=listCustomerAll.get(i).getContractID()%>");
                    <%}%>
                </script>
                <br>
                <label><b>Người đại diện</b></label>
                <div style="height: auto" >
                    <select id="myselect" class="form-control droplist" name="CustomerID" data-live-search="true" required="true"></select>
                </div>
                <label><b>Ngày bắt đầu</b></label>
                <br>
                <input id="startAtEdit" type="date" name="startAt" required="">
                <br>
                <label><b>Ngày kết thúc</b></label>
                <br>
                <input id="endAtEdit" type="date" name="endAt" required="">
                <br>
                <label><b>Các dịch vụ</b></label>
                <%
                    listServices = DAS.getAllServices();
                    for (int i = 0; i < listServices.size(); i++) {
                %>
                <input id="<%="serviceEdit" + listServices.get(i).getID()%>" type="checkbox" value="<%=listServices.get(i).getID()%>" name="ServicesID" style="display: block"/><%=listServices.get(i).getName()%> (<%=listServices.get(i).getPrice()%>/1 đơn vị)

                <%}%>
                <br>
                <label><b>Ghi chú</b></label>
                <textarea id="noteEdit" name="note" style="width: 100%; height: 100px"></textarea>
                <input type="submit" class="btn" value="Thêm"/>
                <button type="button" class="btn cancel" onclick="closeFormEditContract()">Hủy</button>
            </form>
        </div>
        <!--bảng hợp đồng-->
        <div class="container mt-3" style="max-width: 76%; margin-left: 12%; margin-right: 12%;">
            <div style="margin-bottom: 3px">
                <button class="open-button" onclick="openFormAdd()">Thêm Hợp Đồng</button>    
            </div>
            <table id="dtTableContract" class="table table-hover table-striped table-bordered table-sm">
                <thead>
                    <tr>
                        <th class="th-sm">Tên Phòng</th>
                        <th class="th-sm" style="text-align: center">Tên Người Đại Diện</th>
                        <th class="th-sm" style="text-align: center">Ngày Bắt Đầu Thuê</th>
                        <th class="th-sm" style="text-align: center">Ngày Hết Hạn</th>
                        <th class="th-sm" style="text-align: center">Trạng Thái</th>
                        <th style="text-align: center">Sửa/Xóa</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (int i = 0; i < listContract.size(); i++) {
                            ArrayList<ServicesOfContract> listServicesOfContract = DBSerOfCon.getAllServicesOfContractByContractID(listContract.get(i).getID());
                    %>
                <script>
                    listServicesOfContractJS[<%=i%>] = new Array();
                    <%
                        for (int j = 0; j < listServicesOfContract.size(); j++) {%>
                    listServicesOfContractJS[<%=i%>].push("<%=listServicesOfContract.get(j).getServicesID()%>");
                    <%}
                    %>
                </script>
                <tr>

                    <td><%=listContract.get(i).getRoomName()%></td>
                    <%
                        String representativeName = "";
                        Customer customer = DBCus.getCustomerByID(listContract.get(i).getCustomerIDRepresentative());
                        representativeName = customer.getName() + "(" + customer.getPhoneNumber() + ")";
                    %>
                    <td style="text-align: center"><%=representativeName%></td>
                    <td style="text-align: center"><%=listContract.get(i).getStartAt()%></td>
                    <td style="text-align: center"><%=listContract.get(i).getEndAt()%></td>
                    <%
                        if (listContract.get(i).getStatus() == 0) {
                    %>
                    <td style="text-align: center">Đã Hủy</td>
                    <%}else{%>
                    <td style="text-align: center">Hoạt Động</td>
                    <%}%> 
                    <td style="text-align: center">
                        <button onclick="openFormEditContract(listAllCustomerJS, <%=listContract.get(i).getID()%>, new Date('<%=listContract.get(i).getStartAt()%>'), new Date('<%=listContract.get(i).getEndAt()%>'), listServicesOfContractJS[<%=i%>], '<%=listContract.get(i).getNote()%>', '<%=listContract.get(i).getRoomName()%>')">Sửa hợp đồng</button>
                        <button><a style="text-decoration: none; color: black" onclick="cancelFunction(<%=listContract.get(i).getID()%>)" href="#">Hủy hợp đồng</a></button>
                    </td>
                </tr>
                <%}%>   
                </tbody>
            </table>
        </div>
    </body>
</html>
