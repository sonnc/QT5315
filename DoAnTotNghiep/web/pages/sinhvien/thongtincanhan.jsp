<%-- 
    Document   : thongtincanhan
    Created on : Mar 6, 2018, 11:22:10 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cập nhật thông tin cá nhân</title>
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
            <%@include file="../../mains/mainHeader.jsp" %>
            <%@include file="../../mains/banner.jsp" %>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <form role="form" id="formValidate"> 
                                <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                     padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                    <p style="margin: 0px">THÔNG TIN CÁ NHÂN</p>
                                </div>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <strong><p>Mã số sinh viên: </p></strong>
                                        <strong><p>Họ và tên: </p></strong>
                                        <strong><p>Lớp: </p></strong>
                                        <strong><p>Khóa: </p></strong>
                                        <strong><p>Khoa/ viện: </p></strong>
                                        <strong><p>Giới tính: </p></strong>
                                        <strong><p>Ngày sinh: </p></strong>
                                        <strong><p>Địa chỉ: </p></strong>
                                        <strong><p>Điện thoại: </p></strong>
                                        <strong><p>Email: </p></strong>
                                        <strong><p>Laptop: </p></strong>
                                    </div>
                                    <div class="col-lg-4">
                                        <p>Ảnh đại diện</p>
                                        <img id="output" style="height: 120px; width: 120px; border-radius: 100%; margin-bottom: 10px" />
                                    </div>
                                </div> 
                                <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                     padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                    <p style="margin: 0px">THÔNG TIN CHI TIẾT</p>
                                </div>
                                <div>
                                    <label>Ngoại ngữ</label>
                                    <p>thông tin ở đây</p>
                                </div>
                                <div>
                                    <label>Kỹ năng lập trình</label>
                                    <p>thông tin ở đây</p>
                                </div>
                                <div>
                                    <label>Kỹ năng mềm/ kỹ năng khác</label>
                                    <p>thông tin ở đây</p>
                                </div>
                                <div>
                                    <label>Mục tiêu</label>
                                    <p>thông tin ở đây</p>
                                </div>
                                <div>
                                    <label>Hoạt động</label>
                                    <p>thông tin ở đây</p>
                                </div>
                                <div>
                                    <label>Giải thưởng</label>
                                    <p>thông tin ở đây</p>
                                </div>
                                <div>
                                    <label>Sở thích</label>
                                    <p>thông tin ở đây</p>
                                </div>
                                <div>
                                    <label>Dự án</label>
                                    <p>thông tin ở đây</p>
                                </div>
                            </form>
                            <input class="btn btn-blue" value="Cập nhật thông tin"/>
                            <input class="btn btn-green" value="Xuất file CV"/>
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
