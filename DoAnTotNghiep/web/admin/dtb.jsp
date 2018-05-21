<%-- 
    Document   : qltb
    Created on : May 19, 2018, 5:14:36 PM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <title>THÔNG BÁO</title>
        <%@include file="../admin/head.jsp" %>
    </head>
    <body>
        <section id="container">
            <%@include file="../admin/nabar.jsp" %>
            <%@include file="../admin/leftBar.jsp" %>
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <div class="table-agile-info">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                THÔNG BÁO
                            </div>
                            <div class="row w3-res-tb">
                                <div class="col-sm-9 m-b-xs">    

                                </div>
                                <div class="col-sm-3">
                                    <div class="input-group">
                                        <input type="text" class="input-sm form-control" placeholder="Search" style="color: black">
                                        <span class="input-group-btn">
                                            <button class="btn btn-sm btn-default" type="button">Tìm kiếm</button>
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive" style="padding: 20px">
                                <form action="SaveThongBaoByAdmin" method="post" enctype = "multipart/form-data"> 
                                    <div class="row">
                                        <div class="col-sm-9">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Tiêu đề</label>
                                                <input required="true" class="form-control" name="tieuDe" type="text">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">Loại thông báo</label>
                                                <select name="type" required="true" class="form-control m-bot15">
                                                    <option value="">Chọn loại thông báo</option>
                                                    <option value="0">Thông báo thường</option>
                                                    <option value="1">Banner</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>Nội dung</label>
                                        <s:textarea cssClass="form-control" cssStyle="height: 300px; width: 100%" name="noiDung"></s:textarea>
                                    </div>

                                    <div class="form-group">
                                        <p>Chọn ảnh</p>
                                        <img id="output" style="height: 120px; width: 120px; border-radius: 100%; margin-bottom: 10px" />
                                        <input  name="myFile" type="file" accept="image/*" onchange="loadFile(event)" required="true"/>
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
                                    <button type="submit" class="btn btn-info">ĐĂNG THÔNG BÁO</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
                <%@include file="../admin/footer.jsp" %>
            </section>
        </section>
        <%@include file="../admin/js.jsp" %>
    </body>
</html>
