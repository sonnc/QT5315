<%-- 
    Document   : nguoihuongdan
    Created on : May 23, 2018, 6:00:25 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>QUẢN LÝ NGƯỜI HƯỚNG DẪN</title>
        <%@include file="../admin/head.jsp" %>
    </head>
    <%    if (session.getAttribute("getAllNHDByAdmin") == null) {
    %>
    <s:action name="getAllNHDByAdmin" executeResult="true"/>
    <%
        }
    %>
    <%
        if (session.getAttribute("getAllNHDByAdmin") != null) {
            session.removeAttribute("getAllNHDByAdmin");
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
                                QUẢN LÝ NGƯỜI HƯỚNG DẪN
                            </div>
                            <div class="row w3-res-tb">
                                <div class="col-sm-9 m-b-xs">    
                                   
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
                                            <th>HỌ TÊN</th>
                                            <th>ĐIỆN THOẠI</th>
                                            <th>EMAIL</th>
                                            <th>CHỨC VỤ</th>
                                            <th>CÔNG TY</th>
                                            <th>STATUS</th>
                                            <th>KHÓA</th>
                                            <th>MỞ</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <s:iterator value="lstNguoiHuongDans">
                                            <tr>
                                                <td><s:property value="hoTen"/></td>
                                                <td><s:property value="dienThoai"/></td>
                                                <td><s:property value="email"/></td>
                                                <td><s:property value="chucVu"/></td>
                                                <td><s:property value="tenCongTy"/></td>
                                                <td><s:property value="status"/></td>
                                                <td>
                                                    <a href="COAcountNHDByAdmin?email=<s:property value="email"/>&status=LOCKED" ui-toggle-class=""><i style="color: #F0B300" class="glyphicon glyphicon-lock"></i></a>
                                                </td>
                                                <td>
                                                    <a href="COAcountNHDByAdmin?email=<s:property value="email"/>&status=ACTIVE" ui-toggle-class=""><i style="color: #002a80" class="glyphicon glyphicon-eye-open"></i></a>
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
                                            td = tr[i].getElementsByTagName("td")[0];
                                            td1 = tr[i].getElementsByTagName("td")[1];
                                            td2 = tr[i].getElementsByTagName("td")[2];
                                            td3 = tr[i].getElementsByTagName("td")[3];
                                            td4 = tr[i].getElementsByTagName("td")[4];
                                            td5 = tr[i].getElementsByTagName("td")[5];
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
