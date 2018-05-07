<%-- 
    Document   : detaisinhvien
    Created on : Mar 13, 2018, 9:29:47 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đề tài sinh viên</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
           <%    if (session.getAttribute("rule") == null) {
                String l = (String) session.getAttribute("httpURL");
                response.sendRedirect(l + "login.jsp");
                return;
            }
        %>
        <style>
            .error{
                color: red;
                text-orientation: initial;
            }
        </style>
        <%      
            if (session.getAttribute("getAllDeTaiSVNO") == null) {
        %>
        <s:action name="getAllDeTaiSVNO" executeResult="true"/>
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
        if (session.getAttribute("getAllDeTaiSVNO") != null) {
            session.removeAttribute("getAllDeTaiSVNO");
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
                                <p style="margin: 0px">DUYỆT ĐỀ TÀI SINH VIÊN THỰC TẬP</p>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-lg-9">
                                        <a href="<%session.getAttribute("httpURL");%>pages/gvhd/detaisinhvien.jsp"><button class="btn btn-info">Tất cả</button></a>
                                        <a href="<%session.getAttribute("httpURL");%>pages/gvhd/dtsvno.jsp"><button class="btn btn-danger">Chưa duyệt</button></a>
                                        <a href="<%session.getAttribute("httpURL");%>pages/gvhd/dtsvyes.jsp"><button class="btn btn-primary">Đã duyệt</button></a>
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
                                    <td><strong> Mã SV </strong></td>
                                    <td><strong> Họ và tên </strong></td>
                                    <td><strong> Đề tài </strong></td>
                                    <td><strong> Công ty </strong></td>
                                    <td><strong> Người hướng dẫn </strong></td>
                                    <td><strong> So khớp </strong></td>
                                    <td><strong> Kỳ TT </strong></td>
                                    <td><strong> Hành động </strong></td>
                                </tr>
                                <s:iterator value="lstSvDtCtNhds">
                                    <tr>
                                        <td><s:property value="mssv"/></td>
                                        <td><s:property value="hoTen"/></td>
                                        <td><a href=""><s:property value="deTai"/></a></td>
                                        <td><a href=""><s:property value="congTy"/></a></td>
                                        <td><a href=""><s:property value="nguoiHuongDan"/></a></td>
                                        <td><s:property value="soKhop"/>%</td>
                                        <td><s:property value="dotThucTap"/></td>
                                        <td>
                                            <div>
                                                <a href="duyetDeTaiSV?mssv=<s:property value="mssv"/>&maDeTai=<s:property value="maDeTai"/>&dotThucTap=<s:property value="dotThucTap"/>&trangThai=false">
                                                    <button class="btn btn-danger" style="height: 25px; margin-bottom: 5px; font-size: 12px; width: 100%">Từ chối</button>
                                                </a>
                                            </div>
                                            <div>
                                                <a href="duyetDeTaiSV?mssv=<s:property value="mssv"/>&maDeTai=<s:property value="maDeTai"/>&dotThucTap=<s:property value="dotThucTap"/>&trangThai=true">
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
    <%
            session.removeAttribute("chuaDuyet");
        }
    %>
</html>

