<%-- 
    Document   : capnhatcongty
    Created on : Mar 13, 2018, 9:27:56 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật công ty</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
    
        <%    if (session.getAttribute("rule") == null) {
                String l = (String) session.getAttribute("httpURL");
                response.sendRedirect(l + "login.jsp");
                return;
            }
        %>
        <%            if (session.getAttribute("getInfoCongTyByDDCT") == null) {
        %>
        <s:action name="getInfoCongTyByDDCT" executeResult="true"/>
        <%
            }
        %>
    </head>
    <%
        if (session.getAttribute("getInfoCongTyByDDCT") != null) {
            session.removeAttribute("getInfoCongTyByDDCT");
    %>
    <body onLoad="mess()" class="preloading">
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
                            <%                                if (session.getAttribute("updateCongTy") != null) {
                            %>
                            <script type="text/javascript">
                                    swal("Thông báo", "<%=session.getAttribute("updateCongTy")%>", "info");
                            </script>
                            <%
                                    session.removeAttribute("updateCongTy");
                                }
                            %>
                            <form role="form" action="updateCongTyByDDCT" method="post" id="formValidate"> 
                                <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                     padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                    <p style="margin: 0px">ĐĂNG KÝ THÔNG TIN CÔNG TY</p>
                                </div>
                                <div class="row">
                                    <div class="col-lg-8 col-md-8">
                                        <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" value="%{ct.tenCongTy}" name="ct.tenCongTy" placeholder="Tên công ty" required="true" readonly="true"></s:textfield>
                                        <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" value="%{ct.diaChi}" name="ct.diaChi" placeholder="Địa chỉ" required="true" readonly="true"></s:textfield>
                                        <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" value="%{ct.dienThoai}" name="ct.dienThoai" placeholder="Điện thoại" required="true" readonly="true"></s:textfield>
                                        <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" value="%{ct.email}" name="ct.email" placeholder="Email" required="true" readonly="true"></s:textfield>
                                        <s:textfield cssStyle="margin-bottom: 15px;height: 45px;" cssClass="form-control" value="%{ct.website}" name="ct.website" placeholder="Website" required="true" readonly="true"></s:textfield>
                                        </div>
                                        <div class="col-lg-4 col-md-4">
                                            <p>Logo công ty</p>
                                            <img src="<s:url value="%{ct.logo}"/>" style="height: 120px; width: 120px; border-radius: 100%; margin-bottom: 10px" />
                                    </div>
                                </div> 

                                <div class="row">
                                    <div class="col-lg-12  col-md-12">
                                        <label>Mô tả công ty</label>
                                        <s:textarea value="%{ct.moTa}" id="area" name="ct.moTa" required="true" cssStyle="height: 200px; margin-bottom: 30px" cssClass="form-control" placeholder="Hãy mô tả công ty của bạn,....."></s:textarea>
                                            <label>Lĩnh vực hoạt động</label>
                                        <s:textarea value="%{ct.linhVucHoatDong}" name="ct.linhVucHoatDong" required="true" cssStyle="height: 200px; margin-bottom: 30px" cssClass="form-control" placeholder="Các lĩnh vực hoạt động của công ty bạn là gì,...."></s:textarea>
                                        </div>
                                    </div>
                                    <div>
                                        <input id="tagA" type="submit" value="CẬP NHẬT" class="btn btn-primary btn-block btn-lg">
                                        <script>
                                            document.querySelector('#formValidate').addEventListener('submit', function (e) {
                                                var form = this;
                                                e.preventDefault();
                                                swal({
                                                    title: "CẬP NHẬT CÔNG TY",
                                                    text: "Bạn có đồng ý cập nhật thông tin công ty không?",
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
                                                            text: 'Bạn đã đồng ý cập nhật thông tin, xin vui lòng đợi phản hồi từ hệ thống!',
                                                            icon: 'success'
                                                        }).then(function () {
                                                            form.submit();
                                                        });
                                                    } else {
                                                        swal("HỦY BỎ", "Bạn đã hủy bỏ việc cập nhật thông tin!", "error");
                                                    }
                                                });
                                            });
                                        </script>
                                    </div>
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