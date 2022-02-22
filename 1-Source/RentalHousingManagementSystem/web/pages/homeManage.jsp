<%-- 
    Document   : homeAdmin.jsp
    Created on : Feb 22, 2022, 4:20:16 PM
    Author     : coder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/StyleHomeAdmin.css">
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
                <li><a href="HomeManage" target="_blank">Trang Chủ</a></li>
                <li><a href="RoomManage" target="_blank">Quản Lý Phòng</a></li>
                <li><a href="ServiceManage" target="_blank">Quản Lý Dịch Vụ</a></li>
                <li><a href="https://twitter.com/plavookac" target="_blank">Quản Lý Người Thuê</a></li>
                <li><a href="https://www.youtube.com/channel/UCDfZM0IK6RBgud8HYGFXAJg" target="_blank">Thống Kê Thu Chi</a></li>
                <li><a href="https://www.linkedin.com/in/plavookac/" target="_blank">Linkedin</a></li>
            </ul>
        </div>
        <div id='center' class="main center">
            <div class="mainInner">
                <div>PURE CSS SIDEBAR TOGGLE MENU</div>
            </div>
            <div class="mainInner">
                <div>PURE CSS SIDEBAR TOGGLE MENU</div>
            </div>
            <div class="mainInner">
                <div>PURE CSS SIDEBAR TOGGLE MENU</div>
            </div>
        </div>
    </body>
</html>
