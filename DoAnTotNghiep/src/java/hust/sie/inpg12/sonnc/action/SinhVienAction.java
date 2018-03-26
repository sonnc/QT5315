/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.action;

import com.opensymphony.xwork2.ActionSupport;
import hust.sie.inpg12.sonnc.controller.SinhVienController;
import hust.sie.inpg12.sonnc.entities.DeTai;
import hust.sie.inpg12.sonnc.entities.FileAll;
import hust.sie.inpg12.sonnc.entities.SinhVien;
import hust.sie.inpg12.sonnc.entities.SinhVienInfo;
import hust.sie.inpg12.sonnc.other.SoKhop;
import java.text.SimpleDateFormat;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.commons.io.FileUtils;
import java.io.File;

/**
 *
 * @author sonnc
 */
public class SinhVienAction extends ActionSupport implements SessionAware, ServletRequestAware {

    // Phần khai báo các thông tin, các biến cần thiết
    private HttpServletRequest request;
    private Map<String, Object> session;
    private SinhVienController sinhVienController;
    private File myFile;
    private String myFileFileName;
    private String path;
    private SinhVien sinhVien;
    private SinhVienInfo sinhVienInfo;

    // kết thúc phần khai báo 
    //phần getter and setter
    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public SinhVien getSinhVien() {
        return sinhVien;
    }

    public void setSinhVien(SinhVien sinhVien) {
        this.sinhVien = sinhVien;
    }

    public SinhVienInfo getSinhVienInfo() {
        return sinhVienInfo;
    }

    public void setSinhVienInfo(SinhVienInfo sinhVienInfo) {
        this.sinhVienInfo = sinhVienInfo;
    }
    // kết thúc phần getter and setter

    // các phương thức chức năng cho hệ thống của sinh viên
    public SinhVienAction() {
        sinhVienController = new SinhVienController();
    }

    /**
     * Phương thức đăng ký thông tin sinh viên
     *
     * @return String
     * @since v1 - 26.03.18
     * @author SonNC
     */
    public String SinhVienDangKyThongTin() {
        try {
            String date = request.getParameter("ngaySinh");
            SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyyy");
            java.util.Date dateString = sdf.parse(date);
            java.sql.Date ngaySinh = new java.sql.Date(dateString.getTime());
            String avatar = null; 
            try {
                path = request.getSession().getServletContext().getRealPath("/").concat("data/images/avatar/");
                File fileToCreate = new File(path, this.myFileFileName);
                FileUtils.copyFile(this.myFile, fileToCreate);
                avatar = "data/images/avatar/" + myFileFileName;
            } catch (Exception e) {
                e.printStackTrace();
                addActionError(e.getMessage());
            }
            sinhVien.setAvatar(avatar);
            sinhVien.setMssv((int) session.get("mssv"));
            sinhVien.setNgaySinh(ngaySinh);
            sinhVienInfo.setMssv((int) session.get("mssv"));
            if (sinhVienController.saveSinhVienInfo(sinhVien, sinhVienInfo)) {
                return SUCCESS;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    /**
     * Phương thức lấy cập nhật thông tin sinh viên
     *
     * @param mssv
     * @since v1 - 26.03.18
     * @author SonNC
     */
    public String SinhVienCapNhatThongTin() {

        return ERROR;
    }

    /**
     * Phương thức lấy thông tin sinh viên
     *
     * @since v1 - 26.03.18
     * @author SonNC
     */
    public String getSinhVienThongTin() {
        try {
          //  sinhVien = sinhVienController.getSinhVien(Integer.parseInt((String) session.get("mssv")));
            sinhVienInfo = sinhVienController.getSinhVienInfo(Integer.parseInt((String) session.get("mssv")));
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    /**
     * Phương thức so khớp thông tin sinh viên So khớp thông tin gồm có 2 phần
     * trình độ và thông tin so khớp: Trình độ gồm có 5 bậc: khongbiet = 0%;
     * biet = 25%; kha = 50%; tot = 75%; thanhthao = 100%; Thông tin so khớp:
     * bao gồm tất cả các ngôn ngữ lập trình mà sinh viên có so với yêu cầu của
     * công ty tuyển dụng.
     *
     * @since v1 - 26.03.18
     * @author SonNC
     */
    public String setDangKyDeTai() {
        String knlt = null;
        SoKhop sksv = new SoKhop();
        SoKhop skdt = new SoKhop();
        DeTai dt = new DeTai();
        try {
            sinhVienInfo = sinhVienController.getSinhVienInfo(Integer.parseInt((String) session.get("mssv")));
            knlt = sinhVienInfo.getKyNangLt();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    public String test() {
        sinhVienController.getAllDeTai();
        return null;
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
