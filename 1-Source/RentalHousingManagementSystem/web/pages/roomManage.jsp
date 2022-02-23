<%-- 
    Document   : roomManage.jsp
    Created on : Feb 22, 2022, 10:53:03 PM
    Author     : coder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <title>Example</title>
        <link rel="stylesheet" href="css/StyleRoomManage.css">
        <link rel="stylesheet" href="css/StyleSidebar.css">
        <script src="js/JSRoomManage.js"></script>
    </head>
    <body>
        <%@include file="sidebarAndHeader.jsp"%>
        <div class="form-popup" id="myForm">
            <form action="AddRoomManage" method="post" class="form-container">
                <h1 style="text-align: center;">Thêm Phòng</h1>
                <label><b>Tên phòng</b></label>
                <input type="text" placeholder="VD: P01/Phòng 01" id="name" name="name" required>
                <label><b>Giá(VNĐ)</b></label>
                <input type="number" placeholder="VD: 18000000" name="price" required>
                <label><b>Diện tích (m2)</b></label>
                <input type="number" placeholder="VD: 18" name="area" required>
                <label><b>Số lượng người tối đa</b></label>
                <input type="number" placeholder="VD: 2" name="quantityMax" required>
                <label><b>Đồ dùng có trong phòng</b></label>
                <input type="text" placeholder="VD: giường, tủ...." name="utensil">
                <input onclick="check()" type="submit" class="btn" value="Thêm"/>
                <button type="button" class="btn cancel" onclick="closeForm()">Hủy</button>
            </form>
        </div>
        <div style="margin-left: 12%; margin-top: 6%">
            <div class="container mt-3" sty>
                <button class="open-button" onclick="openForm()">Thêm Phòng</button>
                <h2>Hover Rows</h2>
                <p>The .table-hover class enables a hover state (grey background on mouse over) on table rows:</p>            
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Firstname</th>
                            <th>Lastname</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>John</td>
                            <td>Doe</td>
                            <td>john@example.com</td>
                        </tr>
                        <tr>
                            <td>Mary</td>
                            <td>Moe</td>
                            <td>mary@example.com</td>
                        </tr>
                        <tr>
                            <td>July</td>
                            <td>Dooley</td>
                            <td>july@example.com</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
