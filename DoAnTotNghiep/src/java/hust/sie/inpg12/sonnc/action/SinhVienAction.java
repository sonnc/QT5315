/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.action;

import com.opensymphony.xwork2.ActionSupport;
import hust.sie.inpg12.sonnc.controller.SinhVienController;
import hust.sie.inpg12.sonnc.entities.*;
import hust.sie.inpg12.sonnc.other.DetaiCongtyNguoihuongdan;
import hust.sie.inpg12.sonnc.other.SoKhop;
import java.text.SimpleDateFormat;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.commons.io.FileUtils;
import java.io.File;
import java.math.BigInteger;
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
    private List<SinhVienFile> lstSinhVienFileBC = new ArrayList<>();
    private List<SinhVienFile> lstSinhVienFileHT = new ArrayList<>();
    private List<SinhVienDiem> lstSinhVienDiem = new ArrayList<>();
    private List<SinhVienInfo> lstSVI = new ArrayList<>();
    private List<CongTy> lstCongTyforSV = new ArrayList<>();
    private List<SinhVien> lstSinhVien = new ArrayList<>();
    private List<HeSoDiem> lstHeSoDiem = new ArrayList<>();
    private CongTy congTy = new CongTy();
    private DaiDienCongTy daiDienCongTy = new DaiDienCongTy();
    private List<Email> lstAllEmailSV = new ArrayList<>();
    private List<Email> lstEmailSVRead = new ArrayList<>();
    private List<Email> lstEmailSVUnread = new ArrayList<>();
    private List<Email> lstEmailSVSend = new ArrayList<>();

    public List<Email> getLstEmailSVSend() {
        return lstEmailSVSend;
    }

    public void setLstEmailSVSend(List<Email> lstEmailSVSend) {
        this.lstEmailSVSend = lstEmailSVSend;
    }

    public List<Email> getLstEmailSVRead() {
        return lstEmailSVRead;
    }

    public void setLstEmailSVRead(List<Email> lstEmailSVRead) {
        this.lstEmailSVRead = lstEmailSVRead;
    }

    public List<Email> getLstEmailSVUnread() {
        return lstEmailSVUnread;
    }

    public void setLstEmailSVUnread(List<Email> lstEmailSVUnread) {
        this.lstEmailSVUnread = lstEmailSVUnread;
    }

    public List<Email> getLstAllEmailSV() {
        return lstAllEmailSV;
    }

    public void setLstAllEmailSV(List<Email> lstAllEmailSV) {
        this.lstAllEmailSV = lstAllEmailSV;
    }

    public List<SinhVienFile> getLstSinhVienFileBC() {
        return lstSinhVienFileBC;
    }

    public void setLstSinhVienFileBC(List<SinhVienFile> lstSinhVienFileBC) {
        this.lstSinhVienFileBC = lstSinhVienFileBC;
    }

    public List<SinhVienFile> getLstSinhVienFileHT() {
        return lstSinhVienFileHT;
    }

    public void setLstSinhVienFileHT(List<SinhVienFile> lstSinhVienFileHT) {
        this.lstSinhVienFileHT = lstSinhVienFileHT;
    }

    public CongTy getCongTy() {
        return congTy;
    }

    public void setCongTy(CongTy congTy) {
        this.congTy = congTy;
    }

    public DaiDienCongTy getDaiDienCongTy() {
        return daiDienCongTy;
    }

    public void setDaiDienCongTy(DaiDienCongTy daiDienCongTy) {
        this.daiDienCongTy = daiDienCongTy;
    }

    public List<HeSoDiem> getLstHeSoDiem() {
        return lstHeSoDiem;
    }

    public void setLstHeSoDiem(List<HeSoDiem> lstHeSoDiem) {
        this.lstHeSoDiem = lstHeSoDiem;
    }

    public List<SinhVien> getLstSinhVien() {
        return lstSinhVien;
    }

    public void setLstSinhVien(List<SinhVien> lstSinhVien) {
        this.lstSinhVien = lstSinhVien;
    }

    public List<CongTy> getLstCongTyforSV() {
        return lstCongTyforSV;
    }

    public void setLstCongTyforSV(List<CongTy> lstCongTyforSV) {
        this.lstCongTyforSV = lstCongTyforSV;
    }

    public List<SinhVienInfo> getLstSVI() {
        return lstSVI;
    }

    public void setLstSVI(List<SinhVienInfo> lstSVI) {
        this.lstSVI = lstSVI;
    }

    public List<SinhVienDiem> getLstSinhVienDiem() {
        return lstSinhVienDiem;
    }

    public void setLstSinhVienDiem(List<SinhVienDiem> lstSinhVienDiem) {
        this.lstSinhVienDiem = lstSinhVienDiem;
    }

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
        try {

            //Phải lấy thêm trường dữ liệu thông tin cúa sinh viên 
            // sau đó mới bắt đầu xem trường nào cần thay đổi, 
            // trường nào cần giữ lại thông tin
            String date = request.getParameter("ngaySinh");
            SimpleDateFormat sdf = new SimpleDateFormat("dd-mm-yyyy");
            java.util.Date dateString = sdf.parse(date);
            java.sql.Date ngaySinh = new java.sql.Date(dateString.getTime());
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
     * Phương thức lấy thông tin sinh viên
     *
     * @since v1 - 26.03.18
     * @author SonNC
     */
    public String getSinhVienThongTinByClass() {
        // kiểm tra lại thông tin của sinhVienInfo.
        // giá trị trả về là null, 
        try {
            sinhVien = sinhVienController.getSinhVienByClass((int) session.get("mssv"));
            sinhVienInfo = sinhVienController.getSinhVienInfoByClass((int) session.get("mssv"));
            session.put("getSinhVienThongTinByClass", "getSinhVienThongTinByClass");
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }
    public String getSinhVienThongTinByList() {
        // kiểm tra lại thông tin của sinhVienInfo.
        // giá trị trả về là null, 
        try {
            lstSinhVien = sinhVienController.getSinhVien((int) session.get("mssv"));
            lstSVI = sinhVienController.getSinhVienInfo((int) session.get("mssv"));
            session.put("getSinhVienThongTinByList", "getSinhVienThongTinByList");
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
        // Đầu tiên lấy thông tin của sinh viên trong tường kỹ năng lập trình
        // sau đó lấy thông tin yêu cầu lập trình của đề tài
        // Dùng vòng lặp for để lấy thông tin và tính giá trị so khớp bằng cách 
        // lấy toàn bộ điểm so khớp của sinh viên, chia cho tổng toàn bộ đề tài yêu cầu.
        String knlt = null;
        DeTai deTai = new DeTai();
        DotThucTap dotThucTap = new DotThucTap();
        List<SinhVienDangKy> lstSVDK = new ArrayList<>();
        List<SoKhop> lstSoKhopSV = new ArrayList<>();
        List<SoKhop> lstSoKhopDT = new ArrayList<>();
        List<DotThucTap> lstDotThucTap = new ArrayList<>();
        String strSKSV = null;
        String strSKDT = null;
        try {
            int maDeTai = Integer.parseInt(request.getParameter("maDeTai"));
            int maDotThucTap = Integer.parseInt(request.getParameter("dotThucTap"));
            lstSVDK = sinhVienController.getListDeTaiMotSVDK((int) session.get("mssv"));
            lstDotThucTap = sinhVienController.getDotThucTap(maDotThucTap);
            if (lstDotThucTap.size() == 0) {
                session.put("messageDangKyDeTai", "Không tồn tại đợt thực tập này, xin vui lòng kiểm tra lại hoặc liên hệ với quản trị viên");
                return SUCCESS;
            } else {
                Date date = new Date();
                int x = (int) (lstDotThucTap.get(0).getThoiGianKetThuc().getTime() - date.getTime()) / (1000 * 60 * 60 * 24);
                if (x < 0) {
                    session.put("messageDangKyDeTai", "Đã hết hạn đăng ký thực tập đợt " + maDotThucTap + ", Vui lòng chờ đến đợt thực tập tiếp theo.");
                    return SUCCESS;
                } else {

                    // lấy thông tin đợt thực tập ở đây và kiểm tra xem có bị quá hạn đăng ký thực tập hay không?\
                    if (lstSVDK.size() < 3) {
                        // thuc hien dang ky de tai
                        // xem lại chỗ này, phải kiểm tra hết dt mà sv đăng ký trong lstSVDK rồi mới tính đến có cho đk đê tài không.
                        // Kiểm tra bằng cách thêm một biến kiểm tra trùng đê tài
                        boolean checkTrungDeTai = false;
                        for (int i = 0; i < lstSVDK.size(); i++) {
                            // thông báo trùng đề tài
                            if (lstSVDK.get(i).getMaDeTai() == maDeTai) {
                                session.put("messageDangKyDeTai", "Bạn đã đăng ký đề tài này, xin vui lòng đăng ký đề tài khác.");
                                checkTrungDeTai = true;
                                break;
                            }
                        }

                        if (checkTrungDeTai == false) {
                            lstSVI = sinhVienController.getSinhVienInfo((int) session.get("mssv"));
                            deTai = sinhVienController.getDeTaiByID(maDeTai);
                            strSKSV = lstSVI.get(0).getKyNangLt();
                            strSKDT = deTai.getYeuCauLapTrinh();
                            double phanTramSoKhop = 0;// x là phần trăm so khớp của một đối tượng ví dụ java băng cách lấy sv/dt
                            int count = 0;

                            // thực hiện so khớp
                            lstSoKhopSV = getDeTaiSoKhop(strSKSV);
                            lstSoKhopDT = getDeTaiSoKhop(strSKDT);
                            for (int i = 0; i < lstSoKhopDT.size(); i++) {
                                for (int j = 0; j < lstSoKhopSV.size(); j++) {
                                    if (lstSoKhopDT.get(i).getKyNang().contains(lstSoKhopSV.get(j).getKyNang())) {
                                        phanTramSoKhop = phanTramSoKhop + ((lstSoKhopSV.get(j).getPhanTram()) / (lstSoKhopDT.get(i).getPhanTram()));
                                    }
                                }
                                count++;
                            }
                            // thực hiện đăng ký đề tài
                            SinhVienDangKy svdk = new SinhVienDangKy();
                            svdk.setMaCongTy(deTai.getMaCongTy());
                            svdk.setMaDeTai(deTai.getMaDeTai());
                            svdk.setMssv((int) session.get("mssv"));
                            svdk.setTrangThai(2);
                            svdk.setSoKhop((phanTramSoKhop / count) * 100);
                            java.util.Date utilDate = new java.util.Date();
                            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                            svdk.setNgayDangKy(sqlDate);
                            svdk.setDotThucTap(maDotThucTap);

                            if (sinhVienController.saveDeTaiSinhVienDangKy(svdk)) {
                                // đăng ký thành công
                                session.put("messageDangKyDeTai", "Bạn đã đăng ký thành công đề tài: " + deTai.getTenDeTai() + ". Xin chờ giảng viên phê duyệt.");
                            } else {
                                session.put("messageDangKyDeTai", "Có lỗi xảy ra khi đăng ký đề tài: " + deTai.getTenDeTai() + ". Xin vui lòng xem lại hoặc "
                                        + "liên hệ với quản trị viên.");
                            }
                        }
                        return SUCCESS;
                    } else {
                        session.put("messageDangKyDeTai", "Bạn đã đăng ký 3 đề tài, bạn không thể đăng ký thêm đề tài nào nữa.");
                        return SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ERROR;
    }

    /**
     * Phương thức cắt chuỗi để đưa vào hệ thống so khớp
     *
     * @param str
     * @return
     */
    public List getDeTaiSoKhop(String str) {
        str.replaceAll(" ", "");
        int start1 = 0;
        int start2 = 0;
        SoKhop soKhop = null;
        List<SoKhop> lstSoKhop = new ArrayList<>();;
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) == '[') {
                start1 = i + 1;
                soKhop = new SoKhop();
            }
            if (str.charAt(i) == '-') {
                String x = str.substring(start1, i);
                soKhop.setKyNang(x);
                start2 = i + 1;
            }
            if (str.charAt(i) == ']') {
                String x = str.substring(start2, i);
                double giaTri = 0;
                if (x.equalsIgnoreCase("thanhthao")) {
                    giaTri = 100;
                } else if (x.equalsIgnoreCase("tot")) {
                    giaTri = 75;
                } else if (x.equalsIgnoreCase("kha")) {
                    giaTri = 50;
                } else if (x.equalsIgnoreCase("biet")) {
                    giaTri = 25;
                } else if (x.equalsIgnoreCase("khongbiet")) {
                    giaTri = 0;
                }
                soKhop.setPhanTram(giaTri);
                lstSoKhop.add(soKhop);
            }
        }
        return lstSoKhop;
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

    /**
     * phương thức lấy toàn bộ thông tin hệ số điểm thi
     */
//    public String GetAllHeSoDiem(){
//        try {
//            
//        } catch (Exception e) {
//        }
//    
//    }
    /**
     * Phương thức lấy toàn bộ danh sách đề tài sinh viên đã đăng ký
     *
     */
//    public String getAllDeTaiSVDK(){
//    
//    
//    }
    /**
     * Phương thức này cho phép lấy toàn bộ thông tin về file của sinh viên
     *
     */
    public String getTaiLieuSinhVien() {
        lstSinhVienFileBC = sinhVienController.GetListFileSinhVienBC((int) session.get("mssv"));
        lstSinhVienFileHT = sinhVienController.GetListFileSinhVienHT((int) session.get("mssv"));
        session.put("getTaiLieuSinhVien", "getTaiLieuSinhVien");
        return SUCCESS;
    }

    /**
     * Phương thức này cho phép sinh viên upload file
     */
    public String UploadFileSinhVien() {
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        String link = null;
        SinhVienFile sinhVienFile = new SinhVienFile();
        int tp = Integer.parseInt(request.getParameter("loaiFile"));
        try {
            System.out.println(request.getSession().getServletContext().getRealPath("/"));
            path = request.getSession().getServletContext().getRealPath("/").concat("file/sinhvien/");
            File fileToCreate = new File(path, this.myFileFileName);
            FileUtils.copyFile(this.myFile, fileToCreate);
            link = "file/sinhvien/" + myFileFileName;
        } catch (Exception e) {
            e.printStackTrace();
            addActionError(e.getMessage());
            session.put("fileMessage", "Tải file lên hệ thống không thành công! ");
            return ERROR;
        }
        sinhVienFile.setMssv((int) session.get("mssv"));
        sinhVienFile.setLoaiFile(Integer.parseInt(request.getParameter("loaiFile")));
        sinhVienFile.setTenFile(request.getParameter("tenFile"));
        sinhVienFile.setLink(link);
        sinhVienFile.setMoTa(request.getParameter("moTa"));
        sinhVienFile.setNgayThang(sqlDate);
        if (sinhVienController.UploadFileSinhVien(sinhVienFile)) {
            session.put("fileMessage", "Tải file lên hệ thống thành công! ");
            return SUCCESS;
        }
        session.put("fileMessage", "Tải file lên hệ thống không thành công! Đã có lỗi xảy ra. Hãy thử lại.");
        return ERROR;
    }

    /**
     * Phuong thức xóa tài liệu của sinh viên
     */
    public String deleteTaiLieuSinhVien() {
        if (sinhVienController.deleteFileSinhVien(Integer.parseInt(request.getParameter("maTaiLieu")))) {
            session.put("messageTaiLieuSinhVien", "Xóa tài liệu thành công. Mã lài liệu đã xóa là: " + request.getParameter("maTaiLieu") + "");
            return SUCCESS;
        } else {
            session.put("messageTaiLieuSinhVien", "Đã có lỗi xảy ra khi xóa tài liệu này. "
                    + " Mã lài liệu đã xóa là: " + request.getParameter("maTaiLieu") + "");
            return ERROR;
        }
    }

    /**
     * Phương thức lấy toàn bộ điểm thi cho sinh viên
     *
     */
    public String getDiemThiSinhVien() {
        try {
            lstSinhVienDiem = sinhVienController.getDiemThiSinhVien((int) session.get("mssv"));
            lstSinhVien = sinhVienController.getSinhVien((int) session.get("mssv"));
            lstHeSoDiem = sinhVienController.getAllHeSoDiem();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (lstSinhVienDiem.size() == 0) {
            session.put("getDiemThiSinhVienNotFound", "getDiemThiSinhVienNotFound");
        }
        session.put("getDiemThiSinhVien", "getDiemThiSinhVien");
        return SUCCESS;
    }

    /**
     * Phương thức lấy danh sách công ty
     *
     */
    public String getAllCongTyforSV() {
        try {
            lstCongTyforSV = sinhVienController.getAllCongTyforSV();
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        session.put("getAllCongTyforSV", "getAllCongTyforSV");
        return SUCCESS;
    }

    /**
     * Phương thức lấy thông tin chi tiết đề tài
     *
     */
    public String getDeTaiInfo() {
        try {
            List<Object[]> results = sinhVienController.getDeTaiInfo(Integer.parseInt(request.getParameter("maDeTai")));
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
                d.setAvatarNHD((String) result[15]);
                d.setEmailNHD((String) result[16]);
                d.setDienThoaiNHD((String) result[17]);
                d.setChucVuNHD((String) result[18]);
                lstDeTai.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        session.put("getDeTaiInfo", "getDeTaiInfo");
        return SUCCESS;
    }

    /**
     * Phương thức lấy lịch trình sinh viên
     */
    public String getLichTrinhForSV() {
        List<QuyTrinh> lstQuyTrinh = sinhVienController.getLichTrinhForSV();
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
        session.put("getLichTrinhForSV", "not null");
        session.put("getLichTrinh", lichTrinh);
        return SUCCESS;
    }

    public String getAllEmailSV() {
        lstAllEmailSV = sinhVienController.getAllEmailSV((String) session.get("email"));
        lstEmailSVRead = sinhVienController.getAllEmailSVRead((String) session.get("email"));
        lstEmailSVUnread = sinhVienController.getAllEmailSVUnread((String) session.get("email"));
        lstEmailSVSend = sinhVienController.getAllEmailSVSend((String) session.get("email"));
        session.put("getAllEmailSV", "lstAllEmailSV");
        return SUCCESS;
    }

    public String sendEmailSV() {
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        Email email = new Email();
        email.setNguoiGui((String) session.get("email"));
        email.setNguoiNhan(request.getParameter("nguoiNhan"));
        email.setNoiDung(request.getParameter("noiDung"));
        email.setTieuDe(request.getParameter("tieuDe"));
        email.setTrangThai(Boolean.FALSE);
        email.setThoiGian(sqlDate);
        if (sinhVienController.sendEmailSV(email)) {
            session.put("emailMessage", "Bạn đã gửi Email trong hệ thống thành công !");
        } else {
            session.put("emailMessage", "Đã có lỗi khi thực hiện hành động gửi Email này. Nếu tình trạng này tiếp tục xảy ra, vui lòng liên hệ với quản trị viên.!");
        }
        return SUCCESS;
    }

//    public String deleteEmailSV(){
//    
//    }
//    
    /**
     * Phương thức lấy chi tiết công ty Các thông tin cần lấy bao gồm có công
     * ty, đại diện và danh sách người hướng dẫn
     *
     */
//    public String getCongTyInfo(){
//        try {
//            ls
//        } catch (Exception e) {
//        }
//    }
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
