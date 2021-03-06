package hust.sie.inpg12.sonnc.entities;
// Generated Mar 25, 2018 2:40:17 PM by Hibernate Tools 4.3.1



/**
 * SinhVienDiem generated by hbm2java
 */
public class SinhVienDiem  implements java.io.Serializable {


     private Integer id;
     private SinhVien sinhVien;
     private int mssv;
     private Double diemPhanHoi;
     private Double diemBcqt;
     private Double diemQuaTrinh;
     private Double diemCuoiKy;
     private int dotThucTap;

    public SinhVienDiem() {
    }

	
    public SinhVienDiem(SinhVien sinhVien) {
        this.sinhVien = sinhVien;
    }
    public SinhVienDiem(SinhVien sinhVien, int mssv, Double diemPhanHoi, Double diemBcqt, Double diemQuaTrinh, Double diemCuoiKy) {
       this.sinhVien = sinhVien;
       this.mssv = mssv;
       this.diemPhanHoi = diemPhanHoi;
       this.diemBcqt = diemBcqt;
       this.diemQuaTrinh = diemQuaTrinh;
       this.diemCuoiKy = diemCuoiKy;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public SinhVien getSinhVien() {
        return this.sinhVien;
    }

    public int getMssv() {
        return mssv;
    }

    public void setMssv(int mssv) {
        this.mssv = mssv;
    }
    
    public void setSinhVien(SinhVien sinhVien) {
        this.sinhVien = sinhVien;
    }
    public Double getDiemPhanHoi() {
        return this.diemPhanHoi;
    }
    
    public void setDiemPhanHoi(Double diemPhanHoi) {
        this.diemPhanHoi = diemPhanHoi;
    }
    public Double getDiemBcqt() {
        return this.diemBcqt;
    }
    
    public void setDiemBcqt(Double diemBcqt) {
        this.diemBcqt = diemBcqt;
    }
    public Double getDiemQuaTrinh() {
        return this.diemQuaTrinh;
    }
    
    public void setDiemQuaTrinh(Double diemQuaTrinh) {
        this.diemQuaTrinh = diemQuaTrinh;
    }
    public Double getDiemCuoiKy() {
        return this.diemCuoiKy;
    }
    
    public void setDiemCuoiKy(Double diemCuoiKy) {
        this.diemCuoiKy = diemCuoiKy;
    }

    public int getDotThucTap() {
        return dotThucTap;
    }

    public void setDotThucTap(int dotThucTap) {
        this.dotThucTap = dotThucTap;
    }




}


