<%-- 
    Document   : chitietdetai
    Created on : May 28, 2018, 11:07:35 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hệ thống đăng ký thực tập trực tuyến - HUST</title>
        <%@include file="../../mains/head.jsp" %>
        <%    if (session.getAttribute("rule") == null) {
                String l = (String) session.getAttribute("httpURL");
                response.sendRedirect(l + "login.jsp");

            }
        %>
    </head>

    <body  class="preloading">
        <div id="preload" class="preload-container text-center">
            <span class="glyphicon glyphicon-refresh preload-icon rotating" style="font-size: 120px"></span>
        </div>
        <%@include file="../../mains/mainHeader.jsp" %>
        <%@include file="../../mains/banner.jsp" %>
        <section id="content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8  col-md-8"> 
                        <s:iterator value="lstDeTai">
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                <p style="margin: 0px">CHI TIẾT ĐỀ TÀI</p>
                            </div>
                            <div class="row" style="margin: 0px">
                                <div class="col-lg-2 col-md-2">
                                    <img src="<s:property value="logo"/>" alt="" class="img-responsive" style="height: 100%; width: 100%" />
                                </div>
                                <div class="col-lg-10  col-md-10">
                                    <article style="margin-bottom: 0px; padding-bottom: 0px">
                                        <div class="post-image" style="margin: 0px">
                                            <div class="post-heading">
                                                <p style="margin: 0;"><a href="getDeTaiInfo?maDeTai=<s:property value="maDeTai"/>"><strong><s:property value="tenDeTai"/></strong></a></p>
                                            </div>
                                        </div>
                                        <p style="margin: 0;"><strong>Công ty: </strong><a href="chiTietCongTy?maCongTy=<s:property value="maCongTy"/>"><s:property value="tenCongTy"/></a></p>
                                        <p style="margin: 0;"><strong>Nội dung: </strong><s:property value="noiDung" escapeHtml="false"/></p>
                                        <p style="margin: 0;"><strong>Yêu cầu lập trình: </strong><s:property value="yeuCauLapTrinh"/></p>
                                        <p style="margin: 0;"><strong>Yêu cầu khác: </strong><s:property value="yeuCauKhac" escapeHtml="false"/></p>
                                        <p style="margin: 0;"><strong>Ngày đăng: </strong><s:property value="ngayDang"/></p>
                                        <p style="margin: 0;"><strong>Hạn đăng ký: </strong><s:property value="hanDangKy"/></p>
                                        <p style="margin: 0;"><strong>Số lượng: </strong><s:property value="soLuong"/></p>
                                    </article>
                                </div>
                            </div>  
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                <p style="margin: 0px">HƯỚNG DẪN ĐỀ TÀI</p>
                            </div>
                            <div class="col-lg-2  col-md-2">
                                <img src="<s:property value="avatarNHD"/>" alt="" class="img-responsive" style="height: 100%; width: 100%" />
                            </div>
                            <div class="col-lg-8 col-md-8">
                                <article style="margin-bottom: 0px; padding-bottom: 0px">
                                    <div class="post-image" style="margin: 0px">
                                        <div class="post-heading">
                                            <p style="margin: 0;"><a href="chiTietNHD?maNHD=<s:property value="maGvhd"/>"><strong><s:property value="nguoiHuongDan"/></strong></a></p>
                                        </div>
                                    </div>
                                    <p style="margin: 0;"><strong>Chức vụ: </strong><s:property value="chucVuNHD"/></p>
                                    <p style="margin: 0;"><strong>Email: </strong><s:property value="emailNHD"/></p>
                                    <p style="margin: 0;"><strong>Điện thoại: </strong><s:property value="dienThoaiNHD"/></p>
                                </article>
                            </div>
                        </s:iterator>
                    </div>  
                    <%@include file="../../mains/RightSidebar.jsp" %>
                </div>

            </div>
        </section>
        <%@include file="../../mains/footer.jsp" %>
        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
            <%@include file="../../mains/js.jsp" %>
    </body>
</html>
