<%-- 
    Document   : chamdiem
    Created on : Mar 13, 2018, 9:29:00 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Điểm thi</title>
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
        <%            if (session.getAttribute("getDanhSachChamDiem") == null) {

        %>
        <s:action name="getDanhSachChamDiem" executeResult="true"/>
        <%            }
        %>

    </head>
    <%
        if (session.getAttribute("getDanhSachChamDiem") != null) {
            session.removeAttribute("getDanhSachChamDiem");
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
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 25px">
                                <p style="margin: 0px">ĐIỂM THI</p>
                            </div>
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <a href="<%=session.getAttribute("httpURL")%>pages/gvhd/dsdt.jsp"><button class="btn btn-danger" style="width: 100%;">DANH SÁCH ĐIỂM THI</button></a>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <input id="myInput" onkeyup="myFunction()"  class="form-control" id="s" style="float: right; width: 100%; margin-bottom: 5px" placeholder="Tìm kiếm.." type="text">
                                </div>
                            </div>

                            <style>
                                td,th{padding: 5px}
                                th{text-align: center}
                            </style>

                            <p>DPH: Điểm phản hồi (auto)_ DBCQT: Điểm báo cáo quá trình_ DBCCK: Điểm báo cáo cuối kỳ</p>
                            <table id="results" border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                <tr>
                                    <th><strong> Mã SV </strong></th>
                                    <th><strong> Họ và tên </strong></th>
                                    <th><strong> Lớp </strong></th>
                                    <th><strong> Khóa </strong></th>
                                    <th><strong> Kỳ TT </strong></th>
                                    <th><strong> BCQT </strong></th>
                                    <th><strong> BCCK </strong></th>
                                    <th><strong> Chấm điểm </strong></th>
                                </tr>
                                <s:iterator value="lstDanhSachSinhViens"> 
                                    <form action="chamDiem" method="post" >
                                        <tr>
                                            <td><input name="mssv" value="<s:property value="mssv" />" readonly="true" style="width: 70px;margin-right: -15px;border: none;background: white;"/></td>
                                            <td><s:property value="hoTen" /></td>
                                            <td><s:property value="lop" /></td>
                                            <td><s:property value="khoa" /></td>
                                            <td><input name="dotThucTap" readonly="true" style="width: 50px;margin-right: -15px;border: none;background: white;" value="<s:property value="dotThucTap" />"/></td>
                                            <td><input type="number" name="bcqt" required="true" style="width: 50px"/></td>
                                            <td><input type="number" name="bcck" required="true" style="width: 50px"/></td>
                                            <td>
                                                <button class="btn btn-info" style="width: 100%; margin-top: 10px">Chấm điểm</button>
                                            </td>
                                        </tr>
                                    </form>
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
                                        if (td || td1 || td2 || td3 || td4 ) {
                                            if (td.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td1.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td2.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td3.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td4.innerHTML.toUpperCase().indexOf(filter) > -1 
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
                                var pager = new Pager('results', 20);
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

