<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.Transactions"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Services"%>
<%@page import="model.Contract"%>
<%@page import="DAL.ServicesDAO"%>
<%@page import="DAL.ContractDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : analysticManage
    Created on : Mar 11, 2022, 4:32:01 PM
    Author     : coder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý hóa đơn</title>
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
        <link rel="stylesheet" href="css/StyleAnalysticManage.css">
        <script src="js/JSAnalysticManage.js"></script>
        <script>
            $(document).ready(function () {
                $('#dtTableAnalystic').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
            const deleteFunction = (id) => {
                if (confirm("Bấm ok để xóa hóa đơn đã chọn, cancel để hủy") == true) {
                    window.location.href = "DeleteTransactionsManage?id=" + id;
                }

            }
        </script>
    </head>
    <body>
        <%
            ContractDAO DBCon = new ContractDAO();
            ServicesDAO DBSer = new ServicesDAO();
            Contract contract = new Contract();
            Services services = new Services();
        %>
        <%@include file="sidebarAndHeader.jsp"%>
        <div>
            <div class="container mt-3" style="max-width: 76%; margin-left: 12%; margin-right: 12%;">
                <div style="margin-bottom: 3px">
                    <a href="AddTransactionsManage" target="_blank"><button class="open-button" >Thêm Hóa Đơn</button>  </a>

                </div>
                <table id="dtTableAnalystic" class="table table-hover table-striped table-bordered table-sm">
                    <thead>
                        <tr>
                            <th class="th-sm">Tên Phòng</th>
                            <th class="th-sm" style="text-align: center">Tên Dịch Vụ</th>
                            <th class="th-sm" style="text-align: center">Giá/Số Lượng</th>
                            <th class="th-sm" style="text-align: center">Số Lượng</th>
                            <th class="th-sm" style="text-align: center">Tổng</th>
                            <th class="th-sm" style="text-align: center">Chu Kỳ</th>
                            <th class="th-sm" style="text-align: center">Ghi Chú</th>
                            <th class="th-sm" style="text-align: center">Chức Năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Transactions> listTrans = (ArrayList<Transactions>) request.getAttribute("listTransaction");
                            for (int i = 0; i < listTrans.size(); i++) {
                                contract = DBCon.getContractByContractID(listTrans.get(i).getContactID());
                                services = DBSer.getServicesByID(listTrans.get(i).getServicesID());
                        %>
                        <tr>
                            <td style="text-align: center"><%=contract.getRoomName()%></td>
                            <td style="text-align: center"><%=services.getName()%></td>
                            <td style="text-align: center"><%=listTrans.get(i).getPrice()%></td>
                            <td style="text-align: center"><%=listTrans.get(i).getQuantity()%></td>
                            <td style="text-align: center"><%=listTrans.get(i).getAmount()%></td>
                            <td style="text-align: center"><%=listTrans.get(i).getPaymentCycle()%></td>
                            <td style="text-align: center"><%=listTrans.get(i).getNote()%></td>
                            <td style="text-align: center">
                                <a style="text-decoration: none; color: black" href="EditTransactionsManage?id=<%=listTrans.get(i).getId()%>" target="_blank"><button>Sửa</button></a>
                                <a style="text-decoration: none; color: black" onclick="deleteFunction(<%=listTrans.get(i).getId()%>)"><button>Xóa</button></a>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
