package hust.sie.inpg12.sonnc.entities;
// Generated Mar 25, 2018 2:40:17 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Logs generated by hbm2java
 */
public class Logs  implements java.io.Serializable {


     private Integer id;
     private Login login;
     private String nguoiDung;
     private Date thoiGian;
     private Date ngayThang;
     private String noiDung;

    public Logs() {
    }

	
    public Logs(Login login) {
        this.login = login;
    }
    public Logs(Login login, String nguoiDung, Date thoiGian, Date ngayThang, String noiDung) {
       this.login = login;
       this.nguoiDung = nguoiDung;
       this.thoiGian = thoiGian;
       this.ngayThang = ngayThang;
       this.noiDung = noiDung;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(String nguoiDung) {
        this.nguoiDung = nguoiDung;
    }
   
    public Login getLogin() {
        return this.login;
    }
    
    public void setLogin(Login login) {
        this.login = login;
    }
    public Date getThoiGian() {
        return this.thoiGian;
    }
    
    public void setThoiGian(Date thoiGian) {
        this.thoiGian = thoiGian;
    }
    public Date getNgayThang() {
        return this.ngayThang;
    }
    
    public void setNgayThang(Date ngayThang) {
        this.ngayThang = ngayThang;
    }
    public String getNoiDung() {
        return this.noiDung;
    }
    
    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }




}

