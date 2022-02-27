<%-- 
    Document   : contractManage
    Created on : Feb 27, 2022, 11:20:42 PM
    Author     : coder
--%>

<%@page import="model.Contract"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý hợp đồng</title>
        <!--bs-->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
        <!--hết bs-->
        <link rel="stylesheet" href="css/StyleContractManage.css">
        <link rel="stylesheet" href="css/StyleSidebar.css">
        <script src="js/JSContractManage.js"></script>
    </head>
    <body>
        <%
            ArrayList<Contract> listContract = (ArrayList<Contract>) request.getAttribute("listContract");
        %>
        <%@include file="sidebarAndHeader.jsp"%>
    </body>
</html>
