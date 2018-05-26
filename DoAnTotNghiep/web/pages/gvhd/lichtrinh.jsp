<%-- 
    Document   : lichtrinh
    Created on : Mar 20, 2018, 11:28:22 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quy trình thực tập</title>
        <%@include file="../../mains/head.jsp" %>
        <link href="./pages/libs/calendar/fullcalendar.min.css" rel="stylesheet" />
        <link href="./pages/libs/calendar/fullcalendar.print.min.css" rel="stylesheet" media="print" />
        <script src="./pages/libs/calendar/moment.min.js"></script>
        <script src="./pages/libs/calendar/jquery.min.js"></script>
        <script src="./pages/libs/calendar/fullcalendar.min.js"></script>
        <%    if (session.getAttribute("rule") == null) {
                String l = (String) session.getAttribute("httpURL");
                response.sendRedirect(l + "login.jsp");
                return;
            }
        %>
        <%            if (session.getAttribute("getLichTrinhForGVHD") == null) {
        %>
        <s:action name="getLichTrinhForGVHD" executeResult="true"/>
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
        if (session.getAttribute("getLichTrinhForGVHD") != null) {
            session.removeAttribute("getLichTrinhForGVHD");

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
                            
                             <%                                if (session.getAttribute("messageLichTrinh") != null) {
                            %>
                            <script type="text/javascript">
                                    swal("Thông báo", "<%=session.getAttribute("messageLichTrinh")%>", "info");
                            </script>
                            <%
                                    session.removeAttribute("messageLichTrinh");
                                }
                            %>
                            <div>
                                <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                     padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                    <p style="margin: 0px">QUY TRÌNH THỰC TẬP</p>
                                </div>
                                <script>
                                    $(document).ready(function () {

                                        $('#calendar').fullCalendar({
                                            header: {
                                                left: 'prev,next today',
                                                center: 'title',
                                                right: 'month,basicWeek,basicDay'
                                            },
                                            navLinks: true, // can click day/week names to navigate views
                                            editable: true,
                                            eventLimit: true, // allow "more" link when too many events
                                            events: <%=session.getAttribute("getLichTrinh")%>,
                                            eventClick: function (event) {
                                                if (event.content) {
                                                    swal("THÔNG TIN", event.content, "info");
                                                }
                                            }
                                        });

                                    });

                                </script>
                                <div id="calendar"></div>
                                <div style="margin: 50px 0 50px 0" class="alert alert-success">
                                    <p style="text-align: center; font-size: 20px; margin: 5px 0 5px 0">ĐĂNG LỊCH TRÌNH</p>
                                    <form class="contactForm" id="formValidate" role="form" id="formValidate" action="SaveLichTrinh" method="post"> 
                                        <div class="form-group">
                                            <input name="tieuDe" class="form-control" id="name" placeholder="Tiêu đề: ... "  required="true">
                                            <div class="validation"></div>
                                        </div>
                                        <div class="form-group">
                                            <input class="form-control" name="ngayBatDau" id="subject" placeholder="Ngày bắt đầu: (mm/dd/yyyy) .... " type="text" required="true">
                                            <div class="validation"></div>
                                        </div>
                                        <div class="form-group">
                                            <input class="form-control" name="ngayKetThuc" id="subject" placeholder="Ngày kết thúc: (mm/dd/yyyy) .... " type="text" required="true">
                                            <div class="validation"></div>
                                        </div>
                                        <div class="form-group">
                                            <label>Nội dung</label>
                                            <s:textarea cssClass="form-control" name="noiDung" rows="5"></s:textarea>
                                            <div class="validation"></div>
                                        </div>
                                        <script>
                                            document.querySelector('#formValidate').addEventListener('submit', function (e) {
                                                var form = this;
                                                e.preventDefault();
                                                swal({
                                                    title: "ĐĂNG TÀI LIỆU",
                                                    text: "Bạn có chắc chắn muốn đăng lịch trình này lên hệ thống không?",
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
                                                            text: 'Bạn đã xác nhận đăng lịch trình, xin vui lòng đợi phản hồi từ hệ thống!',
                                                            icon: 'success'
                                                        }).then(function () {
                                                            form.submit();
                                                        });
                                                    } else {
                                                        swal("HỦY BỎ", "Bạn đã hủy bỏ đăng lịch trình !", "error");
                                                    }
                                                });
                                            });
                                        </script>
                                        <div class="text-center"><button type="submit" class="btn btn-theme btn-block btn-md">Đăng lịch trình</button></div>
                                    </form>
                                </div>
                                <div style="margin: 50px 0 50px 0" class="alert alert-info">
                                     <p style="text-align: center; font-size: 20px; margin: 5px 0 5px 0">DANH SÁCH LỊCH TRÌNH</p>
                                    <table border="1">
                                        <tr>
                                        <style>
                                            #theTH{
                                                text-align: center;
                                            }
                                            #theTD{
                                                padding: 5px;
                                            }
                                        </style>
                                        <th id="theTH">Tên quy trình</th>
                                        <th id="theTH">Nội dung</th>
                                        <th id="theTH">Ngày đăng</th>
                                        <th id="theTH">Hạn cuối</th>
                                        <th id="theTH">Hành động</th>
                                        </tr>
                                        <s:iterator value="lstQuyTrinh">
                                            <tr>
                                                <td id="theTD"><s:property value="tieuDe"/></td>
                                                <td id="theTD"><s:property value="noiDung"/></td>
                                                <td id="theTD"><s:property value="ngayBatDau"/></td>
                                                <td id="theTD"><s:property value="ngayKetThuc"/></td>
                                                <td id="theTD">
                                                    <a  id="idLichTrinh<s:property value="id"/>" href="DeleteLichTrinh?id=<s:property value="id"/>"><i class="glyphicon glyphicon-trash"></i></a>
                                                    <script>
                                                        var action = document.getElementById("idLichTrinh<s:property value="id"/>");
                                                        action.addEventListener('click', function (e) {
                                                            var form = this;
                                                            e.preventDefault();
                                                            swal({
                                                                title: "XÓA TÀI LIỆU",
                                                                text: "Bạn có chắc chắn muốn xóa bỏ lịch trình <s:property value="tieuDe"/>?",
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
                                                                        text: 'Bạn đã xác nhận xóa lịch trình, xin vui lòng đợi phản hồi từ hệ thống!',
                                                                        icon: 'success'
                                                                    }).then(function () {
                                                                        window.location.href = document.getElementById('idLichTrinh<s:property value="id"/>').href;
                                                                    });
                                                                } else {
                                                                    swal("HỦY BỎ", "Bạn đã hủy bỏ việc xóa lịch trình", "error");
                                                                }
                                                            });
                                                        });
                                                    </script>
                                                </td>
                                            </tr>
                                        </s:iterator>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <%@include file="../../mains/RightSidebar.jsp" %>
                    </div>
                </div>
            </section>
        </div>   
        <%@include file="../../mains/footer.jsp" %>
        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
            <%@include file="../../mains/jsForCalendar.jsp" %>
    </body>
    <%
        }
    %>
</html>