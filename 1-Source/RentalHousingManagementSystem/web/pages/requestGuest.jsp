<%-- 
    Document   : requestGuest
    Created on : Mar 13, 2022, 3:08:24 PM
    Author     : coder
--%>

<%@page import="model.Request"%>
<%@page import="java.util.ArrayList"%>
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
        <link rel="stylesheet" href="css/StyleRequestGuest.css">
        <script src="js/JSRequestGuest.js"></script>
        <script>
            $(document).ready(function () {
                $('#dtTableAccount').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
            const deleteFunction = (id, status) => {
                if (status == 1) {
                    alert("Không thể xóa yê cầu đã được xử lý");
                } else {
                    if (confirm("Bấm ok để xóa yêu cầu đã chọn, cancel để hủy") == true) {
                        window.location.href = "DeleteRequestGuest?id=" + id;
                    }
                }

            }
        </script>
    </head>
    <body>
        <%@include file="sidebarAndHeaderGuest.jsp"%>
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
        <!--form thêm yêu cầu-->
        <div class="form-popup" id="myFormAdd">
            <form class="form-container" name="myFormAdd" action="AddRequestGuest" method="post"  >
                <h1 style="text-align: center;">Tạo Yêu Cầu</h1>
                <label><b>Nội Dung</b></label>
                <br>
                <textarea style="height: 150px;width: 100%;" name="content" required=""></textarea>
                <input type="submit" class="btn" value="Thêm"/>
                <button type="button" class="btn cancel" onclick="closeFormAdd()">Hủy</button>
            </form>
        </div>
        <!--form sửa yêu cầu-->
        <div class="form-popup" id="myFormEdit">
            <form class="form-container" name="myFormEdit" action="EditRequestGuest" method="post"  >
                <h1 style="text-align: center;">Sửa Yêu Cầu</h1>
                <input style="display: none" id="id" name="id">
                <label><b>Nội Dung</b></label>
                <br>
                <textarea style="height: 150px;width: 100%;" id="content" name="content" required=""></textarea>
                <input type="submit" class="btn" value="Chỉnh Sửa"/>
                <button type="button" class="btn cancel" onclick="closeFormEdit()">Hủy</button>
            </form>
        </div>
        <div>
            <div class="container mt-3" style="max-width: 76%; margin-left: 12%; margin-right: 12%;">
                <div style="margin-bottom: 3px">
                    <button class="open-button" onclick="openFormAdd()">Tạo Yêu Cầu</button>    
                </div>
                <table id="dtTableAccount" class="table table-hover table-striped table-bordered table-sm">
                    <thead>
                        <tr>
                            <th class="th-sm" style="text-align: center">Nội Dung</th>
                            <th class="th-sm" style="text-align: center">Trạng Thái</th>
                            <th class="th-sm" style="text-align: center">Ghi Chú</th>
                            <th class="th-sm" style="text-align: center">Chức Năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="R" items="${listRequest}" varStatus="loop">
                            <tr>
                                <td style="text-align: center">${R.content}</td>
                                <td style="text-align: center">${R.status == 1?"Đã xử lý":"Chưa xử lý"}</td>
                                <td style="text-align: center">${R.note}</td>
                                <td style="text-align: center">
                                    <button onclick="openFormEdit(${R.id}, '${R.content}',  ${loop.index}, listStatusRequest)">Sửa yêu cầu</button>
                                    <a style="text-decoration: none; color: black" onclick="deleteFunction(${R.id}, ${R.status})" href="#"><button>Xóa</button></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
