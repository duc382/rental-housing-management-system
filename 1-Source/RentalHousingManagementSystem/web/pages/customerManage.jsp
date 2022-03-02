<%-- 
    Document   : customerManage
    Created on : Feb 28, 2022, 11:02:31 PM
    Author     : coder
--%>

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
            ArrayList<Customer> listCustomer = (ArrayList<Customer>) request.getAttribute("listCustomer");
//            CustomerDAO DAS = new CustomerDAO();
//            RoomDAO DBR = new RoomDAO();
        %>
        <%@include file="sidebarAndHeader.jsp"%>
        <!--bảng thông tin phòng-->
        <div>
            <div class="container mt-3" style="max-width: 76%; margin-left: 12%; margin-right: 12%;">
                <div style="margin-bottom: 3px">
                    <button class="open-button" onclick="openForm()">Thêm Phòng</button>    
                </div>
                <table id="dtTableContract" class="table table-hover table-striped table-bordered table-sm">
                    <thead>
                        <tr>
                            <th class="th-sm">Tên Phòng</th>
                            <th class="th-sm" style="text-align: center">Họ Tên</th>
                            <th class="th-sm" style="text-align: center">Số Điện Thoại</th>
                            <th class="th-sm" style="text-align: center">Ngày Sinh</th>
                            <th class="th-sm" style="text-align: center">Giới Tính</th>
                            <th class="th-sm" style="text-align: center">Số CCCD</th>
                            <th class="th-sm" style="text-align: center">Địa Chỉ</th>
                            <th class="th-sm" style="text-align: center">Số Điện Thoại Người Thân</th>
                            <th style="text-align: center">Sửa/Xóa</th>
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
                            <td><%=ContractID%></td>
                            <td style="text-align: center"><%=listCustomer.get(i).getName()%></td>
                            <td style="text-align: center"><%=listCustomer.get(i).getPhoneNumber()%></td>
                            <td style="text-align: center"><%=listCustomer.get(i).getDOB()%></td>
                            <td style="text-align: center"><%=listCustomer.get(i).getSex()%></td>
                            <td style="text-align: center"><%=listCustomer.get(i).getCCCD()%></td>
                            <td style="text-align: center"><%=listCustomer.get(i).getAddress()%></td>
                            <td style="text-align: center"><%=listCustomer.get(i).getRelativeNumber()%></td>
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
