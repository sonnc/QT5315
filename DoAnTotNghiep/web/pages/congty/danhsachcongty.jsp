<%-- 
    Document   : danhsachcongty
    Created on : Mar 19, 2018, 11:02:48 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách công ty</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <style>
            .error{
                color: red;
                text-orientation: initial;
            }
        </style>
        <%            if (session.getAttribute("getAllCongTy") == null) {
        %>
        <s:action name="getAllCongTy" executeResult="true"/>
        <%
            }
        %>
    </head>
    <%
        if (session.getAttribute("getAllCongTy") != null) {
            session.removeAttribute("getAllCongTy");
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
                                <p style="margin: 0px">DANH SÁCH CÔNG TY</p>
                            </div>
                            <%                                for (int i = 0; i < 5; i++) {
                            %>
                            <div class="row" style="margin: 0px">
                                <div class="col-lg-2">
                                    <img src="pages/libs/img/index.png" alt="" class="img-responsive" style="height: 100%; width: 100%" />
                                </div>
                                <div class="col-lg-10">
                                    <article style="margin-bottom: 0px; padding-bottom: 0px">
                                        <div class="post-image" style="margin: 0px">
                                            <div class="post-heading">
                                                <p style="margin: 0;"><a href="#"><strong>CÔNG TY HỆ THỐNG THÔNG TIN FPT</strong></a></p>
                                            </div>
                                        </div>
                                        <p style="margin: 0;"><strong>Nội dung:</strong> Ngày 06/02/2018, Hội đồng Trường tổ chức họp phiên thứ 6, nhiệm kỳ 2015-2020 tại Trường ĐHBK Hà Nội với sự tham gia của 15/19 thành viên dưới sự chủ trì của PGS Lê Minh Thắng - Chủ tịch Hội đồng Trường.</p>
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
                        <%@include file="../../mains/RightSidebar.jsp" %>
                    </div>
                </div>
            </section>
        </div>   
        <%@include file="../../mains/footer.jsp" %>
        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
            <%@include file="../../mains/js.jsp" %>
    </body>
    <%
    }
    %>
</html>

