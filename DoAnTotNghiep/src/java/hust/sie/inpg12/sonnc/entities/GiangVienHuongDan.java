package hust.sie.inpg12.sonnc.entities;
// Generated Mar 25, 2018 2:40:17 PM by Hibernate Tools 4.3.1



/**
 * GiangVienHuongDan generated by hbm2java
 */
public class GiangVienHuongDan  implements java.io.Serializable {


     private Integer maGvpt;
     private Login login;
     private String email;
     private String hoTen;
     private String diaChi;
     private String dienThoai;
     private String khoaVien;
     private String boMon;
     private String congTrinhNghienCuu;
     private String sachXuatBan;
     private String monGiangDay;
     private String khac;
     private String avatar;
     private String status;

    public GiangVienHuongDan() {
    }

	
    public GiangVienHuongDan(Login login, String hoTen, String diaChi, String dienThoai) {
        this.login = login;
        this.hoTen = hoTen;
        this.diaChi = diaChi;
        this.dienThoai = dienThoai;
    }
    public GiangVienHuongDan(Login login, String email, String hoTen, String diaChi, String dienThoai, String khoaVien, String boMon, String congTrinhNghienCuu, String sachXuatBan, String monGiangDay, String khac, String avatar) {
       this.login = login;
       this.email = email;
       this.hoTen = hoTen;
       this.diaChi = diaChi;
       this.dienThoai = dienThoai;
       this.khoaVien = khoaVien;
       this.boMon = boMon;
       this.congTrinhNghienCuu = congTrinhNghienCuu;
       this.sachXuatBan = sachXuatBan;
       this.monGiangDay = monGiangDay;
       this.khac = khac;
       this.avatar = avatar;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
   
    public Integer getMaGvpt() {
        return this.maGvpt;
    }
    
    public void setMaGvpt(Integer maGvpt) {
        this.maGvpt = maGvpt;
    }
    public Login getLogin() {
        return this.login;
    }
    
    public void setLogin(Login login) {
        this.login = login;
    }
    public String getHoTen() {
        return this.hoTen;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }
    public String getDiaChi() {
        return this.diaChi;
    }
    
    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
    public String getDienThoai() {
        return this.dienThoai;
    }
    
    public void setDienThoai(String dienThoai) {
        this.dienThoai = dienThoai;
    }
    public String getKhoaVien() {
        return this.khoaVien;
    }
    
    public void setKhoaVien(String khoaVien) {
        this.khoaVien = khoaVien;
    }
    public String getBoMon() {
        return this.boMon;
    }
    
    public void setBoMon(String boMon) {
        this.boMon = boMon;
    }
    public String getCongTrinhNghienCuu() {
        return this.congTrinhNghienCuu;
    }
    
    public void setCongTrinhNghienCuu(String congTrinhNghienCuu) {
        this.congTrinhNghienCuu = congTrinhNghienCuu;
    }
    public String getSachXuatBan() {
        return this.sachXuatBan;
    }
    
    public void setSachXuatBan(String sachXuatBan) {
        this.sachXuatBan = sachXuatBan;
    }
    public String getMonGiangDay() {
        return this.monGiangDay;
    }
    
    public void setMonGiangDay(String monGiangDay) {
        this.monGiangDay = monGiangDay;
    }
    public String getKhac() {
        return this.khac;
    }
    
    public void setKhac(String khac) {
        this.khac = khac;
    }
    public String getAvatar() {
        return this.avatar;
    }
    
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }




}


