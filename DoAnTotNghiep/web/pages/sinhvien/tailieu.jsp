<%-- 
    Document   : tailieu
    Created on : Mar 19, 2018, 11:04:42 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../mains/head.jsp" %>
        <title>Tài liệu</title>
        <%      
            if (session.getAttribute("getTaiLieuSinhVien") == null) {
        %>
        <s:action name="getTaiLieuSinhVien" executeResult="true"/>
        <%
            }
        %>
    </head>
    <%
        if (session.getAttribute("getTaiLieuSinhVien") != null) {
            session.removeAttribute("getTaiLieuSinhVien");
    %>
    <body>
        <div id="wrapper">
            <%@include file="../../mains/mainHeader.jsp" %>
            <%@include file="../../mains/banner.jsp" %>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                <p style="margin: 0px">QUẢN LÝ TÀI LIỆU</p>
                            </div>
                            <div class="alert alert-warning">
                                <form role="form" id="formValidate" action="UploadFileSinhVien" method="post" enctype = "multipart/form-data"> 
                                    <input  style="margin-bottom: 15px;" class="form-control" name="tenFile" placeholder="Tên tài liệu"/>
                                    <textarea style="margin-bottom: 15px; height: 100px" class="form-control" name="moTa" placeholder="Mô tả tài liệu"></textarea>
                                    <select style="margin-bottom: 15px" name="loaiFile" class="form-control" required="true"> 
                                        <option value="Null">Loại tài liệu</option>
                                        <option value="0">CV</option>
                                        <option value="1">Báo cáo quá trình</option>
                                        <option value="2">Báo cáo cuối kỳ</option>
                                        <option value="3">Báo cáo tuần</option>
                                        <option value="4">Tài liệu học tập</option>
                                        <option value="5">Tài liệu khác</option>
                                    </select>
                                    <div class="row">
                                        <div class="col-lg-8"> 
                                            <s:textfield  name="myFile" type="file" accept="file/*" onchange="loadFile(event)" required="required"/>
                                        </div>
                                        <div class="col-lg-4" >
                                            <button style="float: right;" class="btn btn-success">Đăng tài liệu</button>
                                        </div>
                                    </div>

                                </form>
                            </div>
                            <%-- up load file --%>
                            <div class="row" >
                                <div class="col-lg-6 " >
                                    <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                         padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                        <p style="margin: 0px">TÀI LIỆU CHUNG/ HỌC TẬP</p>
                                    </div>
                                    <div class="alert alert-success">
                                        <s:iterator value="lstSinhVienFileHT">
                                            <div class="row" style="margin-bottom: 0px">
                                                <div class="col-lg-9">
                                                    <p><s:property value="tenFile"/></p>
                                                </div>
                                                <div class="col-lg-3"> 
                                                    <a href="<s:property value="link"/>"><i class="glyphicon glyphicon-download-alt"></i></a>
                                                    <a href="deleteTaiLieuSinhVien?maTaiLieu=<s:property value="id"/>"><i class="glyphicon glyphicon-trash"></i></a>
                                                </div>
                                            </div>
                                        </s:iterator>
                                    </div>
                                </div>
                                <div class="col-lg-6 ">
                                    <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                         padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                        <p style="margin: 0px">TÀI LIỆU QUAN TRỌNG/ BÁO CÁO</p>
                                    </div>
                                    <div class="alert alert-danger">
                                        <s:iterator value="lstSinhVienFileBC">
                                            <div class="row" style="margin-bottom: 0px">
                                                <div class="col-lg-9">
                                                    <p><s:property value="tenFile"/></p>
                                                </div>
                                                <div class="col-lg-3"> 
                                                    <a href="<s:property value="link"/>"><i class="glyphicon glyphicon-download-alt"></i></a>
                                                    <a href="deleteTaiLieuSinhVien?maTaiLieu=<s:property value="id"/>"><i class="glyphicon glyphicon-trash"></i></a>
                                                </div>
                                            </div>
                                        </s:iterator>
                                    </div>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <%@include file="../../mains/RightSidebar.jsp" %>
                    </div>
                </div>
            </section>
        </div>   
        <%@include file="../../mains/footer.jsp" %>
        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
            <%@include file="../../mains/js.jsp" %>
    </body>
    <%        }
    %>
</html>