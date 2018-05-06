<%-- 
    Document   : thongtingiangvien
    Created on : Mar 13, 2018, 9:28:50 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng ký thông tin</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <script src="./pages/libs/js/sonnc.js"></script>
        <style>
            .error{
                color: red;
                text-orientation: initial;
            }
        </style>
    </head>
    <body>
        <div id="wrapper">
            <header>
                <div class="navbar navbar-default navbar-static-top">
                    <div class="container">
                        <div class="row" style="margin: 0 0 0 0;">
                            <div class="col-lg-6">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>

                                </div>
                                <a class="navbar-brand" href="<%=request.getContextPath()%>/home.jsp"><img src="./pages/libs/img/logoEn.png" alt="" style="width: 100%; height: 100%"/></a>
                            </div>
                            <div class="col-lg-6">
                                <div class="navbar-collapse collapse ">
                                    <ul class="nav navbar-nav">
                                        <li class="dropdown active">
                                            <a href="logout">Đăng xuất</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <%@include file="../../mains/banner.jsp" %>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <form role="form" id="formValidate" action="SaveThongTinCaNhanGVHD" method="post" enctype = "multipart/form-data"> 
                                <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                     padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                    <p style="margin: 0px">THÔNG TIN CÁ NHÂN</p>
                                </div>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="gvhd.hoTen" placeholder="Họ và tên" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="gvhd.khoaVien" placeholder="Khoa viện" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="gvhd.boMon" placeholder="Bộ môn" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control"name="gvhd.email" readonly="true" value="<%=session.getAttribute("email")%>"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="gvhd.dienThoai" placeholder="Điện thoại" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="gvhd.diaChi" placeholder="Địa chỉ" required="true"/>
                                    </div>
                                    <div class="col-lg-4">
                                        <p>Ảnh đại diện</p>
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
                                    <style>
                                        textarea{
                                            resize: none;
                                        }
                                    </style>
                                    <div class="col-lg-12">
                                        <label>Công trình nghiên cứu</label>
                                        <textarea name="gvhd.congTrinhNghienCuu" required style="height: 100px; margin-bottom: 30px" class="form-control"></textarea>
                                        <div class="clear"></div>
                                        <label>Sách xuất bản</label>
                                        <textarea name="gvhd.sachXuatBan" required style="height: 100px; margin-bottom: 30px" class="form-control"></textarea>
                                        <label>Các môn giảng dạy</label>
                                        <textarea name="gvhd.monGiangDay" required style="height:100px; margin-bottom: 30px" class="form-control" ></textarea>
                                        <label>Nội dung khác</label>
                                        <textarea name="gvhd.khac" required style="height:100px; margin-bottom: 30px" class="form-control"></textarea>
                                    </div>
                                </div>
                                <input type="submit" class="btn btn-success" value="Đăng ký thông tin"/>
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

