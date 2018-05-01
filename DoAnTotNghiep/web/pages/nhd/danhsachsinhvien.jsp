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
        <style>
            .error{
                color: red;
                text-orientation: initial;
            }
        </style>
        <%            if (session.getAttribute("getAllDanhSachSinhVienByNHD") == null) {

        %>
        <s:action name="getAllDanhSachSinhVienByNHD" executeResult="true"/>
        <%            }
        %>
    </head>
    <%
        if (session.getAttribute("getAllDanhSachSinhVienByNHD") != null) {
            session.removeAttribute("getAllDanhSachSinhVienByNHD");
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
                                <p style="margin: 0px">DANH SÁCH SINH VIÊN THỰC TẬP</p>
                            </div>
                            <input class="form-control" id="s" style="float: right; width: 50%; margin-bottom: 15px" placeholder="Tìm kiếm.." type="text">
                            <style>
                                td{padding: 5px}
                            </style>
                            <table border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                <tr style="font-size: 13px; text-align: center">
                                    <td><strong> Mã SV </strong></td>
                                    <td><strong> Họ và tên </strong></td>
                                    <td><strong> Tên đề tài </strong></td>
                                    <td><strong> Ngày bắt đầu </strong></td>
                                    <td><strong> Ngày kết thúc </strong></td>
                                    <td><strong> Trạng thái </strong></td>
                                    <td><strong> CV </strong></td>
                                    <td><strong> Đánh giá </strong></td>
                                </tr>
                                <s:iterator value="lstDanhSachSinhViens">
                                    <script>
                                        $(document).ready(function () {
                                            $(".btn-open-popup<s:property value="mssv"/>").click(function (even) {
                                                even.preventDefault(); // không truy cập đến link trong thẻ a
                                                loadPopup(); // function show popup
                                            });

                                            $("#btn-close<s:property value="mssv"/>").click(function () {
                                                disablePopup();
                                            });

                                            $(this).keydown(function (event) {
                                                if (event.which == 27) { // 27 is 'Ecs' in the keyboard
                                                    disablePopup();  // function close pop up
                                                }
                                            });

                                            $("#background-popup<s:property value="mssv"/>").click(function () {
                                                disablePopup();  // function close pop up
                                                disableLoginPopup();
                                            });

                                            var popupStatus = 0; // set value

                                            function loadPopup() {
                                                if (popupStatus == 0) { // if value is 0, show popup
                                                    $("#to-popup<s:property value="mssv"/>").fadeIn(200); // fadein popup div
                                                    $("#background-popup<s:property value="mssv"/>").css("opacity", "0.8"); // css opacity, supports IE7, IE8
                                                    $("#background-popup<s:property value="mssv"/>").fadeIn(200);
                                                    popupStatus = 1; // and set value to 1
                                                }
                                            }

                                            function disablePopup() {
                                                if (popupStatus == 1) { // if value is 1, close popup
                                                    $("#to-popup<s:property value="mssv"/>").fadeOut(300);
                                                    $("#background-popup<s:property value="mssv"/>").fadeOut(300);
                                                    $('body,html').css("overflow", "auto");//enable scroll bar
                                                    popupStatus = 0;  // and set value to 0
                                                }
                                            }
                                        });
                                    </script>
                                    <tr style="font-size: 13px;">
                                        <td><s:property value="mssv" /></td>
                                        <td><s:property value="hoTen" /></td>
                                        <td><s:property value="tenDeTai" /></td>
                                        <td><s:property value="startDate" /></td>
                                        <td><s:property value="endDate" /></td>
                                        <td><s:property value="trangThai" /></td>

                                        <td>
                                            <div>
                                                <a href="getThongTinSV?mssv=<s:property value="mssv"/>">
                                                    <button class="btn btn-info" style="height: 25px; margin-bottom: 5px; font-size: 12px; width: 100%">CV</button>
                                                </a>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="row" style="margin: 0px">
                                                <div class="col-lg-12" style="padding: 0px">
                                                    <a class="btn-open-popup<s:property value="mssv"/>"  style="transition: 0.3s;" href="#">
                                                        <button class="btn btn-danger" style="height: 25px; margin-bottom: 5px; font-size: 12px; width: 100%">Đánh giá</button>
                                                    </a>
                                                    <!--Phần hiển thị popup-->
                                                    <!--popup content-->
                                                    <div id="to-popup<s:property value="mssv"/>" style="background: #F9F9F9; color: #333333; display: none; width: 60%; height: 90%; overflow: auto;
                                                         position: fixed; top: 5%; z-index: 90; left: 50%; margin-left: -31%; padding: 15px;">
                                                        <span id="btn-close<s:property value="mssv"/>" style="transition:0.2s; display: block; width: 40px; height: 40px; position: absolute; top: 0; right: 0; cursor: pointer;">
                                                            <i class="glyphicon glyphicon-remove-sign" style="font-size: 30px; padding: 5px; color: red"></i>
                                                        </span>
                                                        <div id="popup-content<s:property value="mssv"/>" style="width: 100%; height: 100%; min-height: 400px; min-width: 500px;">
                                                            <div class="container" style="width: 100%; min-height: 400px; background: #fff; border-radius: 3px;box-shadow: 0 0 1px #ccc; margin-top: 20px;">
                                                                <h4>PHIẾU ĐÁNH GIÁ KẾT QUẢ THỰC TẬP DOANH NGHIỆP</h4>
                                                                Đánh giá theo thang điểm sau : <br/>
                                                                A : xuất sắc, B : tốt, C : khá, D : bình thường, F : kém, X : không liên quan / không có ý kiến
                                                                <br>
                                                                <strong>A. Nhận xét về sinh viên thực tập</strong><br>
                                                                <strong>Trình độ kỹ thuật</strong>
                                                                <table border="1">
                                                                    <tr>
                                                                        <td style="width: 50%">Tiêu chí</td>
                                                                        <td style="width: 10%">Điểm</td>
                                                                        <td style="width: 40%">Nhận xét</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Trình độ kỹ thuật liên quan đến đề tài thực tập</td>
                                                                        <td><input class="form-control"/></td>
                                                                        <td><textarea class="form-control"></textarea></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Khả năng nắm bắt các kỹ thuật mới</td>
                                                                        <td><input class="form-control"/></td>
                                                                        <td><textarea class="form-control"></textarea></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Trình độ kỹ thuật liên quan đến đề tài thực tập</td>
                                                                        <td><input class="form-control"/></td>
                                                                        <td><textarea class="form-control"></textarea></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Mức độ làm chủ kỹ thuật, công nghệ sau khi đã được hướng dẫn</td>
                                                                        <td><input class="form-control"/></td>
                                                                        <td><textarea class="form-control"></textarea></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Khả năng phân tích </td>
                                                                        <td><input class="form-control"/></td>
                                                                        <td><textarea class="form-control"></textarea></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Phương pháp luận – cách thức tổ chức công việc</td>
                                                                        <td><input class="form-control"/></td>
                                                                        <td><textarea class="form-control"></textarea></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Óc sáng tạo</td>
                                                                        <td><input class="form-control"/></td>
                                                                        <td><textarea class="form-control"></textarea></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Trình độ ngoại ngữ phục vụ cho công việc</td>
                                                                        <td><input class="form-control"/></td>
                                                                        <td><textarea class="form-control"></textarea></td>
                                                                    </tr>
                                                                </table>
                                                                
                                                                <strong>Công việc đã thực hiện</strong>
                                                                <table border="1">
                                                                    <tr>
                                                                        <td style="width: 50%">Tiêu chí</td>
                                                                        <td style="width: 10%">Điểm</td>
                                                                        <td style="width: 40%">Nhận xét</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Khối lượng công việc đã thực hiện trong thời gian thực tập</td>
                                                                        <td><input class="form-control"/></td>
                                                                        <td><textarea class="form-control"></textarea></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Chất lượng công việc đã thực hiện trong thời gian thực tập</td>
                                                                        <td><input class="form-control"/></td>
                                                                        <td><textarea class="form-control"></textarea></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Khả năng tự hoàn thành công việc và cách giải quyết các vấn đề phát sinh</td>
                                                                        <td><input class="form-control"/></td>
                                                                        <td><textarea class="form-control"></textarea></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Viết tài liệu về công việc đã thực hiện</td>
                                                                        <td><input class="form-control"/></td>
                                                                        <td><textarea class="form-control"></textarea></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Thuyết trình</td>
                                                                        <td><input class="form-control"/></td>
                                                                        <td><textarea class="form-control"></textarea></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Tuân thủ các ràng buộc chất lượng công việc của cơ sở thực tập</td>
                                                                        <td><input class="form-control"/></td>
                                                                        <td><textarea class="form-control"></textarea></td>
                                                                    </tr>
                                                                </table>

                                                            </div>
                                                        </div><!--end #popup-content-->
                                                    </div> <!--to-popup end-->
                                                    <div id="background-popup<s:property value="mssv"/>" style="z-index:85; position: fixed; display:none; height:100%; width:100%; background:#000; top:0px; left:0px;"></div>
                                                    <!--kết thúc hiển hị popup-->
                                                </div>
                                            </div>
                                        </td>
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
