<%-- 
    Document   : capnhatthongtin
    Created on : May 9, 2018, 9:15:15 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cập nhật thông tin cá nhân</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <script src="./pages/libs/js/sonnc.js"></script>
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
        <%    if (session.getAttribute("getInfoNHD") == null) {
        %>
        <s:action name="getInfoNHD" executeResult="true"/>
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
        if (session.getAttribute("getInfoNHD") != null) {
            session.removeAttribute("getInfoNHD");
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
                        <%                                if (session.getAttribute("message") != null) {
                        %>
                        <script type="text/javascript">
                            swal("Thông báo", "<%=session.getAttribute("message")%>", "info");
                        </script>
                        <%
                                session.removeAttribute("message");
                            }
                        %>
                        <form role="form" id="formValidate" action="updateInfoNHD" method="post" enctype = "multipart/form-data"> 
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                <p style="margin: 0px">CẬP NHẬT THÔNG TIN CÁ NHÂN</p>
                            </div>
                            <div class="row">    
                                <div class="col-lg-8">
                                    <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" name="nhd.hoTen" readonly="true" value="%{nhd.hoTen}" placeholder="Họ và tên" required="true"/>
                                    <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" name="nhd.chucvu"  value="%{nhd.chucvu}" placeholder="Lớp" required="true"/>
                                    <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" name="nhd.dienThoai"   value="%{nhd.dienThoai}" placeholder="Khóa" required="true"/>
                                    <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" name="nhd.diaChi"  value="%{nhd.diaChi}" placeholder="Khoa/ Viện" required="true"/>

                                </div>
                                <div class="col-lg-4"></div>
                            </div> 
                            <div class="row">    
                                <div class="col-lg-12">
                                    <s:textarea cssStyle="margin-bottom: 15px;height: 150px;" cssClass="form-control" name="nhd.linhVucHoatDong" value="%{nhd.linhVucHoatDong}"></s:textarea>
                                    </div>
                                    <div class="col-lg-12" style="margin-top: 20px">
                                    <s:textarea cssStyle="margin-bottom: 15px;height: 150px;" cssClass="form-control" name="nhd.duAn" value="%{nhd.duAn}"></s:textarea>
                                    </div>
                                </div>
                                <button style="float: right;" class="btn btn-success">CẬP NHẬT THÔNG TIN</button>
                            </form>

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
    <%    }
    %>
</html>


