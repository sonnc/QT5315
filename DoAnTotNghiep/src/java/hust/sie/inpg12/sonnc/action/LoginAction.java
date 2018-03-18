/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.action;

import com.opensymphony.xwork2.ActionSupport;
import hust.sie.inpg12.sonnc.controller.LoginController;
import hust.sie.inpg12.sonnc.entities.DeTai;
import hust.sie.inpg12.sonnc.entities.Login;
import hust.sie.inpg12.sonnc.entities.SinhVienThucTap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author sonnc
 */
public class LoginAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private LoginController loginController;
    private HttpServletRequest request;
    private Map<String, Object> session;
    List<DeTai> list = new ArrayList<>();

    public List<DeTai> getList() {
        return list;
    }

    public void setList(List<DeTai> list) {
        this.list = list;
    }

    public LoginAction() {
        loginController = new LoginController();
    }

    /**
     * Phương thức login/ kiểm tra login Các thông số định danh người dùng bao
     * gồm: 0-sinhvien; Kiểm tra thông tin tài khoản có tồn tại hay không. Nếu
     * không, thông báo lỗi. Nếu có, sử dụng EMAIL để lấy toàn bộ thông tin của
     * người dùng, sau đó lưu vào session của mỗi đối tượng. mỗi session của một
     * đối tượng đó được lưu vào file header riêng. Tất cả đối tượng đăng nhập
     * lần đầu đều phải đăng ký, kê khai thông tin
     */
    public String login() {
        List<Login> lstLogin = new ArrayList();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        lstLogin = loginController.login(email, password);
        session.put("email", email);
        session.put("rule", lstLogin.get(0).getRule());

        if (lstLogin.size() == 1) {
            if (true) {

            }
        } else {
            addFieldError("email", "Tài khoản hoặc mật khẩu không đúng !");
            return INPUT;
        }
        return SUCCESS;
    }

    public String test() {

        list = loginController.getTest();
        session.put("test", "test");

        if (list.size() == 0) {
            return ERROR;
        }
        return SUCCESS;
    }

    /**
     * Phương thức này cho phép đăng xuất các tài khoản. Có thể sử dụng chung
     * cho mọi đối tượng
     */
    public String logout() {
        session.clear();
        return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }

}
