<%-- 
    Document   : danhsachdiemthi
    Created on : Apr 15, 2018, 5:52:52 PM
    Author     : sonnc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách điểm thi</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <style>
            .error{
                color: red;
                text-orientation: initial;
            }
        </style>
        <%            if (session.getAttribute("getAllDiemSV") == null) {

        %>
        <s:action name="getAllDiemSV" executeResult="true"/>
        <%            }
        %>
    </head>
    <%
        if (session.getAttribute("getAllDiemSV") != null) {
            session.removeAttribute("getAllDiemSV");
    %>
    <body>
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
                            <p>DPH: Điểm phản hồi (auto)</p>
                            <p>DBCQT: Điểm báo cáo quá trình</p>
                            <p>DBCCK: Điểm báo cáo cuối kỳ</p>
                            <input class="form-control" id="s" style="float: right; width: 50%; margin-bottom: 15px" placeholder="Tìm kiếm.." type="text">
                            <style>
                                td{padding: 5px}
                            </style>
                            <table border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                <tr>
                                    <td><strong> Mã SV </strong></td>
                                    <td><strong> Họ và tên </strong></td>
                                    <td><strong> Lớp </strong></td>
                                    <td><strong> Khóa </strong></td>
                                    <td><strong> Kỳ TT </strong></td>
                                    <td><strong> PH </strong></td>
                                    <td><strong> BCQT </strong></td>
                                    <td><strong> QT </strong></td>
                                    <td><strong> CK </strong></td>
                                    <td><strong> Trạng thái </strong></td>
                                </tr>
                                <s:iterator value="lstSinhVienDiemThi"> 
                                    <tr>
                                        <td><s:property value="mssv" /></td>
                                        <td><s:property value="hoTen" /></td>
                                        <td><s:property value="lop" /></td>
                                        <td><s:property value="khoa" /></td>
                                        <td><s:property value="dotThucTap"/></td>
                                        <td><s:property value="diemPhanHoi"/></td>
                                        <td><s:property value="diemBCQT"/></td>
                                        <td><s:property value="diemQuaTrinh"/></td>
                                        <td><s:property value="diemBCCK"/></td>
                                        <td><s:property value="trangThai"/></td>
                                    </tr>
                                </s:iterator>
                            </table>
                            <div id="pagination">
                                <span class="all">Page 1 of 3</span>
                                <span class="current">1</span>
                                <a href="#" class="inactive">2</a>
                                <a href="#" class="inactive">3</a>
                            </div>
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

