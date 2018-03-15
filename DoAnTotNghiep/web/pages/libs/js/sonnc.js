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
            hoTen: {
                required: true
            },
            lop: {
                required: true
            },
            khoa: {
                required: true,
                digits: true
            },
            khoaVien: {
                required: true
            },
            gioiTinh: {
                required: true
            },
            ngaySinh: {
                required: true,
                date: true
            },
            diaChi: {
                required: true
            },
            dienThoai: {
                required: true,
                minlength: 10,
                maxlength: 15,
                digits: true
            },
            laptop: {
                required: true
            },
            myFile: {
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
            hoTen: {
                required: "Xin vui lòng nhập tên !"
            },
            lop: {
                required: "Xin hãy nhập lớp học của bạn !"
            },
            khoa: {
                required: "Xin hãy nhập khóa học của bạn !",
                digits: "Khóa học phải là số nguyên dương !"
            },
            khoaVien: {
                required: "Hãy điền khoa/ viện của bạn !"
            },
            gioiTinh: {
                required: "Hãy chọn giới tính !"
            },
            ngaySinh: {
                required: "Ngày sinh không được để trống !",
                date: "Định dạng ngày không chính xác !"
            },
            diaChi: {
                required: "Địa chỉ không được để trống !"
            },
            dienThoai: {
                required: "Điện thoại không được để trống !",
                minlength: "Điện thoại tối thiểu 10 số !",
                maxlength: "Điện thoại quá 15 số !",
                digits: "Điện thoại phải là số nguyên dương !"
            },
            laptop: {
                required: "Laptop không được để trống !"
            },
            myFile: {
                required: "Ảnh thẻ không được để trống !"
            }

        }
    });

});

