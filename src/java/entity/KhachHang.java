/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author FPT
 */
public class KhachHang {
    private int idKH;
    private String tenKH;
    private int sdt;
    private String ngayThamGia;
    private int doanhSo;
    private int diemTichLuy;
    private int idND;
    private NguoiDung nguoiDung;
    private DiaChi diaChi;

    public KhachHang() {
    }

    public KhachHang(int idKH, String tenKH, int sdt, String ngayThamGia, int doanhSo, int diemTichLuy, int idND, NguoiDung nguoiDung, DiaChi diaChi) {
        this.idKH = idKH;
        this.tenKH = tenKH;
        this.sdt = sdt;
        this.ngayThamGia = ngayThamGia;
        this.doanhSo = doanhSo;
        this.diemTichLuy = diemTichLuy;
        this.idND = idND;
        this.nguoiDung = nguoiDung;
        this.diaChi = diaChi;
    }

    public int getIdKH() {
        return idKH;
    }

    public void setIdKH(int idKH) {
        this.idKH = idKH;
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }

    public int getSdt() {
        return sdt;
    }

    public void setSdt(int sdt) {
        this.sdt = sdt;
    }

    public String getNgayThamGia() {
        return ngayThamGia;
    }

    public void setNgayThamGia(String ngayThamGia) {
        this.ngayThamGia = ngayThamGia;
    }

    public int getDoanhSo() {
        return doanhSo;
    }

    public void setDoanhSo(int doanhSo) {
        this.doanhSo = doanhSo;
    }

    public int getDiemTichLuy() {
        return diemTichLuy;
    }

    public void setDiemTichLuy(int diemTichLuy) {
        this.diemTichLuy = diemTichLuy;
    }

    public int getIdND() {
        return idND;
    }

    public void setIdND(int idND) {
        this.idND = idND;
    }

    public NguoiDung getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(NguoiDung nguoiDung) {
        this.nguoiDung = nguoiDung;
    }

    public DiaChi getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(DiaChi diaChi) {
        this.diaChi = diaChi;
    }

    @Override
    public String toString() {
        return "KhachHang{" + "idKH=" + idKH + ", tenKH=" + tenKH + ", sdt=" + sdt + ", ngayThamGia=" + ngayThamGia + ", doanhSo=" + doanhSo + ", diemTichLuy=" + diemTichLuy + ", idND=" + idND + ", nguoiDung=" + nguoiDung + ", diaChi=" + diaChi + '}';
    }

    
    

    

    
}
