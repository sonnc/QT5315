<%-- 
    Document   : detai
    Created on : Mar 6, 2018, 11:21:33 PM
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
                            <%                                for (int i = 0; i < 5; i++) {
                            %>
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
                                                <li><i class="fa fa-calendar"></i><a href="#"> Mar 27, 2014</a></li>
                                                <li><i class="fa fa-user"></i><a href="#"> Admin</a></li>
                                                <li><i class="fa fa-comments"></i><a href="#">4 bình luận</a></li>
                                            </ul>
                                            <a style="margin-bottom: 10px" href="#" class="readmore pull-right">Xem chi tiết <i class="fa fa-angle-right"></i></a>
                                        </div>
                                    </article>
                                </div>
                                <div class="col-lg-1">
                                    <p><strong>0/20</strong></p>
                                    <button class="btn-add">Đăng ký</button>
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