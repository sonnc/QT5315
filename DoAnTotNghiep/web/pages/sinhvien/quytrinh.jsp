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
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <script src="./pages/libs/js/sonnc.js"></script>
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