<%-- 
    Document   : giangvien-chamdiem
    Created on : Apr 20, 2017, 10:55:43 PM
    Author     : sonng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chấm điểm sinh viên</title>
        <%@include file="head.jsp" %>
    </head>
    <%
        if (session.getAttribute("middle") == null) {
    %>
    <s:action name="giangvien-diemthi-sinhvien" executeResult="true"/>
    <%
        }
    %>

    <%
        if (session.getAttribute("middle") != null) {
            session.removeAttribute("middle");
    %> 
    <body>
        <%@include file="giangvien-topheader.jsp" %>
        <section id="services">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="center">
                            <h2>ĐIỂM THI SINH VIÊN</h2>
                            <p>Điểm thi sinh viên được ghi lại theo từng sinh viên sau khi nhấn nút "Chấm điểm"</p>
                            <p>Nếu giảng viên cho điểm hết rồi mới nhấn chấm điểm của từng sinh viên thì sẽ mất hết dữ liệu vừa nhập.</p>
                        </div>
                        <div class="gap"></div>
                        <div class="row">
                            <table class="table">
                                <tr>
                                    <th>MSSV</th>
                                    <th>Họ tên</th>
                                    <th>Lớp</th>
                                    <th>Quá trình</th>
                                    <th>Cuối kỳ</th>
                                    <th>Hành động</th>
                                </tr>
                                <s:iterator value="lstSinhVien"> 
                                    <form action="chamDiemSV" method="post">
                                        <tr>
                                            <td><s:property value="mssv"/></td>
                                            <td><s:property value="hoten"/></td>
                                            <td><s:property value="lop"/> <s:property value="khoa"/></td>
                                            <td><input type="text" name="quaTrinh"/></td>
                                            <td><input  type="text" name="cuoiKy"/></td>
                                            <td><input type="text" name="mssv" value="<s:property value="mssv"/>" hidden="true" style="width: 0px"/>
                                                <a href="abc/"></a>
                                                <input type="submit" value="Chấm điểm" class="button" 
                                                       style="background-color: green; height: 25; width: 70px; font-size: 10px; color: white">
                                            </td>
                                        </tr> 
                                    </form>

                                </s:iterator>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="footer.jsp" %>
        <%@include file="js.jsp" %>
    </body>
    <%
        }
    %>
</html>
