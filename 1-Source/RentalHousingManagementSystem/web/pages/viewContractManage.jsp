<%@page import="model.Services"%>
<%@page import="DAL.ServicesDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : viewContractManage.jsp
    Created on : Mar 12, 2022, 11:37:48 PM
    Author     : coder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <link rel="stylesheet" href="css/StyleViewContractManage.css">
        <script>
            $(document).ready(function () {
                $('#dtTableCustomer').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
        </script>
    </head>
    <body>
        <%
            ServicesDAO DBSer = new ServicesDAO();
            Services services = new Services();
        %>
        <h1 style="text-align: center">Chi Tiết Hợp Đồng</h1>
        <h1 style="text-align: center">Phòng ${contract.roomName}</h1>
        <h1 style="text-align: center">Tình trạng hợp đồng ${contract.status == 1? "Hoạt Động" : "Hủy"}</h1>
        <div class="date" style="text-align: center">
            Ngày bắt đầu: ${contract.startAt}&emsp;
            Ngày kết thúc: ${contract.endAt}
        </div>
        <b>Người đại diện hợp đồng:</b>
        <table border="0">
            <tbody>
                <tr>
                    <td>Họ Tên:</td>
                    <td>${customerRepresentative.name}</td>
                </tr>
                <tr>
                    <td>Số Điện Thoại:</td>
                    <td>${customerRepresentative.phoneNumber}</td>
                <tr>
                    <td>Địa Chỉ:</td>
                    <td>${customerRepresentative.address}</td>
                </tr>
            </tbody>
        </table>
        <c:forEach var="C" items="${listCustomer}" varStatus="loop">
            <br>
            <b>Người thuê ${loop.index + 2}</b>
            <table border="0">
                <tbody>
                    <tr>
                        <td>Họ Tên:</td>
                        <td>${C.name}</td>
                    </tr>
                    <tr>
                        <td>Số Điện Thoại:</td>
                        <td>${C.phoneNumber}</td>
                    <tr>
                        <td>Địa Chỉ:</td>
                        <td>${C.address}</td>
                    </tr>
                </tbody>
            </table>
        </c:forEach>
        Bảng Thống Kê Chi Phí Dịch Vụ:
        <div>
            <div class="container mt-3" >
                <table id="dtTableCustomer" class="table table-hover table-striped table-bordered table-sm">
                    <thead>
                        <tr>
                            <th class="th-sm" style="text-align: center">Chu Kỳ</th>
                            <th class="th-sm" style="text-align: center">Tên Dịch Vụ</th>
                            <th class="th-sm" style="text-align: center">Giá</th>
                            <th class="th-sm" style="text-align: center">Số Lượng</th>
                            <th class="th-sm" style="text-align: center">Tổng</th>
                            <th class="th-sm" style="text-align: center">Ghi Chú</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="T" items="${listTransactions}">
                            <tr>
                            <td style="text-align: center">${T.paymentCycle}</td>
                            <c:set var="servicesID" value="${T.servicesID}"/>
                            <%
                                services = DBSer.getServicesByID((Integer)pageContext.getAttribute("servicesID"));
                            %>
                            <td style="text-align: center"><%=services.getName()%></td>
                            <td style="text-align: center">${T.price}</td>
                            <td style="text-align: center">${T.quantity}</td>
                            <td style="text-align: center">${T.amount}</td>
                            <td style="text-align: center">${T.note}</td>
                        </tr>
                        </c:forEach>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
