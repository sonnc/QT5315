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
        <title>QUẢN LÝ ĐỀ TÀI SINH VIÊN THỰC TẬP</title>
        <%@include file="../admin/head.jsp" %>
    </head>
    <%    if (session.getAttribute("getAllDTSVTTByAdmin") == null) {
    %>
    <s:action name="getAllDTSVTTByAdmin" executeResult="true"/>
    <%
        }
    %>
    <%
        if (session.getAttribute("getAllDTSVTTByAdmin") != null) {
            session.removeAttribute("getAllDTSVTTByAdmin");
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
                                QUẢN LÝ ĐỀ TÀI SINH VIÊN THỰC TẬP
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
                                            <td><strong> Mã SV </strong></td>
                                            <td><strong> Họ và tên </strong></td>
                                            <td><strong> Đề tài </strong></td>
                                            <td><strong> Công ty </strong></td>
                                            <td><strong> Người hướng dẫn </strong></td>
                                            <td><strong> So khớp </strong></td>
                                            <td><strong> Kỳ TT </strong></td>
                                            <td><strong> Trạng thái </strong></td>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <s:iterator value="lstSvDtCtNhds">
                                            <tr>
                                                <td><s:property value="mssv"/></td>
                                                <td><s:property value="hoTen"/></td>
                                                <td><a href=""><s:property value="deTai"/></a></td>
                                                <td><a href=""><s:property value="congTy"/></a></td>
                                                <td><a href=""><s:property value="nguoiHuongDan"/></a></td>
                                                <td><s:property value="soKhop"/>%</td>
                                                <td><s:property value="dotThucTap"/></td>
                                                <td><s:property value="trangThai"/></td>
<!--                                                <td><a href="deleteAcountByAdmin?id=<s:property value="mssv"/>" ui-toggle-class=""><i class="fa fa-times text-danger text"></i></a></td>-->
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
