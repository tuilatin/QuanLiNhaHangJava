/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author FPT
 */
public class ChiTietDatBan {
    private int idCTD;
    private DatBan datBan;    // Gắn với đối tượng DatBan
    private MonAn monAn;      // Gắn với đối tượng MonAn
    private int soLuong;
    private double thanhTien;
    private String ghiChu;

    public ChiTietDatBan() {
    }

    public ChiTietDatBan(int idCTD, DatBan datBan, MonAn monAn, int soLuong, double thanhTien, String ghiChu) {
        this.idCTD = idCTD;
        this.datBan = datBan;
        this.monAn = monAn;
        this.soLuong = soLuong;
        this.thanhTien = thanhTien;
        this.ghiChu = ghiChu;
    }

    public int getIdCTD() {
        return idCTD;
    }

    public void setIdCTD(int idCTD) {
        this.idCTD = idCTD;
    }

    public DatBan getDatBan() {
        return datBan;
    }

    public void setDatBan(DatBan datBan) {
        this.datBan = datBan;
    }

    public MonAn getMonAn() {
        return monAn;
    }

    public void setMonAn(MonAn monAn) {
        this.monAn = monAn;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public double getThanhTien() {
        return thanhTien;
    }

    public void setThanhTien(double thanhTien) {
        this.thanhTien = thanhTien;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    @Override
    public String toString() {
        return "ChiTietDatBan{" + "idCTD=" + idCTD + ", datBan=" + datBan + ", monAn=" + monAn + ", soLuong=" + soLuong + ", thanhTien=" + thanhTien + ", ghiChu=" + ghiChu + '}';
    }

    
}
