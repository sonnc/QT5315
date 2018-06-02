<%-- 
    Document   : register
    Created on : Mar 12, 2018, 1:56:49 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="mains/head.jsp" %>
        <title>Đăng ký</title>
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
                            <h3 style="text-align: center; color: red">HỆ THỐNG ĐĂNG KÝ VÀ QUẢN LÝ THỰC TẬP DOANH NGHIỆP</h3>
                        </div>
                    </div>
                </div>
            </section>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                            <form role="form" action="registerAcount" method="post" id="formValidate" class="register-form"  >
                                <h2>ĐĂNG KÝ <small>tài khoản.</small></h2>
                                <hr class="colorgraph">
                                <script>
                                    swal("LƯU Ý ĐĂNG KÝ TÀI KHOẢN", "Đối với sinh viên và giảng viên trường, đăng ký tài khoản Gmail của nhà trường\n\
Sinh viên: mssv@student.hust.edu.vn\n\
Giảng viên: @soict.hust.edu.vn/ @hust.edu.vn\n\
Các trường hợp khác, đăng ký theo tài khoản mail bình thường.", "warning");
                                </script>
                                <div class="form-group">
                                    <s:textfield type="email" name="email" cssClass="form-control input-lg" placeholder="Tài khoản" tabindex="4" required="true"></s:textfield>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" id="password" name="password" class="form-control input-lg" id="exampleInputPassword1" placeholder="Mật khẩu" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" id="repassword" name="repassword" class="form-control input-lg" id="exampleInputPassword1" placeholder="Nhập lại mật khẩu" required>
                                    </div>

                                    <hr class="colorgraph">
                                    <div class="row">
                                        <div class="col-xs-12 col-md-6"><input type="submit" value="Đăng ký" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
                                        <div class="col-xs-12 col-md-6">
                                            <div>Quên mật khẩu? <a href="<%=request.getContextPath()%>/forgotpassword.jsp">Khôi phục</a></div>
                                        <div>Trở về <a href="<%=request.getContextPath()%>/login.jsp">LOGIN</a></div>
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
            <%@include file="mains/js.jsp" %>
    </body>
</html>

