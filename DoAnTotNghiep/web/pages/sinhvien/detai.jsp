<%-- 
    Document   : detai
    Created on : Mar 6, 2018, 11:21:33 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../../mains/head.jsp" %>
        <link href="./pages/libs/css/sweetalert.css" rel="stylesheet" />
        <%    if (session.getAttribute("getAllDeTai") == null) {
        %>
        <s:action name="getAllDeTai" executeResult="true"/>
        <%
            }
        %>

    </head>
    <%
        if (session.getAttribute("getAllDeTai") != null) {
            session.removeAttribute("getAllDeTai");
    %>
    <body onLoad="mess()">
        <div id="wrapper">
            <%@include file="../../mains/mainHeader.jsp" %>
            <%@include file="../../mains/banner.jsp" %>
            <section id="content">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-8">
                            <%                                if (session.getAttribute("messageDangKyDeTai") != null) {
                            %>
                            <script type="text/javascript">
                                function mess() {
                                    swal("Thông báo", "<%=session.getAttribute("messageDangKyDeTai")%>", "info");
                                }
                                ;
                            </script>
                            <%
                                }
                                session.removeAttribute("messageDangKyDeTai");
                            %>

                            <s:iterator value="lstDeTai">
                                <div class="row" style="margin: 0px">
                                    <div class="col-lg-2">
                                        <img src="<s:property value="logo"/>" alt="" class="img-responsive" style="height: 100%; width: 100%" />
                                    </div>
                                    <div class="col-lg-8">
                                        <article style="margin-bottom: 0px; padding-bottom: 0px">
                                            <div class="post-image" style="margin: 0px">
                                                <div class="post-heading">
                                                    <p style="margin: 0;"><a href="<%session.getAttribute("URL");%>getDeTaiInfo?maDeTai=<s:property value="maDeTai"/>"><strong><s:property value="tenDeTai"/></strong></a></p>
                                                </div>
                                            </div>
                                            <p style="margin: 0;"><strong>Công ty: </strong><a href="chiTietCongTy?maCongTy=<s:property value="maCongTy"/>"><s:property value="tenCongTy"/></a></p>
                                            <p style="margin: 0;"><strong>Nội dung: </strong><s:property value="noiDung"/></p>
                                            <p style="margin: 0;"><strong>Yêu cầu lập trình: </strong><s:property value="yeuCauLapTrinh"/></p>
                                            <p style="margin: 0;"><strong>Yêu cầu khác: </strong><s:property value="yeuCauKhac"/></p>
                                            <div style="margin-bottom: 20px">
                                                <ul class="meta-post">
                                                    <li style="padding-right: 0px"><i class="fa fa-calendar"></i><a>Ngày đăng: <s:property value="ngayDang"/></a></li>
                                                    <li style="padding-right: 0px"><i class="fa fa-calendar-o"></i><a>Hạn đăng ký: <s:property value="hanDangKy"/></a></li>
                                                    <li style="padding-right: 0px"><i class="fa fa-users"></i><a>Số lượng: <s:property value="soLuong"/></a></li>
                                                </ul>
                                            </div>
                                        </article>
                                    </div> 
                                    <form action="dangkydetai" method="post" id="from<s:property value="maDeTai"/>">
                                        <div class="col-lg-2">
                                            <input name="maDeTai" value="<s:property value="maDeTai"/>" style="height: 0px; width: 0px;display: contents;" />
                                            <p><strong style="color: blue"><s:property value="soLuongCon"/></strong>/<strong style="color: red"><s:property value="soLuong"/></strong></p>
                                            <input class="form-control" name="dotThucTap" placeholder="Đợt thực tập" required="true" style="padding: 0px 4px; font-size: 13px"/>
                                            <button class="btn btn-info" style="width: 100%; margin-top: 10px">Đăng ký</button>
                                        </div>
                                    </form>
                                </div>
                                <script>
                                    document.querySelector('#from<s:property value="maDeTai"/>').addEventListener('submit', function (e) {
                                        var form = this;
                                        e.preventDefault();
                                        swal({
                                            title: "ĐĂNG KÝ ĐỀ TÀI",
                                            text: "Bạn đồng ý đăng ký đề tài: <s:property value="tenDeTai" escapeHtml="false"/> chứ?",
                                            icon: "warning",
                                            buttons: [
                                                'KHÔNG, Hãy hủy bỏ!',
                                                'CÓ, Tôi chắc chắn!'
                                            ],
                                            dangerMode: true,
                                        }).then(function (isConfirm) {
                                            if (isConfirm) {
                                                swal({
                                                    title: 'ĐĂNG KÝ',
                                                    text: 'Bạn đã gửi đăng ký thành công, xin vui lòng đợi phản hồi từ hệ thống!',
                                                    icon: 'success'
                                                }).then(function () {
                                                    form.submit();
                                                });
                                            } else {
                                                swal("HỦY BỎ", "Bạn đã hủy đăng ký đề tài !", "error");
                                            }
                                        });
                                    });
                                </script>
                            </s:iterator>
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
    <%
        }%>
</html>
