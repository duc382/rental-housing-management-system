<%-- 
    Document   : ServiceManage
    Created on : Feb 25, 2022, 9:53:46 PM
    Author     : coder
--%>

<%@page import="model.Services"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý dịch vụ</title>
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
        <link rel="stylesheet" href="css/StyleServicesManage.css">
        <link rel="stylesheet" href="css/StyleSidebar.css">
        <script src="js/JSServicesManage.js"></script>
    </head>
    <body>
        <%@include file="sidebarAndHeader.jsp"%>
        <%
            ArrayList<Services> listServices = (ArrayList<Services>) request.getAttribute("listServices");
        %>
        <script>
            $(document).ready(function () {
                $('#dtTableServices').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
            const deleteFunction = (id) => {
                if (confirm("Bấm ok để xóa phòng đã chọn, cancel để hủy") == true) {
                    window.location.href = "DeleteServicesManage?id=" + id;
                }
            }
            const listServicesName = [];
            <%
                for (int i = 0; i < listServices.size(); i++) {
            %>
            listServicesName.push("<%=listServices.get(i).getName()%>");
            <%
                }
            %>
            ServicesEdit = new Array();
        </script>
        <!--form thêm services-->
        <div class="form-popup" id="myForm">
            <form class="form-container" name="myForm" action="AddServicesManage" onsubmit="return validateForm(listServicesName)" method="post"  >
                <h1 style="text-align: center;">Thêm Dịch Vụ</h1>
                <label><b>Tên Dịch Vụ</b></label>
                <input type="text" placeholder="VD: điện" name="name" required>
                <label><b>Tên Nhà Cung Cấp</b></label>
                <input type="text" placeholder="VD: EVNHANOI" name="SupplierName">
                <label><b>Giá Gốc(VNĐ)</b></label>
                <input type="text" placeholder="VD: 2300" name="OriginCost" required="">
                <label><b>Giá Bán Ra (VNĐ)</b></label>
                <input type="text" placeholder="VD: 3000" name="price" required>
                <input type="submit" class="btn" value="Thêm"/>
                <button type="button" class="btn cancel" onclick="closeForm()">Hủy</button>
            </form>
        </div>
        <!--form sửa services-->
        <div class="form-popup" id="myFormEdit">
            <form class="form-container" name="myFormEdit" action="EditServicesManage" onsubmit="return validateFormEdit(listServicesName)" method="post"  >
                <h1 style="text-align: center;">Sửa Dịch Vụ</h1>
                <input style="display: none" id ="IDEdit" type="text" name="ID"> 
                <label><b>Tên Dịch Vụ</b></label>
                <input id ="NameEdit" type="text" placeholder="VD: điện" name="name" required>
                <label><b>Tên Nhà Cung Cấp</b></label>
                <input id="SupplierNameEdit" type="text" placeholder="VD: EVNHANOI" name="SupplierName">
                <label><b>Giá Gốc(VNĐ)</b></label>
                <input id="OriginCostEdit" type="text" placeholder="VD: 2300" name="OriginCost" required="">
                <label><b>Giá Bán Ra (VNĐ)</b></label>
                <input id="PriceEdit" type="text" placeholder="VD: 3000" name="price" required>
                <input type="submit" class="btn" value="Sửa"/>
                <button type="button" class="btn cancel" onclick="closeFormEdit()">Hủy</button>
            </form>
        </div>
        <div>
            <div class="container mt-3" style="max-width: 76%; margin-left: 12%; margin-right: 12%;">
                <div style="margin-bottom: 3px">
                    <button class="open-button" onclick="openForm()">Thêm Dịch Vụ</button>    
                </div>
                <table id="dtTableServices" class="table table-hover table-striped table-bordered table-sm">
                    <thead>
                        <tr>
                            <th class="th-sm">Tên Dịch Vụ</th>
                            <th class="th-sm" style="text-align: center">Tên Nhà Cung Cấp</th>
                            <th class="th-sm" style="text-align: center">Giá Gốc</th>
                            <th class="th-sm" style="text-align: center">Giá Bán Ra</th>
                            <th style="text-align: center">Sửa/Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < listServices.size(); i++) {%>
                        <tr>
                            <td><%=listServices.get(i).getName()%></td>
                            <td style="text-align: center"><%=listServices.get(i).getSupplierName()%></td>
                            <td style="text-align: center"><%=listServices.get(i).getOriginCost()%></td>
                            <td style="text-align: center"><%=listServices.get(i).getPrice()%></td>
                            <td style="text-align: center">
                                <script>
                                    ServicesEdit[<%=i%>] = new Array();
                                    ServicesEdit[<%=i%>].push("<%=listServices.get(i).getID()%>");
                                    ServicesEdit[<%=i%>].push("<%=listServices.get(i).getName()%>");
                                    ServicesEdit[<%=i%>].push("<%=listServices.get(i).getSupplierName()%>");
                                    ServicesEdit[<%=i%>].push("<%=listServices.get(i).getOriginCost()%>");
                                    ServicesEdit[<%=i%>].push("<%=listServices.get(i).getPrice()%>");
                                </script>
                                <button onclick="openFormEdit(ServicesEdit, <%=i%>)">Sửa thông dịch vụ</button>
                                <button><a style="text-decoration: none; color: black" onclick="deleteFunction(<%=listServices.get(i).getID()%>)" href="#">Xóa</a></button>
                            </td>
                        </tr>
                        <%}%>   
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
