<%-- 
    Document   : sinhvien
    Created on : May 19, 2018, 9:16:46 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>QUẢN LÝ SINH VIÊN</title>
        <%@include file="../admin/head.jsp" %>
    </head>
    <%    if (session.getAttribute("getAllSinhVienByAdmin") == null) {
    %>
    <s:action name="getAllSinhVienByAdmin" executeResult="true"/>
    <%
        }
    %>
    <%
        if (session.getAttribute("getAllSinhVienByAdmin") != null) {
            session.removeAttribute("getAllSinhVienByAdmin");
    %>
    <body>
        <section id="container">

            <%@include file="../admin/nabar.jsp" %>
            <%@include file="../admin/leftBar.jsp" %>


            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <div class="table-agile-info">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                QUẢN LÝ SINH VIÊN
                            </div>
                            <div class="row w3-res-tb">
                                <div class="col-sm-9 m-b-xs">    
                                    <form class="form-inline" role="form" action="addLoginSVbyAdmin" method="post">
                                        <div class="form-group">
                                            <label style="color: #999">Mã số sinh viên: </label>
                                            <input name="mssv" class="form-control" type="number">
                                        </div>
                                        <button type="submit" class="btn btn-success">Thêm tài khoản</button>
                                    </form>
                                </div>
                                <div class="col-sm-3">
                                    <div class="input-group">
                                        <input  id="myInput" onkeyup="myFunction()" type="text" class="input-sm form-control" placeholder="Search">
                                        <span class="input-group-btn">
                                            <button class="btn btn-sm btn-default" type="button">Tìm kiếm</button>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive">
                                <table  id="myTable" class="table table-striped b-t b-light">
                                    <thead>
                                        <tr>
                                            <th>MSSV</th>
                                            <th>HỌ TÊN</th>
                                            <th>LỚP</th>
                                            <th>KHOA/ VIỆN</th>
                                            <th>EMAIL</th>
                                            <th>STATUS</th>
                                            <th>KHÓA</th>
                                            <th>MỞ</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <s:iterator value="lstSinhVien">
                                            <tr>
                                                <td><s:property value="mssv"/></td>
                                                <td><s:property value="hoTen"/></td>
                                                <td><s:property value="lop"/></td>
                                                <td><s:property value="khoaVien"/></td>
                                                <td><s:property value="email"/></td>
                                                <td><s:property value="status"/></td>
                                                <td>
                                                    <a href="COAcountByAdmin?email=<s:property value="email"/>&status=LOCKED" ui-toggle-class=""><i style="color: #F0B300" class="glyphicon glyphicon-lock"></i></a>
                                                </td>
                                                <td>
                                                    <a href="COAcountByAdmin?email=<s:property value="email"/>&status=OPEN" ui-toggle-class=""><i style="color: #002a80" class="glyphicon glyphicon-eye-open"></i></a>
                                                </td>
                                            </tr>
                                        </s:iterator>
                                    </tbody>
                                </table>
                                <script>
                                    function myFunction() {
                                        // Declare variables 
                                        var input, filter, table, tr, td, i;
                                        var td1, td2, td3, td4, td5;
                                        input = document.getElementById("myInput");
                                        filter = input.value.toUpperCase();
                                        table = document.getElementById("myTable");
                                        tr = table.getElementsByTagName("tr");

                                        // Loop through all table rows, and hide those who don't match the search query
                                        for (i = 0; i < tr.length; i++) {
                                            td = tr[i].getElementsByTagName("td")[1];
                                            td1 = tr[i].getElementsByTagName("td")[2];
                                            td2 = tr[i].getElementsByTagName("td")[3];
                                            td3 = tr[i].getElementsByTagName("td")[4];
                                            td4 = tr[i].getElementsByTagName("td")[5];
                                            td5 = tr[i].getElementsByTagName("td")[6];
                                            if (td || td1) {
                                                if (td.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                        td1.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                        td2.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                        td3.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                        td4.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                        td5.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                                    tr[i].style.display = "";
                                                } else {
                                                    tr[i].style.display = "none";
                                                }
                                            }
                                        }
                                    }
                                </script>
                            </div>

                        </div>
                    </div>
                </section>
                <%@include file="../admin/footer.jsp" %>
            </section>
        </section>
        <%@include file="../admin/js.jsp" %>
    </body>
    <%}%>
</html>
