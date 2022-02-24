<%-- 
    Document   : roomManage.jsp
    Created on : Feb 22, 2022, 10:53:03 PM
    Author     : coder
--%>

<%@page import="model.Room"%>
<%@page import="java.util.ArrayList"%>
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
        <script>
            const deleteFunction = (id) =>{
                if (confirm("Bấm ok để xóa phòng đã chọn, cancel để hủy") == true) {
                    window.location.href = "DeleteRoomManage?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <%
            ArrayList<Room> listRoom = (ArrayList<Room>) request.getAttribute("listRoom");
        %>
        <script>
            const listRoomName = [];
            <%
                for (int i = 0; i < listRoom.size(); i++) {
            %>
            listRoomName.push("<%=listRoom.get(i).getName()%>");
            <%
                }
            %>
        </script>
        <%@include file="sidebarAndHeader.jsp"%>
        <div class="form-popup" id="myForm">
            <form class="form-container" name="myForm" action="AddRoomManage" onsubmit="return validateForm(listRoomName)" method="post"  >
                <h1 style="text-align: center;">Thêm Phòng</h1>
                <label><b>Tên phòng</b></label>
                <input type="text" placeholder="VD: P01/Phòng 01" name="name" required>
                <label><b>Giá(VNĐ)</b></label>
                <input type="number" placeholder="VD: 18000000" name="price" required>
                <label><b>Diện tích (m2)</b></label>
                <input type="text" placeholder="VD: 18" name="area" required>
                <label><b>Số lượng người tối đa</b></label>
                <input type="number" placeholder="VD: 2" name="quantityMax" required>
                <label><b>Đồ dùng có trong phòng</b></label>
                <input type="text" placeholder="VD: giường, tủ...." name="utensil">
                <input type="submit" class="btn" value="Thêm"/>
                <button type="button" class="btn cancel" onclick="closeForm()">Hủy</button>
            </form>
        </div>
        <div>
            <div class="container mt-3" sty>
                <button class="open-button" onclick="openForm()">Thêm Phòng</button>    
                <table id="dtBasicExample" class="table table-hover">
                    <thead>
                        <tr>
                            <th class="th-sm">Tên Phòng</th>
                            <th class="th-sm">Giá</th>
                            <th class="th-sm">Diện Tích</th>
                            <th class="th-sm">Số Lượng Tối Đa</th>
                            <th>Đồ Dùng Trong Phòng</th>
                            <th>Sửa/Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <%
                                        for (int i = 0; i < listRoom.size(); i++) {%>
                        <tr>
                            <td><%=listRoom.get(i).getName()%></td>
                            <td><%=listRoom.get(i).getPrice()%></td>
                            <td><%=listRoom.get(i).getArea()%></td>
                            <td><%=listRoom.get(i).getQuantityMax()%></td>
                            <td><%=listRoom.get(i).getUtensil()%></td>
                            <td>
                                <a href="Edit?id=<%=listRoom.get(i).getID()%>">Edit</a>
                                <a onclick="deleteFunction(<%=listRoom.get(i).getID()%>)" href="#">Delete</a>
                            </td>
                        </tr>
                        <%}%>   
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
