<%-- 
    Document   : trangthaicongty
    Created on : May 5, 2018, 2:40:11 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../mains/head.jsp" %>
        <title>Đăng nhập</title>
    </head>
    <body>
        <div id="wrapper">
            <!-- end header -->
            <section id="inner-headline">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <h3 style="text-align: center; color: red">HỆ THỐNG ĐĂNG KÝ THỰC TẬP DOANH NGHIỆP TRỰC TUYẾN</h3>
                        </div>
                    </div>
                </div>
            </section>
            <section id="content" style="height: 450px">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                            <hr class="colorgraph">
                            <%                                if (session.getAttribute("CongtyStatus") != null) {
                            %>
                            <script type="text/javascript">
                                swal("Thông báo", "<%=session.getAttribute("CongtyStatus")%>", "info");
                            </script>
                            
                            <p style="color: red; font-size: 17px;"><%=session.getAttribute("CongtyStatus")%></p>
                            <%
                                    session.removeAttribute("CongtyStatus");
                                }
                            %>
                            <%
                                session.removeAttribute("email");
                            %>
                            <hr class="colorgraph">
                            <a href="logout">TRANG CHỦ</a>
                        </div>
                    </div>
                </div>
            </section>
            <footer style="padding: 0px">
                <div id="sub-footer" style="margin: 0px">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <div class="copyright">
                                    <p>&copy; Phát triển bởi: Nguyễn Công Sơn - INPG12 - SIE - HUST</p>
                                    <div class="credits">
                                        <a href="#">Hệ thống đăng ký thực tập doanh nghiệp trực tuyến</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <ul class="social-network">
                                    <li><a href="#" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="#" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="#" data-placement="top" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="#" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a></li>
                                    <li><a href="#" data-placement="top" title="Google plus"><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
        <!-- javascript
    ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file="../../mains/js.jsp" %>
    </body>
</html>
