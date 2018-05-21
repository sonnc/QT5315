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
        <title>QUẢN LÝ SINH VIÊN</title>
        <%@include file="../admin/head.jsp" %>
    </head>
    <%    if (session.getAttribute("getAllSinhVienByAdmin") == null) {
    %>
    <s:action name="getAllSinhVienByAdmin" executeResult="true"/>
    <%
        }
    %>
    <%
        if (session.getAttribute("getAllSinhVienByAdmin") != null) {
            session.removeAttribute("getAllSinhVienByAdmin");
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
                                QUẢN LÝ SINH VIÊN
                            </div>
                            <div class="row w3-res-tb">
                                <div class="col-sm-9 m-b-xs">    
                                    <form class="form-inline" role="form" action="addLoginSVbyAdmin" method="post">
                                        <div class="form-group">
                                            <label style="color: #999">Mã số sinh viên: </label>
                                            <input name="mssv" class="form-control" type="number">
                                        </div>
                                        <button type="submit" class="btn btn-success">Thêm tài khoản</button>
                                    </form>
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
                                            <th>MSSV</th>
                                            <th>HỌ TÊN</th>
                                            <th>LỚP</th>
                                            <th>KHOA/ VIỆN</th>
                                            <th>EMAIL</th>
                                            <th style="width:50px;"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <s:iterator value="lstSinhVien">
                                        <tr>
                                            <td><s:property value="mssv"/></td>
                                            <td><s:property value="hoTen"/></td>
                                            <td><s:property value="lop"/></td>
                                            <td><s:property value="khoaVien"/></td>
                                            <td><s:property value="email"/></td>
                                            <td>
                                                <a href="deleteAcountSVByAdmin?id=<s:property value="mssv"/>" ui-toggle-class=""><i class="fa fa-times text-danger text"></i></a>
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
