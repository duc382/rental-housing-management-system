<%-- 
    Document   : editAccountGuest
    Created on : Mar 13, 2022, 12:14:34 PM
    Author     : coder
--%>

<%@page import="model.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAL.AccountDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý tài khoản</title>
        <link rel="stylesheet" href="css/StyleEditAccountGuest.css">
        <script src="js/JSEditAccountGuest.js"></script>
    </head>
    <%
        AccountDAO DBA = new AccountDAO();
        ArrayList<Account> listAccount = DBA.getAllAccount();
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
    <%@include file="sidebarAndHeaderGuest.jsp"%>
    <body>
        <form class="form-container" name="myFormEdit" action="EditAccountGuest" onsubmit="return validateFormEdit(listUsername,'${account.username}','${account.id}')" method="post"  >
                <h1 style="text-align: center;">Sửa Tài Khoản</h1>
                <input style="display: none" id="id" name="id">
                <label><b>Tài Khoản Mới</b></label>
                <input type="text" id="username" name="username" required>
                <label><b>Mật Khẩu Mới</b></label>
                <input type="password" name="password" required>
                <label><b>Nhập Lại Mật Khẩu</b></label>
                <input type="password" name="repassword" required>
<!--                <label><b>Vai Trò</b></label><br>
                <input type="radio" name="role" value="0" required=""/> Quản Lý<br>
                <input type="radio" name="role" value="1" required=""/> Khách Thuê-->
                <input type="submit" class="btn" value="Chỉnh Sửa"/>
            </form>
    </body>
</html>
