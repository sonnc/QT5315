<%-- 
    Document   : duyetcongty
    Created on : Mar 13, 2018, 9:34:56 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đề tài công ty</title>
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
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 25px">
                                <p style="margin: 0px">DUYỆT ĐỀ TÀI CÔNG TY</p>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-lg-9">
                                        <a><button class="btn btn-info">All</button></a>
                                        <a><button class="btn btn-danger">Chưa duyệt</button></a>
                                        <a><button class="btn btn-primary">Đã duyệt</button></a>
                                    </div>
                                    <div class="col-lg-3">
                                        <input class="form-control" id="s" style="float: right; width: 100%; margin-bottom: 15px" placeholder="Tìm kiếm.." type="text">
                                    </div>
                                </div>
                            </div>
                            <style>
                                td{padding: 5px; font-size: 13px}
                            </style>
                            <table border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                <tr>
                                    <td><strong> ĐỀ TÀI CÔNG TY</strong></td>
                                    <%                                        if (Integer.parseInt(session.getAttribute("rule").toString()) == 2) {
                                    %>
                                    <td><strong> TRẠNG THÁI </strong></td>
                                    <%
                                        }
                                    %>

                                </tr>
                                <%                                    for (int i = 0; i < 20; i++) {
                                %>
                                <tr>
                                    <td>
                                        <div class="row" style="margin: 0px">
                                            <div class="col-lg-2">
                                                <img style="height: 100px; width: 100px; margin: 0px" src="./pages/libs/img/logo.png"/>
                                            </div>
                                            <div class="col-lg-10">
                                                <p>Tên công ty: Công ty hệ thống thông tin<br/>
                                                    Đề tài: IoT - Phát triển hệ thống nhà thông minh<br/>
                                                    Số lượng: 20<br/>
                                                    Hạn đăng ký: 01-05-2018<br/>
                                                </p>
                                            </div>
                                        </div>
                                    </td>
                                    <%
                                        if (Integer.parseInt(session.getAttribute("rule").toString()) == 2) {
                                    %>
                                    <td>Đã duyệt</td>
                                    <%
                                        }
                                    %>
                                </tr>
                                <%
                                    }
                                %>
                            </table>
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




