<%-- 
    Document   : qldt
    Created on : May 19, 2018, 4:51:58 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>QUẢN LÝ ĐIỂM THI</title>
        <%@include file="../admin/head.jsp" %>
    </head>
    <%    if (session.getAttribute("getAllDiemThiSVTTByAdmin") == null) {
    %>
    <s:action name="getAllDiemThiSVTTByAdmin" executeResult="true"/>
    <%
        }
    %>
    <%
        if (session.getAttribute("getAllDiemThiSVTTByAdmin") != null) {
            session.removeAttribute("getAllDiemThiSVTTByAdmin");
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
                                QUẢN LÝ ĐIỂM THI
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
                                            <td><strong> Lớp </strong></td>
                                            <td><strong> Khóa </strong></td>
                                            <td><strong> Kỳ TT </strong></td>
                                            <td><strong> ĐPH </strong></td>
                                            <td><strong> BCQT </strong></td>
                                            <td><strong> ĐQT </strong></td>
                                            <td><strong> ĐCK </strong></td>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <s:iterator value="lstSinhVienDiemThi">
                                            <tr>
                                                <td><input name="mssv" value="<s:property value="mssv" />" readonly="true" style="width: 70px;margin-right: -15px;border: none;background: white;"/></td>
                                                <td><s:property value="hoTen" /></td>
                                                <td><s:property value="lop" /></td>
                                                <td><s:property value="khoa" /></td>
                                                <td><s:property value="dotThucTap" /></td>
                                                <td><s:property value="diemPhanHoi" /></td>
                                                <td><s:property value="diemBCQT" /></td>
                                                <td><s:property value="diemQuaTrinh" /></td>
                                                <td><s:property value="diemBCCK" /></td>
                                                <td>
                                                    <a href="editPoint?mssv=<s:property value="mssv"/>&dotThucTap=<s:property value="dotThucTap" />" ui-toggle-class=""><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                                </td>
                                                <td>
                                                    <a href="deletePoint?mssv=<s:property value="mssv"/>&dotThucTap=<s:property value="dotThucTap" />" ui-toggle-class=""><i class="fa fa-times text-danger text"></i></a>
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
