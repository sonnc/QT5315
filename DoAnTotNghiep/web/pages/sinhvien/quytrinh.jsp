<%-- 
    Document   : quytrinh
    Created on : Mar 6, 2018, 11:21:56 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quy trình thực tập</title>
        <%
            StringBuffer url = new StringBuffer();
            int port = request.getServerPort();
            if (port < 0) {
                port = 80; // Work around java.net.URL bug
            }
            String scheme = request.getScheme();
            url.append(scheme);
            url.append("://");
            url.append(request.getServerName());
            if (("http".equals(scheme) && (port != 80)) || ("https".equals(scheme) && (port != 443))) {
                url.append(':');
                url.append(port);
            }
            url.append(request.getContextPath());
            String URL = url.toString() + "/";
            session.setAttribute("httpURL", URL);
        %>
        <base href="<%=URL%>">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- css -->
        <link href="./pages/libs/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./pages/libs/plugins/flexslider/flexslider.css" rel="stylesheet" media="screen" />
        <link href="./pages/libs/css/cubeportfolio.min.css" rel="stylesheet" />
        <link href="./pages/libs/css/style.css" rel="stylesheet" />
        <!-- Theme skin -->
        <link id="t-colors" href="./pages/libs/skins/default.css" rel="stylesheet" />

        <!-- boxed bg -->
        <link id="bodybg" href="./pages/libs/bodybg/bg1.css" rel="stylesheet" type="text/css" />
        <link href="./pages/libs/img/logoEn.png" rel="shortcut icon" type="image/x-icon" />

        <link href="./pages/sinhvien/libs/fullcalendar.min.css" rel="stylesheet" />
        <link href="./pages/sinhvien/libs/fullcalendar.print.min.css" rel="stylesheet" media="print" />
        <script src="./pages/sinhvien/libs/moment.min.js"></script>
        <script src="./pages/sinhvien/libs/jquery.min.js"></script>
        <script src="./pages/sinhvien/libs/fullcalendar.min.js"></script>
        <style>
            .error{
                color: red;
                text-orientation: initial;
            }
        </style>
    </head>
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
                                            defaultDate: '2018-03-12',
                                            navLinks: true, // can click day/week names to navigate views
                                            editable: true,
                                            eventLimit: true, // allow "more" link when too many events
                                            events: [
                                                {
                                                    title: 'All Day Event',
                                                    start: '2018-03-01'
                                                },
                                                {
                                                    title: 'Long Event',
                                                    start: '2018-03-07',
                                                    end: '2018-03-10'
                                                },
                                                {
                                                    id: 999,
                                                    title: 'Repeating Event',
                                                    start: '2018-03-09T16:00:00'
                                                },
                                                {
                                                    id: 999,
                                                    title: 'Repeating Event',
                                                    start: '2018-03-16T16:00:00'
                                                },
                                                {
                                                    title: 'Conference',
                                                    start: '2018-03-11',
                                                    end: '2018-03-13'
                                                },
                                                {
                                                    title: 'Meeting',
                                                    start: '2018-03-12T10:30:00',
                                                    end: '2018-03-12T12:30:00'
                                                },
                                                {
                                                    title: 'Lunch',
                                                    start: '2018-03-12T12:00:00'
                                                },
                                                {
                                                    title: 'Meeting',
                                                    start: '2018-03-12T14:30:00'
                                                },
                                                {
                                                    title: 'Happy Hour',
                                                    start: '2018-03-12T17:30:00'
                                                },
                                                {
                                                    title: 'Dinner',
                                                    start: '2018-03-12T20:00:00'
                                                },
                                                {
                                                    title: 'Birthday Party',
                                                    start: '2018-03-13T07:00:00'
                                                },
                                                {
                                                    title: 'Click for Google',
                                                    url: 'http://google.com/',
                                                    start: '2018-03-28'
                                                }
                                            ]
                                        });

                                    });

                                </script>
                                <div id="calendar"></div>
                                <div>Dưới đây là mọi thông tin của quy trình thực tập <strong>20181</strong>
                                    . Hãy thực hiện đúng theo quy trình và thời hạn của mỗi nhiệm vụ. </div>
                                <table border="1">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên quy trình</th>
                                        <th>Nội dung</th>
                                        <th>Ngày đăng</th>
                                        <th>Hạn cuối</th>
                                        <th>Mã quy trình</th>
                                    </tr>
                                    <%                                        for (int i = 0; i < 10; i++) {
                                    %>
                                    <tr>
                                        <td>1</td>
                                        <td>Nộp bản báo cáo bản cứng</td>
                                        <td>Tất cả sinh viên thực tập đợt 20181 phải nộp lại các báo cáo bản cứng cho quản ngành</td>
                                        <td>2018-03-19</td>
                                        <td>2018-03-25</td>
                                        <td>20181</td>
                                    </tr>
                                    <%
                                        }
                                    %>

                                </table>
                            </div>
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



<!--<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='../fullcalendar.min.css' rel='stylesheet' />
<link href='../fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='../lib/moment.min.js'></script>
<script src='../lib/jquery.min.js'></script>
<script src='../fullcalendar.min.js'></script>
<script>

  $(document).ready(function() {

    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,basicWeek,basicDay'
      },
      defaultDate: '2018-03-12',
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2018-03-01'
        },
        {
          title: 'Long Event',
          start: '2018-03-07',
          end: '2018-03-10'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2018-03-09T16:00:00'
        },
        {
          id: 999,
          title: 'Repeating Event',
          start: '2018-03-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2018-03-11',
          end: '2018-03-13'
        },
        {
          title: 'Meeting',
          start: '2018-03-12T10:30:00',
          end: '2018-03-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2018-03-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2018-03-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2018-03-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2018-03-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2018-03-13T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2018-03-28'
        }
      ]
    });

  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>-->
