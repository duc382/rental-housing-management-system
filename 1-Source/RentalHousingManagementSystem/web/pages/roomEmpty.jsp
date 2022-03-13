<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : roomEmpty
    Created on : Mar 13, 2022, 8:31:38 PM
    Author     : coder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh Sách Phòng Trống</title>
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
        <link rel="stylesheet" href="css/StyleRoomEmpty.css">
        <script>
            $(document).ready(function () {
                $('#dtTableRoom').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
        </script>
    </head>
    <body>
        <%@include file="sidebarAndHeaderGuest.jsp"%>
        <h1 style="text-align: center">Danh Sách Phòng Trống</h1>
        <div>
            <div class="container mt-3" style="max-width: 76%; margin-left: 12%; margin-right: 12%;">
                <table id="dtTableRoom" class="table table-hover table-striped table-bordered table-sm">
                    <thead>
                        <tr>
                            <th class="th-sm">Tên Phòng</th>
                            <th class="th-sm" style="text-align: center">Giá</th>
                            <th class="th-sm" style="text-align: center">Diện Tích</th>
                            <th class="th-sm" style="text-align: center">Số Lượng Tối Đa</th>
                            <th>Đồ Dùng Trong Phòng</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="R" items="${listRoom}">
                    
                        <tr>
                            <td>${R.name}</td>
                            <td class="th-sm" style="text-align: center">${R.price}</td>
                            <td class="th-sm" style="text-align: center">${R.area}</td>
                            <td class="th-sm" style="text-align: center">${R.quantityMax}</td>
                            <td>${R.utensil}</td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
