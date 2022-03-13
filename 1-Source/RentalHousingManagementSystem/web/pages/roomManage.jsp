<%-- 
    Document   : roomManage.jsp
    Created on : Feb 22, 2022, 10:53:03 PM
    Author     : coder
--%>

<%@page import="DAL.RoomDAO"%>
<%@page import="model.Room"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý phòng</title>
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
        <link rel="stylesheet" href="css/StyleRoomManage.css">
        <link rel="stylesheet" href="css/StyleSidebar.css">
        <script src="js/JSRoomManage.js"></script>
        <script>
            const deleteFunction = (id, status) => {
                if (status != 1) {
                    if (confirm("Bấm ok để xóa phòng đã chọn, cancel để hủy") == true) {
                        window.location.href = "DeleteRoomManage?id=" + id;
                    }
                } else{
                    alert("Không thể xóa phòng đang còn hợp đồng");
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
        <!--form thêm phòng-->
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
        <!--form sửa phòng-->
        <div class="form-popup" id="myFormEdit">
            <form class="form-container" name="myFormEdit" action="EditRoomManage" onsubmit="return validateFormEdit(listRoomName)" method="post"  >
                <h1 style="text-align: center;">Sửa phòng</h1>
                <input style="display: none" id ="IDEdit" type="text" name="ID"> 
                <label><b>Tên phòng</b></label>
                <input id ="NameEdit" type="text" placeholder="VD: P01/Phòng 01" name="name" required>
                <label><b>Giá(VNĐ)</b></label>
                <input id ="PriceEdit" type="number" placeholder="VD: 18000000" name="price" required>
                <label><b>Diện tích (m2)</b></label>
                <input id ="AreaEdit" type="text" placeholder="VD: 18" name="area" required>
                <label><b>Số lượng người tối đa</b></label>
                <input id ="QuantityMaxEdit" type="number" placeholder="VD: 2" name="quantityMax" required>
                <label><b>Đồ dùng có trong phòng</b></label>
                <input id ="UtensilEdit" type="text" placeholder="VD: giường, tủ...." name="utensil">
                <input type="submit" class="btn" value="Đồng ý"/>
                <button type="button" class="btn cancel" onclick="closeFormEdit()">Hủy</button>
            </form>
        </div>
        <!--bảng thông tin phòng-->
        <div>
            <div class="container mt-3" style="max-width: 76%; margin-left: 12%; margin-right: 12%;">
                <div style="margin-bottom: 3px">
                    <button class="open-button" onclick="openForm()">Thêm Phòng</button>    
                </div>
                <table id="dtBasicExample" class="table table-hover table-striped table-bordered table-sm">
                    <thead>
                        <tr>
                            <th class="th-sm">Tên Phòng</th>
                            <th class="th-sm">Trạng Thái</th>
                            <th class="th-sm" style="text-align: center">Giá</th>
                            <th class="th-sm" style="text-align: center">Diện Tích</th>
                            <th class="th-sm" style="text-align: center">Số Lượng Tối Đa</th>
                            <th class="th-sm" style="text-align: center">Số Lượng Hiện Tại</th>
                            <th>Đồ Dùng Trong Phòng</th>
                            <th style="text-align: center">Sửa/Xóa</th>
                        </tr>
                    </thead>
                    <tbody>
                    <script>
                        roomEdit = new Array();
                    </script>
                    <%
                        for (int i = 0; i < listRoom.size(); i++) {%>

                    <tr>
                        <td class="roomName hired"><h5><%=listRoom.get(i).getName()%></h5></td>
                        <td style="text-align: center"><h5><%=listRoom.get(i).getStatus()==1?"Đã Thuê":"Trống"%></h5></td>
                        <td style="text-align: center"><%=listRoom.get(i).getPrice()%></td>
                        <td style="text-align: center"><%=listRoom.get(i).getArea()%></td>
                        <td style="text-align: center"><%=listRoom.get(i).getQuantityMax()%></td>
                        <td style="text-align: center"><%=listRoom.get(i).getQuantityCurrent()%></td>
                        <td><%=listRoom.get(i).getUtensil()%></td>
                        <td style="text-align: center">
                            <script>
                                roomEdit[<%=i%>] = new Array();
                                roomEdit[<%=i%>].push("<%=listRoom.get(i).getID()%>");
                                roomEdit[<%=i%>].push("<%=listRoom.get(i).getName()%>");
                                roomEdit[<%=i%>].push("<%=listRoom.get(i).getPrice()%>");
                                roomEdit[<%=i%>].push("<%=listRoom.get(i).getArea()%>");
                                roomEdit[<%=i%>].push("<%=listRoom.get(i).getQuantityMax()%>");
                                roomEdit[<%=i%>].push("<%=listRoom.get(i).getUtensil()%>");
                                roomEdit[<%=i%>].push("<%=listRoom.get(i).getQuantityCurrent()%>");
                            </script>
                            <button onclick="openFormEdit(roomEdit, <%=i%>)">Sửa thông tin phòng</button>
                            <button><a style="text-decoration: none; color: black" onclick="deleteFunction(<%=listRoom.get(i).getID()%>, <%=listRoom.get(i).getStatus()%>)" href="#">Xóa</a></button>
                        </td>
                    </tr>
                    <%}%>   
                    </tbody>
                </table>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#dtBasicExample').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
        </script>
    </body>
</html>
