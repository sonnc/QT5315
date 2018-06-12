<%-- 
    Document   : changepassword
    Created on : Mar 19, 2018, 9:11:42 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="mains/head.jsp" %>
        <title>Đổi mật khẩu</title>
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
    </head>
    <body>
        <div id="wrapper">
            <!-- end header -->
            <section id="inner-headline">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h3 style="text-align: center; color: red">HỆ THỐNG ĐĂNG KÝ VÀ QUẢN LÝ THỰC TẬP TẠI DOANH NGHIỆP</h3>
                        </div>
                    </div>
                </div>
            </section>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                            <form role="form" class="register-form" id="formValidate" action="resetpasswordAction" method="post">
                                <h2>Thay đổi mật khẩu <small>đăng nhập</small></h2>
                                <hr class="colorgraph">
                                <script type="text/javascript">
                                    
                                </script>
                                <div class="form-group">
                                    <s:textfield type="text" name="password" cssClass="form-control input-lg" placeholder="Mật khẩu mới" tabindex="4" required="true"></s:textfield>
                                </div>
                                <div class="form-group">
                                    <s:textfield type="email" name="repassword" cssClass="form-control input-lg" placeholder="Xác thực mật khẩu mới" tabindex="4" required="true"></s:textfield>
                                </div>
                                <div class="form-group">
                                    <s:textfield type="email" name="resetcode" cssClass="form-control input-lg" placeholder="Mã reset mật khẩu" tabindex="4" required="true" ></s:textfield>
                                </div>
                                <div class="form-group">
                                    <s:textfield type="email" name="otpcode" cssClass="form-control input-lg" placeholder="Mã OTP" tabindex="4" required="true"></s:textfield>
                                </div>
                                <hr class="colorgraph">
                                <div class="row">
                                    <div class="col-xs-12 col-md-6"><input type="submit" value="Đổi mật khẩu" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
                                    <div class="col-xs-12 col-md-6">
                                        <div>Trở về <a href="<%=session.getAttribute("httpURL")%>home.jsp">Trang chủ</a>
                                        </div>
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

