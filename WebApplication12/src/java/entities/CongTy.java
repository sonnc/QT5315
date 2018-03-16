package entities;
// Generated Mar 16, 2018 1:43:23 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * CongTy generated by hbm2java
 */
@Entity
@Table(name="cong_ty"
    ,catalog="doantotnghiep"
)
public class CongTy  implements java.io.Serializable {


     private Integer maCongTy;
     private String tenCongTy;
     private String diaChi;
     private String dienThoai;
     private String email;
     private String website;
     private String linhVungHoatDong;
     private String moTa;
     private String logo;
     private Integer trangThai;
     private Set<DaiDienCongTy> daiDienCongTies = new HashSet<DaiDienCongTy>(0);
     private Set<DeTai> deTais = new HashSet<DeTai>(0);
     private Set<GiangVienHuongDan> giangVienHuongDans = new HashSet<GiangVienHuongDan>(0);

    public CongTy() {
    }

	
    public CongTy(String tenCongTy, String diaChi, String dienThoai, String email, String website) {
        this.tenCongTy = tenCongTy;
        this.diaChi = diaChi;
        this.dienThoai = dienThoai;
        this.email = email;
        this.website = website;
    }
    public CongTy(String tenCongTy, String diaChi, String dienThoai, String email, String website, String linhVungHoatDong, String moTa, String logo, Integer trangThai, Set<DaiDienCongTy> daiDienCongTies, Set<DeTai> deTais, Set<GiangVienHuongDan> giangVienHuongDans) {
       this.tenCongTy = tenCongTy;
       this.diaChi = diaChi;
       this.dienThoai = dienThoai;
       this.email = email;
       this.website = website;
       this.linhVungHoatDong = linhVungHoatDong;
       this.moTa = moTa;
       this.logo = logo;
       this.trangThai = trangThai;
       this.daiDienCongTies = daiDienCongTies;
       this.deTais = deTais;
       this.giangVienHuongDans = giangVienHuongDans;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="ma_cong_ty", unique=true, nullable=false)
    public Integer getMaCongTy() {
        return this.maCongTy;
    }
    
    public void setMaCongTy(Integer maCongTy) {
        this.maCongTy = maCongTy;
    }

    
    @Column(name="ten_cong_ty", nullable=false, length=500)
    public String getTenCongTy() {
        return this.tenCongTy;
    }
    
    public void setTenCongTy(String tenCongTy) {
        this.tenCongTy = tenCongTy;
    }

    
    @Column(name="dia_chi", nullable=false, length=500)
    public String getDiaChi() {
        return this.diaChi;
    }
    
    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    
    @Column(name="dien_thoai", nullable=false, length=15)
    public String getDienThoai() {
        return this.dienThoai;
    }
    
    public void setDienThoai(String dienThoai) {
        this.dienThoai = dienThoai;
    }

    
    @Column(name="email", nullable=false)
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    
    @Column(name="website", nullable=false)
    public String getWebsite() {
        return this.website;
    }
    
    public void setWebsite(String website) {
        this.website = website;
    }

    
    @Column(name="linh_vung_hoat_dong", length=65535)
    public String getLinhVungHoatDong() {
        return this.linhVungHoatDong;
    }
    
    public void setLinhVungHoatDong(String linhVungHoatDong) {
        this.linhVungHoatDong = linhVungHoatDong;
    }

    
    @Column(name="mo_ta", length=65535)
    public String getMoTa() {
        return this.moTa;
    }
    
    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    
    @Column(name="logo", length=500)
    public String getLogo() {
        return this.logo;
    }
    
    public void setLogo(String logo) {
        this.logo = logo;
    }

    
    @Column(name="trang_thai")
    public Integer getTrangThai() {
        return this.trangThai;
    }
    
    public void setTrangThai(Integer trangThai) {
        this.trangThai = trangThai;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="congTy")
    public Set<DaiDienCongTy> getDaiDienCongTies() {
        return this.daiDienCongTies;
    }
    
    public void setDaiDienCongTies(Set<DaiDienCongTy> daiDienCongTies) {
        this.daiDienCongTies = daiDienCongTies;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="congTy")
    public Set<DeTai> getDeTais() {
        return this.deTais;
    }
    
    public void setDeTais(Set<DeTai> deTais) {
        this.deTais = deTais;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="congTy")
    public Set<GiangVienHuongDan> getGiangVienHuongDans() {
        return this.giangVienHuongDans;
    }
    
    public void setGiangVienHuongDans(Set<GiangVienHuongDan> giangVienHuongDans) {
        this.giangVienHuongDans = giangVienHuongDans;
    }




}


