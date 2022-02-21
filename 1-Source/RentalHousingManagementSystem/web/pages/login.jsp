<%-- 
    Document   : login.jsp
    Created on : Feb 21, 2022, 11:02:19 PM
    Author     : coder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/StyleLogin.css">
    </head>
    <body>
        <form method="post" action="Login">
            <div class="login-page">
                <div class="form">
                    <div class="login-form">
                        <input type="text" name="username"/>
                        <input type="password" name="password"/>
                        <input class="buttonLogin" type="submit" value="Đăng Nhập">
                    </div>
                    <%
                    boolean error = false;
                    if (request.getAttribute("error") != null){
                        error = Boolean.parseBoolean(request.getAttribute("error").toString());
                    }
                    if (error){%>
                    Sai tên đăng nhập hoặc mật khẩu!
                    <%}
                %>
                </div> 
                
            </div>
        </form>
    </body>
</html>
