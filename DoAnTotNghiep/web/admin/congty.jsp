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
        <title>QUẢN LÝ CÔNG TY</title>
        <%@include file="../admin/head.jsp" %>
    </head>
    <%    if (session.getAttribute("getAllCongTyByAdmin") == null) {
    %>
    <s:action name="getAllCongTyByAdmin" executeResult="true"/>
    <%
        }
    %>
    <%
        if (session.getAttribute("getAllCongTyByAdmin") != null) {
            session.removeAttribute("getAllCongTyByAdmin");
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
                                QUẢN LÝ CÔNG TY
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
                                            <th>LOGO</th>
                                            <th>TÊN CÔNG TY</th>
                                            <th>EMAIL</th>
                                            <th>ĐỊA CHỈ</th>
                                            <th>ĐIỆN THOẠI</th>
                                            <th>WEBSITE</th>
                                            <th>NGƯỜI ĐẠI DIỆN</th>
                                            <th>CHỨC VỤ</th>
                                            <th style="width:50px;"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <s:iterator value="lstCongTy">
                                            <tr>
                                                <td> <img src="<%= session.getAttribute("httpURL")%><s:property value="logo"/>" style="height: 50px; width: 50px"/></td>
                                                <td><s:property value="tenCongTy"/></td>
                                                <td><s:property value="email"/></td>
                                                <td><s:property value="diaChi"/></td>
                                                <td><s:property value="dienThoai"/></td>
                                                <td><s:property value="website"/></td>
                                                <td><s:property value="daiDien"/></td>
                                                <td><s:property value="chucVuDD"/></td>
                                                <td>
                                                    <a href="deleteCongTyByAdmin?maCongTy=<s:property value="maCongTy"/>" ui-toggle-class=""><i class="fa fa-times text-danger text"></i></a>
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
