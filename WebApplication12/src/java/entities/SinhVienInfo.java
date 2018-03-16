package entities;
// Generated Mar 16, 2018 1:43:23 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 * SinhVienInfo generated by hbm2java
 */
@Entity
@Table(name="sinh_vien_info"
    ,catalog="doantotnghiep"
)
public class SinhVienInfo  implements java.io.Serializable {


     private int mssv;
     private SinhVien sinhVien;
     private String ngoaiNgu;
     private String kyNangLt;
     private String nyNangKhac;
     private String mucTieu;
     private String hoatDong;
     private String giaiThuong;
     private String soThich;
     private String duAn;

    public SinhVienInfo() {
    }

	
    public SinhVienInfo(SinhVien sinhVien) {
        this.sinhVien = sinhVien;
    }
    public SinhVienInfo(SinhVien sinhVien, String ngoaiNgu, String kyNangLt, String nyNangKhac, String mucTieu, String hoatDong, String giaiThuong, String soThich, String duAn) {
       this.sinhVien = sinhVien;
       this.ngoaiNgu = ngoaiNgu;
       this.kyNangLt = kyNangLt;
       this.nyNangKhac = nyNangKhac;
       this.mucTieu = mucTieu;
       this.hoatDong = hoatDong;
       this.giaiThuong = giaiThuong;
       this.soThich = soThich;
       this.duAn = duAn;
    }
   
     @GenericGenerator(name="generator", strategy="foreign", parameters=@Parameter(name="property", value="sinhVien"))@Id @GeneratedValue(generator="generator")

    
    @Column(name="mssv", unique=true, nullable=false)
    public int getMssv() {
        return this.mssv;
    }
    
    public void setMssv(int mssv) {
        this.mssv = mssv;
    }

@OneToOne(fetch=FetchType.LAZY)@PrimaryKeyJoinColumn
    public SinhVien getSinhVien() {
        return this.sinhVien;
    }
    
    public void setSinhVien(SinhVien sinhVien) {
        this.sinhVien = sinhVien;
    }

    
    @Column(name="ngoai_ngu", length=500)
    public String getNgoaiNgu() {
        return this.ngoaiNgu;
    }
    
    public void setNgoaiNgu(String ngoaiNgu) {
        this.ngoaiNgu = ngoaiNgu;
    }

    
    @Column(name="ky_nang_lt", length=65535)
    public String getKyNangLt() {
        return this.kyNangLt;
    }
    
    public void setKyNangLt(String kyNangLt) {
        this.kyNangLt = kyNangLt;
    }

    
    @Column(name="ny_nang_khac", length=65535)
    public String getNyNangKhac() {
        return this.nyNangKhac;
    }
    
    public void setNyNangKhac(String nyNangKhac) {
        this.nyNangKhac = nyNangKhac;
    }

    
    @Column(name="muc_tieu", length=65535)
    public String getMucTieu() {
        return this.mucTieu;
    }
    
    public void setMucTieu(String mucTieu) {
        this.mucTieu = mucTieu;
    }

    
    @Column(name="hoat_dong", length=65535)
    public String getHoatDong() {
        return this.hoatDong;
    }
    
    public void setHoatDong(String hoatDong) {
        this.hoatDong = hoatDong;
    }

    
    @Column(name="giai_thuong", length=65535)
    public String getGiaiThuong() {
        return this.giaiThuong;
    }
    
    public void setGiaiThuong(String giaiThuong) {
        this.giaiThuong = giaiThuong;
    }

    
    @Column(name="so_thich", length=65535)
    public String getSoThich() {
        return this.soThich;
    }
    
    public void setSoThich(String soThich) {
        this.soThich = soThich;
    }

    
    @Column(name="du_an", length=65535)
    public String getDuAn() {
        return this.duAn;
    }
    
    public void setDuAn(String duAn) {
        this.duAn = duAn;
    }




}


