<%-- 
    Document   : homeAdmin.jsp
    Created on : Feb 22, 2022, 4:20:16 PM
    Author     : coder
--%>

<%@page import="model.Request"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Account"%>
<%@page import="DAL.AccountDAO"%>
<%@page import="model.Room"%>
<%@page import="DAL.RoomDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Yêu Cầu</title>
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
        <link rel="stylesheet" href="css/StyleHomeManage.css">
        <script src="js/JSHomeManage.js"></script>
        <script>
            $(document).ready(function () {
                $('#dtTableRequest').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
        </script>
    </head>
    <body>
        <%
            RoomDAO DBRoom = new RoomDAO();
            AccountDAO DBAcc = new AccountDAO();
            Account account = new Account();
            Room room = new Room();
        %>
        <%@include file="sidebarAndHeader.jsp"%>
        <%
            ArrayList<Request> listRequest = (ArrayList<Request>) request.getAttribute("listRequest");
        %>
        <script>
            const listStatusRequest = [];
            <%
                for (int i = 0; i < listRequest.size(); i++) {
            %>
            listStatusRequest.push("<%=listRequest.get(i).getStatus()%>");
            <%
                }
            %>
        </script>
        <!--form sửa yêu cầu-->
        <div class="form-popup" id="myFormEdit">
            <form class="form-container" name="myFormEdit" action="EditRequestManage" method="post"  >
                <h1 style="text-align: center;">Sửa Yêu Cầu</h1>
                <input style="display: none" id="id" name="id">
                <label><b>Trạng Thái:</b></label>
                <select id="status" name="status">
                    <option value="1">Đã xử lý</option>
                    <option value="0">Chưa xử lý</option>
                </select>
                <br>
                <label><b>Ghi Chú</b></label>
                <br>
                <textarea style="height: 150px;width: 100%;" id="note" name="note" ></textarea>
                <input type="submit" class="btn" value="Chỉnh Sửa"/>
                <button type="button" class="btn cancel" onclick="closeFormEdit()">Hủy</button>
            </form>
        </div>
        <!--bảng request-->
        <div>
            <div class="container mt-3" style="max-width: 76%; margin-left: 12%; margin-right: 12%;">
                <table id="dtTableRequest" class="table table-hover table-striped table-bordered table-sm">
                    <thead>
                        <tr>
                            <th class="th-sm" style="text-align: center">Phòng</th>
                            <th class="th-sm" style="text-align: center">Nội Dung</th>
                            <th class="th-sm" style="text-align: center">Trạng Thái</th>
                            <th class="th-sm" style="text-align: center">Ghi Chú</th>
                            <th class="th-sm" style="text-align: center">Chức Năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="Re" items="${listRequest}" varStatus="loop">
                            <tr>
                                <c:set var="accountID" value="${Re.accountID}"/>
                                <%
                                    int accountID = (Integer) pageContext.getAttribute("accountID");
                                    account = DBAcc.getAccountByID(accountID);
                                %>
                                <c:set var="roomID" value="<%=account.getRoomID()%>"/>
                                <%
                                    int roomID = (Integer) pageContext.getAttribute("roomID");
                                    room = DBRoom.getRoomByID(roomID);
                                    String roomName = "";
                                    if (room != null){
                                        roomName = room.getName();
                                    }
                                %>
                                <td style="text-align: center"><%=roomName%></td>
                                <td style="text-align: center">${Re.content}</td>
                                <td style="text-align: center">${Re.status == 1?"Đã xử lý":"Chưa xử lý"}</td>
                                <td style="text-align: center">${Re.note}</td>
                                <td style="text-align: center">
                                    <button onclick="openFormEdit(${Re.id}, '${Re.note}', ${loop.index}, listStatusRequest)">Sửa yêu cầu</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
