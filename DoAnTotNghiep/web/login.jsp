<%-- 
    Document   : login
    Created on : Mar 4, 2018, 10:21:26 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="mains/head.jsp" %>
        <title>Đăng nhập</title>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <script src="./pages/libs/js/sonnc.js"></script>
        <style>
            .error {
                color: red;
                text-orientation: initial;
            }
            .errorMessage{
                color: red;
                text-orientation: initial;
            }
        </style> 
        <%            if (session.getAttribute("email") != null) {
                response.sendRedirect(session.getAttribute("httpURL")+"home.jsp");
            }
        %>
    </head>
    <body>
        <div id="wrapper">
            <!-- end header -->
            <section id="inner-headline">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 style="text-align: center; color: red">HỆ THỐNG ĐĂNG KÝ THỰC TẬP DOANH NGHIỆP TRỰC TUYẾN</h3>
                        </div>
                    </div>
                </div>
            </section>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                            <form role="form" class="register-form" id="formValidate" action="loginAction" method="post">
                                <h2>ĐĂNG NHẬP <small>vào hệ thống</small></h2>
                                <hr class="colorgraph">
                                <div class="form-group">
                                    <s:textfield type="email" name="email" cssClass="form-control input-lg" placeholder="Tài khoản" tabindex="4" required="true"></s:textfield>
                                    </div>
                                    <div class="form-group">
                                    <s:textfield type="password" name="password" cssClass="form-control input-lg" placeholder="Mật khẩu" required="true"></s:textfield>
                                    </div>

                                    <div class="row">
                                        <div class="col-xs-4 col-sm-3 col-md-3">
                                            <span class="button-checkbox">
                                                <button type="button" class="btn" data-color="info" tabindex="7">Ghi nhớ tài khoản</button>
                                                <input type="checkbox" name="t_and_c" id="t_and_c" class="hidden" value="1">
                                            </span>
                                        </div>
                                    </div>

                                    <hr class="colorgraph">
                                    <div class="row">
                                        <div class="col-xs-12 col-md-6"><input type="submit" value="Đăng nhập" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
                                        <div class="col-xs-12 col-md-6">
                                            <div>Quên mật khẩu? <a href="<%=session.getAttribute("httpURL")%>forgotpassword.jsp">Khôi phục</a></div>
                                        <div>Trở về <a href="home.jsp">Trang chủ</a></div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </section>
            <footer style="padding: 0px">
                <div id="sub-footer" style="margin: 0px">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="copyright">
                                    <p>&copy; Phát triển bởi: Nguyễn Công Sơn - INPG12 - SIE - HUST</p>
                                    <div class="credits">
                                        <a href="#">Hệ thống đăng ký thực tập doanh nghiệp trực tuyến</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
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
        <%@include file="mains/js.jsp" %>
    </body>
</html>
