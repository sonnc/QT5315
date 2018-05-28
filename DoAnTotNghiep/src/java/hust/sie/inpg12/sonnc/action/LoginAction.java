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
import hust.sie.inpg12.sonnc.entities.NguoiHuongDan;
import hust.sie.inpg12.sonnc.entities.SinhVien;
import hust.sie.inpg12.sonnc.entities.SinhVienThucTap;
import hust.sie.inpg12.sonnc.entities.ThongBao;
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
            addFieldError("email", "Đăng ký tài khoản thành công. Vui lòng đăng nhập lại.");
            session.put("login", login);
            return SUCCESS;
        }
        addFieldError("email", "Đăng ký tài khoản thất bại. Vui lòng kiểm tra lại thông tin.");
        session.put("login", login);
        return INPUT;
    }

    /**
     * Phương thức này cho phép đăng xuất các tài khoản. Có thể sử dụng chung
     * cho mọi đối tượng
     */
    public String logout() {
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

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }

}
