<%-- 
    Document   : email.jsp
    Created on : Mar 19, 2018, 9:18:53 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../mains/head.jsp" %>
        <title>Email</title>
        <%    if (session.getAttribute("rule") == null) {
                String l = (String) session.getAttribute("httpURL");
                response.sendRedirect(l + "login.jsp");

            }
        %>
        <%            if (session.getAttribute("getAllEmailSV") == null) {
        %>
        <s:action name="getAllEmailSV" executeResult="true" />
        <%
            }
        %>

    </head>
    <%
        if (session.getAttribute("getAllEmailSV") != null) {
            session.removeAttribute("getAllEmailSV");
    %>
    <body  class="preloading">
        <div id="preload" class="preload-container text-center">
            <span class="glyphicon glyphicon-refresh preload-icon rotating" style="font-size: 120px"></span>
        </div>
        <div id="wrapper">
            <%@include file="../../mains/mainHeader.jsp" %>
            <%@include file="../../mains/banner.jsp" %>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 col-md-8" >
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                <p style="margin: 0px">QUẢN LÝ EMAIL</p>
                            </div>
                            <%                                if (session.getAttribute("emailMessage") != null) {
                            %>
                            <script type="text/javascript">
                                function mess() {
                                    swal("Thông báo", "<%=session.getAttribute("emailMessage")%>", "info");
                                }
                                ;
                            </script>
                            <%
                                    session.removeAttribute("emailMessage");
                                }
                            %>
                            <%-- up load file --%>
                            <div class="row" >
                                <script>
                                    function sendEmail() {
                                        var a = document.getElementById("sendEmail");
                                        var b = document.getElementById("allEmail");
                                        var c = document.getElementById("readEmail");
                                        var d = document.getElementById("unreadEmail");
                                        var e = document.getElementById("emailSend");
                                        if (a.style.display === "none") {
                                            a.style.display = "block";
                                            b.style.display = "none";
                                            c.style.display = "none";
                                            d.style.display = "none";
                                            e.style.display = "none";
                                        }
                                    }
                                    function allEmail() {
                                        var a = document.getElementById("sendEmail");
                                        var b = document.getElementById("allEmail");
                                        var c = document.getElementById("readEmail");
                                        var d = document.getElementById("unreadEmail");
                                        var e = document.getElementById("emailSend");
                                        if (b.style.display === "none") {
                                            b.style.display = "block";
                                            a.style.display = "none";
                                            c.style.display = "none";
                                            d.style.display = "none";
                                            e.style.display = "none";
                                        }
                                    }
                                    function readEmail() {
                                        var a = document.getElementById("sendEmail");
                                        var b = document.getElementById("allEmail");
                                        var c = document.getElementById("readEmail");
                                        var d = document.getElementById("unreadEmail");
                                        var e = document.getElementById("emailSend");
                                        if (c.style.display === "none") {
                                            c.style.display = "block";
                                            b.style.display = "none";
                                            a.style.display = "none";
                                            d.style.display = "none";
                                            e.style.display = "none";
                                        }
                                    }
                                    function unreadEmail() {
                                        var a = document.getElementById("sendEmail");
                                        var b = document.getElementById("allEmail");
                                        var c = document.getElementById("readEmail");
                                        var d = document.getElementById("unreadEmail");
                                        var e = document.getElementById("emailSend");
                                        if (d.style.display === "none") {
                                            d.style.display = "block";
                                            b.style.display = "none";
                                            c.style.display = "none";
                                            a.style.display = "none";
                                            e.style.display = "none";
                                        }
                                    }
                                    function emailSend() {
                                        var a = document.getElementById("sendEmail");
                                        var b = document.getElementById("allEmail");
                                        var c = document.getElementById("readEmail");
                                        var d = document.getElementById("unreadEmail");
                                        var e = document.getElementById("emailSend");
                                        if (e.style.display === "none") {
                                            e.style.display = "block";
                                            b.style.display = "none";
                                            c.style.display = "none";
                                            a.style.display = "none";
                                            d.style.display = "none";
                                        }
                                    }
                                </script>
                                <div class="col-lg-3 col-md-3">
                                    <div>
                                        <button style="width: 100%;margin: 0px 0px 15px 0px;" class="btn btn-theme" onclick="sendEmail();">Gửi thư</button>
                                        <button style="width: 100%;margin: 0px 0px 15px 0px;" class="btn btn-primary" onclick="allEmail();">Tất cả thư</button>
                                        <button style="width: 100%;margin: 0px 0px 15px 0px;" class="btn btn-warning" onclick="unreadEmail();">Thư chưa đọc</button>
                                        <button style="width: 100%;margin: 0px 0px 15px 0px;" class="btn btn-info" onclick="readEmail();">Thư đã đọc</button>
                                        <button style="width: 100%;margin: 0px 0px 15px 0px; background-color: indigo; border-color: indigo" class="btn btn-info" onclick="emailSend();">Thư đã gửi</button>
                                    </div>
                                </div>

                                <div class="col-lg-9 col-md-9">
                                    <div class="alert alert-warning" id="sendEmail" style="display: none">
                                        <form class="contactForm" role="form" id="formValidate" action="sendEmailSV" method="post" enctype = "multipart/form-data"> 
                                            <div class="form-group">
                                                <input name="nguoiNhan" class="form-control" id="name" placeholder="Người nhận: " type="email" required="true">
                                                <div class="validation"></div>
                                            </div>
                                            <div class="form-group">
                                                <input class="form-control" name="tieuDe" id="subject" placeholder="Tiêu đề: ..." type="text" required="true">
                                                <div class="validation"></div>
                                            </div>
                                            <div class="form-group">
                                                <textarea style="height: 400px" class="form-control" name="noiDung" rows="30"  placeholder="Nội dung: ..."  ></textarea>
                                                <div class="validation"></div>
                                            </div>
                                            <div class="text-center"><button type="submit" class="btn btn-theme btn-block btn-md">GỬI ĐI</button></div>
                                        </form>
                                    </div>
                                    <script>
                                        document.querySelector('#formValidate').addEventListener('submit', function (e) {
                                            var form = this;
                                            e.preventDefault();
                                            swal({
                                                title: "GỬI THƯ",
                                                text: "Bạn có chắc chắn muốn gửi thư này không?",
                                                icon: "warning",
                                                buttons: [
                                                    'KHÔNG, Hãy hủy bỏ!',
                                                    'CÓ, Tôi chắc chắn!'
                                                ],
                                                dangerMode: true,
                                            }).then(function (isConfirm) {
                                                if (isConfirm) {
                                                    swal({
                                                        title: 'ĐANG XỬ LÝ',
                                                        text: 'Bạn đã xác nhận gửi thư, xin vui lòng đợi phản hồi từ hệ thống!',
                                                        icon: 'success'
                                                    }).then(function () {
                                                        form.submit();
                                                    });
                                                } else {
                                                    swal("HỦY BỎ", "Bạn đã hủy bỏ gửi thư !", "error");
                                                }
                                            });
                                        });
                                    </script>
                                    <div id="allEmail"  style="display: none">
                                        <s:iterator value="lstAllEmailSV">
                                            <div >
                                                <strong><p style="margin: 0px"><s:property value="tieuDe"/></p></strong>
                                                <p style="font-size: 13px;margin-left: 20px; margin-top: 0px; margin-bottom: 0px"><span>Gửi từ: <s:property value="nguoiGui"/> - <s:property value="thoiGian"/></span></p>
                                                <p style="font-size: 13px;margin-left: 20px; margin-top: 0px; margin-bottom: 0px"><s:property value="noiDung"/></p>
                                            </div>
                                        </s:iterator>
                                    </div>
                                    <div id="readEmail"  style="display: none">
                                        <s:iterator value="lstEmailSVRead">
                                            <div >
                                                <strong><p style="margin: 0px"><s:property value="tieuDe"/></p></strong>
                                                <p style="font-size: 13px;margin-left: 20px; margin-top: 0px; margin-bottom: 0px"><span>Gửi từ: <s:property value="nguoiGui"/> - <s:property value="thoiGian"/></span></p>
                                                <p style="font-size: 13px;margin-left: 20px; margin-top: 0px; margin-bottom: 0px"><s:property value="noiDung"/></p>
                                            </div>
                                        </s:iterator>
                                    </div>
                                    <div id="unreadEmail"  style="display: none">
                                        <s:iterator value="lstEmailSVUnread">
                                            <div >
                                                <strong><p style="margin: 0px"><s:property value="tieuDe"/></p></strong>
                                                <p style="font-size: 13px;margin-left: 20px; margin-top: 0px; margin-bottom: 0px"><span>Gửi từ: <s:property value="nguoiGui"/> - <s:property value="thoiGian"/></span></p>
                                                <p style="font-size: 13px;margin-left: 20px; margin-top: 0px; margin-bottom: 0px"><s:property value="noiDung"/></p>
                                            </div>
                                        </s:iterator>
                                    </div>
                                    <div id="emailSend"  style="display: none">
                                        <s:iterator value="lstEmailSVSend">
                                            <div >
                                                <strong><p style="margin: 0px"><s:property value="tieuDe"/></p></strong>
                                                <p style="font-size: 13px;margin-left: 20px; margin-top: 0px; margin-bottom: 0px"><span>Gửi từ: <s:property value="nguoiGui"/> - <s:property value="thoiGian"/></span></p>
                                                <p style="font-size: 13px;margin-left: 20px; margin-top: 0px; margin-bottom: 0px"><s:property value="noiDung"/></p>
                                            </div>
                                        </s:iterator>
                                    </div>
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