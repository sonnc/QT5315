<%-- 
    Document   : qlf
    Created on : May 22, 2018, 11:22:18 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>QUẢN LÝ FILE</title>
        <%@include file="../admin/head.jsp" %>
    </head>
    <%    if (session.getAttribute("getAllFileByAdmin") == null) {
    %>
    <s:action name="getAllFileByAdmin" executeResult="true"/>
    <%
        }
    %>
    <%
        if (session.getAttribute("getAllFileByAdmin") != null) {
            session.removeAttribute("getAllFileByAdmin");
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
                                QUẢN LÝ FILE
                            </div>

                            <form style="border: 1px solid #002a80; margin-bottom: 10px; margin-top: 10px; background-color: #ffe699" role="form" id="formValidate" action="UploadFileByAdmin" method="post" enctype = "multipart/form-data"> 
                                <div class="row w3-res-tb">
                                    <div class="col-sm-3 m-b-xs"> 
                                        <label>Tên tài liệu</label>
                                        <input  style="margin-bottom: 15px;" class="form-control" name="tenFile" placeholder="Tên tài liệu"/>
                                    </div>
                                    <div class="col-sm-4 m-b-xs"> 
                                        <label>Mô tả</label>
                                        <input style="margin-bottom: 15px; " class="form-control" name="noiDung" placeholder="Mô tả tài liệu"/>
                                    </div>
                                    <div class="col-sm-3 m-b-xs"> 
                                        <s:textfield name="myFile" type="file" accept="file/*" required="required" />
                                    </div>
                                    <div class="col-sm-2 m-b-xs"> 
                                        <button style="float: right;" class="btn btn-success">Đăng tài liệu</button>
                                    </div>
                                </div>
                            </form>
                            <div class="row w3-res-tb">
                                <div class="col-sm-9 m-b-xs"> 
                                </div>
                                <div class="col-sm-3">
                                    <div class="input-group">
                                        <input type="text" class="input-sm form-control" >
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
                                            <td><strong> Mã file </strong></td>
                                            <td><strong> Tên file </strong></td>
                                            <td><strong> Mô tả </strong></td>
                                            <td><strong> Ngày đăng </strong></td>
                                            <td><strong> Link </strong></td>
                                            <td><strong> Người đăng </strong></td>
                                            <td><strong> </strong></td>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <s:iterator value="lstFileAlls">
                                            <tr>
                                                <td><s:property value="id" /></td>
                                                <td><s:property value="tenFile" /></td>
                                                <td><s:property value="noiDung" /></td>
                                                <td><s:property value="ngayThang" /></td>
                                                <td><a href="<s:property value="link" />"><s:property value="link" /></a></td>
                                                <td><s:property value="email" /></td>
                                                <td><a href="deleteFileByAdmin?id=<s:property value="id"/>" ui-toggle-class=""><i class="fa fa-times text-danger text"></i></a></td>
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
