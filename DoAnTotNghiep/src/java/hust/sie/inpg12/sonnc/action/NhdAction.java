/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import hust.sie.inpg12.sonnc.controller.NhdController;
import hust.sie.inpg12.sonnc.entities.CongTy;
import hust.sie.inpg12.sonnc.entities.DeTai;
import hust.sie.inpg12.sonnc.entities.NguoiHuongDan;
import hust.sie.inpg12.sonnc.other.DanhSachSinhVien;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author sonnc
 */
public class NhdAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private File myFile;
    private String myFileFileName;
    private String path;
    private NhdController nhdController;
    private NguoiHuongDan nhd;
    private List<DanhSachSinhVien> lstDanhSachSinhViens = new ArrayList<>();
    private List<DeTai> lstAllDeTai = new ArrayList<>();
    private List<DeTai> lstAllDeTaiNHD = new ArrayList<>();
    private CongTy congTy;

    public NguoiHuongDan getNhd() {
        return nhd;
    }

    public void setNhd(NguoiHuongDan nhd) {
        this.nhd = nhd;
    }

    public List<DeTai> getLstAllDeTai() {
        return lstAllDeTai;
    }

    public void setLstAllDeTai(List<DeTai> lstAllDeTai) {
        this.lstAllDeTai = lstAllDeTai;
    }

    public List<DeTai> getLstAllDeTaiNHD() {
        return lstAllDeTaiNHD;
    }

    public void setLstAllDeTaiNHD(List<DeTai> lstAllDeTaiNHD) {
        this.lstAllDeTaiNHD = lstAllDeTaiNHD;
    }

    public CongTy getCongTy() {
        return congTy;
    }

    public void setCongTy(CongTy congTy) {
        this.congTy = congTy;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
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

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public List<DanhSachSinhVien> getLstDanhSachSinhViens() {
        return lstDanhSachSinhViens;
    }

    public void setLstDanhSachSinhViens(List<DanhSachSinhVien> lstDanhSachSinhViens) {
        this.lstDanhSachSinhViens = lstDanhSachSinhViens;
    }

    public NhdAction() {
        nhdController = new NhdController();
    }

    public String getAllDanhSachSinhVienByNHD() {
        try {
            String email = (String) session.get("email");
            List<Object[]> results = nhdController.getAllDanhSachSinhVienByNHD(email);
            for (Object[] result : results) {
                DanhSachSinhVien d = new DanhSachSinhVien();
                d.setMssv((int) result[0]);
                d.setHoTen((String) result[1]);
                d.setLop((String) result[2]);
                d.setKhoaVien((String) result[3]);
                d.setTenDeTai((String) result[4]);
                if ((boolean) result[5]) {
                    d.setTrangThai("Hoạt động");
                } else {
                    d.setTrangThai("Đã đóng");
                }
                d.setMaDeTai((int) result[6]);
                d.setStartDate((Date) result[7]);
                d.setEndDate((Date) result[8]);
                lstDanhSachSinhViens.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        session.put("getAllDanhSachSinhVienByNHD", "getAllDanhSachSinhVienByNHD");
        session.put("getAllDSSV", "getAllDSSV");
        return SUCCESS;

    }

    public String getAllDeTaiNHD() {
        int x = nhdController.getMaNHD((String) session.get("email"));
        int y = nhdController.getMaCongTy((String) session.get("email"));
        lstAllDeTai = nhdController.getAllDeTaiNHD(y, x);
        session.put("getAllDeTaiNHD", "getAllDeTaiNHD");
        return SUCCESS;
    }

    public String getAllDeTai() {
        int y = nhdController.getMaCongTy((String) session.get("email"));
        lstAllDeTai = nhdController.getAllDeTai(y);
        session.put("getAllDeTai", "getAllDeTai");
        return SUCCESS;
    }

    public String getInfoCongTy() {
        int y = nhdController.getMaCongTy((String) session.get("email"));
        this.congTy = nhdController.getInfoCongTy(y);
        session.put("getInfoCongTy", "getInfoCongTy");
        return SUCCESS;
    }

    public String getInfoNHD() {
        int y = nhdController.getMaNHD((String) session.get("email"));
        this.nhd = nhdController.getInfoNHD(y);
        session.put("getInfoNHD", "getInfoNHD");
        return SUCCESS;
    }
    
    

    public String saveFileSV() {
        
        return SUCCESS;
    }

    // 
    public String updateInfoNHD() {
        int maNguoiHuongDan = nhdController.getMaNHD((String) session.get("email"));
        NguoiHuongDan nguoiHuongDan = nhdController.getInfoNHD(maNguoiHuongDan);
        this.nhd.setAvatar(nguoiHuongDan.getAvatar());
        this.nhd.setEmail((String) session.get("email"));
        this.nhd.setMaCongTy(nguoiHuongDan.getMaCongTy());
        this.nhd.setMaGvhd(nguoiHuongDan.getMaGvhd());
        this.nhd.setHoTen(nguoiHuongDan.getHoTen());
        if (nhdController.updateInFo(nhd)) {
            session.put("message", "Cập nhật thông tin cá nhân thành công !");
        } else {
            session.put("message", " cập nhật thông tin thất bại. Đã có lỗi xáy ra, vui lòng thử đăng nhập lại và thực hiện sau hoặc liên hệ với quản trị viên.");
        }
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
