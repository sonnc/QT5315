<%-- 
    Document   : mainHeader
    Created on : Mar 6, 2018, 11:10:13 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<div>
    <%
        if (Integer.parseInt(session.getAttribute("rule").toString()) == 0) {
    %>
    <%@include file="/mains/sinhVienHeader.jsp" %>
    <%
    } else {
    %>
    <%@include  file="/mains/header.jsp"%>
    <%
        }
    %>
</div>