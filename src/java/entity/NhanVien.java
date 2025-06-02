/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author FPT
 */
public class NhanVien {
    private int id;
    private String tenNV;
    private String ngayVL;
    private String sdt;
    private String chucVu;
    private int idNguoiDung;
    private Integer idNguoiQuanLy;
    private String tinhTrang;
    private NguoiDung nguoiDung;

    public NhanVien() {
    }

    public NhanVien(int id, String tenNV, String ngayVL, String sdt, String chucVu, int idNguoiDung, Integer idNguoiQuanLy, String tinhTrang, NguoiDung nguoiDung) {
        this.id = id;
        this.tenNV = tenNV;
        this.ngayVL = ngayVL;
        this.sdt = sdt;
        this.chucVu = chucVu;
        this.idNguoiDung = idNguoiDung;
        this.idNguoiQuanLy = idNguoiQuanLy;
        this.tinhTrang = tinhTrang;
        this.nguoiDung = nguoiDung;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenNV() {
        return tenNV;
    }

    public void setTenNV(String tenNV) {
        this.tenNV = tenNV;
    }

    public String getNgayVL() {
        return ngayVL;
    }

    public void setNgayVL(String ngayVL) {
        this.ngayVL = ngayVL;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getChucVu() {
        return chucVu;
    }

    public void setChucVu(String chucVu) {
        this.chucVu = chucVu;
    }

    public int getIdNguoiDung() {
        return idNguoiDung;
    }

    public void setIdNguoiDung(int idNguoiDung) {
        this.idNguoiDung = idNguoiDung;
    }

    public Integer getIdNguoiQuanLy() {
        return idNguoiQuanLy;
    }

    public void setIdNguoiQuanLy(Integer idNguoiQuanLy) {
        this.idNguoiQuanLy = idNguoiQuanLy;
    }

    public String getTinhTrang() {
        return tinhTrang;
    }

    public void setTinhTrang(String tinhTrang) {
        this.tinhTrang = tinhTrang;
    }

    public NguoiDung getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(NguoiDung nguoiDung) {
        this.nguoiDung = nguoiDung;
    }

    @Override
    public String toString() {
        return "NhanVien{" + "id=" + id + ", tenNV=" + tenNV + ", ngayVL=" + ngayVL + ", sdt=" + sdt + ", chucVu=" + chucVu + ", idNguoiDung=" + idNguoiDung + ", idNguoiQuanLy=" + idNguoiQuanLy + ", tinhTrang=" + tinhTrang + ", nguoiDung=" + nguoiDung + '}';
    }
    
}
