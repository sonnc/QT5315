/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.action;

import com.opensymphony.xwork2.ActionSupport;
import hust.sie.inpg12.sonnc.controller.SinhVienController;
import hust.sie.inpg12.sonnc.entities.CongTy;
import hust.sie.inpg12.sonnc.entities.DeTai;
import hust.sie.inpg12.sonnc.entities.GiangVienHuongDan;
import hust.sie.inpg12.sonnc.entities.SinhVien;
import hust.sie.inpg12.sonnc.entities.SinhVienInfo;
import hust.sie.inpg12.sonnc.other.DetaiCongtyNguoihuongdan;
import hust.sie.inpg12.sonnc.other.SoKhop;
import java.text.SimpleDateFormat;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.commons.io.FileUtils;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    private List<DetaiCongtyNguoihuongdan> lstDeTai = new ArrayList<>();

    public List<DetaiCongtyNguoihuongdan> getLstDeTai() {
        return lstDeTai;
    }

    public void setLstDeTai(List<DetaiCongtyNguoihuongdan> lstDeTai) {
        this.lstDeTai = lstDeTai;
    }

    public File getMyFile() {
        return myFile;
    }

    public void setMyFile(File myFile) {
        this.myFile = myFile;
    }

    public String getMyFileFileName() {
        return myFileFileName;
    }

    public void setMyFileFileName(String myFileFileName) {
        this.myFileFileName = myFileFileName;
    }

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
                path = request.getSession().getServletContext().getRealPath("/").concat("data/avatar/images/");
                File fileToCreate = new File(path, this.myFileFileName);
                FileUtils.copyFile(this.myFile, fileToCreate);
                avatar = "data/avatar/images/" + myFileFileName;
                System.out.println(avatar);
                System.out.println(path);
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
            sinhVien = sinhVienController.getSinhVienByClass(Integer.parseInt((String) session.get("mssv")));
            sinhVienInfo = sinhVienController.getSinhVienInfo(Integer.parseInt((String) session.get("mssv")));
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    /**
     * Phương thức đăng ký đề tài thông tin sinh viên So khớp thông tin gồm có 2
     * phần trình độ và thông tin so khớp: Trình độ gồm có 5 bậc: khongbiet =
     * 0%; biet = 25%; kha = 50%; tot = 75%; thanhthao = 100%; Thông tin so
     * khớp: bao gồm tất cả các ngôn ngữ lập trình mà sinh viên có so với yêu
     * cầu của công ty tuyển dụng.
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

    /**
     * Phương thức lấy toàn bộ thông tin của đề tài, công ty, người hướng dẫn
     * Phương thức này chỉ dụng cho sinh viên, Lấy toàn bộ thông tin của để tài
     * đã được xác thực
     *
     * @since v1 27/03/18
     * @author SonNC
     * @return string
     *
     */
    public String getAllDeTai() {
        try {
            List<Object[]> results = sinhVienController.getAllDeTai();
            for (Object[] result : results) {
                DetaiCongtyNguoihuongdan d = new DetaiCongtyNguoihuongdan();
                d.setMaDeTai((int) result[0]);
                d.setMaCongTy((int) result[1]);
                d.setMaGvhd((int) result[2]);
                d.setNgayDang((Date) result[3]);
                d.setNguoiDang((String) result[4]);
                d.setNoiDung((String) result[5]);
                d.setSoLuong((int) result[6]);
                d.setSoLuongCon((int) result[7]);
                d.setTenDeTai((String) result[8]);
                d.setYeuCauKhac((String) result[9]);
                d.setYeuCauLapTrinh((String) result[10]);
                d.setHanDangKy((Date) result[11]);
                d.setLogo((String) result[12]);
                d.setTenCongTy((String) result[13]);
                d.setNguoiHuongDan((String) result[14]);
                lstDeTai.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        session.put("getAllDeTai", "getAllDeTai");
        return SUCCESS;

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
