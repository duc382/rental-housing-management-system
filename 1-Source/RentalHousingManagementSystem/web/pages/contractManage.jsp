<%-- 
    Document   : contractManage
    Created on : Feb 27, 2022, 11:20:42 PM
    Author     : coder
--%>

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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css"
              rel="stylesheet" />
        <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
        <!--hết bs-->
        <link rel="stylesheet" href="css/StyleContractManage.css">
        <link rel="stylesheet" href="css/StyleSidebar.css">
        <script src="js/JSContractManage.js"></script>
        <script>
            $(document).ready(function () {
                $('#dtTableContract').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
            $(function () {
                $('.selectpicker').selectpicker();
            });
        </script>
    </head>
    <body>
        <%
            ArrayList<Contract> listContract = (ArrayList<Contract>) request.getAttribute("listContract");
            ServicesDAO DAS = new ServicesDAO();
            RoomDAO DBR = new RoomDAO();
            CustomerDAO DBC= new CustomerDAO();
        %>
        
        <%@include file="sidebarAndHeader.jsp"%>
        <!--form thêm hợp đồng-->
        <div class="form-popup" id="myForm">
            <form class="form-container" name="myFormAddContract" action="AddContractManage" onsubmit="return validateForm()" method="post"  >
                <h1 style="text-align: center;">Thêm Hợp Đồng</h1>
                <label><b>Tên phòng</b></label>
                <div style="height: auto" >
                    <select class="form-control selectpicker droplist" name="roomID" data-live-search="true">
                        <%
                            ArrayList<Room> listRoom = DBR.getRoomEmpty();
                            for (int i = 0; i < listRoom.size(); i++){%>
                            <option data-tokens="<%=listRoom.get(i).getName()%>" value="<%=listRoom.get(i).getID()%>"><%=listRoom.get(i).getName()%></option>
                        <%}%> 
                    </select>
                </div>
                <label><b>Người đại diện</b></label>
                <div style="height: auto" >
                    <select class="form-control selectpicker droplist" name="CustomerID" data-live-search="true">
                        <%
                            ArrayList<Customer> listCustomer = DBC.getCustomerNoneContract();
                            for (int i = 0; i < listCustomer.size(); i++){%>
                            <option data-tokens="<%=listCustomer.get(i).getName()+"("+listCustomer.get(i).getPhoneNumber()+")"%>" value="<%=listCustomer.get(i).getID()%>"><%=listCustomer.get(i).getName()+"("+listCustomer.get(i).getPhoneNumber()+")"%></option>
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
                    %>
                    <tr>
                        <%
                            Room room = DBR.getRoomByID(listContract.get(i).getRoomID());
                            String roomName = room.getName();
                        %>
                        <td><%=roomName%></td>
                        <td style="text-align: center"><%=listContract.get(i).getRepresentativeName()%></td>
                        <td style="text-align: center"><%=listContract.get(i).getStartAt()%></td>
                        <td style="text-align: center"><%=listContract.get(i).getEndAt()%></td>
                        <td style="text-align: center"><%=listContract.get(i).getStatus()%></td>
                        <td style="text-align: center">
                            <button>Sửa hợp đồng</button>
                            <button>Xóa</button>
                        </td>
                    </tr>
                    <%}%>   
                </tbody>
            </table>
        </div>
    </body>
</html>
