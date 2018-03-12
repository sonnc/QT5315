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
                            <div class="row">
                                <div class="col-lg-5">
                                    <h4> Thông tin sinh viên</h4>
                                    <p>Họ và tên: Nguyễn Công Sơn</p>
                                    <p>Lớp: INPG12</p>
                                    <p>Khoa/ viên: Viện công nghệ thông tin và truyền  thông</p>
                                    <p>Điện thoại: 0898595657</p>
                                    <p>Email: son.nguyencong.hust@gmail.com</p>
                                </div>
                                <div class="col-lg-7">
                                    <h4>Điểm thi</h4>
                                    <p>Điểm phản hồi</p>
                                    <p>Điểm BCQT</p>
                                    <p>Điểm BCCK</p>
                                    <p>Thực tập tại: Công ty BKAV</p>
                                    <p>Đề tài: phát triển IoT - Hệ thống nhà thông minh</p>
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
</html>
