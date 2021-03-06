<%-- 
    Document   : tailieu
    Created on : Mar 19, 2018, 11:04:42 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>

        <%@include file="../../mains/head.jsp" %>
        <title>Tài liệu</title> 
       <%    if (session.getAttribute("rule") == null) {
            String l = (String) session.getAttribute("httpURL");
            response.sendRedirect(l + "login.jsp");

        }
    %>
        <%            if (session.getAttribute("getTaiLieuSinhVien") == null) {
        %>
        <s:action name="getTaiLieuSinhVien" executeResult="true" />
        <%
            }
        %>
        <script>
            document.querySelector('#formValidate').addEventListener('submit', function (e) {
                var form = this;
                e.preventDefault();
                swal({
                    title: "ĐĂNG TÀI LIỆU",
                    text: "Bạn có chắc chắn muốn gửi tài liệu này lên hệ thống không?",
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
                            text: 'Bạn đã xác nhận đăng tài liệu, xin vui lòng đợi phản hồi từ hệ thống!',
                            icon: 'success'
                        }).then(function () {
                            form.submit();
                        });
                    } else {
                        swal("HỦY BỎ", "Bạn đã hủy bỏ đăng tài liệu !", "error");
                    }
                });
            });
        </script>

     
    </head>

    <%
        if (session.getAttribute("getTaiLieuSinhVien") != null) {
            session.removeAttribute("getTaiLieuSinhVien");
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
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                <p style="margin: 0px">QUẢN LÝ TÀI LIỆU</p>
                            </div>
                            <%                                if (session.getAttribute("fileMessage") != null) {
                            %>
                            <script type="text/javascript">
                                    swal("Thông báo", "<%=session.getAttribute("fileMessage")%>", "info");
                            </script>
                            <%
                                    session.removeAttribute("fileMessage");
                                }
                            %>
                            <%                                if (session.getAttribute("messageTaiLieuSinhVien") != null) {
                            %>
                            <script type="text/javascript">
                                function mess() {
                                    swal("Thông báo", "<%=session.getAttribute("messageTaiLieuSinhVien")%>", "info");
                                }
                                ;
                            </script>
                            <%
                                    session.removeAttribute("messageTaiLieuSinhVien");
                                }
                            %>
                            <div class="alert alert-warning">
                                <form role="form" id="formValidate" action="UploadFileSinhVien" method="post" enctype = "multipart/form-data"> 
                                    <input  style="margin-bottom: 15px;" class="form-control" name="tenFile" placeholder="Tên tài liệu"/>
                                    <label>Nội dung</label>
                                    <textarea style="margin-bottom: 15px; height: 100px" class="form-control" name="moTa" placeholder="Mô tả tài liệu"></textarea>
                                   <br/>
                                    <select style="margin-bottom: 15px" name="loaiFile" class="form-control" required="true"> 
                                        <option value="Null">Loại tài liệu</option>
                                        <option value="0">CV</option>
                                        <option value="1">Báo cáo quá trình</option>
                                        <option value="2">Báo cáo cuối kỳ</option>
                                        <option value="3">Báo cáo tuần</option>
                                    </select>
                                    <div class="row">
                                        <div class="col-lg-8 col-md-8"> 
                                            <s:textfield  name="myFile" type="file" accept="file/*" onchange="loadFile(event)" required="required"/>
                                        </div>
                                        <div class="col-lg-4 col-md-4" >
                                            <button style="float: right;" class="btn btn-success">Đăng tài liệu</button>
                                        </div>
                                    </div>

                                </form>
                            </div>
                            <%-- up load file --%>
                            <div class="row" >
<!--                                <div class="col-lg-6 " >
                                    <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                         padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                        <p style="margin: 0px">TÀI LIỆU CHUNG/ HỌC TẬP</p>
                                    </div>
                                    <div class="alert alert-success">
                                        <s:iterator value="lstSinhVienFileHT">
                                            <div class="row" style="margin-bottom: 0px">
                                                <div class="col-lg-9">
                                                    <p><s:property value="tenFile"/></p>
                                                </div>
                                                <div class="col-lg-3"> 
                                                    <a href="<s:property value="link"/>"><i class="glyphicon glyphicon-download-alt"></i></a>
                                                    <a  id="tagA<s:property value="id"/>" href="deleteTaiLieuSinhVien?maTaiLieu=<s:property value="id"/>"><i class="glyphicon glyphicon-trash"></i></a>
                                                    <script>
                                                        var action = document.getElementById("tagA<s:property value="id"/>");
                                                        action.addEventListener('click', function (e) {
                                                            var form = this;
                                                            e.preventDefault();
                                                            swal({
                                                                title: "XÓA TÀI LIỆU",
                                                                text: "Bạn có chắc chắn muốn xóa tài liệu <s:property value="tenFile"  escapeHtml="false"/> ra khỏi hệ thống không? ",
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
                                                                        text: 'Bạn đã xác nhận Xóa tài liệu, xin vui lòng đợi phản hồi từ hệ thống!',
                                                                        icon: 'success'
                                                                    }).then(function () {
                                                                        window.location.href = document.getElementById('tagA<s:property value="id"/>').href;
                                                                    });
                                                                } else {
                                                                    swal("HỦY BỎ", "Bạn đã hủy bỏ việc xóa bỏ tài liệu.", "error");
                                                                }
                                                            });
                                                        });
                                                    </script>
                                                </div>
                                            </div>
                                        </s:iterator>
                                    </div>
                                </div>-->
                                <div class="col-lg-12 col-md-12">
                                    <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                         padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                        <p style="margin: 0px">TÀI LIỆU/ BÁO CÁO</p>
                                    </div>
                                    <div class="alert alert-danger">
                                        <s:iterator value="lstSinhVienFileBC">
                                            <div class="row" style="margin-bottom: 0px">
                                                <div class="col-lg-8 col-md-8">
                                                    <p><s:property value="tenFile"/></p>
                                                </div>
                                                <div class="col-lg-4 col-md-4"> 
                                                    <div class="row" style="margin-bottom: 0px">
                                                        <div class=" col-lg-6 col-md-6">
                                                            <a href="<s:property value="link"/>"><i class="glyphicon glyphicon-download-alt"></i></a>
                                                        </div>
                                                        <div class="col-lg-6 col-md-6">
                                                            <a id="tagA<s:property value="id"/>" href="deleteTaiLieuSinhVien?maTaiLieu=<s:property value="id"/>"><i class="glyphicon glyphicon-trash"></i></a>
                                                        </div>
                                                    </div>
                                                    <script>
                                                        var action = document.getElementById("tagA<s:property value="id"/>");
                                                        action.addEventListener('click', function (e) {
                                                            var form = this;
                                                            e.preventDefault();
                                                            swal({
                                                                title: "XÓA TÀI LIỆU",
                                                                text: "Bạn có chắc chắn muốn xóa tài liệu <s:property value="tenFile"  escapeHtml="false"/> ra khỏi hệ thống không? ",
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
                                                                        text: 'Bạn đã xác nhận Xóa tài liệu, xin vui lòng đợi phản hồi từ hệ thống!',
                                                                        icon: 'success'
                                                                    }).then(function () {
                                                                        window.location.href = document.getElementById('tagA<s:property value="id"/>').href;
                                                                    });
                                                                } else {
                                                                    swal("HỦY BỎ", "Bạn đã hủy bỏ việc xóa bỏ tài liệu.", "error");
                                                                }
                                                            });
                                                        });
                                                    </script>
                                                </div>
                                            </div>
                                        </s:iterator>
                                    </div>
                                </div>
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