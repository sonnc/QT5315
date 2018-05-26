/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.action;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import hust.sie.inpg12.sonnc.controller.AdminController;
import hust.sie.inpg12.sonnc.entities.CongTy;
import hust.sie.inpg12.sonnc.entities.DeTai;
import hust.sie.inpg12.sonnc.entities.FileAll;
import hust.sie.inpg12.sonnc.entities.GiangVienHuongDan;
import hust.sie.inpg12.sonnc.entities.HeSoDiem;
import hust.sie.inpg12.sonnc.entities.Login;
import hust.sie.inpg12.sonnc.entities.SinhVien;
import hust.sie.inpg12.sonnc.entities.SinhVienDiem;
import hust.sie.inpg12.sonnc.entities.ThongBao;
import hust.sie.inpg12.sonnc.other.CongTyvaDaiDienCongTy;
import hust.sie.inpg12.sonnc.other.DanhSachSinhVien;
import hust.sie.inpg12.sonnc.other.SinhVienDiemThi;
import hust.sie.inpg12.sonnc.other.SvDtCtNhd;
import hust.sie.inpg12.sonnc.other.nhd;
import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author sonnc
 */
public class AdminAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private AdminController adminController;
    private List<SinhVien> lstSinhVien = new ArrayList<>();
    private List<GiangVienHuongDan> lstGiangVienHuongDans = new ArrayList<>();
    private List<CongTyvaDaiDienCongTy> lstCongTy = new ArrayList<>();
    private List<DeTai> lstDeTais = new ArrayList<>();
    private List<DanhSachSinhVien> lstDanhSachSinhViens = new ArrayList<>();
    private List<SvDtCtNhd> lstSvDtCtNhds = new ArrayList<>();
    private List<SinhVienDiemThi> lstSinhVienDiemThi = new ArrayList<>();
    private List<ThongBao> lstThongBaos = new ArrayList<>();
    private List<FileAll> lstFileAlls = new ArrayList<>();
    private List<nhd> lstNguoiHuongDans = new ArrayList<>();
    private File myFile;
    private String myFileFileName;
    private String path;

    public List<nhd> getLstNguoiHuongDans() {
        return lstNguoiHuongDans;
    }

    public void setLstNguoiHuongDans(List<nhd> lstNguoiHuongDans) {
        this.lstNguoiHuongDans = lstNguoiHuongDans;
    }

    public List<FileAll> getLstFileAlls() {
        return lstFileAlls;
    }

    public void setLstFileAlls(List<FileAll> lstFileAlls) {
        this.lstFileAlls = lstFileAlls;
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

    public List<ThongBao> getLstThongBaos() {
        return lstThongBaos;
    }

    public void setLstThongBaos(List<ThongBao> lstThongBaos) {
        this.lstThongBaos = lstThongBaos;
    }

    public List<SinhVienDiemThi> getLstSinhVienDiemThi() {
        return lstSinhVienDiemThi;
    }

    public void setLstSinhVienDiemThi(List<SinhVienDiemThi> lstSinhVienDiemThi) {
        this.lstSinhVienDiemThi = lstSinhVienDiemThi;
    }

    public List<SvDtCtNhd> getLstSvDtCtNhds() {
        return lstSvDtCtNhds;
    }

    public void setLstSvDtCtNhds(List<SvDtCtNhd> lstSvDtCtNhds) {
        this.lstSvDtCtNhds = lstSvDtCtNhds;
    }

    public List<DanhSachSinhVien> getLstDanhSachSinhViens() {
        return lstDanhSachSinhViens;
    }

    public void setLstDanhSachSinhViens(List<DanhSachSinhVien> lstDanhSachSinhViens) {
        this.lstDanhSachSinhViens = lstDanhSachSinhViens;
    }

    public List<DeTai> getLstDeTais() {
        return lstDeTais;
    }

    public void setLstDeTais(List<DeTai> lstDeTais) {
        this.lstDeTais = lstDeTais;
    }

    public List<CongTyvaDaiDienCongTy> getLstCongTy() {
        return lstCongTy;
    }

    public void setLstCongTy(List<CongTyvaDaiDienCongTy> lstCongTy) {
        this.lstCongTy = lstCongTy;
    }

    public List<SinhVien> getLstSinhVien() {
        return lstSinhVien;
    }

    public List<GiangVienHuongDan> getLstGiangVienHuongDans() {
        return lstGiangVienHuongDans;
    }

    public void setLstGiangVienHuongDans(List<GiangVienHuongDan> lstGiangVienHuongDans) {
        this.lstGiangVienHuongDans = lstGiangVienHuongDans;
    }

    public void setLstSinhVien(List<SinhVien> lstSinhVien) {
        this.lstSinhVien = lstSinhVien;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    public AdminAction() {
        adminController = new AdminController();
    }

    public String getAllSinhVienByAdmin() {
        try {
            List<Object[]> results = adminController.getAllSinhVienByAdmin();
            for (Object[] result : results) {
                SinhVien d = new SinhVien();
                if (result[0] == null) {
                    d.setMssv(Integer.parseInt(((String) result[5]).substring(0, 8)));
                    d.setHoTen("null");
                    d.setLop("null");
                    d.setKhoa(999);
                    d.setKhoaVien("null");
                } else {
                    d.setMssv((int) result[0]);
                    d.setHoTen((String) result[1]);
                    d.setLop((String) result[2]);
                    d.setKhoa((int) result[3]);
                    d.setKhoaVien((String) result[4]);
                }
                d.setEmail((String) result[5]);
                if (result[6].toString().equals("ACTIVE")) {
                    d.setStatus("<p style=\"color: blue\">ACTIVE</p>");
                } else {
                     d.setStatus("<p style=\"color: red\">CLOSED</p>");
                }
               // d.setStatus((String) result[6]);

                lstSinhVien.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        session.put("getAllSinhVienByAdmin", "getAllSinhVienByAdmin");
        return SUCCESS;
    }

    public String COAcountByAdmin() {
        String status = request.getParameter("status").toUpperCase();
        String email = request.getParameter("email");
        if (adminController.COAcountByAdmin(email, status)) {
            session.put("message", "Thay đổi trạng thái tài khoản thành công.");
        } else {
            session.put("message", "Thay đổi trạng thái tài khoản thất bại.");
        }
        return SUCCESS;
    }

    public String addLoginSVbyAdmin() {
        Login l = new Login();
        String e = request.getParameter("mssv");
        String email = e + "@student.hust.edu.vn";
        l.setEmail(email);
        l.setPass(e);
        System.out.println(e);
        l.setRule(0);
        l.setStatus("ACTIVE");
        if (adminController.addAcountLogin(l)) {
            session.put("message", "Thêm thành công tài khoản sinh viên.");
        } else {
            session.put("message", "Thêm tài khoản sinh viên thất bại.");
        }
        return SUCCESS;
    }

    public String getAllGVHDByAdmin() {
        try {
            List<Object[]> results = adminController.getAllGVHDByAdmin();
            for (Object[] result : results) {
                GiangVienHuongDan d = new GiangVienHuongDan();
                if (result[0] == null) {
                    d.setHoTen("null");
                    d.setDiaChi("null");
                    d.setDienThoai("null");
                    d.setKhoaVien("null");
                    d.setBoMon("null");
                } else {
                    d.setHoTen((String) result[0]);
                    d.setDiaChi((String) result[1]);
                    d.setDienThoai((String) result[3]);
                    d.setKhoaVien((String) result[4]);
                    d.setBoMon((String) result[5]);
                }
                d.setEmail((String) result[2]);
                d.setStatus((String) result[6]);
                lstGiangVienHuongDans.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        session.put("getAllGVHDByAdmin", "getAllGVHDByAdmin");
        return SUCCESS;

    }

    public String getAllNHDByAdmin() {
        try {
            List<Object[]> results = adminController.getAllNHDByAdmin();
            for (Object[] result : results) {
                nhd d = new nhd();
                d.setHoTen((String) result[0]);
                d.setDienThoai((String) result[1]);
                d.setEmail((String) result[2]);
                d.setChucVu((String) result[3]);
                d.setTenCongTy((String) result[4]);
                d.setStatus((String) result[5]);
                lstNguoiHuongDans.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        session.put("getAllNHDByAdmin", "getAllNHDByAdmin");
        return SUCCESS;

    }

    public String addLoginGVHDbyAdmin() {
        Login l = new Login();
        String e = request.getParameter("email");
        l.setEmail(e);
        l.setPass("12345678abc");
        l.setRule(2);
        l.setStatus("ACTIVE");
        if (adminController.addAcountLogin(l)) {
            session.put("message", "Thêm tài khoản giảng viên hướng dẫn thành công.");
        } else {
            session.put("message", "Thêm tài khoản giảng viên hướng dẫn thất bại.");
        }
        return SUCCESS;
    }

    public String getAllCongTyByAdmin() {
        List<Object[]> results = adminController.getAllCongTy();
        for (Object[] result : results) {
            CongTyvaDaiDienCongTy ct = new CongTyvaDaiDienCongTy();
            ct.setMaCongTy((int) result[0]);
            ct.setLogo((String) result[1]);
            ct.setTenCongTy((String) result[2]);
            ct.setDiaChi((String) result[3]);
            ct.setDienThoai((String) result[4]);
            ct.setEmail((String) result[5]);
            ct.setDaiDien((String) result[6]);
            ct.setMaDaiDien((int) result[7]);
            if ((int) result[8] == 0) {
                ct.setTrangThai("Đã từ chối");
            } else if ((int) result[8] == 1) {
                ct.setTrangThai("Đã chấp nhận");
            } else if ((int) result[8] == 2) {
                ct.setTrangThai("Chờ duyệt");
            }
            ct.setWebsite((String) result[9]);
            ct.setChucVuDD((String) result[10]);
            lstCongTy.add(ct);
        }
        session.put("getAllCongTyByAdmin", "getAllCongTyByAdmin");
        return SUCCESS;
    }

    public String deleteCongTyByAdmin() {
        int maCongTy = Integer.parseInt(request.getParameter("maCongTy"));
        if (adminController.deleteCongTyByAdmin(maCongTy)) {
            session.put("message", "Xóa công ty thành công.");
        } else {
            session.put("message", "Xóa công ty thất bại.");
        }
        return SUCCESS;
    }

    public String getAllDeTaiByAdmin() {
        lstDeTais = adminController.getAllDeTaiByAdmin();
        session.put("getAllDeTaiByAdmin", "getAllDeTaiByAdmin");
        return SUCCESS;
    }

    public String deleteDeTaiByAdmin() {
        int maDeTai = Integer.parseInt(request.getParameter("id"));
        if (adminController.deleteDeTaiByAdmin(maDeTai)) {
            session.put("message", "Xóa đề tài thành công.");
        } else {
            session.put("message", "Xóa đề tài thất bại.");
        }
        return SUCCESS;
    }

    public String getAllSVTTByAdmin() {
        try {
            List<Object[]> results = adminController.getAllSVTTByAdmin();
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
        session.put("getAllSVTTByAdmin", "getAllSVTTByAdmin");
        return SUCCESS;

    }

    public String getAllDTSVTTByAdmin() {
        try {
            List<Object[]> results = adminController.getAllDTSVTTByAdmin();
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
        session.put("getAllDTSVTTByAdmin", "getAllDTSVTTByAdmin");
        return SUCCESS;
    }

    public String getAllDiemThiSVTTByAdmin() {
        try {
            List<Object[]> results = adminController.getAllDiemThiSVTTByAdmin();
            for (Object[] result : results) {
                SinhVienDiemThi d = new SinhVienDiemThi();
                d.setMssv((int) result[0]);
                d.setHoTen((String) result[1]);
                d.setLop((String) result[2]);
                d.setKhoa((int) result[3]);
                d.setKhoaVien((String) result[4]);
                d.setDiemPhanHoi((double) result[5]);
                d.setDiemBCQT((double) result[6]);
                d.setDiemQuaTrinh((double) result[7]);
                d.setDiemBCCK((double) result[8]);
                d.setDotThucTap((int) result[9]);
                if ((boolean) result[10]) {
                    d.setTrangThai("Hoạt động");
                } else {
                    d.setTrangThai("Đã đóng");
                }
                lstSinhVienDiemThi.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        session.put("getAllDiemThiSVTTByAdmin", "getAllDiemThiSVTTByAdmin");
        return SUCCESS;
    }

    public String editPointByAdmin() {
        List<HeSoDiem> lstHeSoDiems = adminController.getAllHeSoDiem();
        int mssv = Integer.parseInt(request.getParameter("mssv"));
        int kyThucTap = Integer.parseInt(request.getParameter("dotThucTap"));
        double diemBCQT = Double.valueOf(request.getParameter("diemBCQT"));
        double diemPhanHoi = Double.valueOf(request.getParameter("diemPhanHoi"));
        double diemQuaTrinh = Double.valueOf(request.getParameter("diemQuaTrinh"));
        double diemBCCK = Double.valueOf(request.getParameter("diemBCCK"));
        double setDiemQuaTrinh = ((double) Math.round((lstHeSoDiems.get(0).getDiemPhanHoi() * diemPhanHoi
                + lstHeSoDiems.get(0).getDiemBcqt() * diemBCQT) * 10) / 10);

        if (adminController.updateDiem(setDiemQuaTrinh, diemBCQT, diemBCCK, kyThucTap, mssv)) {
            session.put("message", "Cập nhật điểm thành công!");
        } else {
            session.put("message", "Cập nhật điểm thất bại!");
        }
        return SUCCESS;
    }

    public String deletePoint() {
        int mssv = Integer.parseInt(request.getParameter("mssv"));
        int kyThucTap = Integer.parseInt(request.getParameter("dotThucTap"));
        if (adminController.deleteDiemThi(mssv, kyThucTap)) {
            session.put("message", "Xóa điểm thành công!");
        } else {
            session.put("message", "Xóa điểm thất bại!");
        }
        return SUCCESS;
    }

    public String viewDiemThiSVTTByAdmin() {
        int mssv = Integer.parseInt(request.getParameter("mssv"));
        int dotThucTap = Integer.parseInt(request.getParameter("dotThucTap"));
        try {
            List<Object[]> results = adminController.viewDiemThiSVTTByAdmin(mssv, dotThucTap);
            for (Object[] result : results) {
                SinhVienDiemThi d = new SinhVienDiemThi();
                d.setMssv((int) result[0]);
                d.setHoTen((String) result[1]);
                d.setLop((String) result[2]);
                d.setKhoa((int) result[3]);
                d.setKhoaVien((String) result[4]);
                d.setDiemPhanHoi((double) result[5]);
                d.setDiemBCQT((double) result[6]);
                d.setDiemQuaTrinh((double) result[7]);
                d.setDiemBCCK((double) result[8]);
                d.setDotThucTap((int) result[9]);
                if ((boolean) result[10]) {
                    d.setTrangThai("Hoạt động");
                } else {
                    d.setTrangThai("Đã đóng");
                }
                lstSinhVienDiemThi.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }

    public String deleteThongBao() {
        int x = Integer.parseInt(request.getParameter("id"));
        if (adminController.deleteThongBao(x)) {
            session.put("message", "Xóa thông báo thành công.");
        } else {
            session.put("message", "Xóa thông báo thất bại.");
        }
        return SUCCESS;
    }

    public String viewThongBao() {
        int x = Integer.parseInt(request.getParameter("id"));
        lstThongBaos = adminController.viewThongBao(x);
        return SUCCESS;
    }

    public String getAllThongBaoByAdmin() {
        lstThongBaos = adminController.getAllThongBaoByAdmin();
        session.put("getAllThongBaoByAdmin", "getAllThongBaoByAdmin");
        return SUCCESS;
    }

    public String SaveThongBaoByAdmin() {
        String link = null;
        try {
            path = request.getSession().getServletContext().getRealPath("/").concat("file/image/thongbao/");
            File fileToCreate = new File(path, this.myFileFileName);
            FileUtils.copyFile(this.myFile, fileToCreate);
            link = "file/image/thongbao/" + myFileFileName;
            System.out.println(link);
        } catch (Exception e) {
            e.printStackTrace();
            addActionError(e.getMessage());
            session.put("messageUploadFile", "Lỗi đường dẫn khi lưu file lên hệ thống. Hãy liên hệ với quản trị viên.");
        }
        ThongBao thongBao = new ThongBao();
        thongBao.setTieuDe(request.getParameter("tieuDe"));
        thongBao.setNoiDung(request.getParameter("noiDung"));
        thongBao.setType(Integer.parseInt(request.getParameter("type")));
        thongBao.setNguoiDang((String) session.get("email"));
        thongBao.setPhotoLink(link);
        Date date = new Date();
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
        thongBao.setNgayThang(sqlDate);
        if (adminController.saveThongBao(thongBao)) {
            session.put("message", "Đăng thông báo lên hệ thống thành công.");
        } else {
            session.put("message", "Đăng thông báo lên hệ thống thất bại.");
        }
        return SUCCESS;
    }

    public String getAllFileByAdmin() {
        lstFileAlls = adminController.getAllFileByAdmin();
        session.put("getAllFileByAdmin", "getAllFileByAdmin");
        return SUCCESS;
    }

    public String deleteFileByAdmin() {
        int id = Integer.parseInt(request.getParameter("id"));
        if (adminController.deleteFileByAdmin(id)) {
            session.put("message", "Xóa file thành công !");
        } else {
            session.put("message", "Xóa file thất bại!");
        }
        return SUCCESS;
    }

    public String UploadFileByAdmin() {
        FileAll fileAll = new FileAll();
        try {
            Date date = new Date();
            java.sql.Date ngayThang = new java.sql.Date(date.getTime());
            String link = null;
            try {
                path = request.getSession().getServletContext().getRealPath("/").concat("file/admin/");
                File fileToCreate = new File(path, this.myFileFileName);
                FileUtils.copyFile(this.myFile, fileToCreate);
                link = "../file/admin/" + myFileFileName;
                System.out.println(link);
            } catch (Exception e) {
                e.printStackTrace();
                addActionError(e.getMessage());
                session.put("messageUploadFile", "Lỗi đường dẫn khi lưu file lên hệ thống. Hãy liên hệ với quản trị viên.");
            }
            fileAll.setEmail((String) session.get("email"));
            fileAll.setLink(link);
            fileAll.setNgayThang(ngayThang);
            fileAll.setNoiDung(request.getParameter("noiDung"));
            fileAll.setTenFile(request.getParameter("tenFile"));
            fileAll.settype(1);
            if (adminController.UploadFileByAdmin(fileAll)) {
                session.put("message", " Tải tài liệu lên hệ thống thành công.");
            } else {
                session.put("message", " Tải tài liệu liệu lên hệ thống không thành công, vui lòng kiểm tra lại.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.put("message", "Lỗi không xác định.");
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
