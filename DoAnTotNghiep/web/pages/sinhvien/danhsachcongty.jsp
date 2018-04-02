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
        <%            if (session.getAttribute("getAllCongTyforSV") == null) {
        %>
        <s:action name="getAllCongTyforSV" executeResult="true"/>
        <%
            }
        %>
    </head>
    <%
        if (session.getAttribute("getAllCongTyforSV") != null) {
            session.removeAttribute("getAllCongTyforSV");
    %>
    <body>
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
                                <div class="row" style="margin: 0px">
                                    <div class="col-lg-2">
                                        <img src="<s:property value="logo"/>" alt="" class="img-responsive" style="height: 100%; width: 100%" />
                                    </div>
                                    <div class="col-lg-10">
                                        <article style="margin-bottom: 0px; padding-bottom: 0px">
                                            <div class="post-image" style="margin: 0px">
                                                <div class="post-heading">
                                                    <p style="margin: 0;"><a href="#"><strong><s:property value="tenCongTy"/></strong></a></p>
                                                </div>
                                            </div>
                                            <p style="margin: 0; font-size: 13px"><strong>Mô tả công ty: </strong><s:property value="moTa"/></p>
                                            <p style="margin: 0; font-size: 13px"><strong>Lĩnh vực hoạt động: </strong><s:property value="linhVucHoatDong"/></p>
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

