<%-- 
    Document   : sidebarAndHeaderGuest
    Created on : Mar 13, 2022, 11:57:19 AM
    Author     : coder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/StyleSidebar.css">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="header"></div>
            <input type="checkbox" class="openSidebarMenu" id="openSidebarMenu">
        <label for="openSidebarMenu" class="sidebarIconToggle">
            <div class="spinner diagonal part-1"></div>
            <div class="spinner horizontal"></div>
            <div class="spinner diagonal part-2"></div>
        </label>
        <div id="sidebarMenu">
            <ul class="sidebarMenuInner">
                <li><a href="HomeGuest">Trang Chủ</a></li>
                <li><a href="EditAccountGuest">Quản Lý Tài Khoản</a></li>
                <li><a href="#">Gửi Yêu Cầu</a></li>
                <li><a href="Logout">Đăng Xuất</a></li>
            </ul>
        </div>
    </body>
</html>
