<%-- 
    Document   : login
    Created on : Jan 26, 2018, 12:07:07 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%> 
<!DOCTYPE html>
<html>
    <%@include file="pages/HeaderFooter/head.jsp" %>
    <body>
        <div class="container" style="background-image: url(pages/lib/images/logo/hust.jpg)">
            <div class="row">
                <div class="col-lg-5" style="background-color: #ffffff">
                    <div class="title-div">
                        <h3 class="tittle" style="margin-top: 20px">
                            <span>Đ</span>ăng
                            <span>N</span>hập
                        </h3>
                        <div class="tittle-style">

                        </div>
                    </div>
                    <div class="login-form" style="width: 100%;">
                        <form action="#" method="post">
                            <div class="">
                                <p>Tài khoản</p>
                                <input type="text" class="name" name="user name" required="" />
                            </div>
                            <div class="">
                                <p>Mật khẩu</p>
                                <input type="password" class="password" name="Password" required="" />
                            </div>
                            <label class="anim">
                                <input type="checkbox" class="checkbox">
                                <span>Ghi nhớ tài khoản ?</span>
                            </label>
                            <div class="login-agileits-bottom wthree">
                                <h6>
                                    <a href="#">Quên mật khẩu ?</a>
                                </h6>
                            </div>
                            <input type="submit" value="Đăng nhập">
                            <div class="register-forming">
                                <p>Chưa có tài khoản ? --
                                    <a href="register.html">Nhấn vào đây.</a>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-7">
                </div>
            </div>
        </div>

        <%@include file="pages/HeaderFooter/js.jsp" %>
    </body>
</html>
