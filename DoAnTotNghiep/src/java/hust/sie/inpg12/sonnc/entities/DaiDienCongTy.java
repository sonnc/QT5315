package hust.sie.inpg12.sonnc.entities;
// Generated Mar 25, 2018 2:40:17 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * DaiDienCongTy generated by hbm2java
 */
public class DaiDienCongTy  implements java.io.Serializable {


     private Integer maDaiDien;
     private Login login;
     private String email;
     private String hoTen;
     private String chucVu;
     private String diaChi;
     private String dienThoai;
     private String avatar;
     private Set congTies = new HashSet(0);

    public DaiDienCongTy() {
    }

	
    public DaiDienCongTy(Login login, String hoTen) {
        this.login = login;
        this.hoTen = hoTen;
    }
    public DaiDienCongTy(Login login, String email, String hoTen, String chucVu, String diaChi, String dienThoai, String avatar, Set congTies) {
       this.login = login;
       this.email = email;
       this.hoTen = hoTen;
       this.chucVu = chucVu;
       this.diaChi = diaChi;
       this.dienThoai = dienThoai;
       this.avatar = avatar;
       this.congTies = congTies;
    }
   
    public Integer getMaDaiDien() {
        return this.maDaiDien;
    }
    
    public void setMaDaiDien(Integer maDaiDien) {
        this.maDaiDien = maDaiDien;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
    
    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }
    public String getChucVu() {
        return this.chucVu;
    }
    
    public void setChucVu(String chucVu) {
        this.chucVu = chucVu;
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
    public String getAvatar() {
        return this.avatar;
    }
    
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    public Set getCongTies() {
        return this.congTies;
    }
    
    public void setCongTies(Set congTies) {
        this.congTies = congTies;
    }




}

