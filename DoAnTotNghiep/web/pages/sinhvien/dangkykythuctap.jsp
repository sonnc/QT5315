<%-- 
    Document   : detai
    Created on : Mar 6, 2018, 11:21:33 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../mains/head.jsp" %>
        <link href="./pages/libs/css/sweetalert.css" rel="stylesheet" />
        <%    if (session.getAttribute("rule") == null) {
                String l = (String) session.getAttribute("httpURL");
                response.sendRedirect(l + "login.jsp");
                return;
            }
        %>
        <%            if (session.getAttribute("GetListKyThucTap") == null) {
        %>
        <s:action name="GetListKyThucTap" executeResult="true" />
        <%
            }
        %>
        <script>
            window.onload = function () {
                setTimeout(function () {
                    $('body').removeClass('preloading');
                    $('#preload').delay(1000).fadeOut('fast');
                }, 0);
            };
        </script>
    </head>
    <%
        if (session.getAttribute("GetListKyThucTap") != null) {
            session.removeAttribute("GetListKyThucTap");
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
                            <%                                if (session.getAttribute("messageDangKyKyThucTap") != null) {
                            %>
                            <script type="text/javascript">
                                swal("Thông báo", "<%=session.getAttribute("messageDangKyKyThucTap")%>", "info");
                            </script>
                            <% session.removeAttribute("messageDangKyKyThucTap");
                                }

                            %>
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                <p style="margin: 0px">ĐĂNG KÝ KỲ THỰC TẬP</p>
                            </div>
                            <div>
                                Sinh viên phải đăng ký các kỳ thực tâp
                            </div>
                            <style>
                                td,th{padding: 5px};
                            </style>
                            <table border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                <tr>
                                    <th><strong>Mã kỳ TT</strong></th>
                                    <th><strong>Ngày đăng ký</strong></th>
                                    <th><strong>Hạn đăng ký</strong></th>
                                    <th><strong>Mô tả</strong></th>
                                </tr>
                                <s:iterator value="lstDotThucTap">
                                    <tr>
                                        <td><s:property value="maDot"/></td>
                                        <td><s:property value="thoiGianBatDau"/></td>
                                        <td><s:property value="thoiGianKetThuc"/></td>
                                        <td><s:property value="moTa"/></td>
                                        <td>
                                            <a class="btn btn-info" id="tagA<s:property value="id"/>" href="DangKyKyThucTap?dotThucTap=<s:property value="maDot"/>">ĐĂNG KÝ</a>
                                            <script>
                                                var action = document.getElementById("tagA<s:property value="id"/>");
                                                action.addEventListener('click', function (e) {
                                                    var form = this;
                                                    e.preventDefault();
                                                    swal({
                                                        title: "ĐĂNG KÝ KỲ THỰC TẬP",
                                                        text: "Bạn có chắc chắn muốn đăng ký kỳ thực tập <s:property value="maDot"/> không?",
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
                                                                text: 'Bạn đã xác nhận đăng ký kỳ thực tập <s:property value="maDot"/>, xin vui lòng đợi phản hồi từ hệ thống!',
                                                                icon: 'success'
                                                            }).then(function () {
                                                                window.location.href = document.getElementById('tagA<s:property value="id"/>').href;
                                                            });
                                                        } else {
                                                            swal("HỦY BỎ", "Bạn đã hủy bỏ việc đăng ký kỳ thực tập", "error");
                                                        }
                                                    });
                                                });
                                            </script>
                                        </td>
                                    </tr>
                                </s:iterator>
                            </table>
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
