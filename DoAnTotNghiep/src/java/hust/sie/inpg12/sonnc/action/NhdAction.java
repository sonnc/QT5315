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
    private List<DanhSachSinhVien> lstDanhSachSinhViens = new ArrayList<>();
    
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
                d.setStartDate((Date)result[7]);
                d.setEndDate((Date)result[8]);
                lstDanhSachSinhViens.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        session.put("getAllDanhSachSinhVienByNHD", "getAllDanhSachSinhVienByNHD");
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
