<%-- 
    Document   : dangkycongty
    Created on : Mar 13, 2018, 9:28:31 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký thông tin công ty</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <style>
            .error{
                color: red;
                text-orientation: initial;
            }
        </style>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="../../mains/mainHeader.jsp" %>
            <%@include file="../../mains/banner.jsp" %>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <form role="form" action="saveCongtyAndDaidien" id="formValidate" method="post" enctype = "multipart/form-data"> 
                                <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                     padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                    <p style="margin: 0px">ĐĂNG KÝ ĐẠI DIỆN CÔNG TY</p>
                                </div>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="ddct.hoTen" placeholder="Họ tên " required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="ddct.chucVu" placeholder="Chức vụ" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="ddct.dienThoai" placeholder="Điện thoại" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" value="<%=session.getAttribute("email")%>" name="ddct.email" placeholder="Email" required="true" readonly="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="ddct.diaChi" placeholder="Địa chỉ" required="true"/>
                                    </div>
                                    <div class="col-lg-4">
                                        <p>Ảnh đại diện</p>
                                        <img id="outputDDCT" style="height: 120px; width: 120px; border-radius: 100%; margin-bottom: 10px" />
                                        <s:textfield  name="myFileDDCT" type="file" accept="image/*" onchange="loadFileDDCT(event)" required="required"/>
                                        <script>
                                            var loadFileDDCT = function (event) {
                                                var reader = new FileReader();
                                                reader.onload = function () {
                                                    var output = document.getElementById('outputDDCT');
                                                    output.src = reader.result;
                                                };
                                                reader.readAsDataURL(event.target.files[0]);
                                            };
                                        </script>
                                    </div>
                                </div>

                                <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                     padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                    <p style="margin: 0px">ĐĂNG KÝ THÔNG TIN CÔNG TY</p>
                                </div>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="ct.tenCongTy" placeholder="Tên công ty" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="ct.diaChi" placeholder="Địa chỉ" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="ct.dienThoai" placeholder="Điện thoại" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="ct.email" placeholder="Email" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="ct.website" placeholder="Website" required="true"/>
                                    </div>
                                    <div class="col-lg-4">
                                        <p>Logo công ty</p>
                                        <img id="output" style="height: 120px; width: 120px; border-radius: 100%; margin-bottom: 10px" />
                                        <s:textfield  name="myFile" type="file" accept="image/*" onchange="loadFile(event)" required="required"/>
                                        <script>
                                            var loadFile = function (event) {
                                                var reader = new FileReader();
                                                reader.onload = function () {
                                                    var output = document.getElementById('output');
                                                    output.src = reader.result;
                                                };
                                                reader.readAsDataURL(event.target.files[0]);
                                            };
                                        </script>
                                    </div>
                                </div> 

                                <div class="row">
                                    <div class="col-lg-12">
                                        <label>Mô tả công ty</label>
                                        <textarea name="ct.moTa" required style="height: 200px; margin-bottom: 30px" class="form-control" placeholder="Hãy mô tả công ty của bạn,....."></textarea>
                                        <label>Lĩnh vực hoạt động</label>
                                        <textarea name="ct.linhVucHoatDong" required style="height: 200px; margin-bottom: 30px" class="form-control" placeholder="Các lĩnh vực hoạt động của công ty bạn là gì,...."></textarea>
                                    </div>
                                </div>
                                <div><input type="submit" value="ĐĂNG KÝ" class="btn btn-primary btn-block btn-lg"></div>
                            </form>
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
</html>

