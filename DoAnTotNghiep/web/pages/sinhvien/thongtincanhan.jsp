<%-- 
    Document   : thongtincanhan
    Created on : Mar 6, 2018, 11:22:10 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Thông tin cá nhân</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <script src="./pages/libs/js/sonnc.js"></script>
         <%    if (session.getAttribute("rule") == null) {
            String l = (String) session.getAttribute("httpURL");
            response.sendRedirect(l + "login.jsp");

        }
    %>
        
        <%    if (session.getAttribute("getSinhVienThongTinByList") == null) {
        %>
        <s:action name="getSinhVienThongTinByList" executeResult="true"/>
        <%
            }
        %>
       
    </head>
    <%
        if (session.getAttribute("getSinhVienThongTinByList") != null) {
            session.removeAttribute("getSinhVienThongTinByList");
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
                        <div class="col-lg-8 col-md-8">
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                <p style="margin: 0px">THÔNG TIN CÁ NHÂN</p>
                            </div>
                            <s:iterator value="lstSinhVien">
                                <div class="row">
                                    <div class="col-lg-8 col-md-8">
                                        <strong><p>Mã số sinh viên: <s:property value="mssv"/></p></strong>
                                        <strong><p>Họ và tên: <s:property value="hoTen"/></p></strong>
                                        <strong><p>Lớp: <s:property value="lop"/></p></strong>
                                        <strong><p>Khóa: <s:property value="khoa"/></p></strong>
                                        <strong><p>Khoa/ viện: <s:property value="khoaVien"/></p></strong>
                                        <strong><p>Giới tính: <s:property value="gioiTinh"/></p></strong>
                                        <strong><p>Ngày sinh: <s:property value="ngaySinh"/></p></strong>
                                        <strong><p>Địa chỉ: <s:property value="diaChi"/></p></strong>
                                        <strong><p>Điện thoại: <s:property value="dienThoai"/></p></strong>
                                        <strong><p>Email: <s:property value="email"/></p></strong>
                                        <strong><p>Laptop: <s:property value="laptop"/></p></strong>
                                    </div>
                                    <div class="col-lg-4  col-md-4">
                                        <p>Ảnh đại diện</p>
                                        <img src="<s:property value="avatar"/>" id="output" style="height: 120px; width: 120px; border-radius: 100%; margin-bottom: 10px" />
                                    </div>
                                </div> 
                            </s:iterator>
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                <p style="margin: 0px">THÔNG TIN CHI TIẾT</p>
                            </div>
                            <s:iterator value="lstSVI">
                                <div>
                                    <label>Ngoại ngữ</label>
                                    <p><s:property value="ngoaiNgu" escapeHtml="false"/></p>
                                </div>
                                <div>
                                    <label>Kỹ năng lập trình</label>
                                    <p><s:property value="kyNangLt" escapeHtml="false"/></p>
                                </div>
                                <div>
                                    <label>Kỹ năng mềm/ kỹ năng khác</label>
                                    <p><s:property value="kyNangKhac" escapeHtml="false"/></p>
                                </div>
                                <div>
                                    <label>Mục tiêu</label>
                                    <p><s:property value="mucTieu" escapeHtml="false"/></p>
                                </div>
                                <div>
                                    <label>Hoạt động</label>
                                    <p><s:property value="hoatDong" escapeHtml="false"/></p>
                                </div>
                                <div>
                                    <label>Giải thưởng</label>
                                    <p><s:property value="giaiThuong" escapeHtml="false"/></p>
                                </div>
                                <div>
                                    <label>Sở thích</label>
                                    <p><s:property value="soThich" escapeHtml="false"/></p>
                                </div>
                                <div>
                                    <label>Dự án</label>
                                    <p><s:property value="duAn" escapeHtml="false"/></p>
                                </div>
                            </s:iterator>
                            <div class="row" style="margin-top: 50px;">
                                <div class="col-lg-6 col-md-6">
                                    <a style="width: 100%" class="btn btn-success">Xuất file CV</a>
                                </div>
                                <%                                    if (Integer.parseInt(session.getAttribute("rule").toString()) == 0) {
                                %>
                                <div class="col-lg-6 col-md-6">
                                    <a style="width: 100%" href="<%=session.getAttribute("httpURL")%>pages/sinhvien/capnhatthongtin.jsp" class="btn btn-danger">Cập nhật thông tin cá nhân</a>
                                </div>
                                <%
                                    }
                                %>
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
