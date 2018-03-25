/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.action;

import com.opensymphony.xwork2.ActionSupport;
import hust.sie.inpg12.sonnc.controller.SinhVienController;
import hust.sie.inpg12.sonnc.entities.FileAll;
import hust.sie.inpg12.sonnc.entities.SinhVien;
import hust.sie.inpg12.sonnc.entities.SinhVienInfo;
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
     * phương thức đăng ký thông tin cho sinh viên
     */
    public String SinhVienDangKyThongTin() {

        try {
            String date = request.getParameter("ngaySinh");
            SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyyy");
            java.util.Date dateString = sdf.parse(date);
            java.sql.Date ngaySinh = new java.sql.Date(dateString.getTime());
            String avatar = null;
            try {
                path = request.getSession().getServletContext().getRealPath("/").concat("images/avatar/");
                File fileToCreate = new File(path, this.myFileFileName);
                FileUtils.copyFile(this.myFile, fileToCreate);
                avatar = "images/avatar/" + myFileFileName;
            } catch (Exception e) {
                e.printStackTrace();
                addActionError(e.getMessage());
            }
            
            sinhVien.setAvatar(avatar);
            sinhVien.setMssv(Integer.parseInt((String) session.get("mssv")));
            sinhVien.setNgaySinh(ngaySinh);
            sinhVienInfo.setSinhVien(sinhVien);
            sinhVienController.saveSinhVienInfo(sinhVien, sinhVienInfo);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
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
