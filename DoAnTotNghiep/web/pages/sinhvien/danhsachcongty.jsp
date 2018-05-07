<%-- 
    Document   : danhsachcongty
    Created on : Mar 19, 2018, 11:02:48 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../mains/head.jsp" %>
        <title>Danh sách công ty</title>
        <%    if (session.getAttribute("rule") == null) {
              String l = (String) session.getAttribute("httpURL");
              response.sendRedirect(l + "login.jsp");
              return;
          }
        %>
        <%            if (session.getAttribute("getAllCongTyforSV") == null) {
        %>
        <s:action name="getAllCongTyforSV" executeResult="true"/>
        <%
            }
        %>
        <script>
                setTimeout(function () {
                    $('body').removeClass('preloading');
                    $('#preload').delay(1000).fadeOut('fast');
                }, 1000);
        </script>
        <style>
            .max-lines {
                text-overflow: ellipsis;
                word-wrap: break-word;
                overflow: hidden;
                max-height: 3.6em;
                line-height: 1.8em;
            }
        </style>
    </head>
    <%
        if (session.getAttribute("getAllCongTyforSV") != null) {
            session.removeAttribute("getAllCongTyforSV");
    %>
    <body class="preloading">
        <div id="preload" class="preload-container text-center">
            <span class="glyphicon glyphicon-refresh preload-icon rotating" style="font-size: 120px"></span>
        </div>
        <div id="wrapper">
            <%@include file="../../mains/mainHeader.jsp" %>
            <%@include file="../../mains/banner.jsp" %>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 25px">
                                <p style="margin: 0px">DANH SÁCH CÔNG TY</p>
                            </div>
                            <s:iterator value="lstCongTyforSV">
                                <script>
                                    $(document).ready(function () {
                                        $(".btn-open-popup<s:property value="maCongTy"/>").click(function (even) {
                                            even.preventDefault(); // không truy cập đến link trong thẻ a
                                            loadPopup(); // function show popup
                                        });

                                        $("#btn-close<s:property value="maCongTy"/>").click(function () {
                                            disablePopup();
                                        });

                                        $(this).keydown(function (event) {
                                            if (event.which == 27) { // 27 is 'Ecs' in the keyboard
                                                disablePopup();  // function close pop up
                                            }
                                        });

                                        $("#background-popup<s:property value="maCongTy"/>").click(function () {
                                            disablePopup();  // function close pop up
                                            disableLoginPopup();
                                        });

                                        var popupStatus = 0; // set value

                                        function loadPopup() {
                                            if (popupStatus == 0) { // if value is 0, show popup
                                                $("#to-popup<s:property value="maCongTy"/>").fadeIn(200); // fadein popup div
                                                $("#background-popup<s:property value="maCongTy"/>").css("opacity", "0.8"); // css opacity, supports IE7, IE8
                                                $("#background-popup<s:property value="maCongTy"/>").fadeIn(200);
                                                popupStatus = 1; // and set value to 1
                                            }
                                        }

                                        function disablePopup() {
                                            if (popupStatus == 1) { // if value is 1, close popup
                                                $("#to-popup<s:property value="maCongTy"/>").fadeOut(300);
                                                $("#background-popup<s:property value="maCongTy"/>").fadeOut(300);
                                                $('body,html').css("overflow", "auto");//enable scroll bar
                                                popupStatus = 0;  // and set value to 0
                                            }
                                        }
                                    });
                                </script>
                                <div class="row" style="margin: 0px">
                                    <div class="col-lg-2">
                                        <img src="<s:property value="logo"/>" alt="" class="img-responsive" style="height: 100%; width: 100%" />
                                    </div>
                                    <div class="col-lg-10">
                                        <article style="margin-bottom: 0px; padding-bottom: 0px">
                                            <div class="post-image" style="margin: 0px">
                                                <div class="post-heading">
                                                    <p style="margin: 0;"><a class="btn-open-popup<s:property value="maCongTy"/>"  style="transition: 0.3s;" href="#"><strong><s:property value="tenCongTy"/></strong></a></p>
                                                    <!--popup content-->
                                                    <div class="preloading">
                                                    <div id="to-popup<s:property value="maCongTy"/>" style="background: #F9F9F9; color: #333333; display: none; width: 60%; height: 90%; overflow: auto;
                                                         position: fixed; top: 5%; z-index: 90; left: 50%; margin-left: -31%; padding: 15px;">
                                                        <span id="btn-close<s:property value="maCongTy"/>" style="transition:0.2s; display: block; width: 40px; height: 40px; position: absolute; top: 0; right: 0; cursor: pointer;">
                                                            <i class="glyphicon glyphicon-remove-sign" style="font-size: 30px; padding: 5px; color: red"></i>
                                                        </span>
                                                        <div id="popup-content<s:property value="maCongTy"/>" style="width: 100%; height: 100%; min-height: 400px; min-width: 500px;">
                                                            <div class="container" style="width: 100%; min-height: 400px; background: #fff; border-radius: 3px;box-shadow: 0 0 1px #ccc; margin-top: 20px;">
                                                                <div class="row" style="margin-top:15px ">
                                                                    <div class="col-lg-2">
                                                                        <img style="height: 100px; width: 100px; margin: 0px" src="<s:property value="logo"/>"/>
                                                                    </div>
                                                                    <div class="col-lg-10">
                                                                        <p style="margin: 0; font-size: 13px"><strong>Tên công ty: </strong><s:property value="tenCongTy"/> </p>
                                                                        <p style="margin: 0; font-size: 13px"><strong>Mô tả công ty: </strong><s:property value="moTa"/> </p>
                                                                        <p style="margin: 0; font-size: 13px"><strong>Lĩnh vực hoạt động: </strong><s:property value="linhVucHoatDong"/></p>
                                                                        <ul class="meta-post" style="font-size: 13px">
                                                                            <li style="padding-right: 0px"><i class="fa fa-location-arrow"></i><strong>Địa chỉ: </strong><s:property value="diaChi"/></li>
                                                                            <li style="padding-right: 0px"><i class="fa fa-phone"></i><strong>Điện thoại: </strong><s:property value="dienThoai"/></li>
                                                                        </ul>
                                                                        <ul class="meta-post" style="font-size: 13px">
                                                                            <li style="padding-right: 0px"><i class="fa fa-fax"></i><strong>Email: </strong><s:property value="email"/></li>
                                                                            <li style="padding-right: 0px"><i class="fa fa-users"></i><strong>Website: </strong><s:property value="website"/></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div><!--end #popup-content-->
                                                    </div> <!--to-popup end-->
                                                </div>
                                                </div>
                                            </div>
                                            <p class="max-lines" style="margin: 0; font-size: 13px"><strong>Mô tả công ty: </strong><s:property value="moTa"/> </p>
                                            <p class="max-lines" style="margin: 0; font-size: 13px"><strong>Lĩnh vực hoạt động: </strong><s:property value="linhVucHoatDong"/></p>
                                            <ul class="meta-post" style="font-size: 13px">
                                                <li style="padding-right: 0px"><i class="fa fa-location-arrow"></i><strong>Địa chỉ: </strong><s:property value="diaChi"/></li>
                                                <li style="padding-right: 0px"><i class="fa fa-phone"></i><strong>Điện thoại: </strong><s:property value="dienThoai"/></li>
                                            </ul>
                                            <ul class="meta-post" style="font-size: 13px">
                                                <li style="padding-right: 0px"><i class="fa fa-fax"></i><strong>Email: </strong><s:property value="email"/></li>
                                                <li style="padding-right: 0px"><i class="fa fa-users"></i><strong>Website: </strong><s:property value="website"/></li>
                                            </ul>
                                        </article>
                                    </div>
                                </div>
                            </s:iterator>
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
    <%        }
    %>
</html>

