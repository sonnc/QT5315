<%-- 
    Document   : detaidangky
    Created on : Mar 13, 2018, 3:09:10 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <%@include file="../../mains/head.jsp" %>
    <body>
        <div id="wrapper">
            <%@include file="../../mains/mainHeader.jsp" %>
            <%@include file="../../mains/banner.jsp" %>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <p>THÔNG TIN ĐỂ TÀI ĐĂNG KÝ</p>
<!--                            vòng lặp bắt đầu từ đây-->
                            <div class="row" style="margin: 0px">
                                <div class="col-lg-2">
                                    <img src="pages/libs/img/index.png" alt="" class="img-responsive" style="height: 100%; width: 100%" />
                                </div>
                                <div class="col-lg-9">
                                    <article style="margin-bottom: 0px; padding-bottom: 0px">
                                        <div class="post-image" style="margin: 0px">
                                            <div class="post-heading">
                                                <p style="margin: 0;"><a href="#"><strong>IoT - hệ thống điều khiển nhà thông minh thế hệ mới</strong></a></p>
                                            </div>
                                        </div>
                                        <p style="margin: 0;"><strong>Nội dung:</strong> Ngày 06/02/2018, Hội đồng Trường tổ chức họp phiên thứ 6, nhiệm kỳ 2015-2020 tại Trường ĐHBK Hà Nội với sự tham gia của 15/19 thành viên dưới sự chủ trì của PGS Lê Minh Thắng - Chủ tịch Hội đồng Trường.</p>
                                        <p style="margin: 0;"><strong>Yêu cầu:</strong> Ngày 06/02/2018, Hội đồng Trường tổ chức họp phiên thứ 6, nhiệm kỳ 2015-2020 tại Trường ĐHBK Hà Nội với sự tham gia của 15/19 thành viên dưới sự chủ trì của PGS Lê Minh Thắng - Chủ tịch Hội đồng Trường.</p>
                                        <div >
                                            <ul class="meta-post">
                                                <li><i class="fa fa-user"></i><a href="#"> Admin</a></li>
                                                <li><i class="fa fa-comments"></i><a href="#">Ngày đăng: 2018-03-16</a></li>
                                                <li><i class="fa fa-comments"></i><a href="#">Hạn đăng ký: 2018-04-16</a></li>
                                            </ul>
                                            <p>Trạng thái: thành công/ từ chối</p>
                                            <a style="margin-bottom: 10px" href="#" class="readmore pull-right">Xem chi tiết <i class="fa fa-angle-right"></i></a>
                                        </div>
                                    </article>
                                </div>
                                <div class="col-lg-1">
                                    <p><strong>0/20</strong></p>
                                    <button class="btn btn-info">Đăng ký</button>
                                </div>
                            </div>
<!--Kết thúc vòng lặp-->
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

