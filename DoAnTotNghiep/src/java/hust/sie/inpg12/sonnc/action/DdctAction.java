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
import hust.sie.inpg12.sonnc.entities.CongTy;
import hust.sie.inpg12.sonnc.entities.DaiDienCongTy;
import hust.sie.inpg12.sonnc.entities.DeTai;
import hust.sie.inpg12.sonnc.entities.Email;
import hust.sie.inpg12.sonnc.entities.Login;
import hust.sie.inpg12.sonnc.entities.NguoiHuongDan;
import hust.sie.inpg12.sonnc.other.CongTyvaDaiDienCongTy;
import hust.sie.inpg12.sonnc.other.DanhSachSinhVien;
import hust.sie.inpg12.sonnc.other.DetaiCongtyNguoihuongdan;
import java.io.File;
import java.text.SimpleDateFormat;
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
public class DdctAction extends ActionSupport implements SessionAware, ServletRequestAware {

    // Phần khai báo các thông tin, các biến cần thiết
    private HttpServletRequest request;
    private Map<String, Object> session;
    private DdctController ddctController;
    private List<CongTyvaDaiDienCongTy> lstCongTyvaDaiDienCongTys = new ArrayList<>();
    private List<DanhSachSinhVien> lstDanhSachSinhViens = new ArrayList<>();
    private List<DetaiCongtyNguoihuongdan> lstDetaiCongtyNguoihuongdan = new ArrayList<>();
    private List<NguoiHuongDan> lstNguoiHuongDans = new ArrayList<>();
    private NguoiHuongDan nhd = new NguoiHuongDan();
    private List<Email> lstAllEmail = new ArrayList<>();
    private List<Email> lstEmailRead = new ArrayList<>();
    private List<Email> lstEmailUnread = new ArrayList<>();
    private List<Email> lstEmailSend = new ArrayList<>();
    private DaiDienCongTy ddct = new DaiDienCongTy();
    private CongTy ct = new CongTy();
    private DeTai deTai = new DeTai();
    private File myFile;
    private File myFileDDCT;
    private String myFileFileName;
    private String myFileFileNameDDCT;
    private String path;
    private String pathDDCT;

    public File getMyFileDDCT() {
        return myFileDDCT;
    }

    public void setMyFileDDCT(File myFileDDCT) {
        this.myFileDDCT = myFileDDCT;
    }

    public String getMyFileFileNameDDCT() {
        return myFileFileNameDDCT;
    }

    public void setMyFileFileNameDDCT(String myFileFileNameDDCT) {
        this.myFileFileNameDDCT = myFileFileNameDDCT;
    }

    public DaiDienCongTy getDdct() {
        return ddct;
    }

    public void setDdct(DaiDienCongTy ddct) {
        this.ddct = ddct;
    }

    public CongTy getCt() {
        return ct;
    }

    public void setCt(CongTy ct) {
        this.ct = ct;
    }

    public List<Email> getLstAllEmail() {
        return lstAllEmail;
    }

    public void setLstAllEmail(List<Email> lstAllEmail) {
        this.lstAllEmail = lstAllEmail;
    }

    public List<Email> getLstEmailRead() {
        return lstEmailRead;
    }

    public void setLstEmailRead(List<Email> lstEmailRead) {
        this.lstEmailRead = lstEmailRead;
    }

    public List<Email> getLstEmailUnread() {
        return lstEmailUnread;
    }

    public void setLstEmailUnread(List<Email> lstEmailUnread) {
        this.lstEmailUnread = lstEmailUnread;
    }

    public List<Email> getLstEmailSend() {
        return lstEmailSend;
    }

    public void setLstEmailSend(List<Email> lstEmailSend) {
        this.lstEmailSend = lstEmailSend;
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

    public NguoiHuongDan getNhd() {
        return nhd;
    }

    public void setNhd(NguoiHuongDan nhd) {
        this.nhd = nhd;
    }

    public DeTai getDeTai() {
        return deTai;
    }

    public void setDeTai(DeTai deTai) {
        this.deTai = deTai;
    }

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

    public String deleteDeTaiByDDCT() {
        DeTai dt = new DeTai();
        int maDeTai = Integer.parseInt(request.getParameter("maDeTai"));
        dt = ddctController.getInfoDeTaiByDDCT(maDeTai);

        if (dt.getTrangThai() == 1) {
            session.put("messageDeleteDetai", "Không thể xóa đề tài. Đề tài này đã được duyệt hoặc đã có sinh viên đăng ký.");
        } else {
            dt.setTrangThai(3);
            if (ddctController.updateDeleteDeTaiByDDCT(dt)) {
                session.put("messageDeleteDetai", "Xóa thành công đề tài: " + dt.getTenDeTai() + "");
            } else {
                session.put("messageDeleteDetai", "Đã có lỗi xảy ra khi xóa đề tài: " + dt.getTenDeTai() + "");
            }
        }
        System.out.println((String) session.get("messageDeleteDetai"));
        return SUCCESS;
    }

    public String getInfoCongTyByDDCT() {
        int msct = ddctController.GetMaCongTy((String) session.get("email"));
        ct = ddctController.getInfoCongTyByDDCT(msct);
        session.put("getInfoCongTyByDDCT", "getInfoCongTyByDDCT");
        return SUCCESS;
    }

    public String updateCongTyByDDCT() {
        int msct = ddctController.GetMaCongTy((String) session.get("email"));
        CongTy congTy = new CongTy();
        congTy = ddctController.getInfoCongTyByDDCT(msct);
        congTy.setLinhVucHoatDong(ct.getLinhVucHoatDong());
        congTy.setMoTa(ct.getMoTa());
        if (ddctController.updateCongty(congTy)) {
            session.put("updateCongTy", "Cập nhật thông tin công ty thành công.");
        } else {
            session.put("updateCongTy", "Đã có lỗi xảy ra. Cập nhật thông tin công ty thất bại.");
        }
        return SUCCESS;
    }

    public String saveCongtyAndDaidien() {
        String avatar = null;
        String logo = null;
        try {
            pathDDCT = request.getSession().getServletContext().getRealPath("/").concat("file/image/avatar/");
            File fileToCreate = new File(pathDDCT, this.myFileFileNameDDCT);
            FileUtils.copyFile(this.myFileDDCT, fileToCreate);
            avatar = "file/image/avatar/" + myFileFileNameDDCT;
            System.out.println(avatar);
            System.out.println(pathDDCT);
        } catch (Exception e) {
            e.printStackTrace();
            addActionError(e.getMessage());
        }
        try {
            path = request.getSession().getServletContext().getRealPath("/").concat("file/image/logo/");
            File fileToCreate = new File(path, this.myFileFileName);
            FileUtils.copyFile(this.myFile, fileToCreate);
            logo = "file/image/logo/" + myFileFileName;
            System.out.println(avatar);
            System.out.println(path);
        } catch (Exception e) {
            e.printStackTrace();
            addActionError(e.getMessage());
        }
        DaiDienCongTy dd = new DaiDienCongTy();
        dd = this.ddct;
        dd.setAvatar(avatar);
        int ma = ddctController.saveDaiDienCongTy(dd);
        if (ma != 0) {
            CongTy ct = new CongTy();
            ct = this.ct;
            ct.setLogo(logo);
            ct.setTrangThai(2);
            ct.setMaDaiDien(ma);
            if (ddctController.saveCongty(ct)) {
                session.put("CongtyStatus", "CÔNG TY: " + ct.getTenCongTy() + " ĐANG TRONG QUÁ TRÌNH CHỜ DUYỆT. ");
            } else {
                session.put("CongtyStatus", "Đăng ký Không thành công Công Ty và Đại diện công ty.");
            }
        } else {
            session.put("CongtyStatus", "ĐĂNG KÝ KHÔNG THÀNH CÔNG ĐẠI DIỆN CÔNG TY");
        }

        return SUCCESS;
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
            if ((int) result[9] == 0) {
                a.setStatus("Từ chối");
            } else if ((int) result[9] == 1) {
                a.setStatus("Chấp nhận");
            } else if ((int) result[9] == 2) {
                a.setStatus("Chờ duyệt");
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
        int maCongTy = ddctController.GetMaCongTy(email);
        lstNguoiHuongDans = ddctController.GetAllNguoiHuongDanByCongTy(maCongTy);
        session.put("GetAllDeTaiByCongTy", "GetAllDeTaiByCongTy");
        return SUCCESS;
    }

    public String dangDeTaiByCongTy() {
        DeTai dt = new DeTai();
        dt = deTai;
        try {
            String email = (String) session.get("email");
            int maCongTy = ddctController.GetMaCongTy(email);
            String date = request.getParameter("hanDangKy");
            SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyyy");
            java.util.Date dateString = sdf.parse(date);
            java.sql.Date hanDangKy = new java.sql.Date(dateString.getTime());
            dt.setHanDangKy(hanDangKy);
            dt.setMaCongTy(maCongTy);
            dt.setNguoiDang(email);
            dt.setTrangThai(2);
            dt.setSoLuongCon(dt.getSoLuong());
            java.util.Date utilDate = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            System.out.println(sqlDate);
            dt.setNgayDang(sqlDate);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (ddctController.SaveDeTai(dt)) {
            session.put("messageSaveDeTai", "Đăng đề tài: " + dt.getTenDeTai() + " thành công, xin chờ duyệt.");
        } else {
            session.put("messageSaveDeTai", "Đăng đề tài: " + dt.getTenDeTai() + " thất bại");
        }
        return SUCCESS;
    }

    public String GetAllNguoiHuongDanByCongTy() {
        String email = (String) session.get("email");
        int maCongTy = ddctController.GetMaCongTy(email);
        try {
            lstNguoiHuongDans = ddctController.GetAllNguoiHuongDanByCongTy(maCongTy);
        } catch (Exception e) {
        }
        session.put("GetAllNguoiHuongDanByCongTy", "GetAllNguoiHuongDanByCongTy");
        return SUCCESS;
    }

    public String AddAcountNguoiHuongDan() {
        String email = (String) session.get("email");
        int maCongTy = ddctController.GetMaCongTy(email);
        String avatar = null;
        try {
            System.out.println(request.getSession().getServletContext().getRealPath("/"));
            path = request.getSession().getServletContext().getRealPath("/").concat("file/image/avatar/");
            File fileToCreate = new File(path, this.myFileFileName);
            FileUtils.copyFile(this.myFile, fileToCreate);
            avatar = "file/image/avatar/" + myFileFileName;
        } catch (Exception e) {
            e.printStackTrace();
            addActionError(e.getMessage());
            session.put("fileMessage", "Tải ảnh đại diện lên hệ thống không thành công! ");
        }
        NguoiHuongDan nguoiHuongDan = new NguoiHuongDan();
        nguoiHuongDan = nhd;
        nguoiHuongDan.setMaCongTy(maCongTy);
        nguoiHuongDan.setAvatar(avatar);
        Login l = new Login();
        l.setEmail(nhd.getEmail());
        l.setPass(nhd.getDienThoai());
        l.setRule(3);
        if (ddctController.AddAcountNguoiHuongDan(nhd, l)) {
            session.put("messageAddAcount", "Thêm nhân viên mới thành công");
        } else {
            session.put("messageAddAcount", "Thêm nhân viên mới thất bại");
        }
        session.put("AddAcountNguoiHuongDan", "AddAcountNguoiHuongDan");
        return SUCCESS;
    }

    public String getAllEmailDDCT() {
        lstAllEmail = ddctController.getAllEmail((String) session.get("email"));
        lstEmailRead = ddctController.getAllEmailRead((String) session.get("email"));
        lstEmailUnread = ddctController.getAllEmailUnread((String) session.get("email"));
        lstEmailSend = ddctController.getAllEmailSend((String) session.get("email"));
        session.put("getAllEmailDDCT", "getAllEmailDDCT");
        return SUCCESS;
    }

    public String sendEmailDDCT() {
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        Email email = new Email();
        email.setNguoiGui((String) session.get("email"));
        email.setNguoiNhan(request.getParameter("nguoiNhan"));
        email.setNoiDung(request.getParameter("noiDung"));
        email.setTieuDe(request.getParameter("tieuDe"));
        email.setTrangThai(Boolean.FALSE);
        email.setThoiGian(sqlDate);
        if (ddctController.sendEmail(email)) {
            session.put("emailMessage", "Bạn đã gửi Email trong hệ thống thành công !");
        } else {
            session.put("emailMessage", "Đã có lỗi khi thực hiện hành động gửi Email này. Nếu tình trạng này tiếp tục xảy ra, vui lòng liên hệ với quản trị viên.!");
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
