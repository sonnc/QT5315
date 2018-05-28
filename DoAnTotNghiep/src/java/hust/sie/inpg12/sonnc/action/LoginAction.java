/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.action;

import com.opensymphony.xwork2.ActionSupport;
import hust.sie.inpg12.sonnc.controller.LoginController;
import hust.sie.inpg12.sonnc.controller.SinhVienController;
import hust.sie.inpg12.sonnc.entities.CongTy;
import hust.sie.inpg12.sonnc.entities.DaiDienCongTy;
import hust.sie.inpg12.sonnc.entities.DeTai;
import hust.sie.inpg12.sonnc.entities.FileAll;
import hust.sie.inpg12.sonnc.entities.GiangVienHuongDan;
import hust.sie.inpg12.sonnc.entities.Login;
import hust.sie.inpg12.sonnc.entities.Logs;
import hust.sie.inpg12.sonnc.entities.NguoiHuongDan;
import hust.sie.inpg12.sonnc.entities.SinhVien;
import hust.sie.inpg12.sonnc.entities.SinhVienThucTap;
import hust.sie.inpg12.sonnc.entities.ThongBao;
import hust.sie.inpg12.sonnc.utils.SendEmail;
import hust.sie.inpg12.sonnc.utils.SendSMS;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author sonnc
 */
public class LoginAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private LoginController loginController;
    private SinhVienController sinhVienController;
    private HttpServletRequest request;
    private Map<String, Object> session;
    private List<DeTai> list = new ArrayList<>();
    private List<ThongBao> lstThongBao = new ArrayList<>();
    private List<ThongBao> lstBanner = new ArrayList<>();
    private List<FileAll> lstFileAll = new ArrayList<>();
    private List<CongTy> lstCongTys = new ArrayList<>();

    public List<ThongBao> getLstBanner() {
        return lstBanner;
    }

    public void setLstBanner(List<ThongBao> lstBanner) {
        this.lstBanner = lstBanner;
    }

    public List<CongTy> getLstCongTys() {
        return lstCongTys;
    }

    public void setLstCongTys(List<CongTy> lstCongTys) {
        this.lstCongTys = lstCongTys;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public List<FileAll> getLstFileAll() {
        return lstFileAll;
    }

    public void setLstFileAll(List<FileAll> lstFileAll) {
        this.lstFileAll = lstFileAll;
    }

    public List<ThongBao> getLstThongBao() {
        return lstThongBao;
    }

    public void setLstThongBao(List<ThongBao> lstThongBao) {
        this.lstThongBao = lstThongBao;
    }

    public List<DeTai> getList() {
        return list;
    }

    public void setList(List<DeTai> list) {
        this.list = list;
    }

    public LoginAction() {
        loginController = new LoginController();
        sinhVienController = new SinhVienController();
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
        if (lstLogin.size() == 1) {
            Logs(email, "Đăng nhập vào hệ thống");
            if (lstLogin.get(0).getStatus().equals("LOCKED")) {
                addFieldError("email", "Tài khoản này đã bị đóng.");
                return INPUT;
            } else {
                session.put("email", email);
                session.put("rule", lstLogin.get(0).getRule());
                //sinh viên
                if (lstLogin.get(0).getRule() == 0) {
                    int mssv = Integer.parseInt(email.substring(0, 8));
                    session.put("mssv", mssv);
                    if (sinhVienController.getSinhVien(mssv).size() == 1) {
                        return SUCCESS;
                    } else {
                        session.put("rule", "99");
                        return "DANGKYTHONGTINSINHVIEN";
                    }
                    // đại diện công ty
                } else if (lstLogin.get(0).getRule() == 1) {
                    List<DaiDienCongTy> lstDaiDienCongTys = new ArrayList<>();
                    List<CongTy> lstCongTy = new ArrayList<>();
                    lstDaiDienCongTys = loginController.getInfoDaiDienCongTy(email);

                    if (lstDaiDienCongTys.size() == 0) {
                        session.put("rule", "99");
                        return "DANGKYDAIDIENVACONGTY";
                    }
                    lstCongTy = loginController.getInfoCongTy(lstDaiDienCongTys.get(0).getMaDaiDien());
                    if (lstCongTy.size() == 0) {
                        session.put("rule", "99");
                        return "DANGKYCONGTY";
                    } else if (lstCongTy.get(0).getTrangThai() == 2) {
                        //công ty chờ duyệt
                        session.put("CongtyStatus", "CÔNG TY: " + lstCongTy.get(0).getTenCongTy().toUpperCase() + " ĐANG TRONG QUÁ TRÌNH CHỜ DUYỆT. ");
                        return "CONGTYSTATUS";
                    } else if (lstCongTy.get(0).getTrangThai() == 0) {
                        // công ty bị từ chối
                        session.put("CongtyStatus", "CÔNG TY: " + lstCongTy.get(0).getTenCongTy().toUpperCase() + " ĐÃ BỊ TỪ CHỐI VÌ KHÔNG THỂ ĐÁP ỨNG YÊU CẦU.");
                        return "CONGTYSTATUS";
                    }
                    return SUCCESS;
                    //Giảng viên hướng dẫn
                } else if (lstLogin.get(0).getRule() == 2) {
                    List<GiangVienHuongDan> lstGiangVienHuongDans = loginController.getInfoGiangVienHuongDan(email);
                    if (lstGiangVienHuongDans.size() == 0) {
                        session.put("rule", "99");
                        return "DANGKYTHONGTINGIANGVIENHUONGDAN";
                    }
                    return SUCCESS;
                    // Người hướng dẫn
                } else if (lstLogin.get(0).getRule() == 3) {
                    List<NguoiHuongDan> lstNguoiHuongDans = loginController.getInfoNguoiHuongDan(email);
                    if (lstNguoiHuongDans.size() == 0) {
                        session.put("rule", "99");
                        return "DANGKYTHONGTINNGUOIHUONGDAN";
                    }
                    return SUCCESS;
                } else if (lstLogin.get(0).getRule() == 4) {
                    return "ADMIN";
                }
            }
        } else {
            Logs((String) session.get("email"), "Đăng nhập vào hệ thống không thành công.");
            addFieldError("email", "Tài khoản hoặc mật khẩu không đúng !");
            return INPUT;
        }
        return SUCCESS;
    }

    /**
     * SV = 0 GVHD = 2 DDCT = 1 NHD = 3 AD = 4
     */
    public String registerAcount() {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        int role;
        // email của sinh viên có định dạng @student.hust.edu.vn
        // email giảng viên hướng dẫn: @hust.edu.vn / soict.hust.edu.vn
        if (email.contains("@student.hust.edu.vn")) {
            String mssv = email.substring(0, 8);
            try {
                int x = Integer.parseInt(mssv);
            } catch (Exception e) {
                addFieldError("email", "Email sinh viên không hợp lệ.");
                return INPUT;
            }
            role = 0;
        } else if (email.contains("@hust.edu.vn") || email.contains("@soict.hust.edu.vn")) {
            role = 2;
        } else {
            role = 1;
        }
        Login login = new Login();
        login.setEmail(email);
        login.setPass(pass);
        login.setRule(role);
        login.setStatus("ACTIVE");
        if (loginController.SaveRegister(login)) {
            Logs((String) session.get("email"), "Đăng ký tài khoản thành công.");
            addFieldError("email", "Đăng ký tài khoản thành công. Vui lòng đăng nhập lại.");
            session.put("login", login);
            return SUCCESS;
        }
        Logs((String) session.get("email"), "Đăng ký tài khoản thất bại");
        addFieldError("email", "Đăng ký tài khoản thất bại. Vui lòng kiểm tra lại thông tin.");
        session.put("login", login);
        return INPUT;
    }

    /**
     * Phương thức này cho phép đăng xuất các tài khoản. Có thể sử dụng chung
     * cho mọi đối tượng
     */
    public String logout() {
        Logs((String) session.get("email"), "Đăng xuất ra khỏi hệ thống");
        session.clear();
        return SUCCESS;
    }

    public String GetAllThongBao() {
        lstThongBao = loginController.GetAllThongBao(0);
        lstBanner = loginController.GetAllThongBao(1);
        lstFileAll = loginController.getAllFile();
        lstCongTys = loginController.getAllCongTy();
        session.put("GetAllThongBao", "GetAllThongBao");
        session.put("lstBanner", lstBanner);
        session.put("lstFileAll", lstFileAll);
        session.put("lstCongTys", lstCongTys);
        return SUCCESS;
    }

    public String GetDetailThongBao() {
        int id = Integer.parseInt(request.getParameter("id"));
        lstThongBao = loginController.GetDetailThongBao(id);
        session.put("GetDetailThongBao", "GetDetailThongBao");
        return SUCCESS;
    }

//    public String sendEmailChangePass() {
//
//    }
    public String changePassword() {
        String passwordold = request.getParameter("passwordold");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String email = (String) session.get("email");

        List<Login> lstLogin = new ArrayList();
        lstLogin = loginController.login(email, passwordold);
        Logs(email, "Thay đổi mật khẩu");
        if (lstLogin.size() == 1) {
            if (lstLogin.get(0).getPass().equals(password)) {
                session.put("message", "Mật khẩu mới đã được sử dụng trước đó, vui lòng sử dụng mật khẩu khác");
                return SUCCESS;
            } else {
                if (loginController.changePass(email, password)) {
                    try {
                        Date d = new Date();
                        java.sql.Date date = new java.sql.Date(d.getTime());
                        Time time = new Time(d.getTime());
                        //send mail
                        SendEmail sendEmail = new SendEmail();
                        sendEmail.doSendEmail("" + email + "", "THAY ĐỔI MẬT KHẨU", "Xin chào " + email + ". Bạn đã thay đổi mật khẩu vào lúc " + time + " " + date + "."
                                + " Nếu bạn không thực hiện hành động này, vui lòng kiểm tra lại và thay đổi mật khẩu.");
                        //Send SMS
//                        SendSMS sendSMS = new SendSMS();
//                        sendSMS.sendSMSCustomer("0898595657", "Xin chao NGUYEN CONG SON. Ban da thay doi mat khau vao luc: " + time + " " + date + ". Send by SonNC");
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    session.put("message", "Thay đổi mật khẩu thành công");
                } else {
                    session.put("message", "Thay đổi mật khẩu thất bại");
                }

            }
        }
        return SUCCESS;
    }

    public String forgotpasswordAction() {
        String email = request.getParameter("email");
        try {
            Date d = new Date();
            java.sql.Date date = new java.sql.Date(d.getTime());
            Time time = new Time(d.getTime());
            //send mail
            String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            Random rnd = new Random();
            StringBuilder sb = new StringBuilder(8);
            for (int i = 0; i < 8; i++) {
                sb.append(AB.charAt(rnd.nextInt(AB.length())));
            }
            String pass = sb.toString();
             if (loginController.changePass(email, pass))  {
                 SendEmail sendEmail = new SendEmail();
                 sendEmail.doSendEmail("" + email + "", "THAY ĐỔI MẬT KHẨU",
                         "HỆ THỐNG ĐĂNG KÝ VÀ QUẢN LÝ THỰC TẬP TẠI DOANH NGHIỆP\n"
                         + "Xin chào: "+email+"\n"
                         + "Chúng tôi đã tiếp nhận yêu cầu thay đổi mật khẩu của bạn vào lúc: "+time+" "+date+"\n"
                         + "Chúng tôi đã thay đổi mật khẩu của bạn thành: "+pass+"\n"
                         + "Nếu bạn không thực hiện hành động này, xin vui lòng thay đổi lại mật khẩu hoặc liên hệ với quản trị viên hệ thống.\n"
                         + "Nhóm phát triển hệ thống, trân trọng!");
            }
            session.put("message", "Mật khẩu mới đã được gửi qua email: "+email+", xin vui lòng kiểm tra email của bạn.");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public void Logs(String email, String noidung) {
        Logs logs = new Logs();
        Date d = new Date();
        java.sql.Date date = new java.sql.Date(d.getTime());
        Time time = new Time(d.getTime());
        logs.setNgayThang(date);
        logs.setNguoiDung(email);
        logs.setNoiDung(noidung);
        logs.setThoiGian(time);
        loginController.logs(logs);
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
