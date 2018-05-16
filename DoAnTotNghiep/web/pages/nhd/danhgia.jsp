<%-- 
    Document   : danhgia
    Created on : May 15, 2018, 5:04:29 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đánh giá sinh viên</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <style>
            .error{
                color: red;
                text-orientation: initial;
            }
        </style>
        <%            if (session.getAttribute("getAllDSSVDanhGia") == null) {

        %>
        <s:action name="getAllDSSVDanhGia" executeResult="true"/>
        <%            }
        %>
    </head>
    <%
        if (session.getAttribute("getAllDSSVDanhGia") != null) {
            session.removeAttribute("getAllDSSVDanhGia");
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
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 25px">
                                <p style="margin: 0px">ĐÁNH GIÁ SINH VIÊN THỰC TẬP</p>
                            </div>
                            <input class="form-control" id="s" style="float: right; width: 50%; margin-bottom: 15px" placeholder="Tìm kiếm.." type="text">
                            <style>
                                td{padding: 5px}
                            </style>
                            <form role="form" id="formValidate" action="UploadFileDanhGia" method="post" enctype = "multipart/form-data"> 
                                <div class="row" style="padding: 15px"> 
                                    <div class="col-lg-12"  style="border: 2px solid #46b8da; padding: 10px">
                                        <p style="margin: 0px; color: red;margin-left: 10px; padding: 5px">GỬI FILE ĐÁNH GIÁ</p>
                                        <div class="col-lg-4">
                                            <select style="margin-bottom: 15px" name="mssv" class="form-control" required="true"> 
                                                <option value="">Chọn sinh viên</option>
                                                <s:iterator value="lstDanhSachSinhViens">
                                                    <option value="<s:property value="mssv" />"><s:property value="mssv"/> - <s:property value="hoTen" /></option>
                                                </s:iterator>
                                            </select>
                                        </div>
                                        <div class="col-lg-8" >
                                            <s:textfield  name="myFile" type="file" accept="file/*" required="required"/>  
                                            <button class="btn btn-info" style="height: 25px; margin: 5px; font-size: 12px; width: auto; float: right">Đánh giá</button>
                                        </div>
                                    </div>
                                </div>
                            </form> 
                            <div class="row">
                                <div class="col-lg-8">
                                    <p>DANH SÁCH SINH VIÊN</p>
                                    <table border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                        <tr style="font-size: 13px; text-align: center">
                                            <td><strong> Mã SV </strong></td>
                                            <td><strong> Họ và tên </strong></td>
                                            <td><strong> Ngày bắt đầu </strong></td>
                                            <td><strong> Ngày kết thúc </strong></td>
                                            <td><strong> Trạng thái </strong></td>
                                        </tr>
                                        <s:iterator value="lstDanhSachSinhViens">
                                            <tr style="font-size: 13px;">
                                                <td><s:property value="mssv" /></td>
                                                <td><s:property value="hoTen" /></td>
                                                <td><s:property value="startDate" /></td>
                                                <td><s:property value="endDate" /></td>
                                                <td><s:property value="trangThai" /></td>
                                            </tr>
                                        </s:iterator>
                                    </table>
                                </div>
                                <div class="col-lg-4">
                                    <p>D/S ĐÃ GỬI ĐÁNH GIÁ</p>
                                    <table border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                        <tr style="font-size: 13px; text-align: center">
                                            <td><strong> Mã SV </strong></td>
                                            <td><strong> Họ và tên </strong></td>
                                        </tr>
                                        <s:iterator value="lstDSSVDanhGia">
                                            <tr style="font-size: 13px;">
                                                <td><s:property value="mssv" /></td>
                                                <td><s:property value="hoTen" /></td>
                                            </tr>
                                        </s:iterator>
                                    </table>
                                </div>
                            </div>

                            <div id="pagination">
                                <span class="all">Page 1 of 3</span>
                                <span class="current">1</span>
                                <a href="#" class="inactive">2</a>
                                <a href="#" class="inactive">3</a>
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
