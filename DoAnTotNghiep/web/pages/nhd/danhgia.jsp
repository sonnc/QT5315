<%-- 
    Document   : danhgia
    Created on : May 15, 2018, 5:04:29 AM
    Author     : sonnc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đánh giá sinh viên</title>
        <%@include file="../../mains/head.jsp" %>
        <script src="./pages/libs/js/validate.js"></script>
        <script src="./pages/libs/js/jquery.min.js"></script>
        <style>
            .error{
                color: red;
                text-orientation: initial;
            }
        </style>
        <%            if (session.getAttribute("getAllDSSVDanhGia") == null) {

        %>
        <s:action name="getAllDSSVDanhGia" executeResult="true"/>
        <%            }
        %>
    </head>
    <%
        if (session.getAttribute("getAllDSSVDanhGia") != null) {
            session.removeAttribute("getAllDSSVDanhGia");
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
                        <div class="col-lg-8 col-md-8">
                            <div style="background-color: #5bc0de; border-color: #46b8da; color: white; 
                                 padding: 6px 12px; font-size: 20px; border-radius: 5px; margin-bottom: 25px">
                                <p style="margin: 0px">ĐÁNH GIÁ SINH VIÊN THỰC TẬP</p>
                            </div>
                            <%                                if (session.getAttribute("message") != null) {
                            %>
                            <script type="text/javascript">
                                swal("Thông báo", "<%=session.getAttribute("message")%>", "info");
                            </script>
                            <%
                                    session.removeAttribute("message");
                                }
                            %>
                            <!--                            <input class="form-control" id="s" style="float: right; width: 50%; margin-bottom: 15px" placeholder="Tìm kiếm.." type="text">
                                                        <style>
                                                            td{padding: 5px}
                                                        </style>
                                                        <form role="form" id="formValidate" action="UploadFileDanhGia" method="post" enctype = "multipart/form-data"> 
                                                            <div class="row" style="padding: 15px"> 
                                                                <div class="col-lg-12 col-md-12"  style="border: 2px solid #46b8da; padding: 10px">
                                                                    <p style="margin: 0px; color: red;margin-left: 10px; padding: 5px">GỬI FILE ĐÁNH GIÁ</p>
                                                                    <div class="col-lg-4 col-md-4">
                                                                        <select style="margin-bottom: 15px" name="mssv" class="form-control" required="true"> 
                                                                            <option value="">Chọn sinh viên</option>
                            <s:iterator value="lstDanhSachSinhViens">
                                <option value="<s:property value="mssv" />"><s:property value="mssv"/> - <s:property value="hoTen" /></option>
                            </s:iterator>
                        </select>
                    </div>
                    <div class="col-lg-8 col-md-8" >
                            <s:textfield  name="myFile" type="file" accept="file/*" required="required"/>  
                            <button class="btn btn-info" style="height: 25px; margin: 5px; font-size: 12px; width: auto; float: right">Đánh giá</button>
                        </div>
                    </div>
                </div>
            </form> 
            <script>
                document.querySelector('#formValidate').addEventListener('submit', function (e) {
                    var form = this;
                    e.preventDefault();
                    swal({
                        title: "CHẤM CÔNG",
                        text: "Bạn có chắc chắn không?",
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
                                text: 'Bạn đã xác nhận, xin vui lòng đợi phản hồi từ hệ thống!',
                                icon: 'success'
                            }).then(function () {
                                form.submit();
                            });
                        } else {
                            swal("HỦY BỎ", "Bạn đã hủy bỏ!", "error");
                        }
                    });
                });
            </script>
            <div class="row">
                <div class="col-lg-8 col-md-8">
                    <p>DANH SÁCH SINH VIÊN</p>
                    <table border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                        <tr style="font-size: 13px; text-align: center">
                            <th><strong> Mã SV </strong></th>
                            <th><strong> Họ và tên </strong></th>
                            <th><strong> Ngày bắt đầu </strong></th>
                            <th><strong> Ngày kết thúc </strong></th>
                            <th><strong> Trạng thái </strong></th>
                        </tr>
                            <s:iterator value="lstDanhSachSinhViens">
                                <tr style="font-size: 13px;">
                                    <td><s:property value="mssv" /></td>
                                    <td><s:property value="hoTen" /></td>
                                    <td><s:property value="startDate" /></td>
                                    <td><s:property value="endDate" /></td>
                                    <td><s:property value="trangThai" /></td>
                                </tr>
                            </s:iterator>
                        </table>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <p>D/S ĐÃ GỬI ĐÁNH GIÁ</p>
                        <table border="1" style="border: 1px solid #0a6d9b; padding: 5px 5px; width: 100%">
                            <tr style="font-size: 13px; text-align: center">
                                <th><strong> Mã SV </strong></th>
                                <th><strong> Họ và tên </strong></th>
                            </tr>
                            <s:iterator value="lstDSSVDanhGia">
                                <tr style="font-size: 13px;">
                                    <td><s:property value="mssv" /></td>
                                    <td><s:property value="hoTen" /></td>
                                </tr>
                            </s:iterator>
                        </table>
                    </div>
                </div>-->

                            <div class="row">
                                <div style="text-align: center">
                                    <h5>PHIẾU ĐÁNH GIÁ KẾT QUẢ THỰC TẬP DOANH NGHIỆP</h5>
                                    <p>(vui lòng gửi lại cho chúng tôi trong vòng 15 ngày sau khi sinh viên kết thúc thực tập)</p>
                                    <p>
                                        Đánh giá theo thang điểm sau : 
                                        A : xuất sắc, B : tốt, C : khá, D : bình thường, F : kém, X : không liên quan / không có ý kiến

                                    </p>
                                </div>
                                <form role="form" id="formValidate" action="DanhGiaSinhVien" method="post" > 
                                    <div class="col-lg-12 col-md-12" style="margin-bottom: 10px">
                                        <select style="margin-bottom: 15px" name="SINHVIEN" class="form-control" required="true"> 
                                            <option value="">Chọn sinh viên để đánh giá</option>
                                            <s:iterator value="lstDanhSachSinhViens">
                                                <option value="<s:property value="mssv" />"><s:property value="mssv"/> - <s:property value="hoTen" /></option>
                                            </s:iterator>
                                            <option value="20138374-Nguyễn Công Sơn">20138374-Nguyễn Công Sơn</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-12 col-md-12" style="margin-bottom: 10px">
                                        <div class="col-lg-5 col-md-5"><strong>Tiêu chí</strong></div>
                                        <div class="col-lg-1 col-md-1"><strong>Điểm</strong></div>
                                        <div class="col-lg-6 col-md-6"><strong>Nhận xét</strong></div>
                                    </div>
                                    <%
                                        List<String> lst = new ArrayList<String>();
                                        lst.add("Trình độ kỹ thuật liên quan đến đề tài thực tập");
                                        lst.add("Khả năng nắm bắt các kỹ thuật mới");
                                        lst.add("Mức độ làm chủ kỹ thuật, công nghệ sau khi đã được hướng dẫn");
                                        lst.add("Khả năng phân tích ");
                                        lst.add("Phương pháp luận – cách thức tổ chức công việc");
                                        lst.add("Óc sáng tạo");
                                        lst.add("Trình độ ngoại ngữ phục vụ cho công việc");
                                        lst.add("Khối lượng công việc đã thực hiện trong thời gian thực tập");
                                        lst.add("Chất lượng công việc đã thực hiện trong thời gian thực tập");
                                        lst.add("Khả năng tự hoàn thành công việc và cách giải quyết các vấn đề phát sinh");
                                        lst.add("Viết tài liệu về công việc đã thực hiện");
                                        lst.add("Thuyết trình");
                                        lst.add("Tuân thủ các ràng buộc chất lượng công việc của cơ sở thực tập");
                                        lst.add("Đúng giờ");
                                        lst.add("Vẻ ngoài (quần áo, tác phong nơi công sở, …)");
                                        lst.add("Giữ gìn hình ảnh cho cơ sở thực tập và cho sản phẩm đã thực hiện trong quá trình làm việc");
                                        lst.add("Làm việc nhóm");
                                        lst.add("Quan hệ, giao tiếp với nhân viên, khách hàng của cơ sở thực tập ");
                                        lst.add("Tuân thủ các quy định làm việc của công ty và cam kết khi thực tập");
                                        lst.add("Cải thiện năng lực, trình độ kỹ thuật");
                                        lst.add("Cải thiện thái độ, ý thức");
                                        lst.add("Cải thiện về phương pháp làm việc");
                                        for (int i = 0; i < lst.size(); i++) {
                                    %>
                                    <div class="col-lg-12 col-md-12" style="margin-bottom: 10px">
                                        <div class="col-lg-5 col-md-5"><%=lst.get(i)%></div>
                                        <div class="col-lg-1 col-md-1">
                                            <select name="D<%=i%>">
                                                <option>Điểm</option>
                                                <option value="A">A</option>
                                                <option value="B">B</option>
                                                <option value="C">C</option>
                                                <option value="D">B</option>
                                                <option value="F">F</option>
                                                <option value="X">X</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-6 col-md-6">
                                            <input name="NX<%=i%>" class="form-control"/>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <div class="clearfix" ></div>
                                    <div class="col-lg-12 col-md-12" style="display: block; border: 1px solid; margin-bottom: 10px"> 
                                        <div class="col-lg-6 col-md-6 col-md-6">
                                            Kết quả chung :<br/>
                                            A : sinh viên chủ động hoàn thành các công việc, kết quả xuất sắc<br/>
                                            B : sinh viên đáp ứng đầy đủ các yêu cầu công việc, kết quả tốt<br/>
                                            C : sinh viên có khả năng trung bình, kết quả đạt yêu cầu<br/>
                                            D : sinh viên chưa đạt hết các mục tiêu đặt ra, nhưng có cố gắng, nỗ lực, <br/>
                                            F : ý thức học tập của sinh viên kém, không đạt yêu cầu<br/>
                                            <br/>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-md-6">
                                            <h4><strong>Đánh giá chung về khóa thực tập</strong></h4>
                                            <select name="DANHGIACHUNG" >
                                                <option value="">ĐÁNH GIÁ CHUNG QUÁ TRÌNH THỰC TẬP</option>
                                                <option value="A">A</option>
                                                <option value="B">B</option>
                                                <option value="C">C</option>
                                                <option value="D">B</option>
                                                <option value="F">F</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="col-lg-6 col-md-6">
                                            Quý vị có muốn tiếp tục nhận sinh viên thực tập đợt sau không ? 
                                        </div>
                                        <div class="col-lg-6 col-md-6">
                                            <input class="form-control" name="NHANSINHVIEN"/>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12" style="margin-top: 20px">
                                        <p><strong>Đóng góp cho chương trình đào tạo (những ý kiến trong mục này của quý vị sẽ giúp chúng tôi cải tiến chương trình đào tạo, và sẽ không sử dụng để đánh giá kết quả thực tập của sinh viên)</strong></p>
                                        <p>Trong 2 tuần đầu của kỳ thực tập, sinh viên chưa nắm vững các nhóm kiến thức nào?</p>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                Kiến thức cơ sở (giải thuật, toán, …) ? 
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <input class="form-control" name="KIENTHUCCOSO"/>
                                            </div> 
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                Ngôn ngữ lập trình ?
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <input class="form-control" name="NGONNGULAPTRINH"/>
                                            </div> 
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                Phần mềm ?
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <input class="form-control" name="PHANMEM"/>
                                            </div> 
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                Phần mềm ?
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <input class="form-control" name="PHANCUNG"/>
                                            </div> 
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                Khác (vui lòng chỉ rõ) : 
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <input class="form-control" name="KHAC"/>
                                            </div> 
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                Theo quý vị, nhà trường cần chú trọng đào tạo thêm nhóm kiến thức nào cho sinh viên ?
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <input class="form-control" name="Q_NHOMKIENTHUC"/>
                                            </div> 
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                Ngoại ngữ phải là yêu cầu thiết yếu trong công việc tại cơ sở thực tập hay không ?  
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <input class="form-control" name="Q_NGOAINGU"/>
                                            </div> 
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                Nếu có, trình độ tiếng Anh / Pháp của sinh viên có đáp ứng yêu cầu không ? 
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <input class="form-control" name="Q_TRINHDONGOAINGU"/>
                                            </div> 
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                Vui lòng chỉ ra một số thiếu sót của sinh viên trong quá trình thực tập ?
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <input class="form-control" name="Q_THIEUSOT"/>
                                            </div> 
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                Vui lòng chỉ ra các ưu điểm của sinh viên trong quá trình thực tập ?
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <input class="form-control" name="Q_UUDIEM"/>
                                            </div> 
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6">
                                                Theo quý vị, có cần cải tiến quy trình thực tập không ? Cải tiến như thế nào ?
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <input class="form-control" name="Q_CAITIEN"/>
                                            </div> 
                                        </div>
                                    </div>
                                    <button class="btn btn-info" style="height: 35px; margin: 5px; font-size: 12px; width: auto; float: right">Đánh giá</button>
                                </form>
                                <script>
                                    document.querySelector('#formValidate').addEventListener('submit', function (e) {
                                        var form = this;
                                        e.preventDefault();
                                        swal({
                                            title: "ĐÁNH GIÁ THỰC TẬP",
                                            text: "Bạn có chắc chắn không?",
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
                                                    text: 'Bạn đã xác nhận, xin vui lòng đợi phản hồi từ hệ thống!',
                                                    icon: 'success'
                                                }).then(function () {
                                                    form.submit();
                                                });
                                            } else {
                                                swal("HỦY BỎ", "Bạn đã hủy bỏ!", "error");
                                            }
                                        });
                                    });
                                </script>
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
    <%        }
    %>
</html>
