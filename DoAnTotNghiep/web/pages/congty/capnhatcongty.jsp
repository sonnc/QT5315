<%-- 
    Document   : capnhatcongty
    Created on : Mar 13, 2018, 9:27:56 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cập nhật công ty</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <style>
            .error{
                color: red;
                text-orientation: initial;
            }
        </style>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="../../mains/mainHeader.jsp" %>
            <%@include file="../../mains/banner.jsp" %>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <form role="form" id="formValidate"> 
                                <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                     padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 15px">
                                    <p style="margin: 0px">CẬP NHẬT THÔNG TIN CÔNG TY</p>
                                </div>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="" placeholder="Tên công ty" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="" placeholder="Địa chỉ" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="" placeholder="Điện thoại" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="" placeholder="Email" required="true"/>
                                        <input style="margin-bottom: 15px;height: 45px;" class="form-control" name="" placeholder="Website" required="true"/>
                                    </div>
                                    <div class="col-lg-4">
                                        <p>Logo công ty</p>
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

                                <div class="row">
                                    <div class="col-lg-12">
                                        <label>Mô tả công ty</label>
                                        <textarea name="" required style="height: 200px; margin-bottom: 30px" class="form-control" placeholder="Hãy mô tả công ty của bạn,....."></textarea>
                                        <label>Lĩnh vực hoạt động</label>
                                        <textarea name="" required style="height: 200px; margin-bottom: 30px" class="form-control" placeholder="Các lĩnh vực hoạt động của công ty bạn là gì,...."></textarea>
                                    </div>
                                </div>
                                <s:submit value="cẬP NHẬT"></s:submit>
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