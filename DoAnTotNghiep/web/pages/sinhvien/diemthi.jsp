<%-- 
    Document   : diemthi
    Created on : Mar 6, 2018, 11:21:04 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../mains/head.jsp" %>
        <title>Điểm thi</title>
           <%    if (session.getAttribute("rule") == null) {
            String l = (String) session.getAttribute("httpURL");
            response.sendRedirect(l + "login.jsp");

        }
    %>
        <%            if (session.getAttribute("getDiemThiSinhVien") == null) {
        %>
        <s:action name="getDiemThiSinhVien" executeResult="true"/>
        <%
            }
        %>
       
    </head>
    <%
        if (session.getAttribute("getDiemThiSinhVien") != null) {
            session.removeAttribute("getDiemThiSinhVien");
    %>
    <body  class="preloading">
        <div id="preload" class="preload-container text-center">
            <span class="glyphicon glyphicon-refresh preload-icon rotating" style="font-size: 120px"></span>
        </div>
        <%@include file="../../mains/mainHeader.jsp" %>
        <%@include file="../../mains/banner.jsp" %>
        <section id="content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8">
                        <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                             padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                            <p style="margin: 0px">THÔNG TIN SINH VIÊN</p>
                        </div>
                        <s:iterator value="lstSinhVien">
                            <p>Họ và tên: <s:property value="hoTen"/></p>
                            <p>Lớp:  <s:property value="lop"/></p>
                            <p>Khoa/ viên:  <s:property value="khoaVien"/></p>
                            <p>Điện thoại:  <s:property value="dienThoai"/></p>
                            <p>Email:  <s:property value="email"/></p>
                        </s:iterator>
                        <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                             padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                            <p style="margin: 0px">ĐIỂM THI</p>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <%                                        if (session.getAttribute("getDiemThiSinhVienNotFound") != null) {
                                %>
                                <p style="color: red">Chưa có điểm thi trong hệ thống!</p>
                                <%
                                    }
                                    session.removeAttribute("getDiemThiSinhVienNotFound");
                                %>
                                <s:iterator value="lstSinhVienDiem">
                                    <strong>
                                        <p>KỲ THỰC TẬP: <strong style="color: red"><s:property value="dotThucTap"/></strong></p>
                                        <p>Điểm phản hồi: <strong style="color: red"><s:property value="diemPhanHoi"/></strong></p>
                                        <p>Điểm BC Quá Trình: <strong style="color: red"><s:property value="diemBcqt"/></strong></p>
                                        <p>Điểm Quá Trình: <strong style="color: red"><s:property value="diemQuaTrinh"/></strong></p>
                                        <p>Điểm Cuối kỳ: <strong style="color: red"><s:property value="diemCuoiKy"/></strong></p>
                                    </strong>
                                    <div style="margin-bottom: 10px"></div>
                                </s:iterator>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <p style="color: green">Hệ số điểm: </p> 
                                <s:iterator value="lstHeSoDiem">
                                    <ul style="color: green">
                                        <li>Phản hồi: <s:property value="diemPhanHoi"/></li>
                                        <li>Báo cáo quá trình: <s:property value="diemBcqt"/></li>
                                        <li>Điểm quá trình: <s:property value="diemQt"/></li>
                                        <li>Điểm cuối kỳ: <s:property value="diemCk"/></li>
                                    </ul>
                                </s:iterator>
                            </div>
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
