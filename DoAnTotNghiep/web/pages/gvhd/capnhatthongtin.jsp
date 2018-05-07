<%-- 
    Document   : thongtingiangvien
    Created on : Mar 13, 2018, 9:28:50 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cập nhật thông tin</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <script src="./pages/libs/js/sonnc.js"></script>
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
        <%    if (session.getAttribute("getInfoGVHD") == null) {
        %>
        <s:action name="getInfoGVHD" executeResult="true"/>
        <%
            }
        %>
        <script>
            setTimeout(function () {
                $('body').removeClass('preloading');
                $('#preload').delay(1000).fadeOut('fast');
            }, 1000);
        </script>
    </head>
    <%
        if (session.getAttribute("getInfoGVHD") != null) {
            session.removeAttribute("getInfoGVHD");
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
                        <div class="col-lg-8">
                            <%                                if (session.getAttribute("messageUpdateInfo") != null) {
                            %>
                            <script type="text/javascript">
                                swal("Thông báo", "<%=session.getAttribute("messageUpdateInfo")%>", "info");
                            </script>
                            <%
                                    session.removeAttribute("messageUpdateInfo");
                                }
                            %>
                            <form role="form" id="formValidate" action="updateThongTinCaNhanGVHD" method="post" enctype = "multipart/form-data"> 
                                <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                     padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                    <p style="margin: 0px">THÔNG TIN CÁ NHÂN</p>
                                </div>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" value="%{gvhd.hoTen}" name="gvhd.hoTen" readonly="true" placeholder="Họ và tên" required="true"/>
                                        <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" value="%{gvhd.khoaVien}" name="gvhd.khoaVien" readonly="true"  placeholder="Khoa viện" required="true"/>
                                        <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" value="%{gvhd.boMon}" name="gvhd.boMon" readonly="true"  placeholder="Bộ môn" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="gvhd.email" readonly="true" value="<%=session.getAttribute("email")%>"/>
                                        <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control"  value="%{gvhd.dienThoai}" name="gvhd.dienThoai" placeholder="Điện thoại" required="true"/>
                                        <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" value="%{gvhd.diaChi}" name="gvhd.diaChi" placeholder="Địa chỉ" required="true"/>
                                    </div>
                                    <div class="col-lg-4">
                                        <p>Ảnh đại diện</p>
                                        <img src="<s:url  value="%{gvhd.avatar}"/>" style="height: 120px; width: 120px; border-radius: 100%; margin-bottom: 10px" />
                                    </div>
                                </div> 
                                <div class="row">
                                    <style>
                                        textarea{
                                            resize: none;
                                        }
                                    </style>
                                    <div class="col-lg-12">
                                        <label>Công trình nghiên cứu</label>
                                        <s:textarea  value="%{gvhd.congTrinhNghienCuu}"  name="gvhd.congTrinhNghienCuu" required="true" cssStyle="height: 100px; margin-bottom: 30px" cssClass="form-control"></s:textarea>
                                            <div class="clear"></div>
                                            <label>Sách xuất bản</label>
                                        <s:textarea value="%{gvhd.sachXuatBan}" name="gvhd.sachXuatBan" required="true" cssStyle="height: 100px; margin-bottom: 30px" cssClass="form-control"></s:textarea>
                                            <label>Các môn giảng dạy</label>
                                        <s:textarea value="%{gvhd.monGiangDay}" name="gvhd.monGiangDay" required="true" cssStyle="height:100px; margin-bottom: 30px" cssClass="form-control" ></s:textarea>
                                            <label>Nội dung khác</label>
                                        <s:textarea value="%{gvhd.khac}" name="gvhd.khac" required="true" cssStyle="height:100px; margin-bottom: 30px" cssClass="form-control"></s:textarea>
                                        </div>
                                    </div>
                                    <script>
                                        document.querySelector('#formValidate').addEventListener('submit', function (e) {
                                            var form = this;
                                            e.preventDefault();
                                            swal({
                                                title: "CẬP NHẬT THÔNG TIN",
                                                text: "Bạn có chắc chắn muốn cập nhật thông tin cá nhân không?",
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
                                                        text: 'Bạn đã xác nhận cập nhật thông tin các nhân, xin vui lòng đợi phản hồi từ hệ thống!',
                                                        icon: 'success'
                                                    }).then(function () {
                                                        form.submit();
                                                    });
                                                } else {
                                                    swal("HỦY BỎ", "Bạn đã hủy bỏ việc cập nhật thông tin cá nhân.", "error");
                                                }
                                            });
                                        });
                                    </script>
                                    <button style="float: right;" class="btn btn-success">CẬP NHẬT THÔNG TIN CÁ NHÂN</button>
                                </form>
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
    <%
    }
    %>
</html>

