/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import hust.sie.inpg12.sonnc.controller.DdctController;
import hust.sie.inpg12.sonnc.entities.DaiDienCongTy;
import hust.sie.inpg12.sonnc.entities.NguoiHuongDan;
import hust.sie.inpg12.sonnc.other.CongTyvaDaiDienCongTy;
import hust.sie.inpg12.sonnc.other.DanhSachSinhVien;
import hust.sie.inpg12.sonnc.other.DetaiCongtyNguoihuongdan;
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
public class DdctAction extends ActionSupport implements SessionAware, ServletRequestAware {

    // Phần khai báo các thông tin, các biến cần thiết
    private HttpServletRequest request;
    private Map<String, Object> session;
    private DdctController ddctController;
    private List<CongTyvaDaiDienCongTy> lstCongTyvaDaiDienCongTys = new ArrayList<>();
    private List<DanhSachSinhVien> lstDanhSachSinhViens = new ArrayList<>();
    private List<DetaiCongtyNguoihuongdan> lstDetaiCongtyNguoihuongdan = new ArrayList<>();
    private List<NguoiHuongDan> lstNguoiHuongDans = new ArrayList<>();
    
    public List<DetaiCongtyNguoihuongdan> getLstDetaiCongtyNguoihuongdan() {
        return lstDetaiCongtyNguoihuongdan;
    }
    
    public List<NguoiHuongDan> getLstNguoiHuongDans() {
        return lstNguoiHuongDans;
    }
    
    public void setLstNguoiHuongDans(List<NguoiHuongDan> lstNguoiHuongDans) {
        this.lstNguoiHuongDans = lstNguoiHuongDans;
    }
    
    public void setLstDetaiCongtyNguoihuongdan(List<DetaiCongtyNguoihuongdan> lstDetaiCongtyNguoihuongdan) {
        this.lstDetaiCongtyNguoihuongdan = lstDetaiCongtyNguoihuongdan;
    }
    
    public List<DanhSachSinhVien> getLstDanhSachSinhViens() {
        return lstDanhSachSinhViens;
    }
    
    public void setLstDanhSachSinhViens(List<DanhSachSinhVien> lstDanhSachSinhViens) {
        this.lstDanhSachSinhViens = lstDanhSachSinhViens;
    }
    
    public HttpServletRequest getRequest() {
        return request;
    }
    
    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }
    
    public List<CongTyvaDaiDienCongTy> getLstCongTyvaDaiDienCongTys() {
        return lstCongTyvaDaiDienCongTys;
    }
    
    public void setLstCongTyvaDaiDienCongTys(List<CongTyvaDaiDienCongTy> lstCongTyvaDaiDienCongTys) {
        this.lstCongTyvaDaiDienCongTys = lstCongTyvaDaiDienCongTys;
    }
    
    public DdctAction() {
        ddctController = new DdctController();
    }
    
    public String GetCongTyByDDCT() {
        String email = (String) session.get("email");
        List<Object[]> results = ddctController.GetCongTy(email);
        for (Object[] result : results) {
            CongTyvaDaiDienCongTy ct = new CongTyvaDaiDienCongTy();
            ct.setMaCongTy((int) result[0]);
            ct.setTenCongTy((String) result[1]);
            ct.setDiaChi((String) result[2]);
            ct.setDienThoai((String) result[3]);
            ct.setEmail((String) result[4]);
            ct.setWebsite((String) result[5]);
            ct.setLinhVucHoatDong((String) result[6]);
            ct.setMoTa((String) result[7]);
            ct.setLogo((String) result[8]);
            // ct.setTrangThai(result[]);
            ct.setMaDaiDien((int) result[10]);
            ct.setDaiDien((String) result[11]);
            ct.setChucVuDD((String) result[12]);
            ct.setDiaChiDD((String) result[13]);
            ct.setDienThoaiDD((String) result[14]);
            ct.setEmailDD((String) result[15]);
            ct.setAvatarDD((String) result[16]);
            lstCongTyvaDaiDienCongTys.add(ct);
        }
        session.put("GetCongTyByDDCT", "GetCongTyByDDCT");
        return SUCCESS;
    }
    
    public String getAllDanhSachSinhVienByCongTy() {
        try {
            String email = (String) session.get("email");
            List<Object[]> results = ddctController.getAllDanhSachSinhVienByCongTy(email);
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
        session.put("getAllDanhSachSinhVienByCongTy", "getAllDanhSachSinhVienByCongTy");
        return SUCCESS;
        
    }
    
    public String GetAllDeTaiByCongTy() {
        String email = (String) session.get("email");
        List<Object[]> results = ddctController.GetAllDeTaiByCongTy(email);
        for (Object[] result : results) {
            DetaiCongtyNguoihuongdan a = new DetaiCongtyNguoihuongdan();
            a.setMaDeTai((int) result[0]);
            a.setMaCongTy((int) result[1]);
            a.setMaGvhd((int) result[2]);
            a.setTenDeTai((String) result[3]);
            a.setNoiDung((String) result[4]);
            a.setYeuCauLapTrinh((String) result[5]);
            a.setNguoiDang((String) result[6]);
            a.setSoLuong((int) result[7]);
            a.setSoLuongCon((int) result[8]);
            if ((int) result[9] == 0) {
                a.setStatus("Không chấp nhận");
            } else if ((int) result[9] == 1) {
                a.setStatus("Đã chấp nhận");
            } else if ((int) result[9] == 2) {
                a.setStatus("Đang chờ duyệt");
            }
            a.setTrangThai((int) result[9]);
            a.setNgayDang((Date) result[10]);
            a.setHanDangKy((Date) result[11]);
            a.setYeuCauKhac((String) result[12]);
            a.setNguoiHuongDan((String) result[13]);
            a.setEmailNHD((String) result[14]);
            a.setDienThoaiNHD((String) result[15]);
            a.setChucVuNHD((String) result[16]);
            a.setAvatarNHD((String) result[17]);
            a.setDiaChiNHD((String) result[18]);
            lstDetaiCongtyNguoihuongdan.add(a);
        }
        List<Object[]> resultsNHD = ddctController.GetAllNguoiHuongDanByCongTy(email);
        for (Object[] result : resultsNHD) {
            NguoiHuongDan nhd = new NguoiHuongDan();
            nhd.setMaGvhd((int) result[0]);
            nhd.setMaCongTy((int) result[1]);
            nhd.setHoTen((String) result[2]);
            nhd.setChucvu((String) result[3]);
            nhd.setDienThoai((String) result[4]);
            nhd.setEmail((String) result[5]);
            nhd.setAvatar((String) result[6]);
            nhd.setDiaChi((String) result[7]);
            nhd.setLinhVucHoatDong((String) result[8]);
            nhd.setDuAn((String) result[9]);
            lstNguoiHuongDans.add(nhd);
        }
        session.put("maCongTy", ddctController.GetMaCongTy(email));
        session.put("GetAllDeTaiByCongTy", "GetAllDeTaiByCongTy");
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
