<%-- 
    Document   : diemthi
    Created on : Mar 6, 2018, 11:21:04 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Điểm thi</title>
        <%@include file="../../mains/head.jsp" %>
    </head>
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
                                <p style="margin: 0px">THÔNG TIN SINH VIÊN</p>
                            </div>
                            <p>Họ và tên: Nguyễn Công Sơn</p>
                            <p>Lớp: INPG12</p>
                            <p>Khoa/ viên: Viện công nghệ thông tin và truyền  thông</p>
                            <p>Điện thoại: 0898595657</p>
                            <p>Email: son.nguyencong.hust@gmail.com</p>
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                <p style="margin: 0px">ĐIỂM THI</p>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <strong>
                                        <p>Điểm phản hồi: <strong style="color: red">10</strong></p>
                                        <p>Điểm BC Quá Trình: <strong style="color: red">10</strong></p>
                                        <p>Điểm Quá Trình: <strong style="color: red">10</strong></p>
                                        <p>Điểm Cuối kỳ: <strong style="color: red">10</strong></p>
                                        <p>Tổng trung bình: <strong style="color: red">10</strong></p>
                                        <p>Xếp loại: <strong style="color: red">A+</strong></p>
                                    </strong>
                                </div>
                                <div class="col-lg-6">
                                    <p style="color: green">Hệ số điểm: </p> 
                                    <ul style="color: green">
                                        <li>Phản hồi: 0.5</li>
                                        <li>Báo cáo quá trình: 0.5</li>
                                        <li>Điểm quá trình: 0.3</li>
                                        <li>Điểm cuối kỳ: 0.7</li>
                                    </ul>
                                </div>
                            </div>

                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                <p style="margin: 0px">THỰC TẬP</p>
                            </div>
                            <div>
                                <p>Công ty cồ phần bkav</p>
                                <p>Đề tài: IoT - Phát triển hệ thống nhà thông minh tại Việt Nam</p>
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
</html>
