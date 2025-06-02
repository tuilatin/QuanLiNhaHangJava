/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author FPT
 */
public class HoaDon_TrangThai {
    private int id;
    private int idHoaDon;
    private String trangThai;
    private String nguoiCapNhat;
    private String ghiChu;
    private Date ngayThayDoi;

    public HoaDon_TrangThai() {
    }

    public HoaDon_TrangThai(int id, int idHoaDon, String trangThai, String nguoiCapNhat, String ghiChu, Date ngayThayDoi) {
        this.id = id;
        this.idHoaDon = idHoaDon;
        this.trangThai = trangThai;
        this.nguoiCapNhat = nguoiCapNhat;
        this.ghiChu = ghiChu;
        this.ngayThayDoi = ngayThayDoi;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdHoaDon() {
        return idHoaDon;
    }

    public void setIdHoaDon(int idHoaDon) {
        this.idHoaDon = idHoaDon;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getNguoiCapNhat() {
        return nguoiCapNhat;
    }

    public void setNguoiCapNhat(String nguoiCapNhat) {
        this.nguoiCapNhat = nguoiCapNhat;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public Date getNgayThayDoi() {
        return ngayThayDoi;
    }

    public void setNgayThayDoi(Date ngayThayDoi) {
        this.ngayThayDoi = ngayThayDoi;
    }

    @Override
    public String toString() {
        return "HoaDon_TrangThai{" + "id=" + id + ", idHoaDon=" + idHoaDon + ", trangThai=" + trangThai + ", nguoiCapNhat=" + nguoiCapNhat + ", ghiChu=" + ghiChu + ", ngayThayDoi=" + ngayThayDoi + '}';
    }

    
    

}
