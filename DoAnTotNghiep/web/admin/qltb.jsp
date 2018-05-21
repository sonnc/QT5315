<%-- 
    Document   : qltb
    Created on : May 19, 2018, 5:14:36 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>QUẢN LÝ THÔNG BÁO</title>
        <%@include file="../admin/head.jsp" %>
    </head>
    <%    if (session.getAttribute("getAllThongBaoByAdmin") == null) {
    %>
    <s:action name="getAllThongBaoByAdmin" executeResult="true"/>
    <%
        }
    %>
    <%
        if (session.getAttribute("getAllThongBaoByAdmin") != null) {
            session.removeAttribute("getAllThongBaoByAdmin");
    %>
    <body>
        <section id="container">

            <%@include file="../admin/nabar.jsp" %>
            <%@include file="../admin/leftBar.jsp" %>


            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <div class="table-agile-info">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                QUẢN LÝ THÔNG BÁO
                            </div>
                            <div class="row w3-res-tb">
                                <div class="col-sm-9 m-b-xs">    
                                    <a href="<%=session.getAttribute("httpURL")%>admin/dtb.jsp"><button class="btn btn-info">ĐĂNG THÔNG BÁO</button></a>
                                </div>
                                <div class="col-sm-3">
                                    <div class="input-group">
                                        <input type="text" class="input-sm form-control" placeholder="Search" style="color: black">
                                        <span class="input-group-btn">
                                            <button class="btn btn-sm btn-default" type="button">Tìm kiếm</button>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table class="table table-striped b-t b-light">
                                    <thead>
                                        <tr>
                                            <td><strong> ID </strong></td>
                                            <td><strong> Tiêu đề </strong></td>
                                            <!--                                            <td><strong> Nội dung </strong></td>-->
                                            <td><strong> Người đăng </strong></td>
                                            <td><strong> Ngày tháng </strong></td>
                                            <td><strong> Loại TB </strong></td>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <s:iterator value="lstThongBaos">
                                            <tr>
                                                <td><s:property value="id" /></td>
                                                <td><s:property value="tieuDe" /></td>
<!--                                                <td><s:property value="noiDung" /></td>-->
                                                <td><s:property value="nguoiDang" /></td>
                                                <td><s:property value="ngayThang" /></td>
                                                <td><s:property value="type" /></td>
                                                <td>
                                                    <a href="viewThongBao?id=<s:property value="id"/>" ui-toggle-class=""><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                                </td>
                                                <td>
                                                    <a href="deleteThongBao?id=<s:property value="id"/>" ui-toggle-class=""><i class="fa fa-times text-danger text"></i></a>
                                                </td>
                                            </tr>
                                        </s:iterator>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </section>
                <%@include file="../admin/footer.jsp" %>
            </section>
        </section>
        <%@include file="../admin/js.jsp" %>
    </body>
    <%}%>
</html>
