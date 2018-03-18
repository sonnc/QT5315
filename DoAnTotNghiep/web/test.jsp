<%-- 
    Document   : test
    Created on : Mar 17, 2018, 2:06:45 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <s:action name="test" executeResult="true">
            <s:iterator value="list">
                <s:property value="noiDung"/>
                <s:property value="congTy.tenCongTy"/>
                <s:property value="giangVienHuongDan.hoTen"/>
            </s:iterator>
        </s:action>
    </body>
</html>
