package hust.sie.inpg12.sonnc.entities;
// Generated Mar 25, 2018 2:40:17 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * DotThucTap generated by hbm2java
 */
public class DotThucTap  implements java.io.Serializable {


     private Integer id;
     private int maDot;
     private Date thoiGianBatDau;
     private Date thoiGianKetThuc;

    public DotThucTap() {
    }

    public DotThucTap(int maDot, Date thoiGianBatDau, Date thoiGianKetThuc) {
       this.maDot = maDot;
       this.thoiGianBatDau = thoiGianBatDau;
       this.thoiGianKetThuc = thoiGianKetThuc;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public int getMaDot() {
        return this.maDot;
    }
    
    public void setMaDot(int maDot) {
        this.maDot = maDot;
    }
    public Date getThoiGianBatDau() {
        return this.thoiGianBatDau;
    }
    
    public void setThoiGianBatDau(Date thoiGianBatDau) {
        this.thoiGianBatDau = thoiGianBatDau;
    }
    public Date getThoiGianKetThuc() {
        return this.thoiGianKetThuc;
    }
    
    public void setThoiGianKetThuc(Date thoiGianKetThuc) {
        this.thoiGianKetThuc = thoiGianKetThuc;
    }




}


