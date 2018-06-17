<%-- 
    Document   : chamdiem
    Created on : Mar 13, 2018, 9:29:00 AM
    Author     : sonnc
--%>

<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Báo cáo</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <%    if (session.getAttribute("rule") == null) {
                String l = (String) session.getAttribute("httpURL");
                response.sendRedirect(l + "login.jsp");
                return;
            }
        %>
    </head>
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
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 25px">
                                <p style="margin: 0px">BÁO CÁO/ BIỂU MẪU</p>
                            </div>


                            <div class="row">
                                <form action="report" method="post">
                                    <div class="col-lg-6 col-md-6">
                                        <select name="BieuMau" class="form-control" style="width: 100%">
                                            <option value="">Chọn biểu mẫu</option>
                                            <option value="BM01_2_7">BM01_2_7_GiangvienBaocao</option>
                                            <option value="BM01_2_8">BM01_2_8_TongHopNguyenVongSinhVien</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <input required="true" name="kyThucTap" class="form-control" placeholder="Kỳ thực tập"  style="width: 100%">
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <button class="btn btn-info"  style="width: 100%">Xuất FILE</button>
                                    </div>
                                </form>
                            </div>
                            <%                                if ((String) session.getAttribute("path") != null) {
                            %>
                            <a href="<%String result = (String) session.getAttribute("path");%>">Tải xuống</a>
                            <%
                                }
                                session.removeAttribute("path");
                                session.removeAttribute("fileName");
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
</html>

