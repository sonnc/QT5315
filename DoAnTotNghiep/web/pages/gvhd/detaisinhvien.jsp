<%-- 
    Document   : detaisinhvien
    Created on : Mar 13, 2018, 9:29:47 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đề tài sinh viên</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <%    if (session.getAttribute("rule") == null) {
             String l = (String) session.getAttribute("httpURL");
             response.sendRedirect(l + "login.jsp");
             return;
         }
        %>
        <%            if (session.getAttribute("getAllDeTaiSV") == null) {
        %>
        <s:action name="getAllDeTaiSV" executeResult="true"/>
        <%
            }
        %>
      
    </head>
    <%
        if (session.getAttribute("getAllDeTaiSV") != null) {
            session.removeAttribute("getAllDeTaiSV");
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
                                <p style="margin: 0px">DUYỆT ĐỀ TÀI SINH VIÊN THỰC TẬP</p>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <a href="<%session.getAttribute("httpURL");%>pages/gvhd/detaisinhvien.jsp"><button class="btn btn-info">Tất cả</button></a>
                                        <a href="<%session.getAttribute("httpURL");%>pages/gvhd/dtsvno.jsp"><button class="btn btn-danger">Chưa duyệt</button></a>
                                        <a href="<%session.getAttribute("httpURL");%>pages/gvhd/dtsvyes.jsp"><button class="btn btn-primary">Đã duyệt</button></a>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                        <input class="form-control" id="myInput" onkeyup="myFunction()"  style="float: right; width: 100%; margin-bottom: 15px" placeholder="Tìm kiếm.." type="text">
                                    </div>
                                </div>
                            </div>
                            <style>
                                td,th{padding: 5px; font-size: 13px}
                                th{text-align: center}
                            </style>
                            <table id="results" border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                <tr>
                                    <th><strong> Mã SV </strong></th>
                                    <th><strong> Họ và tên </strong></th>
                                    <th><strong> Đề tài </strong></th>
                                    <th><strong> Công ty </strong></th>
                                    <th><strong> Người hướng dẫn </strong></th>
                                    <th><strong> So khớp </strong></th>
                                    <th><strong> Kỳ TT </strong></th>
                                    <th><strong> Trạng thái </strong></th>
                                </tr>
                                <s:iterator value="lstSvDtCtNhds">
                                    <tr>
                                        <td><s:property value="mssv"/></td>
                                        <td><s:property value="hoTen"/></td>
                                        <td><a href="getDeTaiInfo?maDeTai=<s:property value="maDeTai"/>"><s:property value="deTai"/></a></td>
                                        <td><a href="chiTietCongTy?maCongTy=<s:property value="maCongTy"/>"><s:property value="congTy"/></a></td>
                                        <td><a href=""><s:property value="nguoiHuongDan"/></a></td>
                                        <td><s:property value="soKhop"/>%</td>
                                        <td><s:property value="dotThucTap"/></td>
                                        <td><s:property value="trangThai"/></td>
                                    </tr>
                                </s:iterator>
                            </table>
                             <script>
                                function myFunction() {
                                    // Declare variables 
                                    var input, filter, table, tr, td, i;
                                    var td1, td2, td3, td4, td5, td6, td7;
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
                                        td5 = tr[i].getElementsByTagName("td")[5];
                                        td6 = tr[i].getElementsByTagName("td")[6];
                                        td7 = tr[i].getElementsByTagName("td")[7];
                                        if (td || td1 || td2 || td3 || td4 || td5 || td6 || td7) {
                                            if (td.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td1.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td2.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td3.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td4.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td5.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td6.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td7.innerHTML.toUpperCase().indexOf(filter) > -1 
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
    <%
        }
    %>
</html>

