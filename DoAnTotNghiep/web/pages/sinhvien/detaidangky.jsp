<%-- 
    Document   : detaidangky
    Created on : Mar 13, 2018, 3:09:10 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../mains/head.jsp" %>
        <%    if (session.getAttribute("rule") == null) {
                String l = (String) session.getAttribute("httpURL");
                response.sendRedirect(l + "login.jsp");
                return;
            }
        %>
        <%    if (session.getAttribute("getAllDeTaiSVDK") == null) {
        %>
        <s:action name="getAllDeTaiSVDK" executeResult="true"/>
        <%
            }
        %>
        <script>
            setTimeout(function () {
                $('body').removeClass('preloading');
                $('#preload').delay(1000).fadeOut('fast');
            }, 1000);
        </script>
    </head>
    <%
        if (session.getAttribute("getAllDeTaiSVDK") != null) {
            session.removeAttribute("getAllDeTaiSVDK");
    %>
    <body class="preloading">
        <div id="preload" class="preload-container text-center">
            <span class="glyphicon glyphicon-refresh preload-icon rotating" style="font-size: 120px"></span>
        </div>
        <%@include file="../../mains/mainHeader.jsp" %>
        <%@include file="../../mains/banner.jsp" %>
        <section id="content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <%                                if (session.getAttribute("messagegetAllDeTaiSVDK") != null) {
                        %>
                        <script type="text/javascript">
                            swal("Thông báo", "<%=session.getAttribute("messagegetAllDeTaiSVDK")%>", "info");
                        </script>
                        <%
                            }
                            session.removeAttribute("messagegetAllDeTaiSVDK");
                        %>

                        <s:iterator value="lstSVDKs">
                            <div class="row" style="margin: 0px">
                                <div class="col-lg-2">
                                    <img src="<s:property value="logo"/>" alt="" class="img-responsive" style="height: 100%; width: 100%" />
                                </div>
                                <div class="col-lg-8">
                                    <article style="margin-bottom: 0px; padding-bottom: 0px">
                                        <div class="post-image" style="margin: 0px">
                                            <div class="post-heading">
                                                <p style="margin: 0;"><a href="<%session.getAttribute("URL");%>getDeTaiInfo?maDeTai=<s:property value="maDeTai"/>"><strong><s:property value="tenDeTai"/></strong></a></p>
                                            </div>
                                        </div>
                                        <style>
                                            .max-lines {
                                                text-overflow: ellipsis;
                                                word-wrap: break-word;
                                                overflow: hidden;
                                                max-height: 3.6em;
                                                line-height: 1.8em;
                                            }
                                        </style>
                                        <p style="margin: 0;"><strong>Công ty: </strong><s:property value="tenCongTy"/></p>
                                        <p class="max-lines" style="margin: 0;"><strong>Nội dung: </strong><s:property value="noiDung"/></p>
                                        <p class="max-lines" style="margin: 0;"><strong>Yêu cầu lập trình: </strong><s:property value="yeuCauLapTrinh"/></p>
                                        <p class="max-lines" style="margin: 0;"><strong>Yêu cầu khác: </strong><s:property value="yeuCauKhac"/></p>
                                        <div style="margin-bottom: 20px">
                                            <ul class="meta-post">
                                                <li style="padding-right: 0px"><i class="fa fa-calendar"></i><a>Ngày đăng: <s:property value="ngayDang"/></a></li>
                                                <li style="padding-right: 0px"><i class="fa fa-calendar-o"></i><a>Hạn đăng ký: <s:property value="hanDangKy"/></a></li>
                                                <li style="padding-right: 0px"><i class="fa fa-users"></i><a>Số lượng: <s:property value="soLuong"/></a></li>
                                            </ul>
                                        </div>
                                    </article>
                                </div> 
                                <div class="col-lg-2">
                                     <a class="btn btn-info"><s:property value="trangThai"/></a>
                                     <p>So khớp: <s:property value="soKhop"/></p>
                                     <p>Ngày đăng ký: <s:property value="ngayDangKy"/></p>
                                </div>
                            </div>
                        </s:iterator>
                        <div class="clear"></div>
                    </div>
                    <%@include file="../../mains/RightSidebar.jsp" %>
                </div>
            </div>
        </section>
        <%@include file="../../mains/footer.jsp" %>
        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
            <%@include file="../../mains/js.jsp" %>
    </body>
    <%
    }
    %>
</html>

