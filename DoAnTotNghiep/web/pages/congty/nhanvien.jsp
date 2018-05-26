<%-- 
    Document   : nhanvien
    Created on : Mar 20, 2018, 7:37:26 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách nhân viên</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <%    if (session.getAttribute("rule") == null) {
                String l = (String) session.getAttribute("httpURL");
                response.sendRedirect(l + "login.jsp");
                return;
            }
        %>
        <style>
            .error{
                color: red;
                text-orientation: initial;
            }
        </style>
        <%            if (session.getAttribute("GetAllNguoiHuongDanByCongTy") == null) {

        %>
        <s:action name="GetAllNguoiHuongDanByCongTy" executeResult="true"/>
        <%            }
        %>
        <script>
            window.onload = function () {
                setTimeout(function () {
                    $('body').removeClass('preloading');
                    $('#preload').delay(1000).fadeOut('fast');
                }, 0);
            };
        </script>
    </head>
    <%
        if (session.getAttribute("GetAllNguoiHuongDanByCongTy") != null) {
            session.removeAttribute("GetAllNguoiHuongDanByCongTy");
    %>
    <body>
        <div id="wrapper">
            <%@include file="../../mains/mainHeader.jsp" %>
            <%@include file="../../mains/banner.jsp" %>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <%                                if (session.getAttribute("messageDeleteDetai") != null) {
                            %>
                            <script type="text/javascript">
                                swal("Thông báo", "<%=session.getAttribute("messageDeleteDetai")%>", "info");
                            </script>
                            <%
                                    session.removeAttribute("messageDeleteDetai");
                                }
                            %>
                            <%                                if (session.getAttribute("messageAddAcount") != null) {
                            %>
                            <script type="text/javascript">
                                swal("Thông báo", "<%=session.getAttribute("messageAddAcount")%>", "info");
                            </script>
                            <%
                                    session.removeAttribute("messageAddAcount");
                                }
                            %>
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 25px">
                                <p style="margin: 0px">DANH SÁCH NHÂN VIÊN CÔNG TY</p>
                            </div>
                            <div>
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
                                <div class="row">
                                    <div class="col-lg-6">
                                        <a class="btn-open-popup" href=""><input class="btn btn-success" value="Thêm nhân viên"/></a>
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
                                                        <form role="form" id="formValidate" action="AddAcountNguoiHuongDan" method="post" enctype = "multipart/form-data"> 
                                                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                                                <p style="margin: 0px">THÊM NHÂN VIÊN MỚI</p>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <div class="row">
                                                                        <div class="col-lg-6">
                                                                            <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="nhd.hoTen" placeholder="Họ tên" required="true"/>
                                                                            <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="nhd.chucvu" placeholder="Chức vụ" required="true"/>
                                                                            <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="nhd.dienThoai" placeholder="Điện thoại" required="true"/>
                                                                            <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="nhd.email" placeholder="Email" required="true"/>
                                                                            <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="nhd.diaChi" placeholder="Địa chỉ" required="true"/>
                                                                        </div>
                                                                        <div class="col-lg-6">
                                                                            <p>Ảnh đại diện</p>
                                                                            <img id="output" style="height: 120px; width: 120px; border-radius: 100%; margin-bottom: 10px" />
                                                                            <s:textfield  name="myFile" type="file" accept="image/*" onchange="loadFile(event)" required="required"/>
                                                                            <script>
                                                                                var loadFile = function (event) {
                                                                                    var reader = new FileReader();
                                                                                    reader.onload = function () {
                                                                                        var output = document.getElementById('output');
                                                                                        output.src = reader.result;
                                                                                    };
                                                                                    reader.readAsDataURL(event.target.files[0]);
                                                                                };
                                                                            </script>
                                                                        </div>
                                                                    </div>
                                                                    <label>Lĩnh vực hoạt động</label>
                                                                    <textarea style="margin-bottom: 15px;height: 150px;" class="form-control" name="nhd.linhVucHoatDong" placeholder="Lĩnh vực hoạt động"></textarea>
                                                                    <div style="margin-top: 25px"></div>
                                                                    <label>Dự án</label>
                                                                    <textarea style="margin-bottom: 15px;height: 150px;" class="form-control" name="nhd.duAn" placeholder="Các dự án"></textarea>
                                                                </div>
                                                            </div> 
                                                            <input type="submit" class="btn btn-success" value="THÊM NHÂN VIÊN"/>
                                                            <script>
                                                                document.querySelector('#formValidate').addEventListener('submit', function (e) {
                                                                    var form = this;
                                                                    e.preventDefault();
                                                                    swal({
                                                                        title: "THÊM MỚI NHÂN VIÊN",
                                                                        text: "Bạn có chắc chắn muốn thêm nhân viên này làm người hướng dẫn không?",
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
                                                                                text: 'Bạn đã đồng ý, xin vui lòng đợi phản hồi từ hệ thống!',
                                                                                icon: 'success'
                                                                            }).then(function () {
                                                                                form.submit();
                                                                            });
                                                                        } else {
                                                                            swal("HỦY BỎ", "Bạn đã hủy bỏ việc thêm nhân viên này!", "error");
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
                                    <div class="col-lg-6">
                                        <input onkeyup="myFunction()" class="form-control" id="myInput" style="float: right; width: 100%; margin-bottom: 15px" placeholder="Tìm kiếm.." type="text">
                                    </div>
                                </div>
                            </div>
                            <style>
                                td, th{padding: 5px}
                            </style>
                            <table id="myTable" border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                                <tr>
                                    <th><strong> Mã NV </strong></th>
                                    <th><strong> Họ và tên </strong></th>
                                    <th><strong> Chức vụ </strong></th>
                                    <th><strong> Điện thoại </strong></th>
                                    <th><strong> Email </strong></th>
                                </tr>
                                <s:iterator value="lstNguoiHuongDans">
                                    <tr>
                                        <td><s:property value="maGvhd"/></td>
                                        <td><s:property value="hoTen"/></td>
                                        <td><s:property value="chucvu"/></td>
                                        <td><s:property value="dienThoai"/></td>
                                        <td><s:property value="email"/></td>
                                    </tr>
                                </s:iterator>
                            </table>
                            <script>
                                function myFunction() {
                                    // Declare variables 
                                    var input, filter, table, tr, td, i;
                                    var td1, td2, td3;
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
                                        if (td || td1 || td2 || td3) {
                                            if (td.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td1.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td2.innerHTML.toUpperCase().indexOf(filter) > -1 ||
                                                    td3.innerHTML.toUpperCase().indexOf(filter) > -1) {
                                                tr[i].style.display = "";
                                            } else {
                                                tr[i].style.display = "none";
                                            }
                                        }
                                    }
                                }
                            </script>
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

