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
                                <s:iterator value="lstSinhVienDiemThi">
                                    <div style="padding: 20px">
                                        <form action="editPointByAdmin" method="post">
                                            <p>Mã số sinh viên: <input name="mssv" style="border: 0px" readonly="true" value="<s:property value="mssv" />"/></p>
                                            <p>Họ và tên: <s:property value="hoTen" /></p>
                                            <p>Lớp: <s:property value="lop" /></p>
                                            <p>Khóa: <s:property value="khoa" /></p>
                                            <p>Kỳ thực tập: <input name="dotThucTap" style="border: 0px" readonly="true" value="<s:property value="dotThucTap" />"/></p>
                                            <br/>
                                            <br/>
                                            <p>CHỈNH SỬA ĐIỂM THI CHO SINH VIÊN</p>
                                            <div class="row" style="margin-top: 25px">
                                                <div class="col-lg-3">
                                                    <label style="margin-bottom: 5px">Điểm phản hồi</label>
                                                    <input name="diemPhanHoi" readonly="true" class="form-control" value="<s:property value="diemPhanHoi" />"/>
                                                </div>
                                                <div class="col-lg-3">
                                                    <label style="margin-bottom: 5px">Điểm quá trình</label>
                                                    <input name="diemQuaTrinh" readonly="true" class="form-control" value="<s:property value="diemQuaTrinh" />"/>
                                                </div>
                                                <div class="col-lg-3">
                                                    <label style="margin-bottom: 5px">Điểm BCQT</label>
                                                    <input name="diemBCQT" class="form-control" value="<s:property value="diemBCQT" />"/>
                                                </div>
                                                <div class="col-lg-3">
                                                    <label style="margin-bottom: 5px">Điểm BCCK</label>
                                                    <input name="diemBCCK" class="form-control" value="<s:property value="diemBCCK" />"/>
                                                </div>
                                            </div>
                                                <div style="margin-top: 30px; text-align: center">
                                                <button class="btn btn-info">CHỈNH SỬA ĐIỂM</button>
                                            </div>

                                        </form>
                                    </div>
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
