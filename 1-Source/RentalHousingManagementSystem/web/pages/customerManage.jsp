<%-- 
    Document   : customerManage
    Created on : Feb 28, 2022, 11:02:31 PM
    Author     : coder
--%>

<%@page import="model.Room"%>
<%@page import="model.Contract"%>
<%@page import="DAL.RoomDAO"%>
<%@page import="DAL.ContractDAO"%>
<%@page import="DAL.CustomerDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý người thuê</title>
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
        <link rel="stylesheet" href="css/StyleCustomerManage.css">
        <script src="js/JSCustomerManage.js"></script>
        <script>
            $(document).ready(function () {
                $('#dtTableContract').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
            $(function () {
                $('.selectpicker').selectpicker();
            });
            const deleteFunction = (id, check) => {
                if (check == false) {
                    if (confirm("Bấm ok để xóa người thuê đã chọn, cancel để hủy") == true) {
                        window.location.href = "DeleteCustomerManage?id=" + id;
                    }
                } else {
                    alert("Không thể xóa người đại diện hợp đồng");
                }

            }
            listCustomerJS = new Array();
        </script>
    </head>
    <body>
        <%
            ArrayList<Customer> listCustomer = (ArrayList<Customer>) request.getAttribute("listCustomer");
            ContractDAO DBCon = new ContractDAO();
            RoomDAO DBRoom = new RoomDAO();
        %>
        <%@include file="sidebarAndHeader.jsp"%>
        <!--form thêm người thuê-->
        <div class="form-popup" id="myFormAdd">
            <form class="form-container" name="myFormAdd" action="AddCustomerManage" onsubmit="return validateFormAdd()" method="post"  >
                <h1 style="text-align: center;">Thêm Người Thuê</h1>
                <table style="max-width: none">
                    <tr>
                        <td>Họ Tên</td>
                        <td><input type="text" placeholder="VD: Nguyễn Văn An" name="name" required></td>
                        <td>Số Điện Thoại</td>
                        <td><input type="text" placeholder="VD: 0989999999" name="phoneNumber" required></td>
                    </tr>
                    <tr>
                        <td>Ngày Sinh</td>
                        <td>
                            <input type="date" name="DOB" required="">
                        </td>
                        <td>Giới Tính</td>
                        <td>
                            <INPUT TYPE="radio" name="sex" value="1" required/>Nam  
                            <INPUT TYPE="radio" name="sex" VALUE="0" required/>Nữ
                        </td>
                    </tr>
                    <tr>
                        <td>Nghề Nghiệp</td>
                        <td><input type="text" placeholder="VD: Sinh Viên" name="job" required></td>
                        <td>Email</td>
                        <td><input type="text" placeholder="VD: An@gmail.com" name="email"></td>
                    </tr>
                    <tr>
                        <td>Số CCCD</td>
                        <td><input type="text" placeholder="VD: 038301000333" name="CCCD" required></td>
                        <td>Số Điện Thoại Người Thân</td>
                        <td><input type="text" placeholder="VD: 0988888888" name="phoneNumber2" required=""></td>
                    </tr>
                    <tr>
                        <td>Địa chỉ</td>
                        <td colspan="3"><input type="text" placeholder="Số nhà - Đường - Thôn - Phường/Xã - Quận/Huyện - Tỉnh" name="address" required></td>
                    </tr>
                </table>
                <input type="submit" class="btn" value="Thêm"/>
                <button type="button" class="btn cancel" onclick="closeFormAdd()">Hủy</button>
            </form>
        </div>
        <!--form xem chi tiết người thuê-->
        <div class="form-popup" id="myFormView">
            <form class="form-container" name="myFormView">
                <h1 style="text-align: center;">Thông Tin Người Thuê</h1>
                <table style="max-width: none">
                    <tr>
                        <td>Họ Tên</td>
                        <td colspan="3"><input type="text" id="nameView" readonly></td>
                    </tr>
                    <tr>
                        <td>Số Phòng</td>
                        <td><input type="text" id="roomView" readonly></td>
                        <td>Số Điện Thoại</td>
                        <td><input type="text" id="phoneNumberView" readonly></td>
                    </tr>
                    <tr>
                        <td>Ngày Sinh</td>
                        <td><input type="date" id="DOBView" readonly="true"></td>
                        <td>Giới Tính</td>
                        <td>
                            <INPUT TYPE="radio" id="sex1View" value="1"  disabled/>Nam  
                            <INPUT TYPE="radio" id="sex0View" value="0" disabled/>Nữ
                        </td>
                    </tr>
                    <tr>
                        <td>Nghề Nghiệp</td>
                        <td><input type="text" id="jobView" readonly></td>
                        <td>Email</td>
                        <td><input type="text" id="emailView" readonly></td>
                    </tr>
                    <tr>
                        <td>Số CCCD</td>
                        <td><input type="text" id="CCCDView" readonly></td>
                        <td>Số Điện Thoại Người Thân</td>
                        <td><input type="text" id="phoneNumber2View" readonly></td>
                    </tr>
                    <tr>
                        <td>Địa chỉ</td>
                        <td colspan="3"><input type="text" id="addressView" readonly></td>
                    </tr>
                </table>
                <button type="button" class="btn cancel" onclick="closeFormView()">Đóng</button>
            </form>
        </div>
        <!--form chỉnh sửa người thuê-->
        <div class="form-popup" id="myFormEdit">
            <form class="form-container" name="myFormEdit" action="EditCustomerManage" method="post">
                <h1 style="text-align: center;">Thông Tin Người Thuê</h1>
                <table style="max-width: none">
                    <input style="visibility: hidden; position: absolute" type="text" name="IDEdit" id="IDEdit" required>
                    <tr>
                        <td>Họ Tên</td>
                        <td colspan="3"><input type="text" name="nameEdit" id="nameEdit" required></td>
                    </tr>
                    <tr>
                        <td>Số Phòng</td>
                        <td><input type="text" name="roomEdit" id="roomEdit"></td>
                        <td>Số Điện Thoại</td>
                        <td><input type="text" name="phoneNumberEdit" id="phoneNumberEdit" required></td>
                    </tr>
                    <tr>
                        <td>Ngày Sinh</td>
                        <td><input type="date" name="DOBEdit" id="DOBEdit" required></td>
                        <td>Giới Tính</td>
                        <td>
                            <INPUT TYPE="radio" name="sexEdit" id="sex1Edit" value="1"  required/>Nam  
                            <INPUT TYPE="radio" name="sexEdit" id="sex0Edit" value="0" required/>Nữ
                        </td>
                    </tr>
                    <tr>
                        <td>Nghề Nghiệp</td>
                        <td><input type="text" name="jobEdit" id="jobEdit" required></td>
                        <td>Email</td>
                        <td><input type="text" name="emailEdit" id="emailEdit" required></td>
                    </tr>
                    <tr>
                        <td>Số CCCD</td>
                        <td><input type="text" name="CCCDEdit" id="CCCDEdit" required></td>
                        <td>Số Điện Thoại Người Thân</td>
                        <td><input type="text" name="phoneNumber2Edit" id="phoneNumber2Edit" required></td>
                    </tr>
                    <tr>
                        <td>Địa chỉ</td>
                        <td colspan="3"><input type="text" name="addressEdit" id="addressEdit" required></td>
                    </tr>
                </table>
                <input type="submit" class="btn" value="Đồng ý"/>
                <button type="button" class="btn cancel" onclick="closeFormEdit()">Đóng</button>
            </form>
        </div>
        <!--form Chuyển phòng-->
        <div class="form-popup" id="myFormChangeRoom">
            <form class="form-container" name="myFormChangeRoom" action="ChangeRoomForCustomerManage" method="post"  >
                <h1 style="text-align: center;">Chuyển Phòng Người Thuê</h1>
                <input style="visibility: hidden" name="CustomerID" id="CustomerID">
                <input style="visibility: hidden" name="roomIDCurrent" id="roomIDCurrent">
                <label><b>Tên phòng hiện tại</b></label>
                <input type="text" id="roomNameCurrent">
                <label><b>Tên phòng muốn chuyển đến</b></label>
                <div style="height: auto" >
                    <select class="form-control selectpicker droplist" name="roomIDNew" data-live-search="true">
                        <%
                            ArrayList<Room> listRoom = DBRoom.getRoomRedundantSlot();
                            for (int i = 0; i < listRoom.size(); i++) {%>
                        <option data-tokens="<%=listRoom.get(i).getName()%>" value="<%=listRoom.get(i).getID()%>"><%=listRoom.get(i).getName()%></option>
                        <%}%> 
                    </select>
                </div>
                <input type="submit" class="btn" value="Chuyển"/>
                <button type="button" class="btn cancel" onclick="closeFormChangeRoom()">Hủy</button>
            </form>
        </div>
        <!--bảng thông tin phòng-->
        <div>
            <div class="container mt-3" style="max-width: 76%; margin-left: 12%; margin-right: 12%;">
                <div style="margin-bottom: 3px">
                    <button class="open-button" onclick="openFormAdd()">Thêm Người Thuê</button>    
                </div>
                <table id="dtTableContract" class="table table-hover table-striped table-bordered table-sm">
                    <thead>
                        <tr>
                            <th class="th-sm">Tên Phòng</th>
                            <th class="th-sm" style="text-align: center">Họ Tên</th>
                            <th class="th-sm" style="text-align: center">Số Điện Thoại</th>
                            <th class="th-sm" style="text-align: center">Số Điện Thoại Người Thân</th>
                            <th class="th-sm" style="text-align: center">Ngày Sinh</th>
                            <th class="th-sm" style="text-align: center">Giới Tính</th>
                            <th style="text-align: center">Chức năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            for (int i = 0; i < listCustomer.size(); i++) {
                                int ContractID = 0;
                                boolean checkRepresentative = false;
                                if (listCustomer.get(i).getContractID() != 0) {
                                    ContractID = listCustomer.get(i).getContractID();

                                }
                                Contract contract = DBCon.getContractByRepresentative(listCustomer.get(i).getID());
                                if (contract != null) {
                                    checkRepresentative = true;
                                }

                        %>
                        <tr>
                            <%                                String roomName = "";
                                int roomIDCurrent = 0;
                                contract = DBCon.getContractByContractID(listCustomer.get(i).getContractID());
                                if (contract != null) {
                                    Room room = DBRoom.getRoomByID(contract.getRoomID());
                                    if (room == null) {
                                        continue;
                                    }
                                    roomName = room.getName();
                                    roomIDCurrent = room.getID();
                                }

                            %>
                            <td><%=roomName%></td>
                            <td style="text-align: center"><%=listCustomer.get(i).getName()%></td>
                            <td style="text-align: center"><%=listCustomer.get(i).getPhoneNumber()%></td>
                            <td style="text-align: center"><%=listCustomer.get(i).getRelativeNumber()%></td>
                            <td style="text-align: center"><%=listCustomer.get(i).getDOB()%></td>
                            <td style="text-align: center"><% if (listCustomer.get(i).getSex() == 1) {%>Nam<%} else {%>Nữ<%}%></td>                            
                            <td style="text-align: center">
                                <script>
                                    listCustomerJS[<%=i%>] = new Array();
                                    listCustomerJS[<%=i%>].push("<%=roomName%>");
                                    listCustomerJS[<%=i%>].push("<%=listCustomer.get(i).getName()%>");
                                    listCustomerJS[<%=i%>].push("<%=listCustomer.get(i).getPhoneNumber()%>");
                                    listCustomerJS[<%=i%>].push("<%=listCustomer.get(i).getDOB()%>");
                                    listCustomerJS[<%=i%>].push("<%=listCustomer.get(i).getSex()%>");
                                    listCustomerJS[<%=i%>].push("<%=listCustomer.get(i).getJob()%>");
                                    listCustomerJS[<%=i%>].push("<%=listCustomer.get(i).getEmail()%>");
                                    listCustomerJS[<%=i%>].push("<%=listCustomer.get(i).getCCCD()%>");
                                    listCustomerJS[<%=i%>].push("<%=listCustomer.get(i).getRelativeNumber()%>");
                                    listCustomerJS[<%=i%>].push("<%=listCustomer.get(i).getAddress()%>");
                                    listCustomerJS[<%=i%>].push("<%=listCustomer.get(i).getID()%>");
                                </script>
                                <button onclick="openFormEdit(listCustomerJS, <%=i%>)">Sửa thông tin</button>
                                <button><a style="text-decoration: none; color: black" onclick="openFormChangeRoom('<%=roomName%>', <%=listCustomer.get(i).getID()%>, <%=roomIDCurrent%>)" href="#">Chuyển phòng</a></button>
                                <button onclick="openFormView(listCustomerJS, <%=i%>)">Xem chi tiết</button>
                                <button><a style="text-decoration: none; color: black" onclick="deleteFunction(<%=listCustomer.get(i).getID()%>, <%=checkRepresentative%>)" href="#">Xóa</a></button>
                            </td>
                        </tr>
                        <%}%>   
                    </tbody>
                </table>
            </div>
    </body>
</html>
