<%-- 
    Document   : 500
    Created on : Mar 19, 2018, 2:10:19 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lỗi 500</title>
    </head>
    <body>
        <p>Lỗi xử lý từ hệ thống. Xin vui lòng đăng nhập và thử lại.</p>
        <p>Trở về trang <a href="<%=session.getAttribute("httpURL")%>login.jsp">đăng nhập</a></p>
    </body>
</html>
