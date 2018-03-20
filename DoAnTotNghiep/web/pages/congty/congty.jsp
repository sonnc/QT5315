<%-- 
    Document   : thongtincongty
    Created on : Mar 13, 2018, 9:27:24 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Thông tin công ty</title>
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
                                <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                     padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                    <p style="margin: 0px">ĐẠI DIỆN CÔNG TY</p>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <p>Ảnh đại diện</p>
                                        <img id="output" style="height: 120px; width: 120px; border-radius: 100%; margin-bottom: 10px" />
                                    </div>
                                    <div class="col-lg-8">
                                        <strong><p>Ông (bà): </p></strong>
                                        <strong><p>Chức vụ: </p></strong>
                                        <strong><p>Địa chỉ: </p></strong>
                                        <strong><p>Điện thoại: </p></strong>
                                        <strong><p>Email: </p></strong>
                                    </div>

                                </div> 
                                <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                     padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                    <p style="margin: 0px">THÔNG TIN CHI TIẾT</p>
                                </div>
                                <div class="row"> 
                                    <div class="col-lg-4">
                                        <p>Logo</p>
                                        <img />
                                    </div>
                                    <div class="col-lg-8">
                                        <strong><p>Tên công ty: </p></strong>
                                        <strong><p>Địa chỉ: </p></strong>
                                        <strong><p>Điện thoại: </p></strong>
                                        <strong><p>Email: </p></strong>
                                        <strong><p>Website: </p></strong>
                                        <strong><p>Lĩnh vực hoạt động: </p></strong>
                                        <strong><p>Mô tả </p></strong>
                                    </div>
                                </div>
                            <%
                             if (Integer.parseInt(session.getAttribute("rule").toString()) == 1) {
                                    %>
                                    <a href="#"><input class="btn btn-blue" value="Cập nhật thông tin"/></a>
                            <%
                                }
                            %>
                            
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

