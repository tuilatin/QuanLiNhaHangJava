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
public class HoaDon {
    private int idHoaDon;
    private int idKH;
    private int idBan;
    private Date ngayHD;
    private double tienMonAn;
    private String codeVoucher;
    private double tienGiam;
    private double tongTien;
    private String trangThai;
    private NguoiDung nguoiDung;
    private Ban ban;

    public HoaDon() {
    }

    public HoaDon(int idHoaDon, int idKH, int idBan, Date ngayHD, double tienMonAn, String codeVoucher, double tienGiam, double tongTien, String trangThai, NguoiDung nguoiDung, Ban ban) {
        this.idHoaDon = idHoaDon;
        this.idKH = idKH;
        this.idBan = idBan;
        this.ngayHD = ngayHD;
        this.tienMonAn = tienMonAn;
        this.codeVoucher = codeVoucher;
        this.tienGiam = tienGiam;
        this.tongTien = tongTien;
        this.trangThai = trangThai;
        this.nguoiDung = nguoiDung;
        this.ban = ban;
    }

    public int getIdHoaDon() {
        return idHoaDon;
    }

    public void setIdHoaDon(int idHoaDon) {
        this.idHoaDon = idHoaDon;
    }

    public int getIdKH() {
        return idKH;
    }

    public void setIdKH(int idKH) {
        this.idKH = idKH;
    }

    public int getIdBan() {
        return idBan;
    }

    public void setIdBan(int idBan) {
        this.idBan = idBan;
    }

    public Date getNgayHD() {
        return ngayHD;
    }

    public void setNgayHD(Date ngayHD) {
        this.ngayHD = ngayHD;
    }

    public double getTienMonAn() {
        return tienMonAn;
    }

    public void setTienMonAn(double tienMonAn) {
        this.tienMonAn = tienMonAn;
    }

    public String getCodeVoucher() {
        return codeVoucher;
    }

    public void setCodeVoucher(String codeVoucher) {
        this.codeVoucher = codeVoucher;
    }

    public double getTienGiam() {
        return tienGiam;
    }

    public void setTienGiam(double tienGiam) {
        this.tienGiam = tienGiam;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public NguoiDung getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(NguoiDung nguoiDung) {
        this.nguoiDung = nguoiDung;
    }

    public Ban getBan() {
        return ban;
    }

    public void setBan(Ban ban) {
        this.ban = ban;
    }

    @Override
    public String toString() {
        return "HoaDon{" + "idHoaDon=" + idHoaDon + ", idKH=" + idKH + ", idBan=" + idBan + ", ngayHD=" + ngayHD + ", tienMonAn=" + tienMonAn + ", codeVoucher=" + codeVoucher + ", tienGiam=" + tienGiam + ", tongTien=" + tongTien + ", trangThai=" + trangThai + ", nguoiDung=" + nguoiDung + ", ban=" + ban + '}';
    }

    
    
}
