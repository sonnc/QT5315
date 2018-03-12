<%-- 
    Document   : home
    Created on : Feb 26, 2018, 9:42:24 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hệ thống đăng ký thực tập trực tuyến - HUST</title>
        <%@include file="mains/head.jsp" %>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="mains/mainHeader.jsp" %>
            <%@include file="mains/banner.jsp" %>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <%                                for (int i = 0; i < 5; i++) {
                            %>
                            <div class="row" style="margin: 0px">
                                <div class="col-lg-2">
                                    <img src="pages/libs/img/clients/logo1.png" alt="" class="img-responsive" style="height: 100%; width: 100%" />
                                </div>
                                <div class="col-lg-10">
                                    <article style="margin-bottom: 0px; padding-bottom: 0px">
                                        <div class="post-image">
                                            <div class="post-heading">
                                                <h3><a href="#">Thông báo về việc đăng ký thực tập doanh nghiệp</a></h3>
                                            </div>
                                        </div>
                                        <p>
                                            Theo quy định, từ học kỳ 1 năm 2018, tất cả sinh viên khối ngành công nghệ thông tin phải đăng ký
                                            thực tập danh nghiệp online. Mọi thông tin thực tập, công ty, giảng viên sinh viên sẽ được quản lý bởi web....
                                        </p>
                                        <div class="bottom-article" >
                                            <ul class="meta-post">
                                                <li><i class="fa fa-calendar"></i><a href="#"> Mar 27, 2014</a></li>
                                                <li><i class="fa fa-user"></i><a href="#"> Admin</a></li>
                                                <li><i class="fa fa-comments"></i><a href="#">4 bình luận</a></li>
                                            </ul>
                                            <a href="#" class="readmore pull-right">Xem chi tiết <i class="fa fa-angle-right"></i></a>
                                        </div>
                                    </article>
                                </div>
                            </div>
                            <%
                                }
                            %>
                            <div id="pagination">
                                <span class="all">Page 1 of 3</span>
                                <span class="current">1</span>
                                <a href="#" class="inactive">2</a>
                                <a href="#" class="inactive">3</a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <%@include file="mains/RightSidebar.jsp" %>
                    </div>
                </div>
            </section>
        </div>   
        <%@include file="mains/footer.jsp" %>
        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
            <%@include file="mains/js.jsp" %>
    </body>

</html>
