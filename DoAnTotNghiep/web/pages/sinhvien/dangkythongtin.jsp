<%-- 
    Document   : dangkythongtin
    Created on : Mar 6, 2018, 11:23:02 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng ký thông tin</title>
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
         <script>
                setTimeout(function () {
                    $('body').removeClass('preloading');
                    $('#preload').delay(1000).fadeOut('fast');
                }, 1000);
        </script>
    </head>
    <body class="preloading">
        <div id="preload" class="preload-container text-center">
            <span class="glyphicon glyphicon-refresh preload-icon rotating" style="font-size: 120px"></span>
        </div>
        <div id="wrapper">
            <header>
                <div class="navbar navbar-default navbar-static-top">
                    <div class="container">
                        <div class="row" style="margin: 0 0 0 0;">
                            <div class="col-lg-6">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>

                                </div>
                                <a class="navbar-brand" href="<%=request.getContextPath()%>/home.jsp"><img src="./pages/libs/img/logoEn.png" alt="" style="width: 100%; height: 100%"/></a>
                            </div>
                            <div class="col-lg-6">
                                <div class="navbar-collapse collapse ">
                                    <ul class="nav navbar-nav">
                                        <li class="dropdown active">
                                            <a href="logout">ĐĂNG XUẤT</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <%@include file="../../mains/banner.jsp" %>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <%                                if (session.getAttribute("messageRegister") != null) {
                        %>
                        <script type="text/javascript">
                            swal("Thông báo", "<%=session.getAttribute("messageRegister")%>", "info");
                        </script>
                        <%
                                session.removeAttribute("messageRegister");
                            }
                        %>
                            <form role="form" id="formValidate" action="sinhVienDangKyThongTin" method="post" enctype = "multipart/form-data"> 
                                <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                     padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                    <p style="margin: 0px">THÔNG TIN CÁ NHÂN</p>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="sinhVien.hoTen" placeholder="Họ và tên" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="sinhVien.lop" placeholder="Lớp" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="sinhVien.khoa" placeholder="Khóa" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="sinhVien.khoaVien" placeholder="Khoa/ Viện" required="true"/>
                                        <select style="margin-bottom: 15px;height: 45px;" name="sinhVien.gioiTinh" class="form-control" required="required"> 
                                            <option>Giới tính</option>
                                            <option value="true">Nam</option>
                                            <option value="false">Nữ</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-4">
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="ngaySinh" placeholder="Ngày sinh" required="true" />
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="sinhVien.diaChi" placeholder="Địa chỉ" required="true" />
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="sinhVien.dienThoai" placeholder="Điện thoại" required="true" />
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="sinhVien.email" placeholder="Email" value="<%=session.getAttribute("email")%>" readonly="readonly" required="true" />
                                        <select style="margin-bottom: 15px;height: 45px;" name="sinhVien.laptop" class="form-control" required="true"> 
                                            <option value="Null">LapTop</option>
                                            <option value="True">Có</option>
                                            <option value="False">Không</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-4">
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
                                    <style>
                                        textarea{
                                            resize: none;
                                        }
                                    </style>
                                    <div class="col-lg-6">
                                        <label>Ngoại ngữ</label>
                                        <textarea name="sinhVienInfo.ngoaiNgu" required style="height: 100px; margin-bottom: 30px" class="form-control" placeholder="Các chứng chỉ Tiếng anh, Tiếng pháp, Tiếng nhật,...."></textarea>
                                        <div class="clear"></div>
                                        <label>Kỹ năng lập trình</label>
                                        <textarea name="sinhVienInfo.kyNangLt" required style="height: 100px; margin-bottom: 30px" class="form-control" placeholder="Bạn có các kỹ năng lập trình nào? Hãy viết tất cả các kỹ năng mà bạn có theo hướng dẫn ở trên."></textarea>
                                        <label>Kỹ năng mềm/ kỹ năng khác</label>
                                        <textarea name="sinhVienInfo.kyNangKhac" required style="height:100px; margin-bottom: 30px" class="form-control" placeholder="Bạn có các kỹ năng mềm nào? Kỹ năng, tình nguyện, văn phòng,..."></textarea>
                                        <label>Mục tiêu</label>
                                        <textarea name="sinhVienInfo.mucTieu" required style="height:100px; margin-bottom: 30px" class="form-control" placeholder="Mục tiêu của bạn trước - trong - sau khi được thực tập tại doanh nghiệp?"></textarea>
                                    </div>
                                    <div class="col-lg-6">
                                        <label>Hoạt động</label>
                                        <textarea name="sinhVienInfo.hoatDong" required style="height:100px; margin-bottom: 30px" class="form-control" placeholder="Bạn tham gia các hoạt động nào? Hãy kể ra các hoạt động của bạn."></textarea>
                                        <label>Giải thưởng</label>
                                        <textarea name="sinhVienInfo.giaiThuong" required style="height: 100px; margin-bottom: 30px" class="form-control" placeholder="Bạn có những giải thưởng nào? Học tập, học bổng, nghiên cứu,...?"></textarea>
                                        <label>Sở thích</label>
                                        <textarea name="sinhVienInfo.soThich" required style="height: 100px; margin-bottom: 30px" class="form-control" placeholder="Bạn có những ở thích gì? Hãy kể ra một vài sở thích tiêu biểu?"></textarea>
                                        <label>Dự án</label>
                                        <textarea name="sinhVienInfo.duAn" required style="height: 100px; margin-bottom: 30px" class="form-control" placeholder="Bạn đã tham gia các dự án nào? Tên dự án, vị trí, vai trò, sản phẩm,...."></textarea>
                                    </div>

                                </div>
                                <input type="submit" class="btn btn-success" value="Đăng ký thông tin"/>
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
</html>

