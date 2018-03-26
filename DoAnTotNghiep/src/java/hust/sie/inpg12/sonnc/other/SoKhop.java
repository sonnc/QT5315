/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hust.sie.inpg12.sonnc.other;

/**
 *
 * @author sonnc
 */
public class SoKhop {
    private String kyNang;
    private String trinhDo;
    private double phanTram;

    public SoKhop() {
    }

    
    
    public SoKhop(String kyNang, String trinhDo, double phanTram) {
        this.kyNang = kyNang;
        this.trinhDo = trinhDo;
        this.phanTram = phanTram;
    }

    public String getKyNang() {
        return kyNang;
    }

    public void setKyNang(String kyNang) {
        this.kyNang = kyNang;
    }

    public String getTrinhDo() {
        return trinhDo;
    }

    public void setTrinhDo(String trinhDo) {
        this.trinhDo = trinhDo;
    }

    public double getPhanTram() {
        return phanTram;
    }

    public void setPhanTram(double phanTram) {
        this.phanTram = phanTram;
    }
    
    
    
}
