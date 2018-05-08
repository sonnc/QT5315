<%-- 
    Document   : thongtincongty
    Created on : Mar 13, 2018, 9:27:24 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Thông tin công ty</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <script src="./pages/libs/js/sonnc.js"></script>
        <style>
            .error{
                color: red;
                text-orientation: initial;
            }
        </style>
        <%            if (session.getAttribute("GetCongTyByDDCT") == null) {
        %>
        <s:action name="GetCongTyByDDCT" executeResult="true"/>
        <%
            }
        %>
    </head>
    <%
        if (session.getAttribute("GetCongTyByDDCT") != null) {
            session.removeAttribute("GetCongTyByDDCT");

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
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                <p style="margin: 0px">ĐẠI DIỆN CÔNG TY</p>
                            </div>
                            <s:iterator value="lstCongTyvaDaiDienCongTys">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <p>Ảnh đại diện</p>
                                        <img src="<s:property value="avatarDD"/>" id="output" style="height: 120px; width: 120px; border-radius: 100%; margin-bottom: 10px" />
                                    </div>
                                    <div class="col-lg-8">
                                        <p><strong>Ông (bà):</strong> <s:property value="daiDien"/></p>
                                        <p><strong>Chức vụ:</strong> <s:property value="chucVuDD"/></p>
                                        <p><strong>Địa chỉ:</strong> <s:property value="diaChiDD"/></p>
                                        <p><strong>Điện thoại:</strong> <s:property value="dienThoaiDD"/></p>
                                        <p><strong>Email:</strong> <s:property value="emailDD"/></p>
                                    </div>

                                </div> 
                                <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                     padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                    <p style="margin: 0px">THÔNG TIN CHI TIẾT</p>
                                </div>
                                <div class="row"> 
                                    <div class="col-lg-4">
                                        <p>Logo</p>
                                        <img src="<s:property value="logo"/>" id="output" style="height: 120px; width: 120px; border-radius: 100%; margin-bottom: 10px" />
                                    </div>
                                    <div class="col-lg-8">
                                        <p><strong>Tên công ty:</strong> <s:property value="tenCongTy"/></p>
                                        <p><strong>Địa chỉ:</strong> <s:property value="diaChi"/></p>
                                        <p><strong>Điện thoại:</strong> <s:property value="dienThoai"/></p>
                                        <p><strong>Email:</strong> <s:property value="email"/></p>
                                        <p><strong>Website:</strong> <s:property value="website"/></p>
                                        <p><strong>Lĩnh vực hoạt động:</strong> <s:property value="linhVucHoatDong" escapeHtml="false"/></p>
                                        <p><strong>Mô tả:</strong> <s:property value="moTa" escapeHtml="false"/></p>
                                    </div>
                                </div>
                            </s:iterator>
                            <%                                if (Integer.parseInt(session.getAttribute("rule").toString()) == 1) {
                            %>
                            <a id="tagA" href="<%=session.getAttribute("httpURL")%>pages/congty/capnhatcongty.jsp"><input class="btn btn-primary btn-block btn-lg" value="Cập nhật thông tin"/></a>

                            <%
                                }
                            %>

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
        }
    %>
</html>

