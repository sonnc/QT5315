<%-- 
    Document   : detai
    Created on : May 15, 2018, 5:04:59 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../mains/head.jsp" %>
        <%    if (session.getAttribute("rule") == null) {
                String l = (String) session.getAttribute("httpURL");
                response.sendRedirect(l + "login.jsp");

            }
        %>
        <link href="./pages/libs/css/sweetalert.css" rel="stylesheet" />
        <%    if (session.getAttribute("getAllDeTaiNHD") == null) {
        %>
        <s:action name="getAllDeTaiNHD" executeResult="true"/>
        <%
            }
        %>
    </head>
    <%
        if (session.getAttribute("getAllDeTaiNHD") != null) {
            session.removeAttribute("getAllDeTaiNHD");
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
                                <p style="margin: 0px">DANH SÁCH SINH VIÊN THỰC TẬP</p>
                            </div>
                            <input class="form-control" id="myInput" onkeyup="myFunction()" style="float: right; width: 50%; margin-bottom: 15px" placeholder="Tìm kiếm.." type="text">
                            <style>
                                td,th{padding: 5px}
                                th{text-align: center}
                            </style>     
                            <table id="results" border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                <tr style="font-size: 13px; text-align: center">
                                    <th><strong> Mã đề tài </strong></th>
                                    <th><strong> Tên đề tài </strong></th>
                                    <th><strong> Số lượng </strong></th>
                                    <th><strong> Ngày đăng </strong></th>
                                    <th><strong> Hạn đăng ký </strong></th>
                                        <s:iterator value="lstAllDeTai">
                                    <tr style="font-size: 13px;">
                                        <td><s:property value="maDeTai" /></td>
                                        <td><a href="getDeTaiInfo?maDeTai=<s:property value="maDeTai"/>"><s:property value="tenDeTai" /></a></td>
                                        <td><s:property value="soLuong" /></td>
                                        <td><s:property value="ngayDang" /></td>
                                        <td><s:property value="hanDangKy" /></td>
                                    </tr>
                                </s:iterator>
                            </table>
                            <script>
                                function myFunction() {
                                    // Declare variables 
                                    var input, filter, table, tr, td, i;
                                    var td1, td2, td3, td4;
                                    input = document.getElementById("myInput");
                                    filter = input.value.toUpperCase();
                                    table = document.getElementById("results");
                                    tr = table.getElementsByTagName("tr");

                                    // Loop through all table rows, and hide those who don't match the search query
                                    for (i = 0; i < tr.length; i++) {
                                        td = tr[i].getElementsByTagName("td")[0];
                                        td1 = tr[i].getElementsByTagName("td")[1];
                                        td2 = tr[i].getElementsByTagName("td")[2];
                                        td3 = tr[i].getElementsByTagName("td")[3];
                                        td4 = tr[i].getElementsByTagName("td")[4];
                                        if (td || td1 || td2 || td3 || td4) {
                                            if (td.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td1.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td2.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td3.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td4.innerHTML.toUpperCase().indexOf(filter) > -1) {
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
                                var pager = new Pager('results', 15);
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
    <%        }%>
</html>