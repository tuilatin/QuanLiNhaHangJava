/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author FPT
 */
public class DiaChi {
    private int idDC;
    private int idKH;
    private String soNhaDuong;
    private String phuongXa;
    private String quanHuyen;
    private String tinhThanh;
    private String ghiChu;
    private boolean macDinh;

    public DiaChi() {
    }

    public DiaChi(int idDC, int idKH, String soNhaDuong, String phuongXa, String quanHuyen, String tinhThanh, String ghiChu, boolean macDinh) {
        this.idDC = idDC;
        this.idKH = idKH;
        this.soNhaDuong = soNhaDuong;
        this.phuongXa = phuongXa;
        this.quanHuyen = quanHuyen;
        this.tinhThanh = tinhThanh;
        this.ghiChu = ghiChu;
        this.macDinh = macDinh;
    }

    public int getIdDC() {
        return idDC;
    }

    public void setIdDC(int idDC) {
        this.idDC = idDC;
    }

    public int getIdKH() {
        return idKH;
    }

    public void setIdKH(int idKH) {
        this.idKH = idKH;
    }

    public String getSoNhaDuong() {
        return soNhaDuong;
    }

    public void setSoNhaDuong(String soNhaDuong) {
        this.soNhaDuong = soNhaDuong;
    }

    public String getPhuongXa() {
        return phuongXa;
    }

    public void setPhuongXa(String phuongXa) {
        this.phuongXa = phuongXa;
    }

    public String getQuanHuyen() {
        return quanHuyen;
    }

    public void setQuanHuyen(String quanHuyen) {
        this.quanHuyen = quanHuyen;
    }

    public String getTinhThanh() {
        return tinhThanh;
    }

    public void setTinhThanh(String tinhThanh) {
        this.tinhThanh = tinhThanh;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public boolean isMacDinh() {
        return macDinh;
    }

    public void setMacDinh(boolean macDinh) {
        this.macDinh = macDinh;
    }

    @Override
    public String toString() {
        return "DiaChi{" + "idDC=" + idDC + ", idKH=" + idKH + ", soNhaDuong=" + soNhaDuong + ", phuongXa=" + phuongXa + ", quanHuyen=" + quanHuyen + ", tinhThanh=" + tinhThanh + ", ghiChu=" + ghiChu + ", macDinh=" + macDinh + '}';
    }
    
    
}
