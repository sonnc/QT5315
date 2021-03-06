<%-- 
    Document   : duyetDTCT
    Created on : Apr 21, 2018, 1:56:52 AM
    Author     : sonnc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đề tài công ty</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <!--        <link href="./pages/libs/css/stylepopup.css" rel="stylesheet" type="text/css" />-->
           <%    if (session.getAttribute("rule") == null) {
                String l = (String) session.getAttribute("httpURL");
                response.sendRedirect(l + "login.jsp");
                return;
            }
        %>
       
        <%            if (session.getAttribute("GetAllDeTaiReviewed") == null) {
        %>
        <s:action name="GetAllDeTaiReviewed" executeResult="true"/>
        <%
            }
        %>
        
    </head>
    <%
        if (session.getAttribute("GetAllDeTaiReviewed") != null) {
            session.removeAttribute("GetAllDeTaiReviewed");

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
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 25px">
                                <p style="margin: 0px">DUYỆT ĐỀ TÀI CÔNG TY</p>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <a href="<%session.getAttribute("httpURL");%>pages/gvhd/detaicongty.jsp"><button class="btn btn-info">All</button></a>
                                        <a href="<%session.getAttribute("httpURL");%>pages/gvhd/duyetDTCT.jsp"><button class="btn btn-danger">Chưa duyệt</button></a>
                                        <a href="<%session.getAttribute("httpURL");%>pages/gvhd/duyetDTCTED.jsp"><button class="btn btn-primary">Đã duyệt</button></a>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <input class="form-control" id="myInput" onkeyup="myFunction()" style="float: right; width: 100%; margin-bottom: 15px" placeholder="Tìm kiếm.." type="text">
                                    </div>
                                </div>
                            </div>
                            <style>
                                td,th{padding: 5px; font-size: 13px}
                                th{text-align: center}
                            </style>
                            <table id="results" border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                <tr>
                                    <th><strong> ĐỀ TÀI CÔNG TY</strong></th>
                                    <th><strong> TRẠNG THÁI </strong></th>
                                </tr>
                                <s:iterator value="lstDTCTNHD">
                                    <script>
                                        $(document).ready(function () {
                                            $(".btn-open-popup<s:property value="maDeTai"/>").click(function (even) {
                                                even.preventDefault(); // không truy cập đến link trong thẻ a
                                                loadPopup(); // function show popup
                                            });

                                            $("#btn-close<s:property value="maDeTai"/>").click(function () {
                                                disablePopup();
                                            });

                                            $(this).keydown(function (event) {
                                                if (event.which == 27) { // 27 is 'Ecs' in the keyboard
                                                    disablePopup();  // function close pop up
                                                }
                                            });

                                            $("#background-popup<s:property value="maDeTai"/>").click(function () {
                                                disablePopup();  // function close pop up
                                                disableLoginPopup();
                                            });

                                            var popupStatus = 0; // set value

                                            function loadPopup() {
                                                if (popupStatus == 0) { // if value is 0, show popup
                                                    $("#to-popup<s:property value="maDeTai"/>").fadeIn(200); // fadein popup div
                                                    $("#background-popup<s:property value="maDeTai"/>").css("opacity", "0.8"); // css opacity, supports IE7, IE8
                                                    $("#background-popup<s:property value="maDeTai"/>").fadeIn(200);
                                                    popupStatus = 1; // and set value to 1
                                                }
                                            }

                                            function disablePopup() {
                                                if (popupStatus == 1) { // if value is 1, close popup
                                                    $("#to-popup<s:property value="maDeTai"/>").fadeOut(300);
                                                    $("#background-popup<s:property value="maDeTai"/>").fadeOut(300);
                                                    $('body,html').css("overflow", "auto");//enable scroll bar
                                                    popupStatus = 0;  // and set value to 0
                                                }
                                            }
                                        });
                                    </script>
                                    <tr>
                                        <td>
                                            <div class="row" style="margin: 0px">
                                                <div class="col-lg-2 col-md-2">
                                                    <img style="height: 100px; width: 100px; margin: 0px" src="<s:property value="logo"/>"/>
                                                </div>
                                                <div class="col-lg-10 col-md-10">
                                                    <p style="margin: 0 0 0 10px">Đề tài: <a class="btn-open-popup<s:property value="maDeTai"/>"  style="transition: 0.3s;" href="#">
                                                            <s:property value="tenDeTai"/></a> </p>
                                                    <p style="margin: 0 0 0 10px">Công ty: <s:property value="tenCongTy"/></p>
                                                    <p style="margin: 0 0 0 10px">Số lượng: <s:property value="soLuong"/></p>
                                                    <p style="margin: 0 0 0 10px">Hạn đăng ký: <s:property value="hanDangKy"/></p>
                                                    <!--Phần hiển thị popup-->
                                                    <!--popup content-->
                                                    <div id="to-popup<s:property value="maDeTai"/>" style="background: #F9F9F9; color: #333333; display: none; width: 60%; height: 90%; overflow: auto;
                                                         position: fixed; top: 5%; z-index: 90; left: 50%; margin-left: -31%; padding: 15px;">
                                                        <span id="btn-close<s:property value="maDeTai"/>" style="transition:0.2s; display: block; width: 40px; height: 40px; position: absolute; top: 0; right: 0; cursor: pointer;">
                                                            <i class="glyphicon glyphicon-remove-sign" style="font-size: 30px; padding: 5px; color: red"></i>
                                                        </span>
                                                        <div id="popup-content<s:property value="maDeTai"/>" style="width: 100%; height: 100%; min-height: 400px; min-width: 500px;">
                                                            <div class="container" style="width: 100%; min-height: 400px; background: #fff; border-radius: 3px;box-shadow: 0 0 1px #ccc; margin-top: 20px;">
                                                                <div class="row">
                                                                    <div class="col-lg-2 col-md-2">
                                                                        <img style="height: 100px; width: 100px; margin: 0px" src="<s:property value="logo"/>"/>
                                                                    </div>
                                                                    <div class="col-lg-10 col-md-10">
                                                                        <p><strong>Công ty:</strong> <s:property value="tenCongTy"/></p>
                                                                        <p><strong>Đề tài:</strong> <s:property value="tenDeTai"/></p>
                                                                        <p><strong>Nội dung:</strong> <s:property value="noiDung"/></p>
                                                                        <s:if test="yeuCaulapTrinh"></s:if>
                                                                        <p><strong>Yêu cầu lập trình:</strong> <s:property value="yeuCaulapTrinh" escapeHtml="false"/></p>
                                                                        <p><strong>Yêu cầu khác:</strong> <s:property value="yeuCauKhac"/></p>
                                                                        <p><strong>Số lượng:</strong> <s:property value="soLuong"/></p>
                                                                        <p><strong>Ngày đăng:</strong> <s:property value="ngayDang"/></p>
                                                                        <p><strong>Hạn đăng ký:</strong> <s:property value="hanDangKy"/></p>
                                                                        <p><strong>Người hướng dẫn:</strong> <s:property value="nguoiHuongDan"/></p>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div><!--end #popup-content-->
                                                    </div> <!--to-popup end-->
                                                    <div id="background-popup<s:property value="maDeTai"/>" style="z-index:85; position: fixed; display:none; height:100%; width:100%; background:#000; top:0px; left:0px;"></div>
                                                    <!--kết thúc hiển hị popup-->
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                             <s:property value="status"/>        
                                        </td>
                                    </tr>
                                </s:iterator>
                            </table>
                            <script>
                                function myFunction() {
                                    // Declare variables 
                                    var input, filter, table, tr, td, i;
                                    var td1;
                                    input = document.getElementById("myInput");
                                    filter = input.value.toUpperCase();
                                    table = document.getElementById("results");
                                    tr = table.getElementsByTagName("tr");

                                    // Loop through all table rows, and hide those who don't match the search query
                                    for (i = 0; i < tr.length; i++) {
                                        td = tr[i].getElementsByTagName("td")[0];
                                        td1 = tr[i].getElementsByTagName("td")[1];;
                                        ;
                                        if (td || td1 ) {
                                            if (td.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td1.innerHTML.toUpperCase().indexOf(filter) > -1 
                                                    ) {
                                                tr[i].style.display = "";
                                            } else {
                                                tr[i].style.display = "none";
                                            }
                                        }
                                    }
                                }
                            </script>
                            <div id="pageNavPosition" style="float: right"></div>
                            <script type="text/javascript">
                                var pager = new Pager('results', 10);
                                pager.init();
                                pager.showPageNav('pager', 'pageNavPosition');
                                pager.showPage(1);
                            </script>
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




