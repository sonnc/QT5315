<%-- 
    Document   : forgotpassword
    Created on : Mar 4, 2018, 10:38:38 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="mains/head.jsp" %>
        <title>Quên mật khẩu</title>
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
                            <h3 style="text-align: center; color: red">HỆ THỐNG ĐĂNG KÝ THỰC TẬP DOANH NGHIỆP TRỰC TUYẾN</h3>
                        </div>
                    </div>
                </div>
            </section>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                            <%                                if (session.getAttribute("message") != null) {
                            %>
                            <script type="text/javascript">
                                swal("Thông báo", "<%=session.getAttribute("message")%>", "info");
                            </script>
                            <%
                                    session.removeAttribute("message");
                                }
                            %>
                            <form role="form" class="register-form" id="formValidate" action="forgotpasswordAction" method="post">
                                <h2>Quên mật khẩu <small>đăng nhập vào hệ thống</small></h2>
                                <hr class="colorgraph">
                                <div class="form-group">
                                    <s:textfield type="email" name="email" cssClass="form-control input-lg" placeholder="Tài khoản email" tabindex="4" required="true"></s:textfield>
                                    </div>
                                    <hr class="colorgraph">
                                    <div class="row">
                                        <div class="col-xs-12 col-md-6"><input type="submit" value="Đặt lại mật khẩu" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
                                        <div class="col-xs-12 col-md-6">
                                            <div>Trở về <a href="<%=session.getAttribute("httpURL")%>login.jsp">Trang chủ</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                                        <script>
                                document.querySelector('#formValidate').addEventListener('submit', function (e) {
                                    var form = this;
                                    e.preventDefault();
                                    swal({
                                        title: "ĐẶT LẠI MẬT KHẨU",
                                        text: "Bạn có chắc chắn muốn thay đổi lại mật khẩu không?",
                                        icon: "warning",
                                        buttons: [
                                            'KHÔNG, Hãy hủy bỏ!',
                                            'CÓ, Tôi chắc chắn!'
                                        ],
                                        dangerMode: true,
                                    }).then(function (isConfirm) {
                                        if (isConfirm) {
                                            swal({
                                                title: 'ĐANG XỬ LÝ',
                                                text: 'Bạn đã xác nhận, xin vui lòng đợi phản hồi từ hệ thống!',
                                                icon: 'success'
                                            }).then(function () {
                                                form.submit();
                                            });
                                        } else {
                                            swal("HỦY BỎ", "Bạn đã hủy bỏ!", "error");
                                        }
                                    });
                                });
                            </script>
                            <div style="margin: 100px"></div>
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
