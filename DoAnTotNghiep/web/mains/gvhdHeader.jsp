<%-- 
    Document   : gvhdHeader
    Created on : Mar 20, 2018, 5:10:15 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                                <a href="<%=request.getContextPath()%>/home.jsp">Trang chủ</a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Sinh viên<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="<%=session.getAttribute("httpURL")%>pages/gvhd/danhsachsinhvien.jsp">Danh sách sinh viên</a></li>
                                    <li><a href="<%=session.getAttribute("httpURL")%>pages/gvhd/detaisinhvien.jsp">Đề tài sinh viên</a> </li>
                                    <li><a href="<%=session.getAttribute("httpURL")%>pages/gvhd/baocao.jsp">Báo cáo - Đánh giá</a></li>
                                    <li><a href="<%=session.getAttribute("httpURL")%>pages/gvhd/diemthi.jsp">Điểm thi</a></li>
                                    <li><a href="<%=session.getAttribute("httpURL")%>pages/gvhd/file.jsp">File</a></li>
                                    <li><a href="<%=session.getAttribute("httpURL")%>pages/gvhd/lichtrinh.jsp">Lịch trình</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Công ty<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="<%=session.getAttribute("httpURL")%>pages/gvhd/danhsachcongty.jsp">Danh sách công ty</a></li>
                                    <li><a href="<%=session.getAttribute("httpURL")%>pages/gvhd/detaicongty.jsp">Đề tài công ty</a> </li>
                                </ul>
                            </li>
                            <li><a href="<%=session.getAttribute("httpURL")%>pages/gvhd/email.jsp">Email</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false"><img style="width: 25px; height: 25px" src="./pages/libs/img/avatar.png"></a>
                                <ul class="dropdown-menu">
                                    <li><a><p style="color: red"><%=session.getAttribute("email").toString()%></p></a></li>
                                    <li><a href="<%=session.getAttribute("httpURL")%>pages/gvhd/capnhatthongtin.jsp">Cập nhật thông tin</a></li>
                                    <li><a href="<%=session.getAttribute("httpURL")%>resetpassword.jsp">Đổi mật khẩu</a></li>
                                    <li><a href="logout">Đăng xuất</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

