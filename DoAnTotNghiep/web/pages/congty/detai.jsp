<%-- 
    Document   : detaicongty
    Created on : Mar 13, 2018, 9:27:42 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách đề tài công ty</title>
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
                                <p style="margin: 0px">DANH SÁCH ĐỀ TÀI CÔNG TY</p>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <a href=""><input class="btn btn-success" value="Đăng đề tài"/></a>
                                    </div>
                                    <div class="col-lg-6">
                                        <input class="form-control" id="s" style="float: right; width: 100%; margin-bottom: 15px" placeholder="Tìm kiếm.." type="text">
                                    </div>
                                </div>
                            </div>
                            <style>
                                td{padding: 5px}
                            </style>
                            <table border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                <tr>
                                    <td><strong> Mã đề tài </strong></td>
                                    <td><strong> Tên đề tài </strong></td>
                                    <td><strong> Người hướng dẫn </strong></td>
                                    <td><strong> Số lượng </strong></td>
                                    <td><strong> Trạng thái </strong></td>
                                </tr>
                                <%                                    for (int i = 0; i < 20; i++) {
                                %>
                                <tr>
                                    <td>001</td>
                                    <td>IoT - hệ thống điều khiển nhà thông minh thế hệ mới</td>
                                    <td>OBAMA</td>
                                    <td>20</td>
                                    <td>Đã duyệt</td>
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

