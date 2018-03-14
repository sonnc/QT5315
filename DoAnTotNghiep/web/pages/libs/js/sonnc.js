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
            myFile:{
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
            }

        }
    });

});

