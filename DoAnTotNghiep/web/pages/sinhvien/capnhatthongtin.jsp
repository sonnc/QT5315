<%-- 
    Document   : capnhatthongtin
    Created on : Mar 6, 2018, 11:22:30 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cập nhật thông tin cá nhân</title>
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
        <%    if (session.getAttribute("getSinhVienThongTinByClass") == null) {
        %>
        <s:action name="getSinhVienThongTinByClass" executeResult="true"/>
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
        if (session.getAttribute("getSinhVienThongTinByClass") != null) {
            session.removeAttribute("getSinhVienThongTinByClass");
    %>

    <body class="preloading">
        <div id="preload" class="preload-container text-center">
            <span class="glyphicon glyphicon-refresh preload-icon rotating" style="font-size: 120px"></span>
        </div>
        <%@include file="../../mains/mainHeader.jsp" %>
        <%@include file="../../mains/banner.jsp" %>
        <section id="content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <%                                if (session.getAttribute("messageUpdateInfoSV") != null) {
                        %>
                        <script type="text/javascript">
                            swal("Thông báo", "<%=session.getAttribute("messageUpdateInfoSV")%>", "info");
                        </script>
                        <%
                                session.removeAttribute("messageUpdateInfoSV");
                            }
                        %>
                        <form role="form" id="formValidate" action="SinhVienCapNhatThongTin" method="post" enctype = "multipart/form-data"> 
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                <p style="margin: 0px">THÔNG TIN CÁ NHÂN</p>
                            </div>
                            <div class="row">    
                                <%--   <s:iterator value="sinhVien"> --%>
                                <div class="col-lg-4">
                                    <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" name="sinhVien.hoTen" readonly="true" value="%{sinhVien.hoTen}" placeholder="Họ và tên" required="true"/>
                                    <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" name="sinhVien.lop" readonly="true" value="%{sinhVien.lop}" placeholder="Lớp" required="true"/>
                                    <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" name="sinhVien.khoa" readonly="true"  value="%{sinhVien.khoa}" placeholder="Khóa" required="true"/>
                                    <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" name="sinhVien.khoaVien" readonly="true"  value="%{sinhVien.khoaVien}" placeholder="Khoa/ Viện" required="true"/>

                                </div>
                                <div class="col-lg-4">
                                    <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" name="sinhVien.ngaySinh"  readonly="true" value="%{sinhVien.ngaySinh}" placeholder="Ngày sinh" />
                                    <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" name="sinhVien.diaChi"  readonly="true" value="%{sinhVien.diaChi}" placeholder="Địa chỉ" required="true" />
                                    <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" name="sinhVien.dienThoai"  readonly="true" value="%{sinhVien.dienThoai}" placeholder="Điện thoại" required="true" />
                                    <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" name="sinhVien.email"  readonly="true" value="%{sinhVien.email}" placeholder="Email" required="true" />

                                </div>
                                <div class="col-lg-4">
                                    <p>Ảnh đại diện</p>
                                    <img src="%{sinhVien.avatar}" id="output" style="height: 120px; width: 120px; border-radius: 100%; margin-bottom: 10px" />

                                </div>
                                <%--  </s:iterator> --%>
                            </div> 
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                <p style="margin: 0px">THÔNG TIN CHI TIẾT</p>
                            </div>
                            <div style="border: 1px solid red;padding: 0px 0px 0px 10px; margin-bottom: 30px">
                                <p style="color: red">Hãy cập nhật đầy đủ thông tin mà bạn có để 
                                    làm tăng khả năng được phê duyệt và CV của bạn cũng đảm bảo hơn.</p>
                                <p style="color: red">Đối với phần: <strong>Kỹ năng lập trình</strong>, các bạn phải thực hiện đúng cú pháp sau.
                                    Nếu sai, mọi so khớp của các bạn không thành công. <strong>Cú pháp: [abc.xyz]</strong>
                                    Mỗi một kỹ năng sẽ được bao bọc bởi dấu ngoặc vuông viết liền không dấu. Trong đó: abc là ngôn ngữ, xyz thể hiện trình độ.
                                    Ví dụ: [java.tot][php.kha]<br/>
                                    Trình độ bao gồm các mức sau:<strong>thanhthao - Thành thạo; tot - Tốt; kha - Khá; biet - Biết; khongbiet - Không biết</strong></p>
                            </div>

                            <div class="row">
                                <div class="col-lg-12">
                                    <label>Ngoại ngữ</label>
                                    <s:textarea name="sinhVienInfo.ngoaiNgu"  value="%{sinhVienInfo.ngoaiNgu}" required="true" cssStyle="height: 100px; margin-bottom: 30px" cssClass="form-control"/>
                                </div>
                                <div class="col-lg-12">
                                    <label>Kỹ năng lập trình</label>
                                    <s:textarea readonly="true" name="sinhVienInfo.kyNangLt"  value="%{sinhVienInfo.kyNangLt}" required="true" cssStyle="height: 100px; margin-bottom: 30px" cssClass="form-control" />
                                </div>
                                <div class="col-lg-12">
                                    <label>Kỹ năng mềm/ kỹ năng khác</label>
                                    <s:textarea name="sinhVienInfo.kyNangKhac"  value="%{sinhVienInfo.kyNangKhac}" required="true" cssStyle="height:100px; margin-bottom: 30px" cssClass="form-control" />
                                </div>
                                <div class="col-lg-12">
                                    <label>Mục tiêu</label>
                                    <s:textarea name="sinhVienInfo.mucTieu"  value="%{sinhVienInfo.mucTieu}" required="true" cssStyle="height:100px; margin-bottom: 30px" cssClass="form-control" />
                                </div>
                                <div class="col-lg-12">
                                    <label>Hoạt động</label>
                                    <s:textarea name="sinhVienInfo.hoatDong"  value="%{sinhVienInfo.hoatDong}" required="true" cssStyle="height:100px; margin-bottom: 30px" cssClass="form-control"/>
                                </div>
                                <div class="col-lg-12">
                                    <label>Giải thưởng</label>
                                    <s:textarea name="sinhVienInfo.giaiThuong"  value="%{sinhVienInfo.giaiThuong}"  required="true" cssStyle="height: 100px; margin-bottom: 30px" cssClass="form-control" />
                                </div>
                                <div class="col-lg-12">
                                    <label>Sở thích</label>
                                    <s:textarea name="sinhVienInfo.soThich"  value="%{sinhVienInfo.soThich}"  required="true" cssStyle="height: 100px; margin-bottom: 30px" cssClass="form-control" />
                                </div>
                                <div class="col-lg-12">
                                    <label>Dự án</label>
                                    <s:textarea name="sinhVienInfo.duAn" value="%{sinhVienInfo.duAn}" required="true" cssStyle="height: 100px; margin-bottom: 30px" cssClass="form-control" />
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
                            </div> 
                            <button style="float: right;" class="btn btn-success">CẬP NHẬT THÔNG TIN</button>
                        </form>

                        <div class="clear"></div>

                    </div>  
                    <%@include file="../../mains/RightSidebar.jsp" %>
                </div>
            </div>
        </section>
        <%@include file="../../mains/footer.jsp" %>
        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
            <%@include file="../../mains/js.jsp" %>
    </body>
    <%    }
    %>
</html>


