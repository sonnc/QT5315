package entities;
// Generated Mar 16, 2018 1:43:23 PM by Hibernate Tools 4.3.1


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Logs generated by hbm2java
 */
@Entity
@Table(name="logs"
    ,catalog="doantotnghiep"
)
public class Logs  implements java.io.Serializable {


     private Integer id;
     private Login login;
     private Date thoiGian;
     private Date ngayThang;
     private String noiDung;

    public Logs() {
    }

	
    public Logs(Login login) {
        this.login = login;
    }
    public Logs(Login login, Date thoiGian, Date ngayThang, String noiDung) {
       this.login = login;
       this.thoiGian = thoiGian;
       this.ngayThang = ngayThang;
       this.noiDung = noiDung;
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
    @JoinColumn(name="nguoi_dung", nullable=false)
    public Login getLogin() {
        return this.login;
    }
    
    public void setLogin(Login login) {
        this.login = login;
    }

    @Temporal(TemporalType.TIME)
    @Column(name="thoi_gian", length=8)
    public Date getThoiGian() {
        return this.thoiGian;
    }
    
    public void setThoiGian(Date thoiGian) {
        this.thoiGian = thoiGian;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="ngay_thang", length=10)
    public Date getNgayThang() {
        return this.ngayThang;
    }
    
    public void setNgayThang(Date ngayThang) {
        this.ngayThang = ngayThang;
    }

    
    @Column(name="noi_dung")
    public String getNoiDung() {
        return this.noiDung;
    }
    
    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }




}

