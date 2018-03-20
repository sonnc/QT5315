<%-- 
    Document   : mainHeader
    Created on : Mar 6, 2018, 11:10:13 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<div>
    <!--
    sinh viên = 0
    đại diện công ty = 1
    giang viên hướng dẫn  = 2
    người hướng dẫn = 3
    admin = 4
    -->
    <%
        if (Integer.parseInt(session.getAttribute("rule").toString()) == 0) {
    %>
    <%@include file="/mains/sinhVienHeader.jsp" %>
    <%
    } else if (Integer.parseInt(session.getAttribute("rule").toString()) == 1) {
    %>
    <%@include  file="/mains/ddctHeader.jsp"%>
    <%
    } else if (Integer.parseInt(session.getAttribute("rule").toString()) == 2) {
    %>
    <%@include  file="/mains/gvhdHeader.jsp"%>
    <%
    } else if (Integer.parseInt(session.getAttribute("rule").toString()) == 3) {
    %>
    <%@include  file="/mains/nhdHeader.jsp"%>
    <%
        };
    %>
</div>