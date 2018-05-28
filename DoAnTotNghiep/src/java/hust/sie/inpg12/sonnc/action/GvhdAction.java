/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import hust.sie.inpg12.sonnc.controller.GvhdController;
import hust.sie.inpg12.sonnc.controller.SinhVienController;
import hust.sie.inpg12.sonnc.entities.CongTy;
import hust.sie.inpg12.sonnc.entities.DeTai;
import hust.sie.inpg12.sonnc.entities.Email;
import hust.sie.inpg12.sonnc.entities.FileAll;
import hust.sie.inpg12.sonnc.entities.NguoiHuongDan;
import hust.sie.inpg12.sonnc.entities.GiangVienHuongDan;
import hust.sie.inpg12.sonnc.entities.HeSoDiem;
import hust.sie.inpg12.sonnc.entities.Logs;
import hust.sie.inpg12.sonnc.entities.QuyTrinh;
import hust.sie.inpg12.sonnc.entities.SinhVien;
import hust.sie.inpg12.sonnc.entities.SinhVienDangKy;
import hust.sie.inpg12.sonnc.entities.SinhVienDiem;
import hust.sie.inpg12.sonnc.entities.SinhVienInfo;
import hust.sie.inpg12.sonnc.entities.SinhVienThucTap;
import hust.sie.inpg12.sonnc.other.BaoCaoSinhVien;
import hust.sie.inpg12.sonnc.other.CongTyvaDaiDienCongTy;
import hust.sie.inpg12.sonnc.other.DanhSachSinhVien;
import hust.sie.inpg12.sonnc.other.DetaiCongtyNguoihuongdan;
import hust.sie.inpg12.sonnc.other.SinhVienDiemThi;
import hust.sie.inpg12.sonnc.other.SvDtCtNhd;
import java.io.File;
import java.sql.Time;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author sonnc THAY ĐỔI TÊN: GIẢNG VIÊN PHỤ TRÁCH THÀNH GIẢNG VIÊN HƯỚNG DẪN
 * (TRONG DATABASE VÀ JAVA, TRÊN GUI VẪN GIỮ NGUYÊN) THAY ĐỔI TÊN: GIẢNG VIÊN
 * HƯỚNG DẪN THÀNH NGƯỜI HƯỚNG DẪN (TRONG DATABASE VÀ JAVA, TRÊN GUI VẪN GIỮ
 * NGUYÊN)
 */
public class GvhdAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private GvhdController gvhdController;
    private SinhVienController sinhVienController;
    private File myFile;
    private String myFileFileName;
    private String path;
    private List<DanhSachSinhVien> lstDanhSachSinhViens = new ArrayList<>();
    private List<SvDtCtNhd> lstSvDtCtNhds = new ArrayList<>();
    private List<SinhVien> lstSinhVien = new ArrayList<>();
    private List<SinhVienInfo> lstSVI = new ArrayList<>();
    private List<SinhVienDiemThi> lstSinhVienDiemThi = new ArrayList<>();
    private List<FileAll> lstFileAll = new ArrayList<>();
    private List<CongTyvaDaiDienCongTy> lstCongTy = new ArrayList<>();
    private List<DetaiCongtyNguoihuongdan> lstDTCTNHD = new ArrayList<>();
    private List<Email> lstAllEmailGVHD = new ArrayList<>();
    private List<Email> lstEmailGVHDRead = new ArrayList<>();
    private List<Email> lstEmailGVHDUnread = new ArrayList<>();
    private List<Email> lstEmailGVHDSend = new ArrayList<>();
    private List<QuyTrinh> lstQuyTrinh = new ArrayList<>();
    private List<BaoCaoSinhVien> lstBaoCaoSinhVien = new ArrayList<>();
    private GiangVienHuongDan gvhd = new GiangVienHuongDan();

    public List<BaoCaoSinhVien> getLstBaoCaoSinhVien() {
        return lstBaoCaoSinhVien;
    }

    public void setLstBaoCaoSinhVien(List<BaoCaoSinhVien> lstBaoCaoSinhVien) {
        this.lstBaoCaoSinhVien = lstBaoCaoSinhVien;
    }

    public GiangVienHuongDan getGvhd() {
        return gvhd;
    }

    public void setGvhd(GiangVienHuongDan gvhd) {
        this.gvhd = gvhd;
    }

    public List<Email> getLstAllEmailGVHD() {
        return lstAllEmailGVHD;
    }

    public List<QuyTrinh> getLstQuyTrinh() {
        return lstQuyTrinh;
    }

    public void setLstQuyTrinh(List<QuyTrinh> lstQuyTrinh) {
        this.lstQuyTrinh = lstQuyTrinh;
    }

    public void setLstAllEmailGVHD(List<Email> lstAllEmailGVHD) {
        this.lstAllEmailGVHD = lstAllEmailGVHD;
    }

    public List<Email> getLstEmailGVHDRead() {
        return lstEmailGVHDRead;
    }

    public void setLstEmailGVHDRead(List<Email> lstEmailGVHDRead) {
        this.lstEmailGVHDRead = lstEmailGVHDRead;
    }

    public List<Email> getLstEmailGVHDUnread() {
        return lstEmailGVHDUnread;
    }

    public void setLstEmailGVHDUnread(List<Email> lstEmailGVHDUnread) {
        this.lstEmailGVHDUnread = lstEmailGVHDUnread;
    }

    public List<Email> getLstEmailGVHDSend() {
        return lstEmailGVHDSend;
    }

    public void setLstEmailGVHDSend(List<Email> lstEmailGVHDSend) {
        this.lstEmailGVHDSend = lstEmailGVHDSend;
    }

    public List<DetaiCongtyNguoihuongdan> getLstDTCTNHD() {
        return lstDTCTNHD;
    }

    public void setLstDTCTNHD(List<DetaiCongtyNguoihuongdan> lstDTCTNHD) {
        this.lstDTCTNHD = lstDTCTNHD;
    }

    public List<CongTyvaDaiDienCongTy> getLstCongTy() {
        return lstCongTy;
    }

    public void setLstCongTy(List<CongTyvaDaiDienCongTy> lstCongTy) {
        this.lstCongTy = lstCongTy;
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

    public List<FileAll> getLstFileAll() {
        return lstFileAll;
    }

    public void setLstFileAll(List<FileAll> lstFileAll) {
        this.lstFileAll = lstFileAll;
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
            List<Object[]> results = gvhdController.getAllDeTaiSV();
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
//                DecimalFormat f = new DecimalFormat("##.00");
//                d.setSoKhop(Double.parseDouble(f.format((double) result[5])));
                d.setSoKhop((double) Math.floor(((double) result[5]) * 10) / 10);
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
                Logs((String)session.get("email"), "Từ chối đề tài của sinh viên : " + request.getParameter("mssv")+" - đợt thực tập: "+request.getParameter("dotThucTap")+"");
                session.put("messageDuyetDetai", "Đã từ chối thành công đề tài cho sinh viên: " + request.getParameter("mssv"));
            } else {
                Logs((String)session.get("email"), "Đã có lỗi xảy ra khi thực hiện hành động từ chối đề tài sinh viên.");
                session.put("messageDuyetDetai", "Đã có lỗi xảy ra khi xử lý hành động này, vui lòng thử lại sau.");
            }
            return SUCCESS;
        }
        if (request.getParameter("trangThai").equals("true")) {
            List<SinhVienDangKy> lstSinhVienDangKys = gvhdController.listDetaiMotSinhVienDangKy(
                    Integer.parseInt(request.getParameter("mssv")), Integer.parseInt(request.getParameter("dotThucTap")));
            List<SinhVienThucTap> lst = gvhdController.getSinhVienThucTapByID(
                    Integer.parseInt(request.getParameter("mssv")),
                    Integer.parseInt(request.getParameter("dotThucTap")));
            if (lst.size() == 1) {
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
                    Logs((String)session.get("email"), "Duyệt thành công đề tài cho sinh viên: "+request.getParameter("mssv")+" - kỳ thực tập: "+request.getParameter("dotThucTap")+"");
                    session.put("messageDuyetDetai", "Duyệt thành công");
                } else {
                    Logs((String)session.get("email"), "Lỗi xảy ra khi duyệt đề tài cho sinh viên: "+request.getParameter("mssv")+" - kỳ thực tập: "+request.getParameter("dotThucTap")+"");
                    session.put("messageDuyetDetai", "Duyệt thất bại");
                }
                return SUCCESS;
            } else {
                Logs((String)session.get("email"), "Lỗi không tìm thấy mã số sinh viên.");
                session.put("messageDuyetDetai", "Không tìm thấy sinh viên, thử lại sau.");
            }

        }
        return SUCCESS;
    }

    public String getDanhSachChamDiem() {
        try {
            List<Object[]> results = gvhdController.getDanhSachChamDiem();
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

    public String chamDiem() {
        int mssv = Integer.parseInt(request.getParameter("mssv"));
        int dotThucTap = Integer.parseInt(request.getParameter("dotThucTap"));
        double diemBCQT = Double.parseDouble(request.getParameter("bcqt"));
        List<SinhVienDiem> lstSinhVienDiems = gvhdController.getMSSVDiemByID(mssv, dotThucTap);
        List<Email> lstEmail = gvhdController.getSLPhanHoi(mssv, dotThucTap);
        List<HeSoDiem> lstHeSoDiems = gvhdController.getAllHeSoDiem();

        double diemPhanHoi = 0;
        if (lstEmail.size() >= 7) {
            diemPhanHoi = 10;
        } else {
            diemPhanHoi = 1.43 * lstEmail.size();
        }
        if (lstSinhVienDiems.size() == 1) {
            SinhVienDiem svd = new SinhVienDiem();
            svd.setDiemBcqt(diemBCQT);
            svd.setDiemCuoiKy(Double.parseDouble(request.getParameter("bcck")));
            svd.setDiemPhanHoi(diemPhanHoi);
            svd.setDiemQuaTrinh((double) Math.round((lstHeSoDiems.get(0).getDiemPhanHoi() * diemPhanHoi
                    + lstHeSoDiems.get(0).getDiemBcqt() * diemBCQT) * 10) / 10);
            svd.setDotThucTap(dotThucTap);
            svd.setId(lstSinhVienDiems.get(0).getId());
            svd.setMssv(mssv);
            if (gvhdController.chamDiem(svd)) {
                if (gvhdController.CloseThucTapSinhVien(mssv, dotThucTap)) {
                    Logs((String)session.get("email"), "Chấm điểm thành công và kết thúc thực tập "+dotThucTap+" cho sinh viên "+mssv+"");
                    session.put("messageDiemThi", "Chấm điểm thành công.!");
                } else {
                    Logs((String)session.get("email"), "Lỗi kết thúc thực tập "+dotThucTap+" cho sinh viên "+mssv+", nhưng đã chấm điểm thành công.");
                    session.put("messageDiemThi", "Chấm điểm thành công nhưng đóng kỳ thực tập của sinh viên thất bại;");
                }
            } else {
                Logs((String)session.get("email"), "Lỗi khi thực hiện chấm điểm kỳ thực tập "+dotThucTap+" cho sinh viên "+mssv+"");
                session.put("messageDiemThi", "Chấm điểm thất bại. Đã có lỗi xảy ra.");
            }
        } else {
            Logs((String)session.get("email"), "Lỗi không tìm thấy sinh viên "+mssv+"");
            session.put("messageDiemThi", "Không tìm thấy mã sinh viên " + mssv + " với kỳ thực tập " + dotThucTap + "");
        }

        return SUCCESS;
    }

    public String getAllDiemSV() {
        try {
            List<Object[]> results = gvhdController.getAllDiemSinhVien();
            for (Object[] result : results) {
                SinhVienDiemThi d = new SinhVienDiemThi();
                d.setMssv((int) result[0]);
                d.setHoTen((String) result[1]);
                d.setLop((String) result[2]);
                d.setKhoa((int) result[3]);
                d.setKhoaVien((String) result[4]);
                d.setDotThucTap((int) result[5]);
                if ((boolean) result[6] == true) {
                    d.setTrangThai("<p style=" + "blue" + ">ACTIVE</p>");
                } else {
                    d.setTrangThai("<p style=" + "RED" + ">CLOSED</p>");
                }
                d.setDiemBCQT((double) result[8]);
                d.setDiemBCCK((double) result[10]);
                d.setDiemPhanHoi((double) result[7]);
                d.setDiemQuaTrinh((double) result[9]);
                lstSinhVienDiemThi.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        session.put("getAllDiemSV", "getAllDiemSV");
        return SUCCESS;
    }

    public String getAllFileGVHD() {
        lstFileAll = gvhdController.getAllFileGVHD((String) session.get("email"));
        session.put("getAllFileGVHD", "getAllFileGVHD");
        return SUCCESS;
    }

    public String UploadFileGVHD() {
        FileAll fileAll = new FileAll();
        try {
            Date date = new Date();
            java.sql.Date ngayThang = new java.sql.Date(date.getTime());
            String link = null;
            try {
                path = request.getSession().getServletContext().getRealPath("/").concat("file/gvhd/");
                File fileToCreate = new File(path, this.myFileFileName);
                FileUtils.copyFile(this.myFile, fileToCreate);
                link = "file/gvhd/" + myFileFileName;
                System.out.println(link);
            } catch (Exception e) {
                e.printStackTrace();
                addActionError(e.getMessage());
                Logs((String)session.get("email"), "Lỗi đường dẫn khi lưu file lên hệ thống");
                session.put("messageUploadFile", "Lỗi đường dẫn khi lưu file lên hệ thống. Hãy liên hệ với quản trị viên.");
            }
            fileAll.setEmail((String) session.get("email"));
            fileAll.setLink(link);
            fileAll.setNgayThang(ngayThang);
            fileAll.setNoiDung(request.getParameter("noiDung"));
            fileAll.setTenFile(request.getParameter("tenFile"));
            fileAll.settype(Integer.parseInt(request.getParameter("type")));
            if (gvhdController.UploadFileGVHD(fileAll)) {
                Logs((String)session.get("email"), "Tải tài liệu: "+request.getParameter("tenFile")+" lên hệ thống thành công");
                session.put("messageUploadFile", " Tải tài liệu lên hệ thống thành công.");
            } else {
                 Logs((String)session.get("email"), "Tải tài liệu: "+request.getParameter("tenFile")+" lên hệ thống thất bại");
                session.put("messageUploadFile", " Tải tài liệu liệu lên hệ thống không thành công, vui lòng kiểm tra lại.");
            }
        } catch (Exception e) {
            e.printStackTrace();
             Logs((String)session.get("email"), "Lỗi không xác định khi tải tài liệu: "+request.getParameter("tenFile")+" lên hệ thống");
            session.put("messageUploadFile", "Lỗi không xác định.");
        }
        return SUCCESS;
    }

    public String deleteTaiLieuGVHD() {
        if (gvhdController.deleteTaiLieuGVHD(Integer.parseInt(request.getParameter("maTaiLieu")), (String) session.get("email"))) {
             Logs((String)session.get("email"), "Xóa tài liệu: "+request.getParameter("maTaiLieu")+" trên hệ thống thành công");
            session.put("messageTaiLieuSinhVien", "Xóa tài liệu thành công. Mã lài liệu đã xóa là: " + request.getParameter("maTaiLieu") + "");
            return SUCCESS;
        } else {
             Logs((String)session.get("email"), "Có lỗi xảy ra khi xóa tài liệu: "+request.getParameter("maTaiLieu")+" trên hệ thống");
            session.put("messageTaiLieuSinhVien", "Đã có lỗi xảy ra khi xóa tài liệu này. "
                    + " Mã lài liệu đã xóa là: " + request.getParameter("maTaiLieu") + "");
            return ERROR;
        }
    }

    public String getAllCongTy() {
        List<Object[]> results = gvhdController.getAllCongTy();
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
            lstCongTy.add(ct);
        }
        session.put("getAllCongTy", "getAllCongTy");
        return SUCCESS;
    }

    // Lấy toàn bộ danh sách công ty chưa được duyệt
    public String GetAllCongTyReview() {
        List<Object[]> results = gvhdController.GetAllCongTyReview();
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
            lstCongTy.add(ct);
        }
        session.put("GetAllCongTyReview", "GetAllCongTyReview");
        return SUCCESS;
    }

    public String AcceptRefuseCongTy() {
        int maCongTy = Integer.parseInt(request.getParameter("maCongTy"));
        String status = request.getParameter("status");
        CongTy ct = gvhdController.getCongTyByID(maCongTy);
        if (ct.getClass() != null) {
            if (status.equals("true")) {
                ct.setTrangThai(1);
            } else if (status.equals("false")) {
                ct.setTrangThai(0);
            }
            if (gvhdController.AcceptRefuseCongTy(ct)) {
                 Logs((String)session.get("email"), "Chấp nhận công ty với mã số là: "+maCongTy+"");
                session.put("messageAcceptRefuse", "Chấp nhận thành công cho công ty này.");
            }
        } else {
             Logs((String)session.get("email"), "Lỗi không tìm thấy mã công ty: "+maCongTy+"");
            session.put("messageAcceptRefuse", "Lỗi: Không tìm thấy mã công ty, vui lòng kiểm tra lại hoặc liên hệ với quản trị viên.");
        }
        return SUCCESS;
    }

    public String GetAllCongTyReviewed() {
        List<Object[]> results = gvhdController.GetAllCongTyReviewed();
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
            }
            lstCongTy.add(ct);
        }
        session.put("GetAllCongTyReviewed", "GetAllCongTyReviewed");
        return SUCCESS;
    }

    public String GetAllDeTaiCT() {
        List<Object[]> results = gvhdController.GetAllDeTaiCT();
        for (Object[] result : results) {
            DetaiCongtyNguoihuongdan a = new DetaiCongtyNguoihuongdan();
            a.setMaCongTy((int) result[3]);
            a.setMaDeTai((int) result[2]);
            a.setMaGvhd((int) result[4]);
            a.setNgayDang((Date) result[12]);
            a.setNguoiHuongDan((String) result[1]);
            a.setNoiDung((String) result[6]);
            a.setSoLuong((int) result[9]);
            a.setTenCongTy((String) result[0]);
            a.setTenDeTai((String) result[5]);
            a.setYeuCauKhac((String) result[14]);
            a.setLogo((String) result[15]);
            a.setYeuCauLapTrinh((String) result[7]);
            a.setHanDangKy((Date) result[13]);
            if ((int) result[11] == 2) {
                a.setStatus("Đang chờ");
            } else if ((int) result[11] == 1) {
                a.setStatus("Đã chấp nhận");
            } else if ((int) result[11] == 0) {
                a.setStatus("Đã từ chối");
            }
            lstDTCTNHD.add(a);
        }
        session.put("GetAllDeTaiCT", "GetAllDeTaiCT");
        return SUCCESS;
    }

    // đề tài chưa được duyệt
    public String GetAllDeTaiReview() {
        List<Object[]> results = gvhdController.GetAllDeTaiReview();
        for (Object[] result : results) {
            DetaiCongtyNguoihuongdan a = new DetaiCongtyNguoihuongdan();
            a.setMaCongTy((int) result[3]);
            a.setMaDeTai((int) result[2]);
            a.setMaGvhd((int) result[4]);
            a.setNgayDang((Date) result[12]);
            a.setNguoiHuongDan((String) result[1]);
            a.setNoiDung((String) result[6]);
            a.setSoLuong((int) result[9]);
            a.setTenCongTy((String) result[0]);
            a.setTenDeTai((String) result[5]);
            a.setYeuCauKhac((String) result[14]);
            a.setLogo((String) result[15]);
            a.setYeuCauLapTrinh((String) result[7]);
            a.setHanDangKy((Date) result[13]);
            lstDTCTNHD.add(a);
        }
        session.put("GetAllDeTaiReview", "GetAllDeTaiReview");
        return SUCCESS;

    }

    public String AcceptRefuseDeTai() {
        int maDeTai = Integer.parseInt(request.getParameter("maDeTai"));
        String status = request.getParameter("status");
        DeTai dt = gvhdController.getDeTaiByID(maDeTai);
        if (dt.getClass() != null) {
            if (status.equals("true")) {
                dt.setTrangThai(1);
            } else if (status.equals("false")) {
                dt.setTrangThai(0);
            }
            if (gvhdController.AcceptRefuseDeTai(dt)) {
                 Logs((String)session.get("email"), "Chấp nhận đề tài công ty với mã đề tài: "+maDeTai+"");
                session.put("messageAcceptRefuseDTCT", "Chấp nhận thành công cho đề tài này.");
            }
        } else {
             Logs((String)session.get("email"), "Lỗi không tìm thấy mã đề tài: "+maDeTai+"");
            session.put("messageAcceptRefuseDTCT", "Lỗi: Không tìm thấy mã đề tài, vui lòng kiểm tra lại hoặc liên hệ với quản trị viên.");
        }
        return SUCCESS;
    }

    public String GetAllDeTaiReviewed() {
        List<Object[]> results = gvhdController.GetAllDeTaiReviewed();
        for (Object[] result : results) {
            DetaiCongtyNguoihuongdan a = new DetaiCongtyNguoihuongdan();
            a.setMaCongTy((int) result[3]);
            a.setMaDeTai((int) result[2]);
            a.setMaGvhd((int) result[4]);
            a.setNgayDang((Date) result[12]);
            a.setNguoiHuongDan((String) result[1]);
            a.setNoiDung((String) result[6]);
            a.setSoLuong((int) result[9]);
            a.setTenCongTy((String) result[0]);
            a.setTenDeTai((String) result[5]);
            a.setYeuCauKhac((String) result[14]);
            a.setLogo((String) result[15]);
            a.setYeuCauLapTrinh((String) result[7]);
            a.setHanDangKy((Date) result[13]);
            if ((int) result[11] == 1) {
                a.setStatus("Đã chấp nhận");
            } else if ((int) result[11] == 0) {
                a.setStatus("Đã từ chối");
            }
            lstDTCTNHD.add(a);
        }
        session.put("GetAllDeTaiReviewed", "GetAllDeTaiReviewed");
        return SUCCESS;
    }

    public String getAllEmailGVHD() {
        lstAllEmailGVHD = gvhdController.getAllEmailGVHD((String) session.get("email"));
        lstEmailGVHDRead = gvhdController.getAllEmailGVHDRead((String) session.get("email"));
        lstEmailGVHDUnread = gvhdController.getAllEmailGVHDUnread((String) session.get("email"));
        lstEmailGVHDSend = gvhdController.getAllEmailGVHDSend((String) session.get("email"));
        session.put("getAllEmailGVHD", "getAllEmailGVHD");
        return SUCCESS;
    }

    public String sendEmailGVHD() {
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        Email email = new Email();
        email.setNguoiGui((String) session.get("email"));
        email.setNguoiNhan(request.getParameter("nguoiNhan"));
        email.setNoiDung(request.getParameter("noiDung"));
        email.setTieuDe(request.getParameter("tieuDe"));
        email.setTrangThai(Boolean.FALSE);
        email.setThoiGian(sqlDate);
        if (gvhdController.sendEmailGVHD(email)) {
             Logs((String)session.get("email"), "Gửi mail tới: "+request.getParameter("nguoiNhan")+" thành công.");
            session.put("emailMessage", "Bạn đã gửi Email trong hệ thống thành công !");
        } else {
             Logs((String)session.get("email"), "Có lỗi xảy ra khi gửi mail tới: "+request.getParameter("nguoiNhan")+"");
            session.put("emailMessage", "Đã có lỗi khi thực hiện hành động gửi Email này. Nếu tình trạng này tiếp tục xảy ra, vui lòng liên hệ với quản trị viên.!");
        }
        return SUCCESS;
    }

    public String getLichTrinhForGVHD() {
        lstQuyTrinh = gvhdController.getLichTrinhForGVHD();
        String lichTrinh = "[";
        String nd = null;
        for (int i = 0; i < lstQuyTrinh.size(); i++) {
            if (i + 1 == lstQuyTrinh.size()) {
                nd = "{title:'" + lstQuyTrinh.get(i).getTieuDe() + "',content:'" + lstQuyTrinh.get(i).getNoiDung() + "',"
                        + "start:'" + lstQuyTrinh.get(i).getNgayBatDau() + "',end:'" + lstQuyTrinh.get(i).getNgayKetThuc() + "'}";
            }
            if (i + 1 < lstQuyTrinh.size()) {
                nd = "{title:'" + lstQuyTrinh.get(i).getTieuDe() + "',content:'" + lstQuyTrinh.get(i).getNoiDung() + "',"
                        + "start:'" + lstQuyTrinh.get(i).getNgayBatDau() + "',end:'" + lstQuyTrinh.get(i).getNgayKetThuc() + "'},";
            }
            lichTrinh = lichTrinh + nd;
        }
        lichTrinh = lichTrinh + "]";
        session.put("getLichTrinhForGVHD", "not null");
        session.put("getLichTrinh", lichTrinh);
        return SUCCESS;
    }

    public String SaveLichTrinh() {
        String startDate = request.getParameter("ngayBatDau");
        String endDate = request.getParameter("ngayKetThuc");
        DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
        try {
            Date startDateConvert = df.parse(startDate);
            Date endDateConvert = df.parse(endDate);
            QuyTrinh quyTrinh = new QuyTrinh();
            quyTrinh.setNgayBatDau(startDateConvert);
            quyTrinh.setNgayKetThuc(endDateConvert);
            quyTrinh.setNoiDung(request.getParameter("noiDung"));
            quyTrinh.setTieuDe(request.getParameter("tieuDe"));
            if (gvhdController.SaveLichTrinh(quyTrinh)) {
                 Logs((String)session.get("email"), "Đăng lịch trình: "+request.getParameter("tieuDe")+"");
                session.put("messageLichTrinh", "Lưu thành công lịch trình vào hệ thống!");
            } else {
                 Logs((String)session.get("email"), "Đã có lỗi xảy ra khi đăng lịch trình");
                session.put("messageLichTrinh", "Đã có lỗi xảy ra khi lưu lịch trình vào hệ thống, vui lòng kiểm tra lại hoặc liên hệ với quản trị viên.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String DeleteLichTrinh() {
        int id = Integer.parseInt(request.getParameter("id"));
        if (gvhdController.DeleteLichTrinh(id)) {
             Logs((String)session.get("email"), "Xóa lịch trình với mã: "+id+"");
            session.put("messageLichTrinh", "Xóa lịch trình thành công!");
        } else {
             Logs((String)session.get("email"), "Có lỗi xảy ra khi xóa lịch trình");
            session.put("messageLichTrinh", "Đã có lỗi xảy ra khi xóa, vui lòng kiểm tra lại.");
        }
        return SUCCESS;
    }

    public String SaveThongTinCaNhanGVHD() {
        String avatar = null;
        try {
            path = request.getSession().getServletContext().getRealPath("/").concat("file/image/avatar/");
            File fileToCreate = new File(path, this.myFileFileName);
            FileUtils.copyFile(this.myFile, fileToCreate);
            avatar = "file/image/avatar/" + myFileFileName;
            System.out.println(avatar);
        } catch (Exception e) {
            e.printStackTrace();
            addActionError(e.getMessage());
             Logs((String)session.get("email"), "Lỗi đường dẫn khi lưu file avatar");
            session.put("messageUploadFile", "Lỗi đường dẫn khi lưu file lên hệ thống. Hãy liên hệ với quản trị viên.");
        }
        GiangVienHuongDan gvhd = new GiangVienHuongDan();
        gvhd = this.gvhd;
        gvhd.setAvatar(avatar);
        if (gvhdController.SaveThongTinCaNhan(gvhd)) {
            session.put("rule", 2);
             Logs((String)session.get("email"), "Đăng ký thông tin cá nhân thành công");
            session.put("messageRegister", "Đăng ký thông tin cá nhân thành công.");
        } else {
             Logs((String)session.get("email"), "Đăng ký thông tin cá nhân thất bại");
            session.put("messageRegister", "Đã có lỗi xảy ra, vui lòng kiểm tra lại hoặc liên hệ với quản trị viên.");
            return ERROR;
        }
        return SUCCESS;
    }

    public String getInfoGVHD() {
        int maGVHD = gvhdController.getMaGVHDId((String) session.get("email"));
        if (maGVHD != 0) {
            gvhd = gvhdController.getInfoGVHD(maGVHD);
        } else {
            session.put("messageUpdate", "Đã có lỗi xảy ra hoặc không tìm thấy giảng viên.");
        }
        session.put("getInfoGVHD", "getInfoGVHD");
        return SUCCESS;
    }

    public String updateThongTinCaNhanGVHD() {
        int maGVHD = gvhdController.getMaGVHDId((String) session.get("email"));
        GiangVienHuongDan gvhd = new GiangVienHuongDan();
        gvhd = gvhdController.getInfoGVHD(maGVHD);
        gvhd.setCongTrinhNghienCuu(this.gvhd.getCongTrinhNghienCuu());
        gvhd.setDiaChi(this.gvhd.getDiaChi());
        gvhd.setDienThoai(this.gvhd.getDienThoai());
        gvhd.setKhac(this.gvhd.getKhac());
        gvhd.setMonGiangDay(this.gvhd.getMonGiangDay());
        gvhd.setSachXuatBan(this.gvhd.getSachXuatBan());
        if (gvhdController.updateThongTinCaNhan(gvhd)) {
             Logs((String)session.get("email"), "Cập nhật thông tin cá nhân thành công");
            session.put("messageUpdateInfo", "Cập nhật thông tin cá nhân thành công.");
        } else {
             Logs((String)session.get("email"), "Cập nhật thông tin cá nhân thất bại");
            session.put("messageUpdateInfo", "Đã có lỗi xảy ra, vui lòng kiểm tra lại hoặc liên hệ với quản trị viên.");
        }
        return SUCCESS;
    }

    public String GetAllBaoCaoQTCK() {
        List<Object[]> results = gvhdController.GetAllBaoCaoQTCK();
        for (Object[] result : results) {
            BaoCaoSinhVien a = new BaoCaoSinhVien();
            a.setMssv((int) result[0]);
            a.setHoTen((String) result[1]);
            a.setLop((String) result[2]);
            a.setKhoa((int) result[3]);
            a.setKyThucTap((int) result[4]);
            if ((String) result[5] == null) {
                a.setBcqt("javascript:void(0)");
                a.setTenBCQT("Không có");
            } else {
                a.setBcqt((String) result[5]);
                a.setTenBCQT("Tải xuống");
            }
            if ((String) result[6] == null) {
                a.setBcck("javascript:void(0)");
                a.setTenBCCK("Không có");
            } else {
                a.setBcck((String) result[6]);
                a.setTenBCCK("Tải xuống");
            }
            if ((String) result[7] == null) {
                a.setDanhGia("javascript:void(0)");
                a.setTenDanhGia("Không có");
            } else {
                a.setDanhGia((String) result[7]);
                a.setTenDanhGia("Tải xuống");
            }
            lstBaoCaoSinhVien.add(a);
        }
        session.put("GetAllBaoCaoQTCK", "GetAllBaoCaoQTCK");
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
        sinhVienController.logs(logs);
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
