<%-- 
    Document   : detai
    Created on : Mar 6, 2018, 11:21:33 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <%@include file="../../mains/head.jsp" %>
    <%    if (session.getAttribute("getAllDeTai") == null) {
    %>
    <s:action name="getAllDeTai" executeResult="true"/>
    <%
        }
        session.removeAttribute("getAllDeTai");
    %>
    <body>
        <div id="wrapper">
            <%@include file="../../mains/mainHeader.jsp" %>
            <%@include file="../../mains/banner.jsp" %>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <s:iterator value="lstDeTai">
                                <div class="row" style="margin: 0px">
                                    <div class="col-lg-2">
                                        <img src="<s:property value="logo"/>" alt="" class="img-responsive" style="height: 100%; width: 100%" />
                                    </div>
                                    <div class="col-lg-9">
                                        <article style="margin-bottom: 0px; padding-bottom: 0px">
                                            <div class="post-image" style="margin: 0px">
                                                <div class="post-heading">
                                                    <p style="margin: 0;"><a href="chiTietDeTai?maDetai=<s:property value="maDeTai"/>"><strong><s:property value="tenDeTai"/></strong></a></p>
                                                </div>
                                            </div>
                                                    <p style="margin: 0;"><strong>Công ty: </strong><a href="chiTietCongTy?maCongTy=<s:property value="maCongTy"/>"><s:property value="tenCongTy"/></a></p>
                                            <p style="margin: 0;"><strong>Nội dung: </strong><s:property value="noiDung"/></p>
                                            <p style="margin: 0;"><strong>Yêu cầu lập trình: </strong><s:property value="yeuCauLapTrinh"/></p>
                                            <p style="margin: 0;"><strong>Yêu cầu khác: </strong><s:property value="yeuCauKhac"/></p>
                                            <div >
                                                <ul class="meta-post">
                                                    <li><i class="fa fa-calendar"></i><a>Ngày đăng: <s:property value="ngayDang"/></a></li>
                                                    <li><i class="fa fa-calendar-o"></i><a>Hạn đăng ký: <s:property value="hanDangKy"/></a></li>
                                                    <li><i class="fa fa-users"></i><a>Số lượng: <s:property value="soLuong"/></a></li>
                                                </ul>
                                                <a style="margin-bottom: 10px" href="chiTietDeTai?maDetai=<s:property value="maDeTai"/>" class="readmore pull-right">Xem chi tiết <i class="fa fa-angle-right"></i></a>
                                            </div>
                                        </article>
                                    </div>
                                    <div class="col-lg-1">
                                        <p><strong style="color: blue"><s:property value="soLuongCon"/></strong>/<strong style="color: red"><s:property value="soLuongCon"/></strong></p>
                                        <button class="btn btn-info">Đăng ký</button>
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
</html>
