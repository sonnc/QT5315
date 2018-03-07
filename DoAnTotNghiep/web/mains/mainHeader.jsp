<%-- 
    Document   : mainHeader
    Created on : Mar 6, 2018, 11:10:13 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<div>
<%                session.setAttribute("email", "sinhVien");
    if (session.getAttribute("email").equals("sinhVien")) {
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