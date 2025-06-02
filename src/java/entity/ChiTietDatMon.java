/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class ChiTietDatMon {
    private int ID_CTD;
    private int ID_DatBan;
    private int ID_MonAn;
    private String tenBan;
    private String tenMon;
    private int soLuong;
    private int donGia;

    public int getID_CTD() {
        return ID_CTD;
    }

    public void setID_CTD(int ID_CTD) {
        this.ID_CTD = ID_CTD;
    }

    public int getID_DatBan() {
        return ID_DatBan;
    }

    public void setID_DatBan(int ID_DatBan) {
        this.ID_DatBan = ID_DatBan;
    }

    public int getID_MonAn() {
        return ID_MonAn;
    }

    public void setID_MonAn(int ID_MonAn) {
        this.ID_MonAn = ID_MonAn;
    }

    public String getTenBan() {
        return tenBan;
    }

    public void setTenBan(String tenBan) {
        this.tenBan = tenBan;
    }

    public String getTenMon() {
        return tenMon;
    }

    public void setTenMon(String tenMon) {
        this.tenMon = tenMon;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public int getDonGia() {
        return donGia;
    }

    public void setDonGia(int donGia) {
        this.donGia = donGia;
    }

    @Override
    public String toString() {
        return "ChiTietDatMon{" + "ID_CTD=" + ID_CTD + ", tenBan=" + tenBan + ", tenMon=" + tenMon + ", soLuong=" + soLuong + ", donGia=" + donGia + '}';
    }

   
}
