/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.action;

import com.opensymphony.xwork2.ActionSupport;
import hust.sie.inpg12.sonnc.controller.GvhdController;
import hust.sie.inpg12.sonnc.controller.SinhVienController;
import hust.sie.inpg12.sonnc.entities.SinhVien;
import hust.sie.inpg12.sonnc.entities.SinhVienDangKy;
import hust.sie.inpg12.sonnc.entities.SinhVienDiem;
import hust.sie.inpg12.sonnc.entities.SinhVienInfo;
import hust.sie.inpg12.sonnc.entities.SinhVienThucTap;
import hust.sie.inpg12.sonnc.other.DanhSachSinhVien;
import hust.sie.inpg12.sonnc.other.SvDtCtNhd;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author sonnc
 */
public class GvhdAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private GvhdController gvhdController;
    private SinhVienController sinhVienController;
    private List<DanhSachSinhVien> lstDanhSachSinhViens = new ArrayList<>();
    private List<SvDtCtNhd> lstSvDtCtNhds = new ArrayList<>();
    private List<SinhVien> lstSinhVien = new ArrayList<>();
    private List<SinhVienInfo> lstSVI = new ArrayList<>();

    public List<SvDtCtNhd> getLstSvDtCtNhds() {
        return lstSvDtCtNhds;
    }

    public void setLstSvDtCtNhds(List<SvDtCtNhd> lstSvDtCtNhds) {
        this.lstSvDtCtNhds = lstSvDtCtNhds;
    }

    public List<SinhVien> getLstSinhVien() {
        return lstSinhVien;
    }

    public void setLstSinhVien(List<SinhVien> lstSinhVien) {
        this.lstSinhVien = lstSinhVien;
    }

    public List<SinhVienInfo> getLstSVI() {
        return lstSVI;
    }

    public void setLstSVI(List<SinhVienInfo> lstSVI) {
        this.lstSVI = lstSVI;
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

    public GvhdAction() {
        gvhdController = new GvhdController();
        sinhVienController = new SinhVienController();
    }

    public String getAllDanhSachSinhVien() {
        try {
            List<Object[]> results = gvhdController.getAllDanhSachSinhVien();
            for (Object[] result : results) {
                DanhSachSinhVien d = new DanhSachSinhVien();
                d.setMssv((int) result[0]);
                d.setHoTen((String) result[1]);
                d.setLop((String) result[2]);
                d.setKhoa((int) result[3]);
                d.setKhoaVien((String) result[4]);
                d.setDotThucTap((int) result[5]);
                if ((boolean) result[6]) {
                    d.setTrangThai("Hoạt động");
                } else {
                    d.setTrangThai("Đã đóng");
                }

                lstDanhSachSinhViens.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        session.put("getAllDanhSachSinhVien", "getAllDanhSachSinhVien");
        return SUCCESS;

    }

    public String getThongTinSV() {
        // kiểm tra lại thông tin của sinhVienInfo.
        // giá trị trả về là null, 
        try {
            lstSinhVien = sinhVienController.getSinhVien(Integer.parseInt(request.getParameter("mssv")));
            lstSVI = sinhVienController.getSinhVienInfo(Integer.parseInt(request.getParameter("mssv")));
            session.put("getSinhVienThongTinByList", "getSinhVienThongTinByList");
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    public String getAllDeTaiSV() {
        try {
            List<Object[]> results = results = gvhdController.getAllDeTaiSV();
            for (Object[] result : results) {
                SvDtCtNhd d = new SvDtCtNhd();
                d.setMssv((int) result[0]);
                d.setHoTen((String) result[1]);
                d.setDeTai((String) result[2]);
                d.setCongTy((String) result[3]);
                d.setNguoiHuongDan((String) result[4]);
                DecimalFormat f = new DecimalFormat("##.00");
                d.setSoKhop(Double.parseDouble(f.format((double) result[5])));
                d.setDotThucTap((int) result[6]);
                if ((int) result[7] == 0) {
                    d.setTrangThai("Đã từ chối");
                } else if ((int) result[7] == 1) {
                    d.setTrangThai("Đã đồng ý");
                } else if ((int) result[7] == 2) {
                    d.setTrangThai("Đang chờ");
                }
                d.setMaCongTy((int) result[8]);
                d.setMaDeTai((int) result[9]);
                d.setMaGvhd((int) result[10]);
                lstSvDtCtNhds.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        session.put("getAllDeTaiSV", "getAllDeTaiSV");
        return SUCCESS;
    }

    public String getAllDeTaiSVNO() {
        try {
            List<Object[]> results = gvhdController.deTaiSVChuaDuyet();
            for (Object[] result : results) {
                SvDtCtNhd d = new SvDtCtNhd();
                d.setMssv((int) result[0]);
                d.setHoTen((String) result[1]);
                d.setDeTai((String) result[2]);
                d.setCongTy((String) result[3]);
                d.setNguoiHuongDan((String) result[4]);
                DecimalFormat f = new DecimalFormat("##.00");
                d.setSoKhop(Double.parseDouble(f.format((double) result[5])));
                d.setDotThucTap((int) result[6]);
                if ((int) result[7] == 0) {
                    d.setTrangThai("Đã từ chối");
                } else if ((int) result[7] == 1) {
                    d.setTrangThai("Đã đồng ý");
                }
                d.setMaCongTy((int) result[8]);
                d.setMaDeTai((int) result[9]);
                d.setMaGvhd((int) result[10]);
                lstSvDtCtNhds.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        session.put("getAllDeTaiSVNO", "getAllDeTaiSVNO");
        return SUCCESS;
    }

    public String getAllDeTaiSVYES() {
        try {
            List<Object[]> results = gvhdController.deTaiSVDaDuyet();
            for (Object[] result : results) {
                SvDtCtNhd d = new SvDtCtNhd();
                d.setMssv((int) result[0]);
                d.setHoTen((String) result[1]);
                d.setDeTai((String) result[2]);
                d.setCongTy((String) result[3]);
                d.setNguoiHuongDan((String) result[4]);
                DecimalFormat f = new DecimalFormat("##.00");
                d.setSoKhop(Double.parseDouble(f.format((double) result[5])));
                d.setDotThucTap((int) result[6]);
                if ((int) result[7] == 0) {
                    d.setTrangThai("Đã từ chối");
                } else if ((int) result[7] == 1) {
                    d.setTrangThai("Đã đồng ý");
                }
                d.setMaCongTy((int) result[8]);
                d.setMaDeTai((int) result[9]);
                d.setMaGvhd((int) result[10]);
                lstSvDtCtNhds.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        session.put("getAllDeTaiSVYES", "getAllDeTaiSVYES");
        return SUCCESS;
    }

    public String duyetDeTaiSV() {
        String mssv = request.getParameter("mssv");
        String maDT = request.getParameter("maDeTai");
        String trangthai = request.getParameter("trangThai");
        String dotThucTap = request.getParameter("dotThucTap");
        if (request.getParameter("trangThai").equals("false")) {
            SinhVienDangKy svdk = gvhdController.detaiMotSinhVienDangKyGetID(
                    Integer.parseInt(request.getParameter("mssv")),
                    Integer.parseInt(request.getParameter("dotThucTap")),
                    Integer.parseInt(request.getParameter("maDeTai")));
            svdk.setTrangThai(0);
            if (gvhdController.updateDetaiMotSinhVienDangKy(svdk)) {
                session.put("messageDuyetDetai", "Đã từ chối thành công đề tài cho sinh viên: " + request.getParameter("mssv"));
            } else {
                session.put("messageDuyetDetai", "Đã có lỗi xảy ra khi xử lý hành động này, vui lòng thử lại sau.");
            }
            return SUCCESS;
        }
        if (request.getParameter("trangThai").equals("true")) {
            List<SinhVienDangKy> lstSinhVienDangKys = gvhdController.listDetaiMotSinhVienDangKy(
                    Integer.parseInt(request.getParameter("mssv")), Integer.parseInt(request.getParameter("dotThucTap")));
            for (int i = 0; i < lstSinhVienDangKys.size(); i++) {
                SinhVienDangKy svdk = new SinhVienDangKy();
                if (lstSinhVienDangKys.get(i).getMaDeTai() == Integer.parseInt(request.getParameter("maDeTai"))) {
                    svdk.setTrangThai(1);

                } else {
                    svdk.setTrangThai(0);
                }
                svdk.setId(lstSinhVienDangKys.get(i).getId());
                svdk.setDotThucTap(lstSinhVienDangKys.get(i).getDotThucTap());
                svdk.setMaCongTy(lstSinhVienDangKys.get(i).getMaCongTy());
                svdk.setMaDeTai(lstSinhVienDangKys.get(i).getMaDeTai());
                svdk.setMssv(lstSinhVienDangKys.get(i).getMssv());
                svdk.setNgayDangKy(lstSinhVienDangKys.get(i).getNgayDangKy());
                svdk.setSoKhop(lstSinhVienDangKys.get(i).getSoKhop());
                gvhdController.updateDetaiMotSinhVienDangKy(svdk);
                // diền vào bảng sinh viên thực tập nữa
            }
            List<SinhVienThucTap> lst = gvhdController.getSinhVienThucTapByID(
                    Integer.parseInt(request.getParameter("mssv")),
                    Integer.parseInt(request.getParameter("dotThucTap")));
            int id = lst.get(0).getId();
            // Ghi thực tập chinh thức
            java.util.Date utilDate = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            // thực tập trong vòng 3 tháng
            Calendar cal = Calendar.getInstance();
            cal.setTime(utilDate);
            cal.add(Calendar.DATE, 90);
            java.util.Date utilDateEnd = cal.getTime();
            java.sql.Date sqlDateEnd = new java.sql.Date(utilDateEnd.getTime());

            SinhVienThucTap sinhVienThucTap = new SinhVienThucTap();
            sinhVienThucTap.setMaDeTai(Integer.parseInt(request.getParameter("maDeTai")));
            sinhVienThucTap.setDotThucTap(Integer.parseInt(request.getParameter("dotThucTap")));
            sinhVienThucTap.setMssv(Integer.parseInt(request.getParameter("mssv")));
            sinhVienThucTap.setThoiGianBatDau(sqlDate);
            sinhVienThucTap.setThoiGianKetThuc(sqlDateEnd);
            sinhVienThucTap.setTrangThai(true);
            sinhVienThucTap.setId(id);

            SinhVienDiem sinhVienDiem = new SinhVienDiem();
            sinhVienDiem.setMssv(Integer.parseInt(request.getParameter("mssv")));
            sinhVienDiem.setDotThucTap(Integer.parseInt(request.getParameter("dotThucTap")));

            if (gvhdController.saveSVTT(sinhVienThucTap, sinhVienDiem)) {
                session.put("messageDuyetDetai", "Duyệt thành công");
            } else {
                session.put("messageDuyetDetai", "Duyệt thất bại");
            }
            return SUCCESS;
        }
        return SUCCESS;
    }

    public String getDanhSachChamDiem() {
        try {
            List<Object[]> results = gvhdController.getAllDanhSachSinhVien();
            for (Object[] result : results) {
                DanhSachSinhVien d = new DanhSachSinhVien();
                d.setMssv((int) result[0]);
                d.setHoTen((String) result[1]);
                d.setLop((String) result[2]);
                d.setKhoa((int) result[3]);
//                d.setKhoaVien((String) result[4]);
                d.setDotThucTap((int) result[5]);
//                if ((boolean) result[6]) {
//                    d.setTrangThai("Hoạt động");
//                } else {
//                    d.setTrangThai("Đã đóng");
//                }
                lstDanhSachSinhViens.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        session.put("getDanhSachChamDiem", "getDanhSachChamDiem");
        return SUCCESS;
    }

    public String chamDiem(){
        System.out.println(request.getParameter("mssv"));
        return SUCCESS;
    }
    
    public String getAllDiemSV() {

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
