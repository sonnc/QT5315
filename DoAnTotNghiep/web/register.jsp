<%-- 
    Document   : register
    Created on : Mar 12, 2018, 1:56:49 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="mains/head.jsp" %>
        <title>Đăng ký</title>
        <!--        <script type="text/javascript">
                    function validateRegister() {
                        var email = document.getElementById("email").value;
                        var pass = document.getElementById("pass").value;
                        var re_pass = document.getElementById("re-pass").value;
                        if (email == "") {
                            alert("Xin hãy nhập địa chỉ email");
                            return false;
                        }
                        if (pass == "") {
                            alert("Mật khẩu không được để trống");
                            return false;
                        }
                        if (pass.length < 8) {
                            alert("Mật khẩu không được nhỏ hơn 8 ký tự");
                            return false;
                        }
                        if (pass != re_pass) {
                            alert("Mật khẩu không trùng nhau");
                            return false;
                        }
        
                    }
                </script>-->
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <script lang="javascript">
            $(document).ready(function () {
                //Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
                $("#formRegister").validate({
                    rules: {
                        password: {
                            required: true,
                            minlength: 8
                        },
                        repassword: {
                            required: true,
                            minlength: 8,
                            equalTo: "#password"
                        },
                        email: {
                            required: true,
                            email: true,
                        }
                    },
                    messages: {
                        password: {
                            required: "Vui lòng nhập mật khẩu.",
                            minlength: "Mật khẩu không được nhỏ hơn 8 ký tự."
                        },
                        repassword: {
                            required: "Vui lòng xác thực mật khẩu.",
                            minlength: "Mật khẩu xác thực không được nhỏ hơn 8 ký tự",
                            equalTo: "Mật khẩu xác thực không đúng."
                        },
                        email: {
                            required: "Vui lòng nhập địa chỉ email",
                            email: "Địa chỉ email chưa đúng định dạng.",
                        }
                    }
                });
            });
        </script>
        <style>
            .error{
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
                            <form role="form" name="formRegister" id="formRegister" class="register-form"  >
                                <h2>ĐĂNG KÝ <small>tài khoản.</small></h2>
                                <div class="form-group">
                                    <input type="email" name="email" class="form-control input-lg" placeholder="Tài khoản email" tabindex="4" required>
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
                                        <div>Quên mật khẩu? <a href="forgotpassword.jsp">Khôi phục</a></div>
                                        <div>Trở về <a href="home.jsp">Trang chủ</a></div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
            <section>
                <div style="text-align: center">
                    <p>Mọi thông tin chi tiết xin liên hệ: Nguyễn Công Sơn _ INPG12 _ SIE _ HUST - Email: son.nguyencong.hust@gmail.com - Điện thoại: (+84)0898 595 657</p>
                </div>
            </section>
        </div>
        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
        <!-- javascript
    ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file="mains/js.jsp" %>
    </body>
</html>

