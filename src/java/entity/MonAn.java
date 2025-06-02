/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author FPT
 */

public class MonAn {
        
    private int idMonAn;
    private String tenMon;
    private int donGia;
    private int idLoai;
    private String moTa;
    private String image;
    private String trangThai;
    private int soLuong;

    public MonAn() {
    }

    public MonAn(int idMonAn, String tenMon, int donGia, int idLoai, String moTa, String image, String trangThai) {
        this.idMonAn = idMonAn;
        this.tenMon = tenMon;
        this.donGia = donGia;
        this.idLoai = idLoai;
        this.moTa = moTa;
        this.image = image;
        this.trangThai = trangThai;
    }

    public MonAn(int idMonAn, String tenMon, int donGia, int idLoai, String moTa, String image, String trangThai, int soLuong) {
        this.idMonAn = idMonAn;
        this.tenMon = tenMon;
        this.donGia = donGia;
        this.idLoai = idLoai;
        this.moTa = moTa;
        this.image = image;
        this.trangThai = trangThai;
        this.soLuong = soLuong;
    }
    
    public int getIdMonAn() {
        return idMonAn;
    }

    public void setIdMonAn(int idMonAn) {
        this.idMonAn = idMonAn;
    }

    public String getTenMon() {
        return tenMon;
    }

    public void setTenMon(String tenMon) {
        this.tenMon = tenMon;
    }

    public int getDonGia() {
        return donGia;
    }

    public void setDonGia(int donGia) {
        this.donGia = donGia;
    }

    public int getIdLoai() {
        return idLoai;
    }

    public void setIdLoai(int idLoai) {
        this.idLoai = idLoai;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public int getSoLuong() {
        return soLuong;
    }

    @Override
    public String toString() {
        return "MonAn{" + "idMonAn=" + idMonAn + ", tenMon=" + tenMon + ", donGia=" + donGia + ", idLoai=" + idLoai + ", moTa=" + moTa + ", image=" + image + ", trangThai=" + trangThai + ", soLuong=" + soLuong + '}';
    }
    
    
}


