<%-- 
    Document   : home
    Created on : Feb 26, 2018, 9:42:24 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hệ thống đăng ký thực tập trực tuyến - HUST</title>
        <%@include file="mains/head.jsp" %> 
        <script src="./pages/libs/js/jquery.min.js"></script>
        <%    if (session.getAttribute("rule") == null) {
                String l = (String) session.getAttribute("httpURL");
                response.sendRedirect(l + "login.jsp");
                return;
            }
        %>
        <%            if (session.getAttribute("GetAllThongBao") == null) {

        %>
        <s:action name="GetAllThongBao" executeResult="true"/>
        <%            }
        %>
        <script>
            setTimeout(function () {
                $('body').removeClass('preloading');
                $('#preload').delay(1000).fadeOut('fast');
            }, 1000);
        </script>
    </head>
    <%
        if (session.getAttribute("GetAllThongBao") != null) {
            session.removeAttribute("GetAllThongBao");
    %>
    <body>
        <div id="wrapper">
            <%@include file="mains/mainHeader.jsp" %>
            <%@include file="mains/banner.jsp" %>
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
                            <s:iterator value="lstThongBao">
                                <div class="row" style="margin: 0px">
                                    <div class="col-lg-2">
                                        <img src="<s:property value="photoLink"/>" alt="" class="img-responsive" style="height: 100%; width: 100%" />
                                    </div>
                                    <div class="col-lg-10">
                                        <article style="margin-bottom: 0px; padding-bottom: 0px">
                                            <div class="post-image">
                                                <div class="post-heading">
                                                    <h4 style="margin-bottom: -10px"><a href="detail?id=<s:property value="id"/>"><s:property value="tieuDe"/></a></h4>
                                                </div>
                                            </div>
                                            <div style="text-overflow: ellipsis;word-wrap: break-word;
                                               overflow: hidden;max-height: 6.6em;line-height: 1.8em; margin-bottom: 0px;
                                               font-family:Open Sans, Arial, sans-serif;font-size:14px;font-weight:300;line-height:1.6em;color:#656565;">
                                                <s:property value="noiDung" escapeHtml="false"/>
                                            </div>
                                            <p><strong>. . .</strong></p>
                                            <div class="bottom-article" style="padding: 0px; margin-top: 0px; float: right; margin-bottom: 20px; border-bottom-color: red">
                                                <ul class="meta-post">
                                                    <li><i class="fa fa-calendar"></i><a href="javascript:void(0)"><s:property value="ngayThang"/></a></li>
                                                    <li><i class="fa fa-user"></i><a href="javascript:void(0)"><s:property value="nguoiDang"/></a></li>
                                                </ul>
                                            </div>
                                        </article>
                                    </div>
                                </div>
                            </s:iterator>
                            
                            <div style="margin-top: 25px"></div>
                            <div class="clear"></div>
                            <div id="pagination">
                                <span class="all">Page 1 of 3</span>
                                <span class="current">1</span>
                                <a href="#" class="inactive">2</a>
                                <a href="#" class="inactive">3</a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <%@include file="mains/RightSidebar.jsp" %>
                    </div>
                </div>
            </section>
        </div>   
        <%@include file="mains/footer.jsp" %>
        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
            <%@include file="mains/js.jsp" %>
    </body>
    <%
        }
    %>
</html>
