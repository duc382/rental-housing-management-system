<%-- 
    Document   : accountManage
    Created on : Mar 13, 2022, 1:17:51 AM
    Author     : coder
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Account"%>
<%@page import="model.Room"%>
<%@page import="DAL.RoomDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý Tài Khoản</title>
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
        <link rel="stylesheet" href="css/StyleAccountManage.css">
        <script src="js/JSAccountManage.js"></script>
        <script>
            $(document).ready(function () {
                $('#dtTableAccount').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
        </script>

    </head>
    <body>
        <%
            RoomDAO DBRoom = new RoomDAO();
            Room room = new Room();
            ArrayList<Account> listAccount = (ArrayList<Account>) request.getAttribute("listAccount");
        %>
        <script>
            const listUsername = [];
            <%
                for (int i = 0; i < listAccount.size(); i++) {
            %>
            listUsername.push("<%=listAccount.get(i).getUsername()%>");
            <%
                }
            %>
        </script>
        <%@include file="sidebarAndHeader.jsp"%>
        <!--form thêm tài khoản-->
        <div class="form-popup" id="myFormAdd">
            <form class="form-container" name="myFormAdd" action="AddAccountManage" onsubmit="return validateFormAdd(listUsername)" method="post"  >
                <h1 style="text-align: center;">Thêm Tài Khoản</h1>
                <label><b>Tài Khoản</b></label>
                <input type="text" name="username" required>
                <label><b>Mật Khẩu</b></label>
                <input type="password" name="password" required>
                <label><b>Nhập Lại Mật Khẩu</b></label>
                <input type="password" name="repassword" required>
<!--                <label><b>Vai Trò</b></label><br>
                <input type="radio" name="role" value="0" required=""/> Quản Lý<br>
                <input type="radio" name="role" value="1" required=""/> Khách Thuê-->
                <input type="submit" class="btn" value="Thêm"/>
                <button type="button" class="btn cancel" onclick="closeFormAdd()">Hủy</button>
            </form>
        </div>
        <!--form sửa tài khoản-->
        <div class="form-popup" id="myFormEdit">
            <form class="form-container" name="myFormEdit" action="EditAccountManage" onsubmit="return validateFormEdit(listUsername)" method="post"  >
                <h1 style="text-align: center;">Sửa Tài Khoản</h1>
                <input style="display: none" id="id" name="id">
                <label><b>Tài Khoản</b></label>
                <input type="text" id="username" name="username" required>
                <label><b>Mật Khẩu Mơi</b></label>
                <input type="password" name="password" required>
                <label><b>Nhập Lại Mật Khẩu</b></label>
                <input type="password" name="repassword" required>
<!--                <label><b>Vai Trò</b></label><br>
                <input type="radio" name="role" value="0" required=""/> Quản Lý<br>
                <input type="radio" name="role" value="1" required=""/> Khách Thuê-->
                <input type="submit" class="btn" value="Chỉnh Sửa"/>
                <button type="button" class="btn cancel" onclick="closeFormEdit()">Hủy</button>
            </form>
        </div>
        <div>
            <div class="container mt-3" style="max-width: 76%; margin-left: 12%; margin-right: 12%;">
                <div style="margin-bottom: 3px">
                    <button class="open-button" onclick="openFormAdd()">Thêm Tài Khoản</button>    
                </div>
                <table id="dtTableAccount" class="table table-hover table-striped table-bordered table-sm">
                    <thead>
                        <tr>
                            <th class="th-sm" style="text-align: center">Phòng</th>
                            <th class="th-sm" style="text-align: center">Tài Khoản</th>
                            <th class="th-sm" style="text-align: center">Mật Khẩu</th>
                            <th class="th-sm" style="text-align: center">Vai Trò</th>
                            <th class="th-sm" style="text-align: center">Chức Năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="A" items="${listAccount}" varStatus="loop">
                            <tr>
                                <c:set var="roomID" value="${A.roomID}"/>
                                <%
                                    room = DBRoom.getRoomByID((Integer) pageContext.getAttribute("roomID"));
                                    String roomName = "";
                                    if (room != null) {
                                        roomName = room.getName();
                                    }
                                %>
                                <td style="text-align: center"><%=roomName%></td>
                                <td style="text-align: center">${A.username}</td>
                                <td style="text-align: center">${A.password}</td>
                                <td style="text-align: center">${A.role == 1? "Quản lý" : "Khách thuê"}</td>
                                <td style="text-align: center">
                                    <button onclick="openFormEdit(${A.id},'${A.username}', ${loop.index})">Sửa</button>
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
