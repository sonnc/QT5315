<%-- 
    Document   : duyetCT
    Created on : Apr 17, 2018, 6:43:46 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách công ty</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <style>
            .error{
                color: red;
                text-orientation: initial;
            }
        </style>
        <%            if (session.getAttribute("GetAllCongTyReview") == null) {
        %>
        <s:action name="GetAllCongTyReview" executeResult="true"></s:action>
        <%
            }
        %>
    </head>
    <%
        if (session.getAttribute("GetAllCongTyReview") != null) {
            session.removeAttribute("GetAllCongTyReview");
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
                                <p style="margin: 0px">DUYỆT CÔNG TY</p>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-lg-9">
                                        <a href="<%session.getAttribute("httpURL");%>pages/gvhd/danhsachcongty.jsp"><button class="btn btn-info">All</button></a>
                                        <a href="<%session.getAttribute("httpURL");%>pages/gvhd/duyetCT.jsp"><button class="btn btn-danger">Chưa duyệt</button></a>
                                        <a href="<%session.getAttribute("httpURL");%>pages/gvhd/duyetCTED.jsp"><button class="btn btn-primary">Đã duyệt</button></a>
                                    </div>
                                    <div class="col-lg-3">
                                        <input class="form-control" id="s" style="float: right; width: 100%; margin-bottom: 15px" placeholder="Tìm kiếm.." type="text">
                                    </div>
                                </div>
                            </div>
                            <style>
                                td{padding: 5px; font-size: 13px}
                            </style>
                            <table border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                <tr>
                                    <td><strong> Logo </strong></td>
                                    <td><strong> Tên công ty </strong></td>
                                    <td><strong> Đại diện </strong></td>
                                    <td><strong> Địa chỉ </strong></td>
                                    <td><strong> Email </strong></td>
                                    <td><strong> Điện thoại</strong></td>
                                    <td><strong> Hành động </strong></td>
                                </tr>
                                <s:iterator value="lstCongTy">
                                    <tr>
                                        <td><a href="<s:property value="maCongTy"/>"><img style="height: 50px; width: 50px; margin-bottom: 0px" src="<s:property value="logo"/>"/></a></td>
                                        <td><a href="<s:property value="maCongTy"/>"><s:property value="tenCongTy"/></a></td>
                                        <td><a href="<s:property value="maDaiDien"/>"><s:property value="daiDien"/></a></td>
                                        <td><s:property value="diaChi"/></td>
                                        <td><s:property value="email"/></td>
                                        <td><s:property value="dienThoai"/></td>
                                        <td>
                                            <div>
                                                <a href="AcceptRefuseCongTy?maCongTy=<s:property value="maCongTy"/>&status=false">
                                                    <button class="btn btn-danger" style="height: 25px; margin-bottom: 5px; font-size: 12px; width: 100%">Từ chối</button>
                                                </a>
                                            </div>
                                            <div>
                                                <a href="AcceptRefuseCongTy?maCongTy=<s:property value="maCongTy"/>&status=true">
                                                    <button class="btn btn-primary" style="height: 25px; margin-bottom: 5px; font-size: 12px; width: 100%">Đồng ý</button>
                                                </a>
                                            </div>        
                                        </td>
                                    </tr>
                                </s:iterator>
                            </table>
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

