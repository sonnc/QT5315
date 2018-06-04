/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import static hust.sie.inpg12.sonnc.apachepoi.TestRead.getFile;
import static hust.sie.inpg12.sonnc.apachepoi.TestRead.replaceDocument;
import static hust.sie.inpg12.sonnc.apachepoi.TestRead.saveDocxFile;
import hust.sie.inpg12.sonnc.controller.NhdController;
import hust.sie.inpg12.sonnc.entities.CongTy;
import hust.sie.inpg12.sonnc.entities.DeTai;
import hust.sie.inpg12.sonnc.entities.Logs;
import hust.sie.inpg12.sonnc.entities.NguoiHuongDan;
import hust.sie.inpg12.sonnc.entities.SinhVienFile;
import hust.sie.inpg12.sonnc.other.CongTyvaDaiDienCongTy;
import hust.sie.inpg12.sonnc.other.DanhSachSinhVien;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
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
    private List<DanhSachSinhVien> lstDSSVDanhGia = new ArrayList<>();
    private List<DanhSachSinhVien> lstDSSVChamCong = new ArrayList<>();
    private List<DeTai> lstAllDeTai = new ArrayList<>();
    private List<DeTai> lstAllDeTaiNHD = new ArrayList<>();
    private CongTy congTy;
    private List<CongTyvaDaiDienCongTy> lstCongTyvaDaiDienCongTys = new ArrayList<>();

    public List<CongTyvaDaiDienCongTy> getLstCongTyvaDaiDienCongTys() {
        return lstCongTyvaDaiDienCongTys;
    }

    public void setLstCongTyvaDaiDienCongTys(List<CongTyvaDaiDienCongTy> lstCongTyvaDaiDienCongTys) {
        this.lstCongTyvaDaiDienCongTys = lstCongTyvaDaiDienCongTys;
    }

    public List<DanhSachSinhVien> getLstDSSVDanhGia() {
        return lstDSSVDanhGia;
    }

    public void setLstDSSVDanhGia(List<DanhSachSinhVien> lstDSSVDanhGia) {
        this.lstDSSVDanhGia = lstDSSVDanhGia;
    }

    public List<DanhSachSinhVien> getLstDSSVChamCong() {
        return lstDSSVChamCong;
    }

    public void setLstDSSVChamCong(List<DanhSachSinhVien> lstDSSVChamCong) {
        this.lstDSSVChamCong = lstDSSVChamCong;
    }

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
        return SUCCESS;
    }

    public String getAllDSSVDanhGia() {
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
        }
        try {
            String email = (String) session.get("email");
            List<Object[]> results = nhdController.getAllDSSVDanhGia(email);
            for (Object[] result : results) {
                DanhSachSinhVien d = new DanhSachSinhVien();
                d.setMssv((int) result[0]);
                d.setHoTen((String) result[1]);
                lstDSSVDanhGia.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.put("getAllDSSVDanhGia", "getAllDSSVDanhGia");
        return SUCCESS;
    }

    public String getAllDSSVChamCong() {
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
        }
        try {
            String email = (String) session.get("email");
            List<Object[]> results = nhdController.getAllDSSVChamCong(email);
            for (Object[] result : results) {
                DanhSachSinhVien d = new DanhSachSinhVien();
                d.setMssv((int) result[0]);
                d.setHoTen((String) result[1]);
                lstDSSVChamCong.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.put("getAllDSSVChamCong", "getAllDSSVChamCong");
        return SUCCESS;
    }

    public String getAllDeTaiNHD() {
        int x = nhdController.getMaNHD((String) session.get("email"));
        lstAllDeTai = nhdController.getAllDeTaiNHD(x);
        session.put("getAllDeTaiNHD", "getAllDeTaiNHD");
        return SUCCESS;
    }

    public String getAllDeTai() {
        int y = nhdController.getMaCongTy((String) session.get("email"));
        lstAllDeTai = nhdController.getAllDeTai(y);
        session.put("getAllDeTai", "getAllDeTai");
        return SUCCESS;
    }

    public String GetCongTyByNHD() {
        String email = (String) session.get("email");
        List<Object[]> results = nhdController.GetCongTy(email);
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
        session.put("GetCongTyByNHD", "GetCongTyByNHD");
        return SUCCESS;
    }

    public String getInfoNHD() {
        int y = nhdController.getMaNHD((String) session.get("email"));
        this.nhd = nhdController.getInfoNHD(y);
        session.put("getInfoNHD", "getInfoNHD");
        return SUCCESS;
    }

    public String UploadFileDanhGia() {
        int mssv = Integer.parseInt(request.getParameter("mssv"));
        String link = null;
        try {
            path = request.getSession().getServletContext().getRealPath("/").concat("file/sinhvien/");
            File fileToCreate = new File(path, this.myFileFileName);
            FileUtils.copyFile(this.myFile, fileToCreate);
            link = "file/sinhvien/" + myFileFileName;
        } catch (Exception e) {
            e.printStackTrace();
            addActionError(e.getMessage());
            Logs((String) session.get("email"), "Lỗi đường dẫn khi upload file đánh giá cho sinh viên: " + request.getParameter("mssv") + " lên hệ thống thất bại");
        }

        SinhVienFile svf = new SinhVienFile();
        svf.setLoaiFile(3);
        svf.setMoTa("ĐÁNH GIÁ SINH VIÊN: " + mssv + "");
        svf.setMssv(mssv);
        Date dateUtil = new Date();
        java.sql.Date dateSql = new java.sql.Date(dateUtil.getTime());
        svf.setNgayThang(dateSql);
        svf.setTenFile("ĐÁNH GIÁ SINH VIÊN: " + mssv + "");
        svf.setLink(link);
        if (nhdController.saveFileSV(svf)) {
            Logs((String) session.get("email"), "Đăng file đánh giá cho sinh viên: " + request.getParameter("mssv") + " thành công");
            session.put("message", "Quý vị đã đánh giá thành công cho sinh viên: " + mssv + ". Xin cảm ơn quý vị.!");
        } else {
            Logs((String) session.get("email"), "Đăng file đánh giá cho sinh viên: " + request.getParameter("mssv") + " thất bại");
            session.put("message", "Đã có lỗi xảy ra khi đánh giá cho sinh viên: " + mssv + ". Xin quý vị thử lại sau!");
        }
        return SUCCESS;
    }

    public String UploadFileChamCong() {
        int mssv = Integer.parseInt(request.getParameter("mssv"));
        String link = null;
        try {
            path = request.getSession().getServletContext().getRealPath("/").concat("file/sinhvien/");
            File fileToCreate = new File(path, this.myFileFileName);
            FileUtils.copyFile(this.myFile, fileToCreate);
            link = "file/sinhvien/" + myFileFileName;

        } catch (Exception e) {
            e.printStackTrace();
            addActionError(e.getMessage());
            Logs((String) session.get("email"), "Lỗi đường dẫn khi upload file chấm công cho sinh viên: " + request.getParameter("mssv") + " lên hệ thống thất bại");
        }

        SinhVienFile svf = new SinhVienFile();
        svf.setLoaiFile(4);
        svf.setMoTa("CHẤM CÔNG SINH VIÊN: " + mssv + "");
        svf.setMssv(mssv);
        Date dateUtil = new Date();
        java.sql.Date dateSql = new java.sql.Date(dateUtil.getTime());
        svf.setNgayThang(dateSql);
        svf.setTenFile("CHẤM CÔNG SINH VIÊN: " + mssv + "");
        svf.setLink(link);
        if (nhdController.saveFileSV(svf)) {
            Logs((String) session.get("email"), "Đăng file chấm công cho sinh viên: " + request.getParameter("mssv") + " thành công");
            session.put("message", "Quý vị đã GỬI FILE CHẤM CÔNG thành công cho sinh viên: " + mssv + ". Xin cảm ơn quý vị.!");
        } else {
            Logs((String) session.get("email"), "Đăng file chấm công cho sinh viên: " + request.getParameter("mssv") + " thất bại");
            session.put("message", "Đã có lỗi xảy ra khi GỬI FILE CHẤM CÔNG cho sinh viên: " + mssv + ". Xin quý vị thử lại sau!");
        }
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
            Logs((String) session.get("email"), "Cập nhật thông tin cá nhân thành công");
            session.put("message", "Cập nhật thông tin cá nhân thành công !");
        } else {
            Logs((String) session.get("email"), "Cập nhật thông tin cá nhân thất bại");
            session.put("message", " cập nhật thông tin thất bại. Đã có lỗi xáy ra, vui lòng thử đăng nhập lại và thực hiện sau hoặc liên hệ với quản trị viên.");
        }

        session.put("getAllDSSVDanhGia", "getAllDSSVDanhGia");
        return SUCCESS;
    }

    public String DanhGiaSinhVien() throws FileNotFoundException {
        String STR_FIRST_FIELD = "#";
        String STR_LAST_FIELD = "#";
        String STR_MATCHER = "(?i).*#[a-zA-Z_0-9]+#.*";
        String STR_MATCHER_CHILD = "#[a-zA-Z_0-9]+#";
        Date dateU = new Date();
        String date = dateU.toString();

        String sinhVien = request.getParameter("SINHVIEN");

        int maNHD = nhdController.getMaNHD((String) session.get("email"));
        NguoiHuongDan nhd = nhdController.getInfoNHD(maNHD);
        CongTy ct = nhdController.getInfoct(nhd.getMaCongTy());
        Map fieldReport = new HashMap();
        for (int i = 0; i < 22; i++) {
            fieldReport.put("D" + i + "", request.getParameter("D" + i + ""));
            fieldReport.put("NX" + i + "", request.getParameter("NX" + i + ""));
        }
        fieldReport.put("DATE", date);
        fieldReport.put("NHD", nhd.getHoTen());
        fieldReport.put("EMAIL", nhd.getEmail());
        fieldReport.put("DIENTHOAI", nhd.getDienThoai());
        fieldReport.put("COSOTHUCTAP", ct.getTenCongTy());
        fieldReport.put("DIACHI", ct.getDiaChi());
        fieldReport.put("SINHVIEN", sinhVien);
        fieldReport.put("DANHGIACHUNG", request.getParameter("DANHGIACHUNG"));
        fieldReport.put("NHANSINHVIEN", request.getParameter("NHANSINHVIEN"));
        fieldReport.put("KIENTHUCCOSO", request.getParameter("KIENTHUCCOSO"));
        fieldReport.put("NGONNGULAPTRINH", request.getParameter("NGONNGULAPTRINH"));
        fieldReport.put("PHANMEM", request.getParameter("PHANMEM"));
        fieldReport.put("PHANCUNG", request.getParameter("PHANCUNG"));
        fieldReport.put("KHAC", request.getParameter("KHAC"));
        fieldReport.put("Q_NHOMKIENTHUC", request.getParameter("Q_NHOMKIENTHUC"));
        fieldReport.put("Q_NGOAINGU", request.getParameter("Q_NGOAINGU"));
        fieldReport.put("Q_TRINHDONGOAINGU", request.getParameter("Q_TRINHDONGOAINGU"));
        fieldReport.put("Q_THIEUSOT", request.getParameter("Q_THIEUSOT"));
        fieldReport.put("Q_UUDIEM", request.getParameter("Q_UUDIEM"));
        fieldReport.put("Q_CAITIEN", request.getParameter("Q_CAITIEN"));
        path = request.getSession().getServletContext().getRealPath("/");
        XWPFDocument document = getFile(path + "DOCX/BM01_2_4_CongtyDanhgiaketqua.docx");
        System.out.println(path);
        document = replaceDocument(document, fieldReport, STR_FIRST_FIELD, STR_LAST_FIELD, STR_MATCHER, STR_MATCHER_CHILD);
        saveDocxFile(path + "file/sinhvien/danhgia/BM01_2_4_CongtyDanhgiaketqua_" + sinhVien + ".docx", document);

        
        SinhVienFile svf = new SinhVienFile();
        svf.setLoaiFile(3);
        svf.setMoTa("ĐÁNH GIÁ SINH VIÊN: " + sinhVien + "");
        int mssv = Integer.parseInt(sinhVien.substring(0, 8));
        svf.setMssv(mssv);
        Date dateUtil = new Date();
        java.sql.Date dateSql = new java.sql.Date(dateUtil.getTime());
        svf.setNgayThang(dateSql);
        svf.setTenFile("ĐÁNH GIÁ SINH VIÊN: " + sinhVien + "");
        svf.setLink("file/sinhvien/danhgia/BM01_2_4_CongtyDanhgiaketqua_" + sinhVien + ".doc");
        
         if (nhdController.saveFileSV(svf)) {
            Logs((String) session.get("email"), "Đánh giá thực tập cho sinh viên: "+sinhVien+"");
            session.put("message", "Cảm ơn quý vị đã đánh giá thực tập cho sinh viên: "+sinhVien+"");
        } else {
            Logs((String) session.get("email"), "Đánh giá thực tập cho sinh viên: "+sinhVien+"");
            session.put("message", "Đã có lỗi xảy ra khi đánh giá thực tập cho sinh viên: " + sinhVien + ". Xin quý vị thử lại sau!");
        }
        
        session.put("getAllDSSVDanhGia", "getAllDSSVDanhGia");
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
        nhdController.logs(logs);
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
