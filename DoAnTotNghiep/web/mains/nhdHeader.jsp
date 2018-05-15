<%-- 
    Document   : nhdHeader
    Created on : Mar 20, 2018, 5:10:27 PM
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
                                    <li><a href="<%=session.getAttribute("httpURL")%>pages/nhd/danhsachsinhvien.jsp">Danh sách sinh viên</a></li>
                                    <li><a href="<%=session.getAttribute("httpURL")%>pages/nhd/danhgia.jsp">Đánh giá</a></li>
                                    <li><a href="<%=session.getAttribute("httpURL")%>pages/nhd/danhgia.jsp">Chấm công</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false">Công ty<i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="<%=session.getAttribute("httpURL")%>pages/nhd/danhsachsinhvien.jsp">Thông tin</a></li>
                                    <li><a href="<%=session.getAttribute("httpURL")%>pages/nhd/diemthi.jsp">Đề tài</a></li>
                                </ul>
                            </li>
                            <li><a href="<%=session.getAttribute("httpURL")%>pages/nhd/email.jsp">Email</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle " data-toggle="dropdown" data-hover="dropdown" data-delay="0" data-close-others="false"><img style="width: 25px; height: 25px" src="./pages/libs/img/avatar.png"></a>
                                <ul class="dropdown-menu">
                                    <li><a><p style="color: red"><%=session.getAttribute("email").toString()%></p></a></li>
                                    <li><a href="<%=session.getAttribute("httpURL")%>pages/nhd/thongtincanhan.jsp">Thông tin cá nhân</a></li>
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

