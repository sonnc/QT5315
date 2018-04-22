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
        <%            if (session.getAttribute("getLichTrinhForGVHD") == null) {
        %>
        <s:action name="getLichTrinhForGVHD" executeResult="true"/>
        <%
            }
        %>
    </head>
    <%
        if (session.getAttribute("getLichTrinhForGVHD") != null) {
            session.removeAttribute("getLichTrinhForGVHD");

    %>
    <body>
        <div id="wrapper">
            <%@include file="../../mains/mainHeader.jsp" %>
            <%@include file="../../mains/banner.jsp" %>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
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
                                                    alert(event.content);
                                                }
                                            }
                                        });

                                    });

                                </script>
                                <div id="calendar"></div>
                                <div style="margin: 50px 0 50px 0" class="alert alert-success">
                                    <p>ĐĂNG LỊCH TRÌNH</p>
                                    <form class="contactForm" id="from" role="form" id="formValidate" action="SaveLichTrinh" method="post"> 
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
                                            <textarea class="form-control" name="noiDung" rows="5"  placeholder="Nội dung: ..."  required="true"></textarea>
                                            <div class="validation"></div>
                                        </div>
                                        <div class="text-center"><button type="submit" class="btn btn-theme btn-block btn-md">Đăng lịch trình</button></div>

                                    </form>
                                </div>
                                <div style="margin: 50px 0 50px 0" class="alert alert-info">
                                    <p>DANH SÁCH LỊCH TRÌNH</p>
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