<%-- 
    Document   : detailTB
    Created on : May 19, 2018, 5:14:36 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>THÔNG BÁO</title>
        <%@include file="../admin/head.jsp" %>
    </head>
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
                                CHI TIẾT THÔNG BÁO
                            </div>
                            <div class="row w3-res-tb">
                                <div class="col-sm-9 m-b-xs">    

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
                                <s:iterator value="lstThongBaos">
                                    <p>Mã thông báo: <s:property value="id" /></p>
                                    <p>Tiều đề: <s:property value="tieuDe" /></p>
                                    <p>Người đăng: <s:property value="nguoiDang" /></p>
                                    <p>Ngày đăng: <s:property value="ngayThang" /></p>
                                    <p>Loại thông báo: <s:property value="type" /></p>
                                    <p>Nội dung: <s:property value="noiDung" escapeHtml="false"/></p>
                                </s:iterator>
                            </div>
                        </div>
                    </div>
                </section>
                <%@include file="../admin/footer.jsp" %>
            </section>
        </section>
        <%@include file="../admin/js.jsp" %>
    </body>
</html>
