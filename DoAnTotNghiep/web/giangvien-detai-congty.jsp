<%-- 
    Document   : giangvien-duyetdetai-congty
    Created on : Apr 20, 2017, 10:55:22 PM
    Author     : sonng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đề tài công ty</title> 
        <%@include file="head.jsp" %>
    </head>
    <%
        if (session.getAttribute("middle") == null) {
             session.setAttribute("trangThai", "2");
    %>
    <s:action name="giangvien-detai-congty" executeResult="true"/>
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
                            <h2>DUYỆT ĐỀ TÀI CÔNG TY</h2>
                            <p>Danh sách đề tài cần duyệt của các công ty, doanh nghiệp.</p>
                        </div>
                        <div class="gap"></div>
                        <div class="row">
                            <table class="table">
                                <tr>
                                    <th>MSCT</th>
                                    <th>Tên công ty</th>
                                    <th>MDT</th>
                                    <th>Tên đề tài</th>
                                    <th>Mô tả đề tài</th>
                                    <th>Số lượng</th>
                                    <th>Hành động</th>
                                </tr>
                                <s:iterator value="lstCongTyDeTai"> 
                                    <tr>
                                        <td><s:property value="msct"/></td>
                                        <td><s:property value="tencongty"/></td>
                                        <td><s:property value="madetai"/></td>
                                        <td><s:property value="tendetai"/></td>
                                        <td><s:property value="motadetai"/></td>
                                        <td><s:property value="soluongnhan"/></td>
                                        <td>
                                            <a href="duyetDTCT?madetai=<s:property value="madetai"/>" style="color: blue;font-size: 10px">
                                                <input type="button" value="Y" class="button" 
                                                       style="background-color: green; height: 25; width: 25px; font-size: 10px; color: white">
                                            </a>
                                            <a href="tuChoiDTCT?madetai=<s:property value="madetai"/>" style="color: blue;font-size: 10px">
                                                <input type="button" value="N" class="button" 
                                                       style="background-color: red; height: 25px; width: 25px; font-size: 10px; color: white">
                                            </a>
                                        </td>

                                    </tr> 
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
