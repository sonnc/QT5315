package hust.sie.inpg12.sonnc.entities;
// Generated Mar 25, 2018 2:40:17 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * CongTy generated by hbm2java
 */
public class CongTy  implements java.io.Serializable {


     private Integer maCongTy;
     private DaiDienCongTy daiDienCongTy;
     private int maDaiDien;
     private String tenCongTy;
     private String diaChi;
     private String dienThoai;
     private String email;
     private String website;
     private String linhVungHoatDong;
     private String moTa;
     private String logo;
     private Integer trangThai;
     private Set deTais = new HashSet(0);
     private Set giangVienHuongDans = new HashSet(0);

    public CongTy() {
    }

	
    public CongTy(DaiDienCongTy daiDienCongTy, String tenCongTy, String diaChi, String dienThoai, String email, String website) {
        this.daiDienCongTy = daiDienCongTy;
        this.tenCongTy = tenCongTy;
        this.diaChi = diaChi;
        this.dienThoai = dienThoai;
        this.email = email;
        this.website = website;
    }
    public CongTy(DaiDienCongTy daiDienCongTy, int maDaiDien, String tenCongTy, String diaChi, String dienThoai, String email, String website, String linhVungHoatDong, String moTa, String logo, Integer trangThai, Set deTais, Set giangVienHuongDans) {
       this.daiDienCongTy = daiDienCongTy;
       this.maDaiDien = maDaiDien;
       this.tenCongTy = tenCongTy;
       this.diaChi = diaChi;
       this.dienThoai = dienThoai;
       this.email = email;
       this.website = website;
       this.linhVungHoatDong = linhVungHoatDong;
       this.moTa = moTa;
       this.logo = logo;
       this.trangThai = trangThai;
       this.deTais = deTais;
       this.giangVienHuongDans = giangVienHuongDans;
    }
   
    public Integer getMaCongTy() {
        return this.maCongTy;
    }
    
    public void setMaCongTy(Integer maCongTy) {
        this.maCongTy = maCongTy;
    }

    public int getMaDaiDien() {
        return maDaiDien;
    }

    public void setMaDaiDien(int maDaiDien) {
        this.maDaiDien = maDaiDien;
    }
    
    public DaiDienCongTy getDaiDienCongTy() {
        return this.daiDienCongTy;
    }
    
    public void setDaiDienCongTy(DaiDienCongTy daiDienCongTy) {
        this.daiDienCongTy = daiDienCongTy;
    }
    public String getTenCongTy() {
        return this.tenCongTy;
    }
    
    public void setTenCongTy(String tenCongTy) {
        this.tenCongTy = tenCongTy;
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
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getWebsite() {
        return this.website;
    }
    
    public void setWebsite(String website) {
        this.website = website;
    }
    public String getLinhVungHoatDong() {
        return this.linhVungHoatDong;
    }
    
    public void setLinhVungHoatDong(String linhVungHoatDong) {
        this.linhVungHoatDong = linhVungHoatDong;
    }
    public String getMoTa() {
        return this.moTa;
    }
    
    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }
    public String getLogo() {
        return this.logo;
    }
    
    public void setLogo(String logo) {
        this.logo = logo;
    }
    public Integer getTrangThai() {
        return this.trangThai;
    }
    
    public void setTrangThai(Integer trangThai) {
        this.trangThai = trangThai;
    }
    public Set getDeTais() {
        return this.deTais;
    }
    
    public void setDeTais(Set deTais) {
        this.deTais = deTais;
    }
    public Set getGiangVienHuongDans() {
        return this.giangVienHuongDans;
    }
    
    public void setGiangVienHuongDans(Set giangVienHuongDans) {
        this.giangVienHuongDans = giangVienHuongDans;
    }




}


