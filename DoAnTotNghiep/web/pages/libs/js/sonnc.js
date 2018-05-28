/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    $("#formValidate").validate({
        rules: {
            email: {
                required: true,
                email: true
            },
            password: {
                minlength: 8,
                required: true
            },
            repassword: {
                minlength: 8,
                required: true,
                equalTo: "#password"
            },
            "sinhVien.hoTen": {
                required: true
            },
            "sinhVien.lop": {
                required: true
            },
            "sinhVien.khoa": {
                required: true,
                digits: true
            },
            "sinhVien.khoaVien": {
                required: true
            },
            "sinhVien.gioiTinh": {
                required: true
            },
            "sinhVien.ngaySinh": {
                required: true,
                date: true
            },
            "sinhVien.diaChi": {
                required: true
            },
            "sinhVien.dienThoai": {
                required: true,
                minlength: 10,
                maxlength: 15,
                digits: true
            },
            "sinhVien.laptop": {
                required: true
            },
            myFile: {
                required: true
            },
            bcqt:{
                required: true
            }

        },
        messages: {
            email: {
                required: "Email không được để trống !",
                email: "Email chưa đúng định dạng !"
            },
            password: {
                minlength: "Mật khẩu không được nhỏ hơn 8 ký tự !",
                required: "Mật khẩu không được để trống !"
            },
            repassword: {
                minlength: "Mật khẩu xác thực không được nhỏ hơn 8 ký tự !",
                required: "Mật khẩu xác thực không được để trống !",
                equalTo: "Mật khẩu xác thực không chính xác !"
            },
            "sinhVien.hoTen": {
                required: "Xin vui lòng nhập tên !"
            },
            "sinhVien.lop": {
                required: "Xin hãy nhập lớp học của bạn !"
            },
            "sinhVien.khoa": {
                required: "Xin hãy nhập khóa học của bạn !",
                digits: "Khóa học phải là số nguyên dương !"
            },
            "sinhVien.khoaVien": {
                required: "Hãy điền khoa/ viện của bạn !"
            },
            "sinhVien.gioiTinh": {
                required: "Hãy chọn giới tính !"
            },
            "sinhVien.ngaySinh": {
                required: "Ngày sinh không được để trống !",
                date: "Định dạng ngày không chính xác !"
            },
            "sinhVien.diaChi": {
                required: "Địa chỉ không được để trống !"
            },
            "sinhVien.dienThoai": {
                required: "Điện thoại không được để trống !",
                minlength: "Điện thoại tối thiểu 10 số !",
                maxlength: "Điện thoại quá 15 số !",
                digits: "Điện thoại phải là số nguyên dương !"
            },
            "sinhVien.laptop": {
                required: "Laptop không được để trống !"
            },
            myFile: {
                required: "Ảnh thẻ không được để trống !"
            },
            bcqt:{
                required: "Điểm báo cáo quá trình không được để trống!"
            }

        }
    });

});

