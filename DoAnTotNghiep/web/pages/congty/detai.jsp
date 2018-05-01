<%-- 
    Document   : detaicongty
    Created on : Mar 13, 2018, 9:27:42 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách đề tài công ty</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <style>
            .error{
                color: red;
                text-orientation: initial;
            }
        </style>
        <%            if (session.getAttribute("GetAllDeTaiByCongTy") == null) {

        %>
        <s:action name="GetAllDeTaiByCongTy" executeResult="true"/>
        <%            }
        %>
    </head>
    <%
        if (session.getAttribute("GetAllDeTaiByCongTy") != null) {
            session.removeAttribute("GetAllDeTaiByCongTy");
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
                                <p style="margin: 0px">DANH SÁCH ĐỀ TÀI</p>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <script>
                                            $(document).ready(function () {
                                                $(".btn-open-popup").click(function (even) {
                                                    even.preventDefault(); // không truy cập đến link trong thẻ a
                                                    loadPopup(); // function show popup
                                                });

                                                $("#btn-close").click(function () {
                                                    disablePopup();
                                                });

                                                $(this).keydown(function (event) {
                                                    if (event.which == 27) { // 27 is 'Ecs' in the keyboard
                                                        disablePopup();  // function close pop up
                                                    }
                                                });

                                                $("#background-popup").click(function () {
                                                    disablePopup();  // function close pop up
                                                    disableLoginPopup();
                                                });

                                                var popupStatus = 0; // set value

                                                function loadPopup() {
                                                    if (popupStatus == 0) { // if value is 0, show popup
                                                        $("#to-popup").fadeIn(200); // fadein popup div
                                                        $("#background-popup").css("opacity", "0.8"); // css opacity, supports IE7, IE8
                                                        $("#background-popup").fadeIn(200);
                                                        popupStatus = 1; // and set value to 1
                                                    }
                                                }

                                                function disablePopup() {
                                                    if (popupStatus == 1) { // if value is 1, close popup
                                                        $("#to-popup").fadeOut(300);
                                                        $("#background-popup").fadeOut(300);
                                                        $('body,html').css("overflow", "auto");//enable scroll bar
                                                        popupStatus = 0;  // and set value to 0
                                                    }
                                                }
                                            });
                                        </script>
                                        <div class="row" style="margin: 0px">
                                            <div class="col-lg-12">
                                                <a class="btn-open-popup" href=""><input class="btn btn-success" value="Đăng đề tài"/></a>
                                                <!--Phần hiển thị popup-->
                                                <!--popup content-->
                                                <div id="to-popup" style="background: #F9F9F9; color: #333333; display: none; width: 60%; height: 90%; overflow: auto;
                                                     position: fixed; top: 5%; z-index: 90; left: 50%; margin-left: -31%; padding: 15px;">
                                                    <span id="btn-close" style="transition:0.2s; display: block; width: 40px; height: 40px; position: absolute; top: 0; right: 0; cursor: pointer;">
                                                        <i class="glyphicon glyphicon-remove-sign" style="font-size: 30px; padding: 5px; color: red"></i>
                                                    </span>
                                                    <div id="popup-content" style="width: 100%; height: 100%; min-height: 400px; min-width: 500px;">
                                                        <div class="container" style="width: 100%; min-height: 400px; background: #fff; border-radius: 3px;box-shadow: 0 0 1px #ccc; margin-top: 20px;">
                                                            <div class="row">
                                                                <form role="form" id="formValidate" action="dangDeTaiByCongTy" method="post" enctype = "multipart/form-data"> 
                                                                    <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                                                         padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                                                        <p style="margin: 0px">ĐĂNG ĐỀ TÀI</p>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="deTai.tenDeTai" placeholder="Tên đề tài" required="true"/>
                                                                            <div class="row">
                                                                                <div class="col-lg-3">
                                                                                    <input style="height: 45px;" class="form-control" name="deTai.soLuong" placeholder="Số lượng" required="true"/>
                                                                                </div>
                                                                                <div class="col-lg-3">
                                                                                    <input style="height: 45px;" class="form-control" name="deTai.hanDangKy" placeholder="Hạn đăng ký" required="true"/>
                                                                                </div>
                                                                                <div class="col-lg-6">
                                                                                    <select style="margin-bottom: 15px;height: 45px;" name="sinhVien.gioiTinh" class="form-control" required="required"> 
                                                                                        <option>Chọn người hướng dẫn đề tài</option>
                                                                                        <s:iterator value="lstNguoiHuongDans">
                                                                                            <option value="<s:property value="maGvhd"/>"><s:property value="hoTen"/></option> 
                                                                                        </s:iterator>

                                                                                    </select>  
                                                                                </div>
                                                                            </div>
                                                                            <textarea style="margin-bottom: 15px;height: 150px;" class="form-control" name="deTai.noiDung" placeholder="Nội dung"></textarea>
                                                                            <p><strong>Định dạng của yêu cầu lập trình: [tên_ngôn_ngữ-trình_đô]. Ví dụ: [java-tot][c++-tot][mysql-tot]</strong></p>
                                                                            <p>Các trình độ bao gồm: Thành thao - thanhthao , Tốt - tot , Khá - kha , Biết - biet , Không biết - khongbiet</p>
                                                                            <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="deTai.yeuCauLapTrinh" placeholder="Yêu cầu lập trình"/>
                                                                            <textarea style="margin-bottom: 15px;height: 50px;" class="form-control" name="deTai.yeuCauKhac" placeholder="Yêu cầu khác"></textarea>
                                                                        </div>
                                                                    </div> 
                                                                    <input type="submit" class="btn btn-success" value="Đăng ký thông tin"/>
                                                                </form>
                                                            </div>
                                                        </div>

                                                    </div><!--end #popup-content-->
                                                </div> <!--to-popup end-->
                                                <div id="background-popup" style="z-index:85; position: fixed; display:none; height:100%; width:100%; background:#000; top:0px; left:0px;"></div>
                                                <!--kết thúc hiển hị popup-->
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-lg-6">
                                        <input class="form-control" id="s" style="float: right; width: 100%; margin-bottom: 15px" placeholder="Tìm kiếm.." type="text">
                                    </div>
                                </div>
                            </div>
                            <style>
                                td{padding: 5px}
                            </style>
                            <table border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                <tr>
                                    <td><strong> Mã đề tài </strong></td>
                                    <td><strong> Tên đề tài </strong></td>
                                    <td><strong> Người hướng dẫn </strong></td>
                                    <td><strong> Số lượng </strong></td>
                                    <td><strong> Trạng thái </strong></td>
                                </tr>
                                <s:iterator value="lstDetaiCongtyNguoihuongdan">
                                    <tr>
                                        <td><s:property value="maDeTai"/></td>
                                        <td><s:property value="tenDeTai"/></td>
                                        <td><s:property value="nguoiHuongDan"/></td>
                                        <td><s:property value="soLuong"/></td>
                                        <td><s:property value="status"/></td>
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

