package entities;
// Generated Mar 16, 2018 1:43:23 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * SinhVienDiem generated by hbm2java
 */
@Entity
@Table(name="sinh_vien_diem"
    ,catalog="doantotnghiep"
)
public class SinhVienDiem  implements java.io.Serializable {


     private Integer id;
     private SinhVien sinhVien;
     private Double diemPhanHoi;
     private Double diemBcqt;
     private Double diemQuaTrinh;
     private Double diemCuoiKy;

    public SinhVienDiem() {
    }

	
    public SinhVienDiem(SinhVien sinhVien) {
        this.sinhVien = sinhVien;
    }
    public SinhVienDiem(SinhVien sinhVien, Double diemPhanHoi, Double diemBcqt, Double diemQuaTrinh, Double diemCuoiKy) {
       this.sinhVien = sinhVien;
       this.diemPhanHoi = diemPhanHoi;
       this.diemBcqt = diemBcqt;
       this.diemQuaTrinh = diemQuaTrinh;
       this.diemCuoiKy = diemCuoiKy;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="mssv", nullable=false)
    public SinhVien getSinhVien() {
        return this.sinhVien;
    }
    
    public void setSinhVien(SinhVien sinhVien) {
        this.sinhVien = sinhVien;
    }

    
    @Column(name="diem_phan_hoi", precision=2)
    public Double getDiemPhanHoi() {
        return this.diemPhanHoi;
    }
    
    public void setDiemPhanHoi(Double diemPhanHoi) {
        this.diemPhanHoi = diemPhanHoi;
    }

    
    @Column(name="diem_bcqt", precision=2)
    public Double getDiemBcqt() {
        return this.diemBcqt;
    }
    
    public void setDiemBcqt(Double diemBcqt) {
        this.diemBcqt = diemBcqt;
    }

    
    @Column(name="diem_qua_trinh", precision=2)
    public Double getDiemQuaTrinh() {
        return this.diemQuaTrinh;
    }
    
    public void setDiemQuaTrinh(Double diemQuaTrinh) {
        this.diemQuaTrinh = diemQuaTrinh;
    }

    
    @Column(name="diem_cuoi_ky", precision=2)
    public Double getDiemCuoiKy() {
        return this.diemCuoiKy;
    }
    
    public void setDiemCuoiKy(Double diemCuoiKy) {
        this.diemCuoiKy = diemCuoiKy;
    }




}


