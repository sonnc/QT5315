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
        <title>QUẢN LÝ GIẢNG VIÊN HƯỚNG DẪN</title>
        <%@include file="../admin/head.jsp" %>
    </head>
    <%    if (session.getAttribute("getAllGVHDByAdmin") == null) {
    %>
    <s:action name="getAllGVHDByAdmin" executeResult="true"/>
    <%
        }
    %>
    <%
        if (session.getAttribute("getAllGVHDByAdmin") != null) {
            session.removeAttribute("getAllGVHDByAdmin");
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
                                QUẢN LÝ GIẢNG VIÊN HƯỚNG DẪN
                            </div>
                            <div class="row w3-res-tb">
                                <div class="col-sm-9 m-b-xs">    
                                    <form class="form-inline" role="form" action="addLoginGVHDbyAdmin" method="post">
                                        <div class="form-group">
                                            <label style="color: #999">Email: </label>
                                            <input name="email" class="form-control" type="email">
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
                                            <th>HỌ TÊN</th>
                                            <th>ĐỊA CHỈ</th>
                                            <th>EMAIL</th>
                                            <th>ĐIỆN THOẠI</th>
                                            <th>KHOA VIỆN</th>
                                            <th>BỘ MÔN</th>
                                            <th style="width:50px;"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <s:iterator value="lstGiangVienHuongDans">
                                        <tr>
                                            <td><s:property value="hoTen"/></td>
                                            <td><s:property value="diaChi"/></td>
                                            <td><s:property value="email"/></td>
                                            <td><s:property value="dienThoai"/></td>
                                            <td><s:property value="khoaVien"/></td>
                                            <td><s:property value="boMon"/></td>
                                            <td>
                                                <a href="deleteAcountByAdmin?id=<s:property value="mssv"/>" ui-toggle-class=""><i class="fa fa-times text-danger text"></i></a>
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
