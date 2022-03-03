<%-- 
    Document   : customerManage
    Created on : Feb 28, 2022, 11:02:31 PM
    Author     : coder
--%>

<%@page import="model.Contract"%>
<%@page import="DAL.RoomDAO"%>
<%@page import="DAL.ContractDAO"%>
<%@page import="DAL.CustomerDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý người thuê</title>
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
        <link rel="stylesheet" href="css/StyleCustomerManage.css">
        <script src="js/JSCustomerManage.js"></script>
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
            ArrayList<Customer> listCustomer = (ArrayList<Customer>) request.getAttribute("listCustomer");
            ContractDAO DBCon = new ContractDAO();
            RoomDAO DBRoom = new RoomDAO();
        %>
        <%@include file="sidebarAndHeader.jsp"%>
        <!--form thêm người thuê-->
        <div class="form-popup" id="myFormAdd">
            <form class="form-container" name="myFormAdd" action="AddCustomerManage" onsubmit="return validateFormAdd(listServicesName)" method="post"  >
                <h1 style="text-align: center;">Thêm Người Thuê</h1>
                <table style="max-width: none">
                    <tr>
                        <td>Họ Tên</td>
                        <td><input type="text" placeholder="VD: Nguyễn Văn An" name="name" required></td>
                        <td>Số Điện Thoại</td>
                        <td><input type="text" placeholder="VD: 0989999999" name="phoneNumber" required></td>
                    </tr>
                    <tr>
                        <td>Ngày Sinh</td>
                        <td>
                            <input type="date" name="DOB" required="">
                        </td>
                        <td>Giới Tính</td>
                        <td>
                            <INPUT TYPE="radio" name="sex" value="1" required/>Nam  
                            <INPUT TYPE="radio" name="sex" VALUE="0" required/>Nữ
                        </td>
                    </tr>
                    <tr>
                        <td>Nghề Nghiệp</td>
                        <td><input type="text" placeholder="VD: Sinh Viên" name="job" required></td>
                        <td>Email</td>
                        <td><input type="text" placeholder="VD: An@gmail.com" name="email"></td>
                    </tr>
                    <tr>
                        <td>Số CCCD</td>
                        <td><input type="text" placeholder="VD: 038301000333" name="CCCD" required></td>
                        <td>Số Điện Thoại Người Thân</td>
                        <td><input type="text" placeholder="VD: 0988888888" name="phoneNumber2" required=""></td>
                    </tr>
                    <tr>
                        <td>Địa chỉ</td>
                        <td colspan="3"><input type="text" placeholder="Số nhà - Đường - Thôn - Phường/Xã - Quận/Huyện - Tỉnh" name="address" required></td>
                    </tr>
                </table>
                <input type="submit" class="btn" value="Thêm"/>
                <button type="button" class="btn cancel" onclick="closeFormAdd()">Hủy</button>
            </form>
        </div>
        <!--bảng thông tin phòng-->
        <div>
            <div class="container mt-3" style="max-width: 76%; margin-left: 12%; margin-right: 12%;">
                <div style="margin-bottom: 3px">
                    <button class="open-button" onclick="openFormAdd()">Thêm Người Thuê</button>    
                </div>
                <table id="dtTableContract" class="table table-hover table-striped table-bordered table-sm">
                    <thead>
                        <tr>
                            <th class="th-sm">Tên Phòng</th>
                            <th class="th-sm" style="text-align: center">Họ Tên</th>
                            <th class="th-sm" style="text-align: center">Số Điện Thoại</th>
                            <th class="th-sm" style="text-align: center">Số Điện Thoại Người Thân</th>
                            <th class="th-sm" style="text-align: center">Ngày Sinh</th>
                            <th class="th-sm" style="text-align: center">Giới Tính</th>
                            <th style="text-align: center">Chức năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int ContractID = 0;
                            for (int i = 0; i < listCustomer.size(); i++) {
                                if (listCustomer.get(i).getContractID() != 0) {
                                    ContractID = listCustomer.get(i).getContractID();

                                }
                        %>
                        <tr>
                            <%
                                String roomName = "";
                                Contract contract = DBCon.getContractByContractID(listCustomer.get(i).getContractID());
                                if (contract != null){
                                    roomName = DBRoom.getRoomByID(contract.getRoomID()).getName();
                                }
                                
                            %>
                            <td><%=roomName%></td>
                            <td style="text-align: center"><%=listCustomer.get(i).getName()%></td>
                            <td style="text-align: center"><%=listCustomer.get(i).getPhoneNumber()%></td>
                            <td style="text-align: center"><%=listCustomer.get(i).getRelativeNumber()%></td>
                            <td style="text-align: center"><%=listCustomer.get(i).getDOB()%></td>
                            <td style="text-align: center"><% if (listCustomer.get(i).getSex()== 1){%>Nam<%}else{%>Nữ<%}%></td>                            
                            <td style="text-align: center">
                                <button>Sửa thông tin</button>
                                <button>Thêm vào phòng</button>
                                <button>Xóa</button>
                            </td>
                        </tr>
                        <%}%>   
                    </tbody>
                </table>
            </div>
    </body>
</html>
