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
        <%    if (session.getAttribute("rule") == null) {
                String l = (String) session.getAttribute("httpURL");
                response.sendRedirect(l + "login.jsp");
                return;
            }
        %>
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
                            <%                                if (session.getAttribute("messageDeleteDetai") != null) {
                            %>
                            <script type="text/javascript">
                                swal("Thông báo", "<%=session.getAttribute("messageDeleteDetai")%>", "info");
                            </script>
                            <%
                                    session.removeAttribute("messageDeleteDetai");
                                }
                            %>
                            <%                                if (session.getAttribute("messageSaveDeTai") != null) {
                            %>
                            <script type="text/javascript">
                                swal("Thông báo", "<%=session.getAttribute("messageSaveDeTai")%>", "info");
                            </script>
                            <%
                                    session.removeAttribute("messageSaveDeTai");
                                }
                            %>
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 25px">
                                <p style="margin: 0px">DANH SÁCH ĐỀ TÀI</p>
                            </div>
                            <div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6">
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
                                            <div class="col-lg-12 col-md-12">
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
                                                                        <div class="col-lg-12 col-md-12">
                                                                            <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="deTai.tenDeTai" placeholder="Tên đề tài" required="true"/>
                                                                            <div class="row">
                                                                                <div class="col-lg-3 col-md-3">
                                                                                    <input style="height: 45px;" class="form-control" name="deTai.soLuong" placeholder="Số lượng" required="true"/>
                                                                                </div>
                                                                                <div class="col-lg-3 col-md-3">
                                                                                    <input style="height: 45px;" class="form-control" name="hanDangKy" placeholder="Hạn đăng ký (dd-mm-yyyy)" required="true"/>
                                                                                </div>
                                                                                <div class="col-lg-6 col-md-6">
                                                                                    <select style="margin-bottom: 15px;height: 45px;" name="deTai.maGvhd" class="form-control" required="required"> 
                                                                                        <option value="">Chọn người hướng dẫn đề tài</option>
                                                                                        <s:iterator value="lstNguoiHuongDans">
                                                                                            <option value="<s:property value="maGvhd"/>"><s:property value="hoTen"/></option> 
                                                                                        </s:iterator>

                                                                                    </select>  
                                                                                </div>
                                                                            </div>
                                                                            <label>Nội dung</label>
                                                                            <textarea style="margin-bottom: 15px; width: 100%;"  class="form-control" name="deTai.noiDung" placeholder="Nội dung"></textarea>
                                                                      
                                                                            <p><strong>Định dạng của yêu cầu lập trình: [tên_ngôn_ngữ-trình_đô]. Ví dụ: [java-tot][c++-tot][mysql-tot]</strong></p>
                                                                            <p>Các trình độ bao gồm: Thành thao - thanhthao , Tốt - tot , Khá - kha , Biết - biet , Không biết - khongbiet</p>
                                                                            <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="deTai.yeuCauLapTrinh" placeholder="Yêu cầu lập trình"/>
                                                                            <label>Các yêu cầu khác</label>
                                                                            <textarea style="margin-bottom: 15px;" class="form-control" name="deTai.yeuCauKhac" placeholder="Yêu cầu khác"></textarea>
                                                                        </div>
                                                                    </div> 
                                                                    <input type="submit" class="btn btn-success" value="ĐĂNG ĐỀ TÀI"/>
                                                                    <script>
                                                                        document.querySelector('#formValidate').addEventListener('submit', function (e) {
                                                                            var form = this;
                                                                            e.preventDefault();
                                                                            swal({
                                                                                title: "ĐĂNG ĐỀ TÀI",
                                                                                text: "Bạn có muốn đăng đề tài này không?",
                                                                                icon: "warning",
                                                                                buttons: [
                                                                                    'KHÔNG, Hãy hủy bỏ!',
                                                                                    'CÓ, Tôi chắc chắn!'
                                                                                ],
                                                                                dangerMode: true,
                                                                            }).then(function (isConfirm) {
                                                                                if (isConfirm) {
                                                                                    swal({
                                                                                        title: 'ĐANG XỬ LÝ',
                                                                                        text: 'Bạn đã đồng ý đăng đề tài, xin vui lòng đợi phản hồi từ hệ thống!',
                                                                                        icon: 'success'
                                                                                    }).then(function () {
                                                                                        form.submit();
                                                                                    });
                                                                                } else {
                                                                                    swal("HỦY BỎ", "Bạn đã hủy bỏ việc đăng đề tài này!", "error");
                                                                                }
                                                                            });
                                                                        });
                                                                    </script>
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
                                    <div class="col-lg-6 col-md-6">
                                        <input class="form-control"  type="text" id="myInput" onkeyup="myFunction()" style ="float: right; width: 100%; margin-bottom: 15px" placeholder="Tìm đề tài, người hướng dẫn, trạng thái,..." type="text">
                                    </div>
                                </div>
                            </div>
                            <style>
                                td,th{padding: 5px};
                            </style>
                            <table id="results" border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                <tr>
                                    <th><strong> Mã DT </strong></th>
                                    <th><strong> Tên đề tài </strong></th>
                                    <th><strong> Người hướng dẫn </strong></th>
                                    <th><strong> SL </strong></th>
                                    <th><strong> Trạng thái </strong></th>
                                    <th><strong> Xóa </strong></th>
                                </tr>
                                <s:iterator value="lstDetaiCongtyNguoihuongdan">
                                    <tr>
                                        <td><s:property value="maDeTai"/></td>
                                        <td><s:property value="tenDeTai"/></td>
                                        <td><s:property value="nguoiHuongDan"/></td>
                                        <td><s:property value="soLuong"/></td>
                                        <td><s:property value="status"/></td>
                                        <td>
                                            <a id="tagA<s:property value="maDeTai"/>" href="deleteDeTaiByDDCT?maDeTai=<s:property value="maDeTai"/>"><i class="glyphicon glyphicon-trash"></i></a>
                                            <script>
                                                var action = document.getElementById("tagA<s:property value="maDeTai"/>");
                                                action.addEventListener('click', function (e) {
                                                    var form = this;
                                                    e.preventDefault();
                                                    swal({
                                                        title: "XÓA TÀI LIỆU",
                                                        text: "Bạn có chắc chắn muốn xóa đề tài này không? ",
                                                        icon: "warning",
                                                        buttons: [
                                                            'KHÔNG, Hãy hủy bỏ!',
                                                            'CÓ, Tôi chắc chắn!'
                                                        ],
                                                        dangerMode: true,
                                                    }).then(function (isConfirm) {
                                                        if (isConfirm) {
                                                            swal({
                                                                title: 'ĐANG XỬ LÝ',
                                                                text: 'Bạn đã xác nhận Xóa đề tài, xin vui lòng đợi phản hồi từ hệ thống!',
                                                                icon: 'success'
                                                            }).then(function () {
                                                                window.location.href = document.getElementById('tagA<s:property value="maDeTai"/>').href;
                                                            });
                                                        } else {
                                                            swal("HỦY BỎ", "Bạn đã hủy bỏ việc xóa đề tài.", "error");
                                                        }
                                                    });
                                                });
                                            </script>
                                        </td>
                                    </tr>
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
                                        td4 = tr[i].getElementsByTagName("td")[0];
                                        td = tr[i].getElementsByTagName("td")[1];
                                        td1 = tr[i].getElementsByTagName("td")[2];
                                        td2 = tr[i].getElementsByTagName("td")[3];
                                        td3 = tr[i].getElementsByTagName("td")[4];
                                        if (td || td1 || td2 || td3) {
                                            if (td.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td1.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td2.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td3.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td4.innerHTML.toUpperCase().indexOf(filter) > -1) {
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
                                var pager = new Pager('results', 15);
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

