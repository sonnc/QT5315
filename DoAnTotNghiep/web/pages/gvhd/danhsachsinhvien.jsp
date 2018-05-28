<%-- 
    Document   : danhsachsinhvien
    Created on : Mar 20, 2018, 11:28:10 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách sinh viên</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
           <%    if (session.getAttribute("rule") == null) {
                String l = (String) session.getAttribute("httpURL");
                response.sendRedirect(l + "login.jsp");
                return;
            }
        %>
     
        <%
        if (session.getAttribute("getAllDanhSachSinhVien") == null) {
                
            %>
            <s:action name="getAllDanhSachSinhVien" executeResult="true"/>
        <%
            }
        %>
     
    </head>
    <%
        if (session.getAttribute("getAllDanhSachSinhVien") != null) {
                session.removeAttribute("getAllDanhSachSinhVien");
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
                            </style>
                            <table id="results" border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                <tr>
                                    <th><strong> Mã SV </strong></th>
                                    <th><strong> Họ và tên </strong></th>
                                    <th><strong> Lớp </strong></th>
                                    <th><strong> Khóa </strong></th>
                                    <th><strong> Khoa/ viện </strong></th>
                                    <th><strong> Kỳ TT </strong></th>
                                    <th><strong> Trạng thái </strong></th>
                                    <th><strong> CV </strong></th>
                                </tr>
                                <s:iterator value="lstDanhSachSinhViens">
                                <tr>
                                    <td><s:property value="mssv" /></td>
                                    <td><s:property value="hoTen" /></td>
                                    <td><s:property value="lop" /></td>
                                    <td><s:property value="khoa" /></td>
                                    <td><s:property value="khoaVien" /></td>
                                    <td><s:property value="dotThucTap" /></td>
                                    <td><s:property value="trangThai" /></td>
                                    <td><a href="getThongTinSV?mssv=<s:property value="mssv" />" style="color: red">Xem</a></td>
                                </tr>
                                </s:iterator>
                            </table>
                            <script>
                                function myFunction() {
                                    // Declare variables 
                                    var input, filter, table, tr, td, i;
                                    var td1, td2, td3, td4,td5, td6;
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
                                        if (td || td1 || td2 || td3 || td4 || td5 ||td6) {
                                            if (td.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td1.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td2.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td3.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td4.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td5.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td6.innerHTML.toUpperCase().indexOf(filter) > -1
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
    <%
    }
    %>
</html>
