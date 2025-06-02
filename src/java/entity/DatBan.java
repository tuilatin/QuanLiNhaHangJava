/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;
import java.util.List;

/**
 *
 * @author FPT
 */
public class DatBan {
    private int idDatBan;
    private NguoiDung nguoiDung;  // Gắn với đối tượng KhachHang
    private Ban ban;              // Gắn với đối tượng Ban
    private String diaChi;
    private String tenKH;
    private Date thoiGianDat;
    private int soNguoi;
    private String Sdt;
    private String ghiChu;
    private Double tongTien;
    private String trangThai;  
    private List<ChiTietDatBan> chiTietDatBanList;

    public DatBan() {
    }

    public DatBan(int idDatBan, NguoiDung nguoiDung, Ban ban, String diaChi, String tenKH, Date thoiGianDat, int soNguoi, String Sdt, String ghiChu, Double tongTien, String trangThai, List<ChiTietDatBan> chiTietDatBanList) {
        this.idDatBan = idDatBan;
        this.nguoiDung = nguoiDung;
        this.ban = ban;
        this.diaChi = diaChi;
        this.tenKH = tenKH;
        this.thoiGianDat = thoiGianDat;
        this.soNguoi = soNguoi;
        this.Sdt = Sdt;
        this.ghiChu = ghiChu;
        this.tongTien = tongTien;
        this.trangThai = trangThai;
        this.chiTietDatBanList = chiTietDatBanList;
    }

    public int getIdDatBan() {
        return idDatBan;
    }

    public void setIdDatBan(int idDatBan) {
        this.idDatBan = idDatBan;
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

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }

    public Date getThoiGianDat() {
        return thoiGianDat;
    }

    public void setThoiGianDat(Date thoiGianDat) {
        this.thoiGianDat = thoiGianDat;
    }

    public int getSoNguoi() {
        return soNguoi;
    }

    public void setSoNguoi(int soNguoi) {
        this.soNguoi = soNguoi;
    }

    public String getSdt() {
        return Sdt;
    }

    public void setSdt(String Sdt) {
        this.Sdt = Sdt;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public Double getTongTien() {
        return tongTien;
    }

    public void setTongTien(Double tongTien) {
        this.tongTien = tongTien;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public List<ChiTietDatBan> getChiTietDatBanList() {
        return chiTietDatBanList;
    }

    public void setChiTietDatBanList(List<ChiTietDatBan> chiTietDatBanList) {
        this.chiTietDatBanList = chiTietDatBanList;
    }

    @Override
    public String toString() {
        return "DatBan{" + "idDatBan=" + idDatBan + ", nguoiDung=" + nguoiDung + ", ban=" + ban + ", diaChi=" + diaChi + ", tenKH=" + tenKH + ", thoiGianDat=" + thoiGianDat + ", soNguoi=" + soNguoi + ", Sdt=" + Sdt + ", ghiChu=" + ghiChu + ", tongTien=" + tongTien + ", trangThai=" + trangThai + ", chiTietDatBanList=" + chiTietDatBanList + '}';
    }

    
    
}
