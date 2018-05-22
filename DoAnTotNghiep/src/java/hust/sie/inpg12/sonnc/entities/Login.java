package hust.sie.inpg12.sonnc.entities;
// Generated Mar 25, 2018 2:40:17 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Login generated by hbm2java
 */
public class Login  implements java.io.Serializable {


     private String email;
     private String pass;
     private int rule;
     private String status;
     private Set thongBaos = new HashSet(0);
     private Set sinhViens = new HashSet(0);
     private Set giangVienHuongDans = new HashSet(0);
     private Set daiDienCongTies = new HashSet(0);
     private Set logses = new HashSet(0);
     private Set giangVienPhuTraches = new HashSet(0);
     private Set emails = new HashSet(0);

    public Login() {
    }

	
    public Login(String email, String pass, int rule) {
        this.email = email;
        this.pass = pass;
        this.rule = rule;
    }
    public Login(String email, String pass, int rule, Set thongBaos, Set sinhViens, Set giangVienHuongDans, Set daiDienCongTies, Set logses, Set giangVienPhuTraches, Set emails) {
       this.email = email;
       this.pass = pass;
       this.rule = rule;
       this.thongBaos = thongBaos;
       this.sinhViens = sinhViens;
       this.giangVienHuongDans = giangVienHuongDans;
       this.daiDienCongTies = daiDienCongTies;
       this.logses = logses;
       this.giangVienPhuTraches = giangVienPhuTraches;
       this.emails = emails;
    }
   
    public String getEmail() {
        return this.email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPass() {
        return this.pass;
    }
    
    public void setPass(String pass) {
        this.pass = pass;
    }
    public int getRule() {
        return this.rule;
    }
    
    public void setRule(int rule) {
        this.rule = rule;
    }
    public Set getThongBaos() {
        return this.thongBaos;
    }
    
    public void setThongBaos(Set thongBaos) {
        this.thongBaos = thongBaos;
    }
    public Set getSinhViens() {
        return this.sinhViens;
    }
    
    public void setSinhViens(Set sinhViens) {
        this.sinhViens = sinhViens;
    }
    public Set getGiangVienHuongDans() {
        return this.giangVienHuongDans;
    }
    
    public void setGiangVienHuongDans(Set giangVienHuongDans) {
        this.giangVienHuongDans = giangVienHuongDans;
    }
    public Set getDaiDienCongTies() {
        return this.daiDienCongTies;
    }
    
    public void setDaiDienCongTies(Set daiDienCongTies) {
        this.daiDienCongTies = daiDienCongTies;
    }
    public Set getLogses() {
        return this.logses;
    }
    
    public void setLogses(Set logses) {
        this.logses = logses;
    }
    public Set getGiangVienPhuTraches() {
        return this.giangVienPhuTraches;
    }
    
    public void setGiangVienPhuTraches(Set giangVienPhuTraches) {
        this.giangVienPhuTraches = giangVienPhuTraches;
    }
    public Set getEmails() {
        return this.emails;
    }
    
    public void setEmails(Set emails) {
        this.emails = emails;
    }




}


