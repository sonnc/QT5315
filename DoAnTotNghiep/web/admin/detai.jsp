<%-- 
    Document   : sinhvien
    Created on : May 19, 2018, 9:16:46 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>QUẢN LÝ ĐỀ TÀI</title>
        <%@include file="../admin/head.jsp" %>
    </head>
    <%    if (session.getAttribute("getAllDeTaiByAdmin") == null) {
    %>
    <s:action name="getAllDeTaiByAdmin" executeResult="true"/>
    <%
        }
    %>
    <%
        if (session.getAttribute("getAllDeTaiByAdmin") != null) {
            session.removeAttribute("getAllDeTaiByAdmin");
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
                                QUẢN LÝ ĐỀ TÀI
                            </div>
                            <div class="row w3-res-tb">
                                <div class="col-sm-9 m-b-xs">    

                                </div>
                                <div class="col-sm-3">
                                    <div class="input-group">
                                        <input type="text" class="input-sm form-control" placeholder="Search">
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
                                            <th>MÃ DT</th>
                                            <th>TÊN ĐỀ TÀI</th>
                                            <th>NGƯỜI ĐĂNG</th>
                                            <th>SỐ LƯỢNG</th>
                                            <th>NGÀY ĐĂNG</th>
                                            <th>HẠN ĐĂNG KÝ</th>
                                            <th style="width:50px;"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <s:iterator value="lstDeTais">
                                            <tr>
                                                <td><s:property value="maDeTai"/></td>
                                                <td><s:property value="tenDeTai"/></td>
                                                <td><s:property value="nguoiDang"/></td>
                                                <td><s:property value="soLuong"/></td>
                                                <td><s:property value="ngayDang"/></td>
                                                <td><s:property value="hanDangKy"/></td>
                                                <td>
                                                    <a href="deleteDeTaiByAdmin?id=<s:property value="maDeTai"/>" ui-toggle-class=""><i class="fa fa-times text-danger text"></i></a>
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
